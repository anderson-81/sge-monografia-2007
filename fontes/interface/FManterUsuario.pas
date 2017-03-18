unit FManterUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ExtCtrls, DBCtrls, Buttons, cControle, cUsuario, cDataModule,
  cFuncionario, Menus;

type
  TFrmManterUsuario = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Edit1: TEdit;
    Label7: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    Edit4: TEdit;
    N1: TMenuItem;
    ListarUsuriosFuncionrios1: TMenuItem;
    ListarUsuriosNoFuncionrios1: TMenuItem;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ClearBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure AtribuirValores;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    Procedure DesabilitarNavg;
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    procedure ListarUsuriosFuncionrios1Click(Sender: TObject);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Habilitar;
    procedure Desabilitar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManterUsuario: TFrmManterUsuario;
  codUsuario:integer;
  DM : TDM;

implementation

uses FBuscarUsuario, FPrincipal;

{$R *.dfm}

procedure TFrmManterUsuario.BitBtn2Click(Sender: TObject);
begin
    FrmBuscarUsuario.ShowModal;
    FrmBuscarUsuario.Edit1.Clear;
    FrmBuscarUsuario.RadioButton1.Checked := true;
end;

procedure TFrmManterUsuario.BitBtn4Click(Sender: TObject);
var
    Func : Funcionario;
    Ct   : Controle;
    DM   : TDM;
    Usu  : Usuario;
begin
    try
        if (Edit3.Text <> '') AND (Maskedit2.Text <> '') AND (Combobox1.Text <> '') then
        begin
           Usu  := Usuario.Create(StrToInt(self.Edit1.Text),self.Edit3.Text,self.MaskEdit2.Text,self.ComboBox1.Text, Edit4.Text);
           DM   := TDM.Create(NIL);
           Func := Funcionario.Create;
           Func.setcpfFunc(Maskedit1.Text);
           Ct   := Controle.Create(DM,Func,Usu);
           Ct.IncluirUsu;
           MessageDlg('Inclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
           ClearBox;
           self.BitBtn4.Enabled := false;
           self.Desabilitar;
       end
       else
           MessageDlg('Formulário possui campos obrigatórios vazio.', mtError, [mbOk], 0);
     except
         MessageDlg('Problema na Inclusão de usuário no sistema.', mtError, [mbOk], 0);
     end;
end;

procedure TFrmManterUsuario.ClearBox;
begin
    FrmManterUsuario.Edit1.Clear;
    FrmManterUsuario.Edit2.Clear;
    FrmManterUsuario.Edit3.Clear;
    FrmManterUsuario.MaskEdit1.Clear;
    FrmManterUsuario.MaskEdit2.Clear;
end;

procedure TFrmManterUsuario.BitBtn3Click(Sender: TObject);
var
    Ct   : Controle;
    DM   : TDM;
    Usu  : Usuario;
begin
    try
        if (Edit3.Text <> '') AND (Maskedit2.Text <> '') AND (Combobox1.Text <> '') then
        begin
           Usu  := Usuario.Create(StrToInt(self.Edit1.Text),self.Edit3.Text,self.MaskEdit2.Text,self.ComboBox1.Text, Edit4.Text);
           DM   := TDM.Create(NIL);
           Ct   := Controle.Create(DM,Usu);
           Ct.EditarUsu;
           MessageDlg('Edição efetuada com sucesso.', mtInformation, [mbOk], 0);
           self.BitBtn5.Enabled := false;
           self.BitBtn6.Enabled := false;
           self.BitBtn7.Enabled := false;
           self.BitBtn8.Enabled := false;
        end
        else
           MessageDlg('Formulário possui campos obrigatórios vazio.', mtError, [mbOk], 0);
     except
         MessageDlg('Problema na Edição.', mtError, [mbOk], 0);
     end;
end;


procedure TFrmManterUsuario.BitBtn8Click(Sender: TObject);
begin
    try
        DM.ZQuery1.First;
        self.AtribuirValores;
        self.BitBtn8.Enabled := false;
        self.BitBtn7.Enabled := false;
        self.BitBtn6.Enabled := true;
        self.BitBtn5.Enabled := true;
    except
        MessageDlg('Problema na navegação por Usuários.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterUsuario.BitBtn7Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Prior;
        self.AtribuirValores;

        if (DM.ZQuery1.Bof) then
        begin
            self.BitBtn8.Enabled := false;
            self.BitBtn7.Enabled := false;
        end;

        self.BitBtn6.Enabled := true;
        self.BitBtn5.Enabled := true;
    except
        MessageDlg('Problema na navegação por Usuários.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterUsuario.BitBtn6Click(Sender: TObject);
begin
     try
        DM.ZQuery1.Next;
        self.AtribuirValores;

        if (DM.ZQuery1.Eof) then
        begin
            self.BitBtn5.Enabled := false;
            self.BitBtn6.Enabled := false;
        end;

        self.BitBtn8.Enabled := true;
        self.BitBtn7.Enabled := true;
    except
        MessageDlg('Problema na navegação por Usuários.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterUsuario.BitBtn5Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Last;
        self.AtribuirValores;

        self.BitBtn5.Enabled := false;
        self.BitBtn6.Enabled := false;

        self.BitBtn8.Enabled := true;
        self.BitBtn7.Enabled := true;
    except
        MessageDlg('Problema na navegação por Usuários.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterUsuario.AtribuirValores;
var
    status : String;
begin
    try
        FrmManterUsuario.BitBtn6.Enabled := true;
        FrmManterUsuario.BitBtn5.Enabled := true;
        FrmManterUsuario.BitBtn7.Enabled := false;
        FrmManterUsuario.BitBtn8.Enabled := false;
        FrmManterUsuario.Maskedit1.EditMask := '!000\.000\.000\-00;0;_';
        FrmManterUsuario.Edit1.Text     := IntToStr(DM.ZQuery1.FieldByName('codUsu').AsInteger);
        FrmManterUsuario.MaskEdit1.Text := DM.ZQuery1.FieldByName('cpfFunc').AsString;
        FrmManterUsuario.Edit2.Text     := DM.ZQuery1.FieldByName('nomeFunc').AsString;
        FrmManterUsuario.Edit3.Text     := DM.ZQuery1.FieldByName('logUsu').AsString;
        FrmManterUsuario.MaskEdit2.Text := DM.ZQuery1.FieldByName('senhaUsu').AsString;
        FrmManterUsuario.ComboBox1.Text := DM.ZQuery1.FieldByName('nivelUsu').AsString;
        status := DM.ZQuery1.FieldByName('statusUsu').AsString;

        if(status = 'Ativo') then
        begin
            RadioButton1.Checked := true;
            RadioButton2.Checked := false;
        end
        else if(status = 'Inativo') then
        begin
            RadioButton1.Checked := false;
            RadioButton2.Checked := true;
        end;
    except
         MessageDlg('Problema na Atribuição dos valores.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmManterUsuario.BitBtn1Click(Sender: TObject);
var
    Ct   : Controle;
    Usu  : Usuario;
    sit  : integer;
    DM   : TDM;
begin
    DM   := TDM.Create(NIL);
    Usu  := Usuario.Create(0,'','','','');
    Ct   := Controle.Create(DM,Usu);
  
    try
        if Application.MessageBox('Deseja efetuar a exclusão?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
        begin
            Usu.setCodUsu(StrToInt(Edit1.Text));
            sit := Ct.VerifUsuarioAtendCliente;
            if(sit = 1) then
            begin
               if(StrToInt(FrmPrincipal.Edit1.Text) <> Usu.getCodUsu) then
               begin
                  Ct.ExcluirUsu;
                  MessageDlg('Exclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
                  ClearBox;
                  FrmManterUsuario.BitBtn1.Enabled := false;
                  FrmManterUsuario.BitBtn3.Enabled := false;
                  FrmManterUsuario.BitBtn4.Enabled := false;
                  FrmManterUsuario.BitBtn5.Enabled := false;
                  FrmManterUsuario.BitBtn6.Enabled := false;
                  FrmManterUsuario.BitBtn7.Enabled := false;
                  FrmManterUsuario.BitBtn8.Enabled := false;
                  self.Desabilitar;
               end
               else
               begin
                   MessageDlg('Não foi possível excluir usuário do sistema.', mtError, [mbOk], 0);
                   MessageDlg('Usuário Ativo no Sistema.', mtInformation, [mbOk], 0);
               end;
            end
            else
            begin
                Showmessage('Não foi possível excluir Usuário do Sistema.');
                MessageDlg('Usuário vinculado a um ou mais atendimentos de clientes no Sistema.', mtInformation, [mbOk], 0);
            end
        end;
    Except
        MessageDlg('Problema na Exclusão de Usuário.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmManterUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmPrincipal.Enabled := true;
end;

procedure TFrmManterUsuario.FormCreate(Sender: TObject);
begin
    self.ClearBox;
end;

Procedure TFrmManterUsuario.DesabilitarNavg;
begin
    FrmManterUsuario.BitBtn5.Enabled := false;
    FrmManterUsuario.BitBtn6.Enabled := false;
    FrmManterUsuario.BitBtn7.Enabled := false;
    FrmManterUsuario.BitBtn8.Enabled := false;
end;

procedure TFrmManterUsuario.FormShow(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
    self.ClearBox;
    self.Desabilitar;
    self.DesabilitarNavg;
    FrmManterUsuario.BitBtn1.Enabled := false;
    FrmManterUsuario.BitBtn3.Enabled := false;
    FrmManterUsuario.BitBtn4.Enabled := false;
    self.Edit4.Text := 'Ativo';
end;

procedure TFrmManterUsuario.RadioButton1Click(Sender: TObject);
begin
    Edit4.Text := 'Ativo';
end;

procedure TFrmManterUsuario.RadioButton2Click(Sender: TObject);
begin
    Edit4.Text := 'Inativo';
end;

procedure TFrmManterUsuario.Limpar1Click(Sender: TObject);
begin
    FrmManterUsuario.Edit4.Text := 'Ativo';
    FrmManterUsuario.RadioButton1.Checked := true;
    self.ClearBox;
    self.DesabilitarNavg;
    FrmManterUsuario.ComboBox1.Text := 'Gerente';
    FrmManterUsuario.BitBtn1.Enabled := false;
    FrmManterUsuario.BitBtn3.Enabled := false;
    FrmManterUsuario.BitBtn4.Enabled := false;
    self.GroupBox3.Enabled := false;
end;

procedure TFrmManterUsuario.ListarUsuriosFuncionrios1Click(
  Sender: TObject);
var
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.ListarTodosUsuarios;
        if (DM.ZQuery1.FieldByName('codUsu').AsInteger <> 0) then
        begin
            FrmManterUsuario.AtribuirValores;
            FrmManterUsuario.BitBtn4.Enabled := false;
            FrmManterUsuario.BitBtn2.Enabled := true;
            FrmManterUsuario.BitBtn1.Enabled := true;
            FrmManterUsuario.BitBtn3.Enabled := true;
            self.Habilitar;
        end
        else if (DM.ZQuery1.FieldByName('codUsu').AsInteger = 0) then
        begin
           Showmessage ('Não Existe Nenhum Usuário cadastrado no Sistema.');
        end;
    except
        MessageDlg('Problema na Listagem dos Usuários do Sistema.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterUsuario.MaskEdit1Enter(Sender: TObject);
begin
    if(self.Edit3.Enabled = true) then
       self.Edit3.SetFocus
    else
       self.BitBtn2.SetFocus;
end;

procedure TFrmManterUsuario.Edit2Enter(Sender: TObject);
begin
    if(self.Edit3.Enabled = true) then
       self.Edit3.SetFocus
    else
       self.BitBtn2.SetFocus;
end;

procedure TFrmManterUsuario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if Application.MessageBox('Deseja terminar a manutenção de Usuário do Sistema?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
    begin
        self.Desabilitar;
        self.DesabilitarNavg;
        canClose := true;
    end
    else
       canClose := false;
end;

procedure TFrmManterUsuario.Habilitar;
begin
    self.Edit3.Enabled := true;
    self.MaskEdit2.Enabled := true;
    self.ComboBox1.Enabled := true;
    self.RadioButton1.Enabled := true;
    self.RadioButton2.Enabled := true;
end;

procedure TFrmManterUsuario.Desabilitar;
begin
    self.Edit3.Enabled := false;
    self.MaskEdit2.Enabled := false;
    self.ComboBox1.Enabled := false;
    self.RadioButton1.Enabled := false;
    self.RadioButton2.Enabled := false;
end;


end.

















