unit FEfetuarLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, cControle, cUsuario, cDataModule, cFuncionario;
  

type
  TFrmEfetuarLogin = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Image1: TImage;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    MaskEdit1: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure HabilitarParaVendedor;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FecharConexao;
  private
    { Private declarations }
  public
    PodeFechar : Boolean;
    { Public declarations }
  end;

var
  FrmEfetuarLogin: TFrmEfetuarLogin;

implementation

uses FPrincipal;

{$R *.dfm}


procedure TFrmEfetuarLogin.BitBtn1Click(Sender: TObject);
var
    Ct    : Controle;
    DM    : TDM;
    Usu   : Usuario;
    Func  : Funcionario;
begin
    try
       if(self.Edit1.Text <> '') then
       begin
           if (self.MaskEdit1.Text <> '') then
           begin
               Usu  := Usuario.Create(0,self.Edit1.Text,self.MaskEdit1.Text,self.ComboBox1.Text,'');
               Func := Funcionario.Create;
               DM   := TDM.Create(NIL);
               Ct   := Controle.Create(DM,Func,Usu);

               if (Ct.EfetuarLogin = 1) then
               begin
                   if (Usu.getStatusUsu <> 'Inativo') then
                   begin
                       if(Usu.getnivelUsu = 'Gerente') then
                       begin
                           FrmPrincipal.Show;
                           FrmPrincipal.Edit1.Text := IntToStr(Usu.getCodUsu);
                           FrmPrincipal.Edit2.Text := Func.getcpfFunc;
                           FrmPrincipal.Edit3.Text := Usu.getnivelUsu;
                           FrmPrincipal.StatusBar1.Panels[0].Text := 'Hora do Login:  ' + TimeToStr(Time);
                           FrmEfetuarLogin.Visible := false;
                       end
                       else
                       begin
                           FrmPrincipal.Show;
                           self.HabilitarParaVendedor;
                           FrmPrincipal.Edit1.Text := IntToStr(Usu.getCodUsu);
                           FrmPrincipal.Edit2.Text := Func.getcpfFunc;
                           FrmPrincipal.Edit3.Text := Usu.getnivelUsu;
                           FrmEfetuarLogin.Visible := false;
                       end;
                   end
                   else
                   begin
                       MessageDlg('Usuário Inativo.', mtInformation, [mbOk], 0);
                   end
               end
               else
               begin
                   MessageDlg('Login e Senha Inválidos.', mtWarning, [mbOk], 0);
               end
          end
          else
          begin
             MessageDlg('Campo Senha Vazio.', mtWarning, [mbOk], 0);
          end
       end
       else
       begin
           MessageDlg('Campo Login Vazio.', mtWarning, [mbOk], 0);
       end
    Except
        MessageDlg('Problema com o Efetuar Login.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmEfetuarLogin.HabilitarParaVendedor;
begin
    FrmEfetuarLogin.Visible := false;
    FrmPrincipal.Funcionario.Visible := false;
    FrmPrincipal.Fornecedor.Visible := false;
    FrmPrincipal.Produto.Visible := false;
    FrmPrincipal.Usurio1.Visible := false;
end;

procedure TFrmEfetuarLogin.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja cancelar o login no sistema ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        self.PodeFechar := true;
        self.FecharConexao;
        self.Close;
    end
    else
    begin
        self.PodeFechar := false;
    end;
end;

procedure TFrmEfetuarLogin.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

procedure TFrmEfetuarLogin.FormCreate(Sender: TObject);
begin
    PodeFechar := false;
    try
        WinExec(PChar('C:\SGE\mysql\bin\mysqld.exe'),1);
    except
        MessageDlg('Problema com a Conexão ao Banco de Dados.', mtError, [mbOk], 0);
        self.Edit1.Enabled := false;
        self.MaskEdit1.Enabled := false;
        self.ComboBox1.Enabled := false;
        self.BitBtn1.Enabled := false;
    end;
end;

procedure TFrmEfetuarLogin.FecharConexao;
begin
	  try
        PodeFechar := true;
        WinExec(PChar('C:\SGE\mysql\bin\mysqladmin -u root shutdown'),1);
    except

    end;
end;


end.


