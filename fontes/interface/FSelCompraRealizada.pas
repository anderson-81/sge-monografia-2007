unit FSelCompraRealizada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cControle, cFornecedor, cDataModule, cPessoaJuridica, cPessoaFisica;

type
  TFrmSelCompraRealizada = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ComboBox1: TComboBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Procedure ListarPessoaFisica;
    Procedure ListarPessoaJuridica;
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    PodeFechar : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelCompraRealizada: TFrmSelCompraRealizada;

implementation

uses FControlarCompra;

{$R *.dfm}

Procedure TFrmSelCompraRealizada.ListarPessoaFisica;
var
    Ct   : Controle;
    DM   : TDM;
begin
    self.ComboBox1.Clear;
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.ListarFornPorNomeCompraAberta;

        While (NOT DM.ZQuery1.EOF) do
        begin
            self.ComboBox1.Items.Add(DM.ZQuery1.FieldByName('nomeForn').AsString);
            DM.ZQuery1.Next;
        end;
    except
        MessageDlg('Problema na Listagem das Pessoas Físicas.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmSelCompraRealizada.ListarPessoaJuridica;
var
    Ct   : Controle;
    DM   : TDM;
begin
    self.ComboBox1.Clear;
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.ListarFornPorRazaoSocialCompraAberta;

        While (NOT DM.ZQuery1.EOF) do
        begin
            self.ComboBox1.Items.Add(DM.ZQuery1.FieldByName('razaoSocial').AsString);
            DM.ZQuery1.Next;
        end;

    except
        MessageDlg('Problema na Listagem das Pessoas Jurídicas.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmSelCompraRealizada.RadioButton2Click(Sender: TObject);
begin
    self.ListarPessoaJuridica;
    self.ComboBox1.Enabled := true;
end;

procedure TFrmSelCompraRealizada.RadioButton1Click(Sender: TObject);
begin
    self.ListarPessoaFisica;
    self.ComboBox1.Enabled := true;
end;

procedure TFrmSelCompraRealizada.BitBtn1Click(Sender: TObject);
var
    PJ   : PessoaJuridica;
    PF   : PessoaFisica;
    Ct   : Controle;
    DM   : TDM;
begin
    try
        if(self.ComboBox1.Text <> '') then
        begin
            DM   := TDM.Create(NIL);
            if (RadioButton2.Checked = true) then
            begin
                PJ   := PessoaJuridica.Create(0,'','','','','','',0,00/00/0000,'','','');
                Ct   := Controle.Create(DM,PJ);
                PJ.setrazaoSocial(self.ComboBox1.Text);
                Ct.BuscarFornPorRazaoSocial;
                FrmControlarCompra.Label1.Caption := 'CNPJ:';
                FrmControlarCompra.Label2.Caption := 'Razão Social:';
                FrmControlarCompra.MaskEdit1.EditMask := '!00\.000\.000\/0000\-00;0;_';
                FrmControlarCompra.MaskEdit1.Text := PJ.getCnpj;
                FrmControlarCompra.Edit1.Text := PJ.getrazaoSocial;
                FrmControlarCompra.Edit2.Text := PJ.gettipoForn;
                FrmControlarCompra.Edit3.Text := IntToStr(PJ.getcodForn);
           end
           else if (RadioButton1.Checked = true) then
           begin
               PF   := PessoaFisica.Create(0,'','','','','','',0,00/00/0000,'','','');
               Ct   := Controle.Create(DM,PF);
               PF.setnome(self.ComboBox1.Text);
               Ct.BuscarFornPorNome;
               FrmControlarCompra.Label1.Caption := 'CPF:';
               FrmControlarCompra.Label2.Caption := 'Nome:';
               FrmControlarCompra.MaskEdit1.EditMask := '!000\.000\.000\-00;0;_';
               FrmControlarCompra.MaskEdit1.Text := PF.getcpf;
               FrmControlarCompra.Edit1.Text := PF.getnome;
               FrmControlarCompra.Edit2.Text := PF.gettipoForn;
               FrmControlarCompra.Edit3.Text := IntToStr(PF.getcodForn);
           end;

           FrmControlarCompra.BitBtn1.Enabled := true;
           self.PodeFechar := true;
           self.Close;
        end
        else
           MessageDlg('Selecione um Fornecedor.', mtInformation, [mbOk], 0);
    except
        MessageDlg('Problema busca pelo Fornecedor Selecionado.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmSelCompraRealizada.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja Cancelar a Seleção de Fornecedor?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        self.PodeFechar := true;
        self.Close;
    end;
end;

procedure TFrmSelCompraRealizada.FormActivate(Sender: TObject);
begin
    self.RadioButton2.Checked := true;
end;

procedure TFrmSelCompraRealizada.ComboBox1Change(Sender: TObject);
begin
    self.BitBtn1.Enabled := true;
end;

procedure TFrmSelCompraRealizada.FormShow(Sender: TObject);
begin
    self.RadioButton2.Checked := true;
    self.PodeFechar := false;
end;

procedure TFrmSelCompraRealizada.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose:= self.PodeFechar;
end;

end.
