unit FRealizarVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Buttons, FBuscarClienteVenda, FTelaVenda, cDataModule,
  cCliente, cControle;

type
  TFrmRealizarVenda = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure AtribuirValores;
    procedure ClearBox;
    procedure Limpar1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRealizarVenda: TFrmRealizarVenda;
  DM : TDM;


implementation

{$R *.dfm}

uses
    FPrincipal;

procedure TFrmRealizarVenda.BitBtn2Click(Sender: TObject);
begin
    FrmBuscarClienteVenda.Show;
    FrmRealizarVenda.Enabled := false;
end;

procedure TFrmRealizarVenda.BitBtn1Click(Sender: TObject);
var
    DM : TDM;
    Ct : Controle;
    Cli : Cliente;
begin
    try
        DM := TDM.Create(NIL);
        Cli := Cliente.Create(StrToInt(Edit1.Text),'','','','','','','');
        Ct  := Controle.Create(DM,Cli);

        if (Ct.VerifarClientePorVendaAberta = 0) then
        begin
            FrmTelaVenda.Show;
            FrmTelaVenda.Edit1.Text := self.Edit1.Text;
            FrmTelaVenda.Edit2.Text := self.Edit2.Text;
            FrmTelaVenda.GerarCodPagto;
            FrmTelaVenda.GerarCodVenda;
            FrmTelaVenda.CriarRegVenda;
            FrmRealizarVenda.Visible := false;
        end
        else
        begin
            MessageDlg('Este Cliente Possui uma Venda Aberta Associada.', mtWarning		, [mbOk], 0);
        end;
    except
    begin
        MessageDlg('Problema na Confirmação da Venda.', mtError, [mbOk], 0);
        FrmRealizarVenda.Close;
    end;
    end;
end;

procedure TFrmRealizarVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmPrincipal.Enabled := true;
    self.ClearBox;
end;

procedure TFrmRealizarVenda.BitBtn5Click(Sender: TObject);
begin
    DM.ZQuery1.Last;
    AtribuirValores;

    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;

    BitBtn8.Enabled := true;
    BitBtn7.Enabled := true;
end;

procedure TFrmRealizarVenda.BitBtn6Click(Sender: TObject);
begin
    DM.ZQuery1.Next;
    AtribuirValores;

    if (DM.ZQuery1.Eof) then
    begin
        BitBtn5.Enabled := false;
        BitBtn6.Enabled := false;
    end;

    BitBtn8.Enabled := true;
    BitBtn7.Enabled := true;
end;

procedure TFrmRealizarVenda.BitBtn7Click(Sender: TObject);
begin
    DM.ZQuery1.Prior;
    AtribuirValores;

    if (DM.ZQuery1.Bof) then
    begin
        BitBtn8.Enabled := false;
        BitBtn7.Enabled := false;
    end;

    BitBtn6.Enabled := true;
    BitBtn5.Enabled := true;
end;


procedure TFrmRealizarVenda.BitBtn8Click(Sender: TObject);
begin
    DM.ZQuery1.First;
    AtribuirValores;
    BitBtn8.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn6.Enabled := true;
    BitBtn5.Enabled := true;
end;

procedure TFrmRealizarVenda.AtribuirValores;
begin
    try
        FrmRealizarVenda.Edit1.text := IntToStr(DM.ZQuery1.FieldByName('codCli').AsInteger);
        FrmRealizarVenda.Edit2.Text := DM.ZQuery1.FieldByName('nomeCli').AsString;
    except
        MessageDlg('Problema na Atribuição dos valores.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmRealizarVenda.ClearBox;
begin
    Edit1.Clear;
    Edit2.Clear;
    BitBtn1.Enabled := false;
    BitBtn2.Enabled := true;
    BitBtn6.Enabled := false;
    BitBtn5.Enabled := false;
    BitBtn8.Enabled := false;
    BitBtn7.Enabled := false;
end;

procedure TFrmRealizarVenda.Limpar1Click(Sender: TObject);
begin
    self.ClearBox;  
end;

procedure TFrmRealizarVenda.Edit1Enter(Sender: TObject);
begin
    if(self.BitBtn1.Enabled = true) then
       self.BitBtn1.SetFocus
    else
       self.BitBtn2.SetFocus;
end;

procedure TFrmRealizarVenda.Edit2Enter(Sender: TObject);
begin
    if(self.BitBtn1.Enabled = true) then
       self.BitBtn1.SetFocus
    else
       self.BitBtn2.SetFocus;
end;

end.
