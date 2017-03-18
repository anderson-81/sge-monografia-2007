unit FSelFornCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cControle, cFornecedor, cDataModule, cPessoaJuridica, cPessoaFisica;


type
  TFrmSelFornCompra = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ComboBox1: TComboBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure ListarPessoaFisica;
    Procedure ListarPessoaJuridica;
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelFornCompra: TFrmSelFornCompra;

implementation

uses FRealizarCompra;

{$R *.dfm}

procedure TFrmSelFornCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmRealizarCompra.Enabled := true;
end;

Procedure TFrmSelFornCompra.ListarPessoaFisica;
var
    Ct   : Controle;
    DM   : TDM;
begin
    self.ComboBox1.Clear;
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.ListarPessoaFisica;

        While (NOT DM.ZQuery1.EOF) do
        begin
            self.ComboBox1.Items.Add(DM.ZQuery1.FieldByName('nomeForn').AsString);
            DM.ZQuery1.Next;
        end;
    except
        MessageDlg('Problema na Listagem das Pessoas Físicas.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmSelFornCompra.ListarPessoaJuridica;
var
    Ct   : Controle;
    DM   : TDM;
begin
    self.ComboBox1.Clear;
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.ListarPessoaJuridica;

        While (NOT DM.ZQuery1.EOF) do
        begin
            self.ComboBox1.Items.Add(DM.ZQuery1.FieldByName('razaoSocial').AsString);
            DM.ZQuery1.Next;
        end;

    except
        MessageDlg('Problema na Listagem das Pessoas Jurídicas.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmSelFornCompra.RadioButton2Click(Sender: TObject);
begin
    self.ListarPessoaJuridica;
    self.ComboBox1.Enabled := true;
end;

procedure TFrmSelFornCompra.RadioButton1Click(Sender: TObject);
begin
    self.ListarPessoaFisica;
    self.ComboBox1.Enabled := true;
end;

procedure TFrmSelFornCompra.BitBtn1Click(Sender: TObject);
var
    PJ   : PessoaJuridica;
    PF   : PessoaFisica;
    Ct   : Controle;
    DM   : TDM;
begin
    try
        DM   := TDM.Create(NIL);
        if (RadioButton2.Checked = true) AND (self.ComboBox1.Text <> '') then
        begin
            PJ   := PessoaJuridica.Create(0,'','','','','','',0,00/00/0000,'','','');
            Ct   := Controle.Create(DM,PJ);
            PJ.setrazaoSocial(self.ComboBox1.Text);
            Ct.BuscarFornPorRazaoSocial;
            FrmRealizarCompra.Label1.Caption := 'CNPJ:';
            FrmRealizarCompra.Label2.Caption := 'Razão Social:';
            FrmRealizarCompra.MaskEdit1.EditMask := '!00\.000\.000\/0000\-00;0;_';
            FrmRealizarCompra.MaskEdit1.Text := PJ.getCnpj;
            FrmRealizarCompra.Edit1.Text := PJ.getrazaoSocial;
            FrmRealizarCompra.Edit2.Text := PJ.gettipoForn;
            FrmRealizarCompra.Edit3.Text := IntToStr(PJ.getcodForn);
        end
        else if (RadioButton1.Checked = true) AND (self.ComboBox1.Text <> '') then
        begin
            PF   := PessoaFisica.Create(0,'','','','','','',0,00/00/0000,'','','');
            Ct   := Controle.Create(DM,PF);
            PF.setnome(self.ComboBox1.Text);
            Ct.BuscarFornPorNome;
            FrmRealizarCompra.Label1.Caption := 'CPF:';
            FrmRealizarCompra.Label2.Caption := 'Nome:';
            FrmRealizarCompra.MaskEdit1.EditMask := '!000\.000\.000\-00;0;_';
            FrmRealizarCompra.MaskEdit1.Text := PF.getcpf;
            FrmRealizarCompra.Edit1.Text := PF.getnome;
            FrmRealizarCompra.Edit2.Text := PF.gettipoForn;
            FrmRealizarCompra.Edit3.Text := IntToStr(PF.getcodForn);
        end;
        FrmRealizarCompra.BitBtn1.Enabled := true;
        self.Close;
    except
        MessageDlg('Problema busca pelo Fornecedor Selecionado.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmSelFornCompra.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja Cancelar a Seleção de Fornecedor?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        FrmSelFornCompra.Show;
    end;
end;

procedure TFrmSelFornCompra.FormActivate(Sender: TObject);
begin
    self.RadioButton2.Checked := true;
end;

procedure TFrmSelFornCompra.ComboBox1Change(Sender: TObject);
begin
    self.BitBtn1.Enabled := true;
end;

end.
