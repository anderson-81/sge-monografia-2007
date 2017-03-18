unit FSelFornRelCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cFornecedor, cDataModule, cControle, cPessoaFisica, cPessoaJuridica;

type
  TFrmSelFornRelCompra = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ComboBox1: TComboBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure ListarPF;
    procedure ListarPJ;
    procedure FormShow(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
  private
    PodeFechar : Boolean;  
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelFornRelCompra: TFrmSelFornRelCompra;

implementation


uses
   FDefRelCompra;

procedure TFrmSelFornRelCompra.ListarPJ;
var
    PJ : PessoaJuridica;
    Ct : Controle;
    DM : TDM;
begin
    try
        Combobox1.Clear;
        Combobox1.Enabled := false;

        DM   := TDM.create (NIL);
        PJ   := PessoaJuridica.Create(0,'','','','','','',0,00/00/0000,'','','');
        Ct   := Controle.Create(DM,PJ);

        Ct.ListarTodosFornPJ;

        While (NOT DM.ZQuery1.EOF) do
        begin
            PJ.setrazaoSocial(DM.ZQuery1.FieldByName('razaoSocial').AsString);
            FrmSelFornRelCompra.Combobox1.Items.Add(PJ.getrazaoSocial);
            DM.ZQuery1.Next;
        end;

        if (FrmSelFornRelCompra.Combobox1.Items.Text = '') then
        begin
            MessageDlg('Nenhum Fornecedor Pessoa Jurídica cadastrada.', mtInformation, [mbOk], 0);
        end
        else
        begin
            Combobox1.Enabled := true;
        end;

    Except
        MessageDlg('Problema na Listagem de Fornecedor Pessoa Jurídica.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmSelFornRelCompra.ListarPF;
var
    PF : PessoaFisica;
    Ct : Controle;
    DM : TDM;
begin
    try
        Combobox1.Clear;
        Combobox1.Enabled := false;

        DM   := TDM.create (NIL);
        PF   := PessoaFisica.Create(0,'','','','','','',0,00/00/0000,'','','');
        Ct   := Controle.Create(DM,PF);

        Ct.ListarTodosFornPF;

        While (NOT DM.ZQuery1.EOF) do
        begin
            PF.setnome(DM.ZQuery1.FieldByName('nomeForn').AsString);
            FrmSelFornRelCompra.Combobox1.Items.Add(PF.getnome);
            DM.ZQuery1.Next;
        end;

        if (FrmSelFornRelCompra.Combobox1.Items.Text = '') then
        begin
            MessageDlg('Nenhum Fornecedor Pessoa Física cadastrado.', mtInformation, [mbOk], 0);
        end
        else
        begin
            Combobox1.Enabled := true;
        end;

    Except
        MessageDlg('Problema na Listagem de Fornecedor Pessoa Jurídica.', mtError, [mbOk], 0);
    end;
end;

{$R *.dfm}

procedure TFrmSelFornRelCompra.FormShow(Sender: TObject);
begin
    self.PodeFechar := false;
    self.ListarPJ;
    self.RadioButton2.Checked := true;
end;

procedure TFrmSelFornRelCompra.RadioButton2Click(Sender: TObject);
begin
    self.ListarPJ;
end;

procedure TFrmSelFornRelCompra.RadioButton1Click(Sender: TObject);
begin
    self.ListarPF;
end;

procedure TFrmSelFornRelCompra.BitBtn1Click(Sender: TObject);
var
    PJ : PessoaJuridica;
    PF : PessoaFisica;
    Ct : Controle;
    DM : TDM;
begin
    try
      if (ComboBox1.Text <> '') then
      begin
         DM   := TDM.create (NIL);

         if (RadioButton1.Checked = true) then
         begin
             PF := PessoaFisica.Create(0,'','','','','','',0,00/00/0000,'','','');
             Ct := Controle.Create(DM, PF);
             PF.setnome(Combobox1.Text);
             Ct.BuscarFornPorNome;

             FrmDefRelCompra.GroupBox3.Enabled := true;
             FrmDefRelCompra.Label3.Caption := 'CPF:';
             FrmDefRelCompra.Maskedit1.EditMask := '!000\.000\.000\-00;0;_';
             FrmDefRelCompra.MaskEdit1.Text := PF.getcpf;
             FrmDefRelCompra.Label4.Caption := 'Nome:';
             FrmDefRelCompra.Edit2.Text := PF.getnome;
             FrmDefRelCompra.Edit1.Text := IntToStr(PF.getcodForn);
             FrmDefRelCompra.Edit3.Text := PF.gettipoForn;
             self.Close;
         end

         else if (RadioButton2.Checked = true) then
         begin
             PJ := PessoaJuridica.Create(0,'','','','','','',0,00/00/0000,'','','');
             Ct := Controle.Create(DM, PJ);
             PJ.setrazaoSocial(Combobox1.Text);
             Ct.BuscarFornPorRazaoSocial;

             FrmDefRelCompra.GroupBox3.Enabled := true;
             FrmDefRelCompra.Label3.Caption := 'CNPJ:';
             FrmDefRelCompra.Maskedit1.EditMask := '!00\.000\.000\/0000\-00;0;_';
             FrmDefRelCompra.MaskEdit1.Text := PJ.getCnpj;
             FrmDefRelCompra.Label4.Caption := 'Raz.Social:';
             FrmDefRelCompra.Edit2.Text := PJ.getrazaoSocial;
             FrmDefRelCompra.Edit1.Text := IntToStr(PJ.getcodForn);
             FrmDefRelCompra.Edit3.Text := PJ.gettipoForn;
             self.Close;
          end
       end
       else
          MessageDlg('Nenhum Fornecedor Foi Selecionado.', mtWarning, [mbOk], 0);
    Except
        MessageDlg('Problema na Seleção de Fornecedor.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmSelFornRelCompra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

procedure TFrmSelFornRelCompra.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja cancelar seleção de Fornecedor?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        self.PodeFechar := true;
        self.Close;
    end;
end;

end.
