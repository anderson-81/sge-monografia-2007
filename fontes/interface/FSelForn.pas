unit FSelForn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, cDataModule, cControle,
  cPessoaFisica, cPessoaJuridica;

type
  TFrmSelForn = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListarPJ;
    procedure ListarPF;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    PodeFechar : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelForn: TFrmSelForn;



implementation

uses FManterForn;


{$R *.dfm}


procedure TFrmSelForn.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja cancelar a seleção por Fornecedor?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        self.PodeFechar := true;
        self.Close;
    end;
end;

procedure TFrmSelForn.ListarPJ;
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
            FrmSelForn.Combobox1.Items.Add(PJ.getrazaoSocial);
            DM.ZQuery1.Next;
        end;

        if (FrmSelForn.Combobox1.Items.Text = '') then
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

procedure TFrmSelForn.ListarPF;
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
            FrmSelForn.Combobox1.Items.Add(PF.getnome);
            DM.ZQuery1.Next;
        end;

        if (FrmSelForn.Combobox1.Items.Text = '') then
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





procedure TFrmSelForn.BitBtn1Click(Sender: TObject);
var
    PJ : PessoaJuridica;
    PF : PessoaFisica;
    Ct : Controle;
    DM : TDM;
begin
    FrmManterForn.BitBtn5.Enabled := false;
    FrmManterForn.BitBtn6.Enabled := false;
    FrmManterForn.BitBtn7.Enabled := false;
    FrmManterForn.BitBtn8.Enabled := false;
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

             FrmManterForn.Label1.Caption := 'CPF:';
             FrmManterForn.Maskedit1.EditMask := '!000\.000\.000\-00;0;_';
             FrmManterForn.Label2.Caption := 'Nome:';
             FrmManterForn.RadioButton1.Enabled := false;
             FrmManterForn.RadioButton2.Checked := true;
             FrmManterForn.RadioButton2.Enabled := true;

             FrmManterForn.MaskEdit1.ReadOnly := true;
             FrmManterForn.MaskEdit1.Text := PF.getcpf;
             FrmManterForn.Edit1.Text := PF.getnome;
             FrmManterForn.Edit2.Text := PF.getendForn;
             FrmManterForn.Edit3.Text := PF.getbairroForn;
             FrmManterForn.MaskEdit2.Text := IntToStr(PF.getcepForn);
             FrmManterForn.Edit4.Text := PF.getcidadeForn;
             FrmManterForn.ComboBox1.Text := PF.getestadoForn;
             FrmManterForn.Edit5.Text := PF.getemailForn;
             FrmManterForn.Memo1.Text := PF.getdescForn;
             FrmManterForn.Edit7.Text := IntToStr(PF.getcodForn);
             FrmManterForn.Edit6.Text := PF.getstatusForn;
             FrmManterForn.Edit8.Text := PF.gettipoForn;

             if (FrmManterForn.Edit6.Text = 'Ativo') then
             begin
                 FrmManterForn.RadioButton3.Checked := true;
             end
             else if (FrmManterForn.Edit6.Text = 'Inativo') then
             begin
                 FrmManterForn.RadioButton4.Checked := true;
             end;
             FrmManterForn.DateTimePicker1.DateTime := PF.getdataAdmissaoForn;

             FrmManterForn.BitBtn1.Enabled := false;
             FrmManterForn.BitBtn2.Enabled := true;
             FrmManterForn.BitBtn3.Enabled := true;
             FrmManterForn.BitBtn4.Enabled := true;
             self.PodeFechar := true;
             self.Close;
         end

         else if (RadioButton2.Checked = true) then
         begin
             PJ := PessoaJuridica.Create(0,'','','','','','',0,00/00/0000,'','','');
             Ct := Controle.Create(DM, PJ);
             PJ.setrazaoSocial(Combobox1.Text);
             Ct.BuscarFornPorRazaoSocial;

             FrmManterForn.Label1.Caption := 'CNPJ:';
             FrmManterForn.Maskedit1.EditMask := '!00\.000\.000\/0000\-00;0;_';
             FrmManterForn.Label2.Caption := 'Raz.Social:';
             FrmManterForn.RadioButton1.Checked := true;
             FrmManterForn.RadioButton2.Enabled := false;

             FrmManterForn.MaskEdit1.ReadOnly := true;
             FrmManterForn.MaskEdit1.Text := PJ.getCnpj;
             FrmManterForn.Edit1.Text := PJ.getrazaoSocial;
             FrmManterForn.Edit2.Text := PJ.getendForn;
             FrmManterForn.Edit3.Text := PJ.getbairroForn;
             FrmManterForn.MaskEdit2.Text := IntToStr(PJ.getcepForn);
             FrmManterForn.Edit4.Text := PJ.getcidadeForn;
             FrmManterForn.ComboBox1.Text := PJ.getestadoForn;
             FrmManterForn.Edit5.Text := PJ.getemailForn;
             FrmManterForn.Memo1.Text := PJ.getdescForn;
             FrmManterForn.Edit7.Text := IntToStr(PJ.getcodForn);
             FrmManterForn.Edit6.Text := PJ.getstatusForn;
             FrmManterForn.Edit8.Text := PJ.gettipoForn;

             if (FrmManterForn.Edit6.Text = 'Ativo') then
             begin
                 FrmManterForn.RadioButton3.Checked := true;
                 FrmManterForn.RadioButton4.Checked := false;
             end
             else if (FrmManterForn.Edit6.Text = 'Inativo') then
             begin
                 FrmManterForn.RadioButton3.Checked := false;
                 FrmManterForn.RadioButton4.Checked := true;
             end;
             FrmManterForn.DateTimePicker1.DateTime := PJ.getdataAdmissaoForn;

             FrmManterForn.BitBtn1.Enabled := false;
             FrmManterForn.BitBtn2.Enabled := true;
             FrmManterForn.BitBtn3.Enabled := true;
             FrmManterForn.BitBtn4.Enabled := true;
             FrmManterForn.RadioButton2.Checked := false;
             FrmManterForn.RadioButton1.Enabled := true;
             self.PodeFechar := true;
             self.Close;
          end
       end
       else
          Showmessage ('Selecione um Fornecedor.');
    Except
        MessageDlg('Problema na Seleção de Fornecedor.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmSelForn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmManterForn.Enabled := true;
end;

procedure TFrmSelForn.RadioButton1Click(Sender: TObject);
begin
    FrmSelForn.ListarPF;
end;

procedure TFrmSelForn.RadioButton2Click(Sender: TObject);
begin
    FrmSelForn.ListarPJ;
end;

procedure TFrmSelForn.FormShow(Sender: TObject);
begin
    Combobox1.Enabled := false;
    FrmSelForn.ListarPJ;
    self.PodeFechar := false;
end;

procedure TFrmSelForn.FormCreate(Sender: TObject);
begin
    self.PodeFechar := false;
end;

procedure TFrmSelForn.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

end.
