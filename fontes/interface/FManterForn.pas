unit FManterForn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Mask, ComCtrls, Buttons, FSelForn, cControle, cDataModule,
  cPessoaJuridica, cPessoaFisica, cFornecedor, FManterTelefone;
 

type
  TFrmManterForn = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    N1: TMenuItem;
    ListarPessoaFsica1: TMenuItem;
    ListarPessoaJurdica1: TMenuItem;
    Label14: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    Label3: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    MaskEdit2: TMaskEdit;
    ComboBox1: TComboBox;
    Memo1: TMemo;
    Label11: TLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label12: TLabel;
    GroupBox3: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Edit6: TEdit;
    Edit7: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit8: TEdit;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaxCodInclusao;
    procedure LimparParaIncluir;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    Procedure AtribuirDadosFornecedorPF;
    procedure AtribuirDadosFornecedorPJ;
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    Procedure ListarTodosPessoaJuridica;
    Procedure ListarTodosPessoaFisica;
    procedure ListarPessoaJurdica1Click(Sender: TObject);
    procedure ListarPessoaFsica1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InclusaoTelefone;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManterForn: TFrmManterForn;
  DM : TDM;
  teste : integer;

implementation

{$R *.dfm}

uses
    FPrincipal;
   
procedure TFrmManterForn.RadioButton1Click(Sender: TObject);
begin
    self.Maskedit1.Clear;
    self.Edit1.Clear;
    self.Label1.Caption := 'CNPJ:';
    self.Maskedit1.EditMask := '!00\.000\.000\/0000\-00;0;_';
    self.Label2.Caption := 'Raz.Social:';
    self.Edit8.Text := 'PJ';
end;

procedure TFrmManterForn.RadioButton2Click(Sender: TObject);
begin
    self.Maskedit1.Clear;
    self.Edit1.Clear;
    self.Label1.Caption := 'CPF:';
    self.Maskedit1.EditMask := '!000\.000\.000\-00;0;_';
    self.Label2.Caption := 'Nome:';
    self.Edit8.Text := 'PF';
end;

procedure TFrmManterForn.RadioButton3Click(Sender: TObject);
begin
    self.Edit6.Text := 'Ativo';
end;

procedure TFrmManterForn.RadioButton4Click(Sender: TObject);
begin
    self.Edit6.Text := 'Inativo';
end;

procedure TFrmManterForn.Limpar1Click(Sender: TObject);
begin
    self.LimparParaIncluir;
    self.RadioButton1.Checked := true;
    self.RadioButton1.Enabled := true;
end;

procedure TFrmManterForn.BitBtn3Click(Sender: TObject);
begin
    FrmSelForn.ShowModal;
end;

procedure TFrmManterForn.BitBtn1Click(Sender: TObject);
var
    DM : TDM;
    Ct : Controle;
    PF : PessoaFisica;
    PJ : PessoaJuridica;
begin
    try
        if (RadioButton1.Checked = true) then
        begin
            if  (self.Edit7.Text <> '') AND (self.MaskEdit1.Text <> '') AND (self.Edit1.Text <> '')
            AND (self.Edit2.Text <> '') AND (self.Edit3.Text <> '') AND (self.MaskEdit2.Text <> '')
            AND (self.Edit4.Text <> '') AND (self.Edit6.Text <> '') AND (self.Edit8.Text <> '') then
            begin
                DM := TDM.Create(NIL);
                PJ := PessoaJuridica.Create(StrToInt(Edit7.Text),Edit2.Text,Edit3.Text,Edit4.Text,Edit5.Text,
                                            Combobox1.Text,Memo1.Text,StrToInt(Maskedit2.Text),
                                            DateTimePicker1.DateTime,Edit6.Text,Maskedit1.Text,Edit1.Text);
                PJ.settipoForn(self.Edit8.Text);
                Ct := Controle.Create(DM,PJ);
                Ct.IncluirFornPJ;

                if Application.MessageBox('Deseja incluir registro de Telefone para este Cliente?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
                begin
                    self.InclusaoTelefone
                end;

                MessageDlg('Inclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
            end
            else
               MessageDlg('Existem Campos obrigatório vazio.', mtWarning, [mbOk], 0);
        end;

        if (RadioButton2.Checked = true) then
        begin
            if  (self.Edit7.Text <> '') AND (self.MaskEdit1.Text <> '') AND (self.Edit1.Text <> '')
            AND (self.Edit2.Text <> '') AND (self.Edit3.Text <> '') AND (self.MaskEdit2.Text <> '')
            AND (self.Edit4.Text <> '') AND (self.Edit6.Text <> '')   AND (self.Edit8.Text <> '') then
            begin
                DM := TDM.Create(NIL);
                PF := PessoaFisica.Create(StrToInt(Edit7.Text),Edit2.Text,Edit3.Text,Edit4.Text,Edit5.Text,
                                          Combobox1.Text,Memo1.Text,StrToInt(Maskedit2.Text),
                                          DateTimePicker1.DateTime,Edit6.Text,Maskedit1.Text,Edit1.Text);
                PF.settipoForn(self.Edit8.Text);
                Ct := Controle.Create(DM,PF);
                Ct.IncluirFornPF;

                if Application.MessageBox('Deseja incluir registro de Telefone para este Cliente?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
                begin
                    self.InclusaoTelefone
                end;

                MessageDlg('Inclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
            end
            else
               MessageDlg('Existem Campos obrigatório vazio.', mtWarning, [mbOk], 0);
        end;
        FrmManterForn.LimparParaIncluir;
    except
         MessageDlg('Problema na Inclusão do Fornecedor.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterForn.MaxCodInclusao;
var
    DM  : TDM;
    Ct  : Controle;
    res : integer;
begin
    try
        DM  := TDM.Create(NIL);
        Ct  := Controle.Create(DM);
        Ct.RetMaxCodForn;
        res := DM.ZQuery1.FieldByName('Max(codForn)').AsInteger;
        self.Edit7.Text := IntToStr(res + 1);
    except
         MessageDlg('Problema na Geração do código para inclusão.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmManterForn.LimparParaIncluir;
begin
    self.RadioButton1.Checked := true;
    self.RadioButton1.Enabled := true;
    self.RadioButton2.Checked := false;
    self.RadioButton2.Enabled := true;
    self.Label1.Caption := 'CNPJ:';
    self.MaskEdit1.ReadOnly := false;
    self.Maskedit1.Clear;
    self.Maskedit1.EditMask := '!00\.000\.000\/0000\-00;0;_';
    self.Label2.Caption := 'Raz.Social:';
    self.Edit1.Clear;
    self.Edit2.Clear;
    self.Edit3.Clear;
    self.Edit4.Clear;
    self.Edit5.Clear;
    self.Maskedit2.Clear;
    self.Maskedit2.EditMask := '!00000\-000;0;_';
    self.Memo1.Clear;
    self.Edit6.Text := 'Ativo';
    self.RadioButton3.Checked := true;
    self.BitBtn4.Enabled := false;
    self.BitBtn2.Enabled := false;
    self.DateTimePicker1.Date := DATE; //Recebe data atual do sistema.
    self.Edit8.Text := 'PJ';
    self.MaxCodInclusao;
    self.BitBtn1.Enabled := true;
    self.BitBtn3.Enabled := true;
    self.BitBtn5.Enabled := false;
    self.BitBtn6.Enabled := false;
    self.BitBtn7.Enabled := false;
    self.BitBtn8.Enabled := false;
end;


procedure TFrmManterForn.BitBtn2Click(Sender: TObject);
var
    DM : TDM;
    Ct : Controle;
    PJ : PessoaJuridica;
    PF : PessoaFisica;
begin
     try
        if (RadioButton1.Checked = true) then
        begin
            if  (self.Edit7.Text <> '') AND (self.MaskEdit1.Text <> '') AND (self.Edit1.Text <> '')
            AND (self.Edit2.Text <> '') AND (self.Edit3.Text <> '') AND (self.MaskEdit2.Text <> '')
            AND (self.Edit4.Text <> '') AND (self.Edit6.Text <> '')  AND (self.Edit8.Text <> '') then
            begin
                DM := TDM.Create(NIL);
                PJ := PessoaJuridica.Create(StrToInt(Edit7.Text),Edit2.Text,Edit3.Text,Edit4.Text,Edit5.Text,
                                            Combobox1.Text,Memo1.Text,StrToInt(Maskedit2.Text),
                                            DateTimePicker1.DateTime,Edit6.Text,Maskedit1.Text,Edit1.Text);
                PJ.settipoForn(self.Edit8.Text);  
                Ct := Controle.Create(DM,PJ);
                Ct.EditarFornPJ;
                MessageDlg('Edição efetuada com sucesso.', mtInformation, [mbOk], 0);
                self.BitBtn5.Enabled := false;
                self.BitBtn6.Enabled := false;
                self.BitBtn7.Enabled := false;
                self.BitBtn8.Enabled := false;
            end
            else
               MessageDlg('Existem Campos Obrigatórios Vazio.', mtError, [mbOk], 0);
        end;

        if (RadioButton2.Checked = true) then
        begin
            if  (self.Edit7.Text <> '') AND (self.MaskEdit1.Text <> '') AND (self.Edit1.Text <> '')
            AND (self.Edit2.Text <> '') AND (self.Edit3.Text <> '') AND (self.MaskEdit2.Text <> '')
            AND (self.Edit4.Text <> '') AND (self.Edit6.Text <> '') then
            begin
                DM := TDM.Create(NIL);
                PF := PessoaFisica.Create(StrToInt(Edit7.Text),Edit2.Text,Edit3.Text,Edit4.Text,Edit5.Text,
                                          Combobox1.Text,Memo1.Text,StrToInt(Maskedit2.Text),
                                          DateTimePicker1.DateTime,Edit6.Text,Maskedit1.Text,Edit1.Text);
                PF.settipoForn(self.Edit8.Text);
                Ct := Controle.Create(DM,PF);
                Ct.EditarFornPF;
                MessageDlg('Edição efetuada com sucesso.', mtInformation, [mbOk], 0);
                self.BitBtn5.Enabled := false;
                self.BitBtn6.Enabled := false;
                self.BitBtn7.Enabled := false;
                self.BitBtn8.Enabled := false;
            end
            else
               MessageDlg('Existem Campos Obrigatórios Vazio.', mtWarning, [mbOk], 0);
        end;
    except
         MessageDlg('Problema na Edição.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterForn.BitBtn4Click(Sender: TObject);
var
    DM   : TDM;
    Ct   : Controle;
    Forn : Fornecedor;
begin
     try
        if (self.RadioButton1.Checked = true) then
        begin
            DM := TDM.Create(NIL);
            Forn := Fornecedor.Create(StrToInt(self.Edit7.Text),'','','','','','',0,00/00/0000,'','');
            Ct := Controle.Create(DM,Forn);

            if(Ct.VerifFornecComPdCompra = 1) then
            begin
                if(Ct.VerifFornecComTelefone = 1) then
                begin
                    Ct.ExcluirFornPJ;
                    MessageDlg('Exclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
                    self.LimparParaIncluir;
                end
                else
                begin
                    MessageDlg('Não foi possível excluir este Fornecedor.', mtInformation, [mbOk], 0);
                    MessageDlg('Este Fornecedor possui registro de Telefone associado.', mtInformation, [mbOk], 0);
                end;
            end
            else
            begin
                MessageDlg('Não foi possível excluir este Fornecedor.', mtInformation, [mbOk], 0);
                MessageDlg('Este Fornecedor possui registro de Pedido de Compra associado.', mtInformation, [mbOk], 0);
            end;
        end;

        if (self.RadioButton2.Checked = true) then
        begin
            DM := TDM.Create(NIL);
            Forn := Fornecedor.Create(StrToInt(self.Edit7.Text),'','','','','','',0,00/00/0000,'','');
            Ct := Controle.Create(DM,Forn);

            if(Ct.VerifFornecComPdCompra = 1) then
            begin
                if(Ct.VerifFornecComTelefone = 1) then
                begin
                    Ct.ExcluirFornPF;
                    MessageDlg('Exclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
                    self.LimparParaIncluir;
                end
                else
                begin
                    MessageDlg('Não foi possível excluir este Fornecedor.', mtInformation, [mbOk], 0);
                    MessageDlg('Este Fornecedor possui registro de Telefone associado.', mtInformation, [mbOk], 0);
                end;
            end
            else
            begin
                MessageDlg('Não foi possível excluir este Fornecedor.', mtInformation, [mbOk], 0);
                MessageDlg('Este Fornecedor possui registro de Pedido de Compra associado.', mtInformation, [mbOk], 0);
            end;
        end;
    except
         MessageDlg('Problema na Exclusão.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmManterForn.AtribuirDadosFornecedorPF;
begin
    try
        self.MaskEdit1.ReadOnly := true;
        self.Edit7.Text := IntToStr(DM.ZQuery1.FieldByName('codForn').AsInteger);
        self.Maskedit1.EditMask := '!000\.000\.000\-00;0;_';
        self.MaskEdit1.Text := DM.ZQuery1.FieldByName('cpfForn').AsString;
        self.Edit1.Text := DM.ZQuery1.FieldByName('nomeForn').AsString;
        self.Edit2.Text := DM.ZQuery1.FieldByName('endForn').AsString;
        self.Edit3.Text := DM.ZQuery1.FieldByName('bairroForn').AsString;
        self.MaskEdit2.EditMask := '!00000\-000;0;_';
        self.MaskEdit2.Text := IntToStr(DM.ZQuery1.FieldByName('cepForn').AsInteger);
        self.Edit4.Text := DM.ZQuery1.FieldByName('cidadeForn').AsString;
        self.ComboBox1.Text := DM.ZQuery1.FieldByName('estadoForn').AsString;
        self.Edit5.Text := DM.ZQuery1.FieldByName('emailForn').AsString;
        self.Memo1.Text := DM.ZQuery1.FieldByName('descForn').AsString;
        self.Edit7.Text := IntToStr(DM.ZQuery1.FieldByName('codForn').AsInteger);
        self.Edit6.Text := DM.ZQuery1.FieldByName('statusForn').AsString;
        self.Edit8.Text := DM.ZQuery1.FieldByName('tipoForn').AsString;
        if (FrmManterForn.Edit6.Text = 'Ativo') then
        begin
           self.RadioButton3.Checked := true;
        end
        else if (FrmManterForn.Edit6.Text = 'Inativo') then
        begin
            self.RadioButton4.Checked := true;
        end;
        self.DateTimePicker1.DateTime := DM.ZQuery1.FieldByName('dataAdmissao').AsDateTime;
    except
         MessageDlg('Problema na atribuição do dados de Pessoa Física.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmManterForn.BitBtn8Click(Sender: TObject);
begin
    try
        DM.ZQuery1.First;
        if(RadioButton2.Checked = true) then
           self.AtribuirDadosFornecedorPF
        else if(RadioButton1.Checked = true) then
           self.AtribuirDadosFornecedorPJ;

        BitBtn8.Enabled := false;
        BitBtn7.Enabled := false;
        BitBtn6.Enabled := true;
        BitBtn5.Enabled := true;
    except
         MessageDlg('Problema na navegação por Fornecedores.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterForn.BitBtn7Click(Sender: TObject);
begin
    try
       DM.ZQuery1.Prior;

        if(RadioButton2.Checked = true) then
           self.AtribuirDadosFornecedorPF
        else if(RadioButton1.Checked = true) then
           self.AtribuirDadosFornecedorPJ;

        if (DM.ZQuery1.Bof) then
        begin
            BitBtn8.Enabled := false;
            BitBtn7.Enabled := false;
        end;
        BitBtn6.Enabled := true;
        BitBtn5.Enabled := true;
    except
         MessageDlg('Problema na navegação por Fornecedores.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterForn.BitBtn6Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Next;

        if(RadioButton2.Checked = true) then
           self.AtribuirDadosFornecedorPF
        else if(RadioButton1.Checked = true) then
           self.AtribuirDadosFornecedorPJ;

        if (DM.ZQuery1.Eof) then
        begin
            BitBtn5.Enabled := false;
            BitBtn6.Enabled := false;
        end;

        BitBtn8.Enabled := true;
        BitBtn7.Enabled := true;
    except
        MessageDlg('Problema na Navegação por Fornecedor.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterForn.BitBtn5Click(Sender: TObject);
begin
    try
       DM.ZQuery1.Last;
       if(RadioButton2.Checked = true) then
          self.AtribuirDadosFornecedorPF
       else if(RadioButton1.Checked = true) then
          self.AtribuirDadosFornecedorPJ;

       BitBtn5.Enabled := false;
       BitBtn6.Enabled := false;
       BitBtn8.Enabled := true;
       BitBtn7.Enabled := true;
    except
         MessageDlg('Problema na navegação por Fornecedores.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmManterForn.AtribuirDadosFornecedorPJ;
begin
    try
        self.Maskedit1.EditMask := '!00\.000\.000\/0000\-00;0;_';
        self.MaskEdit1.Text := DM.ZQuery1.FieldByName('cnpj').AsString;
        self.Edit1.Text := DM.ZQuery1.FieldByName('razaoSocial').AsString;
        self.Edit2.Text := DM.ZQuery1.FieldByName('endForn').AsString;
        self.Edit3.Text := DM.ZQuery1.FieldByName('bairroForn').AsString;
        self.Maskedit2.EditMask := '!00000\-000;0;_';
        self.MaskEdit2.Text := IntToStr(DM.ZQuery1.FieldByName('cepForn').AsInteger);
        self.Edit4.Text := DM.ZQuery1.FieldByName('cidadeForn').AsString;
        self.ComboBox1.Text := DM.ZQuery1.FieldByName('estadoForn').AsString;
        self.Edit5.Text := DM.ZQuery1.FieldByName('emailForn').AsString;
        self.Memo1.Text := DM.ZQuery1.FieldByName('descForn').AsString;
        self.Edit6.Text := DM.ZQuery1.FieldByName('statusForn').AsString;
        self.Edit7.Text := IntToStr(DM.ZQuery1.FieldByName('codForn').AsInteger);
        self.Edit8.Text := DM.ZQuery1.FieldByName('tipoForn').AsString;

        if (self.Edit6.Text = 'Ativo') then
        begin
            self.RadioButton3.Checked := true;
        end
        else if (self.Edit6.Text = 'Inativo') then
        begin
            self.RadioButton4.Checked := true;
        end;
        self.DateTimePicker1.DateTime := DM.ZQuery1.FieldByName('dataAdmissao').AsDateTime;
    except
        MessageDlg('Problema na atribuição do dados de Pessoa Jurídica.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterForn.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if Application.MessageBox('Deseja terminar a manutenção de Fornecedor?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
    begin
        self.LimparParaIncluir;
        self.Label1.Caption := 'CNPJ:';
        self.Maskedit1.EditMask := '!00\.000\.000\/0000\-00;0;_';
        self.Label2.Caption := 'Raz.Social:';
        FrmPrincipal.Enabled := true;
        canClose := true;
    end
    else
       canClose := false;
end;

Procedure TFrmManterForn.ListarTodosPessoaFisica;
var
    Ct : Controle;
begin
     try
        self.Edit7.Text := '';
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.ListarTodosFornPF;

        if(DM.ZQuery1.FieldByName('codForn').AsString <> '') then
        begin
           self.AtribuirDadosFornecedorPF;
           self.BitBtn5.Enabled := true;
           self.BitBtn6.Enabled := true;
           self.RadioButton2.Enabled := true;
           self.RadioButton2.Checked := true;
           self.RadioButton1.Enabled := false;
           self.RadioButton1.Checked := false;
        end
        else
        begin
            MessageDlg('Não existe nenhum Fornecedor Pessoa Física cadastrado.', mtInformation, [mbOk], 0);
            DM.Destroy;
        end;
    except
         MessageDlg('Problema na Listagem por todos os Fornecedores Pessoa Física.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmManterForn.ListarTodosPessoaJuridica;
var
    Ct : Controle;
begin
     try
         DM := TDM.Create(NIL);
         Ct := Controle.Create(DM);
         Ct.ListarTodosFornPJ;

         if(DM.ZQuery1.FieldByName('codForn').AsString <> '') then
         begin
             self.AtribuirDadosFornecedorPJ;
             self.BitBtn5.Enabled := true;
             self.BitBtn6.Enabled := true;
             self.BitBtn1.Enabled := false;
             self.BitBtn2.Enabled := true;
             self.BitBtn3.Enabled := true;
             self.BitBtn4.Enabled := true;
             self.RadioButton1.Enabled := true;
             self.RadioButton1.Checked := true;
             self.RadioButton2.Enabled := false;
             self.RadioButton2.Checked := false;
        end
        else
        begin
            MessageDlg('Não existe nenhum Fornecedor Pessoa Jurídica cadastrado.', mtInformation, [mbOk], 0);
            DM.Destroy;
        end;
    except
         MessageDlg('Problema na Listagem por todos os Fornecedores Pessoa Jurídica.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterForn.ListarPessoaJurdica1Click(Sender: TObject);
begin
    //self.ListarTodosPessoaJuridica;
end;

procedure TFrmManterForn.ListarPessoaFsica1Click(Sender: TObject);
begin
    //self.ListarTodosPessoaFisica;
end;

procedure TFrmManterForn.FormShow(Sender: TObject);
begin
    self.LimparParaIncluir;
    self.MaskEdit1.SetFocus;
end;


procedure TFrmManterForn.InclusaoTelefone;
var
    Ct : Controle;
    DM : TDM;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        FrmManterTelefone.Label2.Caption := 'R.Social:';
        FrmManterTelefone.Edit3.Text := 'FORNECEDOR';
        FrmManterTelefone.Edit4.Text := self.Edit7.Text;
        FrmManterTelefone.Edit1.Text :=  IntToStr(Ct.MaxCodTel + 1);
        FrmManterTelefone.Edit2.Text := self.Edit1.Text;
        FrmManterTelefone.Habilitar;
        FrmManterTelefone.BitBtn1.Enabled := true;
        FrmManterTelefone.BitBtn2.Enabled := false;
        FrmManterTelefone.BitBtn3.Enabled := false;
        FrmManterTelefone.BitBtn4.Enabled := false;
        FrmManterTelefone.BitBtn5.Enabled := false;
        FrmManterTelefone.BitBtn6.Enabled := false;
        FrmManterTelefone.BitBtn7.Enabled := false;
        FrmManterTelefone.BitBtn8.Enabled := false;
        FrmManterTelefone.MaskEdit2.Enabled := true;
        FrmManterTelefone.MaskEdit3.Enabled := true;
        FrmManterTelefone.sitfechar := 1;
        FrmManterTelefone.ShowModal;
    except
        MessageDlg('Problema ao disponibilizar o Manter Telefone.', mtError, [mbOk], 0);
        MessageDlg('Inclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
        self.LimparParaIncluir;
        self.MaskEdit1.SetFocus;
    end;
end;


end.
