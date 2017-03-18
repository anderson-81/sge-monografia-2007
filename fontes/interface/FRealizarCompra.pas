unit FRealizarCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, FTelaCompra, FSelFornCompra, Mask, cControle, cDataModule, cFornecedor,
  cPessoaJuridica, cPessoaFisica;

type
  TFrmRealizarCompra = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MaskEdit1: TMaskEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRealizarCompra: TFrmRealizarCompra;

implementation

{$R *.dfm}

uses
    FPrincipal;

procedure TFrmRealizarCompra.BitBtn2Click(Sender: TObject);
begin
    FrmSelFornCompra.Show;
    FrmRealizarCompra.Enabled := false;
end;

procedure TFrmRealizarCompra.BitBtn1Click(Sender: TObject);
var
    DM : TDM;
    Ct : Controle;
    Forn : Fornecedor;
begin
    try
        DM := TDM.Create(NIL);
        Forn := Fornecedor.Create(StrToInt(self.Edit3.Text),'','','','','','',0,00/00/0000,'','');
        Ct := Controle.Create(DM,Forn);

        if(Ct.VerifarFornecedorPorCompraAberta = 0) then
        begin
            if (self.Edit2.Text = 'PJ') then
            begin
                FrmTelaCompra.Label1.Caption := 'CNPJ:';
                FrmTelaCompra.Label2.Caption := 'Razão Social:';
                FrmTelaCompra.MaskEdit1.EditMask := '!00\.000\.000\/0000\-00;0;_';
                FrmTelaCompra.MaskEdit1.Text := FrmRealizarCompra.MaskEdit1.Text;
                FrmTelaCompra.Edit1.Text := FrmRealizarCompra.Edit1.Text;
                FrmTelaCompra.Edit3.Text := FrmRealizarCompra.Edit3.Text;
           end
           else if (self.Edit2.Text = 'PF') then
           begin
              FrmTelaCompra.Label1.Caption := 'CPF:';
              FrmTelaCompra.Label2.Caption := 'Nome:';
              FrmTelaCompra.MaskEdit1.EditMask := '!000\.000\.000\-00;0;_';
              FrmTelaCompra.MaskEdit1.Text := FrmRealizarCompra.MaskEdit1.Text;
              FrmTelaCompra.Edit1.Text := FrmRealizarCompra.Edit1.Text;
              FrmTelaCompra.Edit3.Text := FrmRealizarCompra.Edit3.Text;
           end;
           FrmTelaCompra.Show;
           FrmRealizarCompra.Visible := false;
       end
       else
       begin
           MessageDlg('Este Fornecedor Já Possui um Pedido de Compra em Aberto.', mtWarning, [mbOk], 0);
       end;
    except
        MessageDlg('Problema na Confirmação do Fornecedor para Realização da Compra.', mtWarning, [mbOk], 0);
    end;
end;

procedure TFrmRealizarCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmPrincipal.Enabled := true;
end;

procedure TFrmRealizarCompra.Sair1Click(Sender: TObject);
begin
    if MessageDlg('Deseja Cancelar a Realização de Compra?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        FrmRealizarCompra.Close;
    end;
end;

procedure TFrmRealizarCompra.Limpar1Click(Sender: TObject);
begin
    self.Edit1.Clear;
    self.MaskEdit1.Clear;
    self.MaskEdit1.EditMask := '';
    self.BitBtn1.Enabled := false;
end;

procedure TFrmRealizarCompra.MaskEdit1Enter(Sender: TObject);
begin
    if(self.BitBtn1.Enabled = true) then
       self.BitBtn1.SetFocus
    else
       self.BitBtn2.SetFocus;
end;

procedure TFrmRealizarCompra.Edit1Enter(Sender: TObject);
begin
    if(self.BitBtn1.Enabled = true) then
       self.BitBtn1.SetFocus
    else
       self.BitBtn2.SetFocus;
end;

end.
