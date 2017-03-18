unit FRealizarPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, FTelaPagto, cDataModule, cControle, cCliente,
  cVenda, cPagamento;

type
  TFrmRealizarPagamento = class(TForm)
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    BitBtn8: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    N1: TMenuItem;
    ListarTodasasVendasRealizadas1: TMenuItem;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Limpar1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure AtribuirValores;
    procedure ListarTodasasVendasRealizadas1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRealizarPagamento: TFrmRealizarPagamento;
 
  
implementation

{$R *.dfm}

uses
    FPrincipal, FBuscarVendaPagto;
 
procedure TFrmRealizarPagamento.BitBtn2Click(Sender: TObject);
begin
    FrmBuscarVendaPagto.Show;
    FrmRealizarPagamento.Enabled := false;
end;

procedure TFrmRealizarPagamento.BitBtn1Click(Sender: TObject);
var
    DM : TDM;
    Ct : Controle;
    VD : Venda;
    Pg : Pagamento;
    Cli : Cliente;
begin
    try
        DM := TDM.Create(NIL);
        Vd := Venda.Create(0,00/00/0000,0,'');
        Cli := Cliente.Create(StrToInt(self.Edit1.Text),'','','','','','','');
        Pg := Pagamento.Create(0,0,'',00/00/0000,'');
        Ct := Controle.Create(DM,Vd,Cli,Pg);
        Ct.BuscarRegPagtoPorVendaNP;
        FrmRealizarPagamento.Visible := false;
        FrmTelaPagto.Edit1.Text := IntToStr(Cli.getCodCli);
        FrmTelaPagto.Edit2.Text := Cli.getnomeCli;
        FrmTelaPagto.Edit3.Text := IntToStr(Vd.getcodVenda);
        FrmTelaPagto.Edit4.Text := IntToStr(Pg.getcodPag);
        FrmTelaPagto.CurrencyEdit2.Text := FloatToStr(Vd.getValTotVenda);
        FrmTelaPagto.Show;
    except
        MessageDlg('Problema na abertura da realização de Pagamento.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmRealizarPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    self.Edit1.Clear;
    self.Edit2.Clear;
    FrmRealizarPagamento.BitBtn1.Enabled := false;
    FrmPrincipal.Enabled := true;
end;

procedure TFrmRealizarPagamento.Limpar1Click(Sender: TObject);
begin
    self.Edit1.Clear;
    self.Edit2.Clear;
    self.BitBtn5.Enabled := false;
    self.BitBtn6.Enabled := false;
    self.BitBtn7.Enabled := false;
    self.BitBtn8.Enabled := false;
    self.BitBtn1.Enabled := false;
end;

procedure TFrmRealizarPagamento.BitBtn8Click(Sender: TObject);
begin
    try
        DM.ZQuery1.First;
        AtribuirValores;
        BitBtn8.Enabled := false;
        BitBtn7.Enabled := false;
        BitBtn6.Enabled := true;
        BitBtn5.Enabled := true;
    except
        MessageDlg('Problema na navegação por Clientes.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmRealizarPagamento.BitBtn7Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Prior;
        AtribuirValores;

        if (DM.ZQuery1.Bof) then
        begin
            BitBtn8.Enabled := false;
            BitBtn7.Enabled := false;
        end;

        BitBtn6.Enabled := true;
        BitBtn5.Enabled := true;
    except
        MessageDlg('Problema na navegação por Clientes.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmRealizarPagamento.BitBtn6Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Next;
        AtribuirValores;

        if (DM.ZQuery1.Eof) then
        begin
            BitBtn5.Enabled := false;
            BitBtn6.Enabled := false;
        end;

        BitBtn8.Enabled := true;
        BitBtn7.Enabled := true;
    except
        MessageDlg('Problema na navegação por Clientes.', mtError, [mbOk], 0);
    end;
end;
procedure TFrmRealizarPagamento.BitBtn5Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Last;
        AtribuirValores;

        BitBtn5.Enabled := false;
        BitBtn6.Enabled := false;

        BitBtn8.Enabled := true;
        BitBtn7.Enabled := true;
    except
        MessageDlg('Problema na navegação por Clientes.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmRealizarPagamento.AtribuirValores;
begin
    try
        FrmRealizarPagamento.Edit1.Text := IntToStr(DM.ZQuery1.FieldByName('codCli').AsInteger);
        FrmRealizarPagamento.Edit2.Text := DM.ZQuery1.FieldByName('nomeCli').AsString;
    except
        MessageDlg('Problema na atrição dos dados de Cliente.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmRealizarPagamento.ListarTodasasVendasRealizadas1Click(
  Sender: TObject);
var
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.ListarTodasVendasRealizadasPorCliente;
        self.AtribuirValores;
        FrmRealizarPagamento.BitBtn5.Enabled := true;
        FrmRealizarPagamento.BitBtn6.Enabled := true;
        FrmRealizarPagamento.BitBtn7.Enabled := false;
        FrmRealizarPagamento.BitBtn8.Enabled := false;
        FrmRealizarPagamento.BitBtn1.Enabled := true;
    except
        MessageDlg('Problema na Listagem de Todos os Clientes.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmRealizarPagamento.Edit1Enter(Sender: TObject);
begin
    if(self.BitBtn1.Enabled = true)then
        self.BitBtn1.SetFocus
    else
        self.BitBtn2.SetFocus;
end;

procedure TFrmRealizarPagamento.Edit2Enter(Sender: TObject);
begin
    if(self.BitBtn1.Enabled = true)then
        self.BitBtn1.SetFocus
    else
        self.BitBtn2.SetFocus;
end;

end.
