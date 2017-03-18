unit FManterCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, QControls,
  cControle, cCliente, cDataModule, Menus, FManterTelefone;

type
  TFrmManterCliente = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn5: TBitBtn;
    Label9: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ListarTodososClientes1: TMenuItem;
    Edit7: TEdit;
    procedure ClearBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RetCodInclusao;
    procedure AtribuirValores;
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListarTodososClientes1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure LimparParaIncluir;
    procedure Limpar1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure InclusaoTelefone;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManterCliente: TFrmManterCliente;

implementation

uses FBuscarCliente, FPrincipal;


{$R *.dfm}

procedure TFrmManterCliente.BitBtn4Click(Sender: TObject);
var
    Cli      : Cliente;
    Ct       : Controle;
begin
    try
        if Application.MessageBox('Deseja efetuar a exclusão?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
        begin
            Cli := Cliente.Create(StrToInt(Edit1.Text),'','','','','','','');
            DM  := TDM.Create(NIL);
            Ct  := Controle.create (DM,Cli);

            if(Ct.VerifClienteVenda = 1) then
            begin
                if (Ct.VerifClienteTelefone = 1) then
                begin
                    Ct.ExcluirCli;
                    MessageDlg('Exclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
                    FrmManterCliente.LimparParaIncluir;
                end
                else
                begin
                    MessageDlg('Não foi possível excluir este Cliente.', mtInformation, [mbOk], 0);
                    MessageDlg('Este Cliente possui Registro de Telefone Associado.', mtInformation, [mbOk], 0);
                end
            end
            else
            begin
                MessageDlg('Não foi possível excluir este Cliente.', mtInformation, [mbOk], 0);
                MessageDlg('Este Cliente possui Registro de Venda Associado.', mtInformation, [mbOk], 0);
            end
        end;
    Except
        MessageDlg('Problema na exclusão do Cliente.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterCliente.BitBtn1Click(Sender: TObject);
var
    Cli : Cliente;
    Ct  : Controle;
    DM  : TDM;
begin
   try
        if(self.Edit1.Text <> '') AND (self.Edit2.Text <> '')  AND (self.Edit3.Text <> '')  AND (self.Edit4.Text <> '')  AND (self.Edit5.Text <> '')  AND (self.Edit7.Text <> '') then
        begin
            if (RadioButton1.Checked = true) then
            begin
                Edit7.Text := 'Ativo';
            end
            else if (RadioButton2.Checked = true) then
            begin
                Edit7.Text := 'Inativo';
            end;

            Cli := Cliente.Create(StrToInt(Edit1.Text),Edit2.Text,Edit3.Text,Edit4.Text,Edit5.Text,Edit6.Text,Memo1.Text,Edit7.Text);
            DM  := TDM.Create(NIL);
            Ct  := Controle.Create (DM,Cli);
            Ct.IncluirCli(StrToInt(FrmPrincipal.Edit1.Text), FrmPrincipal.Edit2.Text);

            if Application.MessageBox('Deseja incluir registro de Telefone para este Cliente?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
            begin
               self.InclusaoTelefone
            end;

            MessageDlg('Inclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
            FrmManterCliente.LimparParaIncluir;
        end
        else
           MessageDlg('Existe um o mais Campos Obrigatórios Vazio.', mtWarning, [mbOk], 0);
   except
        MessageDlg('Problema na Inclusão.', mtError, [mbOk], 0);
   end;
end;

procedure TFrmManterCliente.BitBtn2Click(Sender: TObject);
var
    Cli : Cliente;
    Ct  : Controle;
begin
    try
        if(self.Edit1.Text <> '') AND (self.Edit2.Text <> '')  AND (self.Edit3.Text <> '')  AND (self.Edit4.Text <> '')  AND (self.Edit5.Text <> '')  AND (self.Edit7.Text <> '') then
        begin
            if (RadioButton1.Checked = true) then
            begin
                Edit7.Text := 'Ativo';
            end
            else if (RadioButton2.Checked = true) then
            begin
                Edit7.Text := 'Inativo';
            end;

            Cli := Cliente.Create(StrToInt(Edit1.Text),Edit2.Text,Edit3.Text,Edit4.Text,Edit5.Text,Edit6.Text,Memo1.Text,Edit7.Text);
            DM  := TDM.Create(NIL);
            Ct  := Controle.Create (DM,Cli);
            Ct.EditarCli;
            MessageDlg('Edição efetuada com sucesso.', mtInformation, [mbOk], 0);
            self.BitBtn5.Enabled := false;
            self.BitBtn6.Enabled := false;
            self.BitBtn7.Enabled := false;
            self.BitBtn8.Enabled := false;
        end
        else
           MessageDlg('Existe um o mais Campos Obrigatórios Vazio.', mtWarning, [mbOk], 0);
   except
        MessageDlg('Problema na Edição.', mtError, [mbOk], 0);
   end;
end;


procedure TFrmManterCliente.ClearBox;
begin
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    Edit5.Clear;
    Edit6.Clear;
    Edit7.Clear;
    Memo1.Clear;
    RadioButton1.Checked := true;
    Edit7.Text := 'Ativo';
end;

procedure TFrmManterCliente.BitBtn3Click(Sender: TObject);
begin
    FrmBuscarCliente.ShowModal;
end;

procedure TFrmManterCliente.BitBtn8Click(Sender: TObject);
begin
    try
        DM.ZQuery1.First;
        AtribuirValores;
        BitBtn8.Enabled := false;
        BitBtn7.Enabled := false;
        BitBtn6.Enabled := true;
        BitBtn5.Enabled := true;
    except
         MessageDlg('Problema na navegação por dados do Cliente.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterCliente.BitBtn7Click(Sender: TObject);
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
         MessageDlg('Problema na navegação por dados do Cliente.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterCliente.BitBtn6Click(Sender: TObject);
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
        MessageDlg('Problema na navegação por dados do Cliente.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterCliente.BitBtn5Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Last;
        AtribuirValores;

        BitBtn5.Enabled := false;
        BitBtn6.Enabled := false;

        BitBtn8.Enabled := true;
        BitBtn7.Enabled := true;
    except
        MessageDlg('Problema na navegação por dados do Cliente.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterCliente.AtribuirValores;
begin
    try
        Edit1.Text := IntToStr(DM.ZQuery1.FieldByName('codCli').AsInteger);
        Edit2.Text := DM.ZQuery1.FieldByName('nomeCli').AsString;
        Edit3.Text := DM.ZQuery1.FieldByName('endCli').AsString;
        Edit4.Text := DM.ZQuery1.FieldByName('bairroCli').AsString;
        Edit5.Text := DM.ZQuery1.FieldByName('cidCli').AsString;
        Edit6.Text := DM.ZQuery1.FieldByName('emailCli').AsString;
        Memo1.Text := DM.ZQuery1.FieldByName('obsCli').AsString;
        Edit7.Text := DM.ZQuery1.FieldByName('statusCli').AsString;

        if (Edit7.Text = 'Ativo') then
        begin
            RadioButton1.Checked := true;
            RadioButton2.Checked := false;
        end
        else if (Edit7.Text = 'Inativo') then
        begin
            RadioButton2.Checked := true;
            RadioButton1.Checked := false;
        end;
    except
        MessageDlg('Problema na Atribuição de dados do Cliente.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FrmPrincipal.Enabled := true;
    FrmManterCliente.ClearBox;
    BitBtn1.Enabled := true;
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := true;
    BitBtn4.Enabled := false;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn8.Enabled := false;
end;

procedure TFrmManterCliente.RetCodInclusao;
var
    Cli : Cliente;
    Ct  : Controle;
    DM  : TDM;
begin
    try
        Cli := Cliente.Create(0,'','','','','','','');
        DM  := TDM.Create(NIL);
        Ct  := Controle.create (DM,Cli);
        Clearbox;
        Ct.RetMaxCodCli;
        Edit1.Text := IntToStr(Cli.getCodCli + 1);
    except
        MessageDlg('Problema na Geração do Código de Inclusão.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterCliente.ListarTodososClientes1Click(Sender: TObject);
var
    Ct   : Controle;
    Cli  : Cliente;
begin
    try
        Cli := Cliente.Create(0,'','','','','','','');
        DM  := TDM.Create(NIL);
        Ct  := Controle.Create(DM,Cli);
        Ct.BuscarCliente;
        FrmManterCliente.AtribuirValores;

        if (Edit1.Text <> '') then
        begin
            BitBtn1.Enabled := false;
            BitBtn2.Enabled := true;
            BitBtn3.Enabled := true;
            BitBtn4.Enabled := true;
            BitBtn5.Enabled := true;
            BitBtn6.Enabled := true;
            BitBtn7.Enabled := false;
            BitBtn8.Enabled := false;
        end
        else
            FrmManterCliente.LimparParaIncluir;
    except
        MessageDlg('Problema na listagem de todos os Clientes', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterCliente.Sair1Click(Sender: TObject);
begin
    if Application.MessageBox('Deseja terminar a manutenção de Clientes?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
    begin
        FrmManterCliente.Close;
    end;
end;

procedure TFrmManterCliente.LimparParaIncluir;
begin
    FrmManterCliente.ClearBox;
    BitBtn1.Enabled := true;
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := true;
    BitBtn4.Enabled := false;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn8.Enabled := false;
    FrmManterCliente.RetCodInclusao;
end;


procedure TFrmManterCliente.Limpar1Click(Sender: TObject);
begin
    FrmManterCliente.LimparParaIncluir;
end;

procedure TFrmManterCliente.RadioButton1Click(Sender: TObject);
begin
    Edit7.Text := 'Ativo';
end;

procedure TFrmManterCliente.RadioButton2Click(Sender: TObject);
begin
    Edit7.Text := 'Inativo';
end;

procedure TFrmManterCliente.FormShow(Sender: TObject);
begin
    FrmManterCliente.ClearBox;
    BitBtn1.Enabled := true;
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := true;
    BitBtn4.Enabled := false;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn8.Enabled := false;
    FrmManterCliente.RetCodInclusao;
    self.Edit2.SetFocus;
end;

procedure TFrmManterCliente.Edit1Enter(Sender: TObject);
begin
    self.Edit2.SetFocus;
end;

procedure TFrmManterCliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if Application.MessageBox('Deseja terminar a manutenção de Cliente?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
       canClose := true
    else
       canClose := false;
end;

procedure TFrmManterCliente.InclusaoTelefone;
var
    Ct : Controle;
    DM : TDM;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        FrmManterTelefone.Label2.Caption := 'Nome:';
        FrmManterTelefone.Edit3.Text := 'CLIENTE';
        FrmManterTelefone.Edit4.Text := self.Edit1.Text;
        FrmManterTelefone.Edit1.Text :=  IntToStr(Ct.MaxCodTel + 1);
        FrmManterTelefone.Edit2.Text := self.Edit2.Text;
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
        FrmManterCliente.ClearBox;
        BitBtn1.Enabled := true;
        BitBtn2.Enabled := false;
        BitBtn3.Enabled := true;
        BitBtn4.Enabled := false;
        BitBtn5.Enabled := false;
        BitBtn6.Enabled := false;
        BitBtn7.Enabled := false;
        BitBtn8.Enabled := false;
        FrmManterCliente.RetCodInclusao;
        self.Edit2.SetFocus;
    end;
end;

end.
