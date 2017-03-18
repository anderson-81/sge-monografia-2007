unit FControlarCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, FSelCompraRealizada, FTelaCompraRealizada,
  Mask, cPedidoDeCompra, cDataModule, cControle, cFornecedor, FDefRelCompra;

type
  TFrmControlarCompra = class(TForm)
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    Edit3: TEdit;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IniciarControle;
    procedure Limpar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControlarCompra: TFrmControlarCompra;

implementation

{$R *.dfm}

uses
    FPrincipal;

procedure TFrmControlarCompra.BitBtn2Click(Sender: TObject);
begin
    FrmSelCompraRealizada.ShowModal;
end;

procedure TFrmControlarCompra.BitBtn1Click(Sender: TObject);
var
    DM : TDM;
    Ct : Controle;
    PdComp : PedidoDeCompra;
    Forn : Fornecedor;
begin
    try
        //Atribuir dados mediante o tipo do fornecedor.
        DM := TDM.Create(NIL);
        Forn := Fornecedor.Create(StrToInt(self.Edit3.Text),'','','','','','',0,00/00/0000,'','');
        PdComp := PedidoDeCompra.Create(0,00/00/0000,0,'');
        Ct:= Controle.Create(DM,PdComp,Forn);

        FrmTelaCompraRealizada.Edit5.Text := self.Edit3.Text;
        FrmTelaCompraRealizada.Edit2.Text := self.Edit2.Text;
        if(self.Label1.Caption = 'CNPJ:') then
        begin
            FrmTelaCompraRealizada.Label1.Caption := 'CNPJ:';
            FrmTelaCompraRealizada.Label2.Caption := 'R.Social:';
            FrmTelaCompraRealizada.Edit1.Text := self.Edit1.Text;
            FrmTelaCompraRealizada.MaskEdit1.EditMask := '!00\.000\.000\/0000\-00;0;_';
            FrmTelaCompraRealizada.MaskEdit1.Text :=  self.MaskEdit1.Text;
        end
        else if(self.Label1.Caption = 'CPF:') then
        begin
            FrmTelaCompraRealizada.Label1.Caption := 'CPF:';
            FrmTelaCompraRealizada.Label2.Caption := 'Nome:';
            FrmTelaCompraRealizada.Edit1.Text := self.Edit1.Text;
            FrmTelaCompraRealizada.MaskEdit1.EditMask := '!000\.000\.000\-00;0;_';
            FrmTelaCompraRealizada.MaskEdit1.Text :=  self.MaskEdit1.Text;
        end;

        Ct.BuscarCompraPorCodForn;
        FrmTelaCompraRealizada.Edit6.Text := IntToStr(PdComp.getcodPedCompra);
        DecimalSeparator := ',';
        FrmTelaCompraRealizada.CurrencyEdit1.Text := FloatToStr(PdComp.getValTotPedCompra);
        self.Visible := false;
        FrmTelaCompraRealizada.ShowModal;
    except
        MessageDlg('Problema na exibição da Compra.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmControlarCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmPrincipal.enabled := true;
end;


procedure TFrmControlarCompra.IniciarControle;
begin
    self.Label1.Caption := 'CNPJ:';
    self.Label2.Caption := 'R.Social:';
    self.Maskedit1.EditMask := '!00\.000\.000\/0000\-00;0;_';
    self.MaskEdit1.Clear;
    self.Edit1.Clear;
    self.BitBtn1.Enabled := false;
    self.Edit2.Clear; 
end;

procedure TFrmControlarCompra.Limpar1Click(Sender: TObject);
begin
    self.IniciarControle;
end;

procedure TFrmControlarCompra.FormShow(Sender: TObject);
begin
    self.IniciarControle;
end;

procedure TFrmControlarCompra.BitBtn3Click(Sender: TObject);
begin
    self.Visible := false;
    FrmDefRelCompra.ShowModal;
end;

procedure TFrmControlarCompra.Sair1Click(Sender: TObject);
begin
    self.Close;
end;

procedure TFrmControlarCompra.MaskEdit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmControlarCompra.Edit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

end.
