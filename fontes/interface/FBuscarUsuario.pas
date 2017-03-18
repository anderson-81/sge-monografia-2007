unit FBuscarUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cUsuario, cControle, cDataModule, FManterUsuario,
  cFuncionario;

type
  TFrmBuscarUsuario = class(TForm)
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    Edit1: TEdit;
    GroupBox4: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioButton3: TRadioButton;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure TrabComponentes;
    Procedure HabilitarNavg;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    PodeFechar : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarUsuario: TFrmBuscarUsuario;

implementation

uses FPrincipal;

{$R *.dfm}

procedure TFrmBuscarUsuario.BitBtn1Click(Sender: TObject);
var
    Usu  : Usuario;
    Ct   : Controle;
    Func : Funcionario;
begin
      try
        if (Edit1.Text <> '') then
        begin
            DM   := TDM.create (NIL);
            Usu  := Usuario.Create(0,'','','','');
            Func := Funcionario.Create;
            Ct   := Controle.Create(DM,Func,Usu);

            if (RadioButton1.Checked = true) then
            begin
               Func.setnomeFunc(Edit1.Text);
               Ct.BuscarFuncUsuarioPorNome;
               self.HabilitarNavg;
            end

            else if (RadioButton3.Checked = true) then
            begin
               Func.setcpfFunc(Edit1.text);
               Ct.BuscarFuncUsuarioPorCPF;
               FrmManterUsuario.DesabilitarNavg;
            end;

            FrmManterUsuario.Edit1.Text := IntToStr(Usu.getCodUsu);

            if(Usu.getCodUsu <> 0) then
            begin
               FrmManterUsuario.Maskedit1.EditMask := '!000\.000\.000\-00;0;_';
               FrmManterUsuario.MaskEdit1.Text  := Func.getcpfFunc;
               FrmManterUsuario.Edit2.Text := Func.getnomeFunc;
               FrmManterUsuario.Edit3.Text := Usu.getLogUsu;
               FrmManterUsuario.MaskEdit2.Text := Usu.getsenhaUsu;
               FrmManterUsuario.ComboBox1.Text := Usu.getnivelUsu;

               if(Usu.getsenhaUsu = 'Ativo') then
               begin
                   FrmManterUsuario.RadioButton1.Checked := true;
                   FrmManterUsuario.RadioButton2.Checked := false;
               end
               else if(Usu.getsenhaUsu = 'Inativo') then
               begin
                   FrmManterUsuario.RadioButton1.Checked := false;
                   FrmManterUsuario.RadioButton2.Checked := true;
               end;

               FrmManterUsuario.BitBtn4.Enabled := false;
               FrmManterUsuario.BitBtn3.Enabled := true;
               FrmManterUsuario.BitBtn2.Enabled := true;
               FrmManterUsuario.BitBtn1.Enabled := true;
               FrmManterUsuario.Habilitar;
               self.PodeFechar := true;
               self.Close;
            end

            else if (Usu.getCodUsu = 0) AND (Func.getcpfFunc <> '0') then
            begin
               FrmManterUsuario.Edit4.Text := 'Ativo';
               FrmManterUsuario.RadioButton1.Checked := true;
               FrmManterUsuario.Maskedit1.EditMask := '!000\.000\.000\-00;0;_';
               FrmManterUsuario.MaskEdit1.Text  := Func.getcpfFunc;
               FrmManterUsuario.Edit2.Text := Func.getnomeFunc;
               FrmManterUsuario.Edit3.Text := '';
               FrmManterUsuario.MaskEdit2.Text := '';
               FrmManterUsuario.ComboBox1.Text := '';
               FrmManterUsuario.Edit1.Text :=  IntToStr(Ct.MaxCodigoUsu + 1);
               Ct.BuscarFuncionario;
               FrmManterUsuario.BitBtn4.Enabled := true;
               FrmManterUsuario.BitBtn3.Enabled := false;
               FrmManterUsuario.BitBtn2.Enabled := true;
               FrmManterUsuario.BitBtn1.Enabled := false;
               FrmManterUsuario.BitBtn5.Enabled := false;
               FrmManterUsuario.BitBtn6.Enabled := false;
               FrmManterUsuario.BitBtn7.Enabled := false;
               FrmManterUsuario.BitBtn8.Enabled := false;
               self.GroupBox3.Enabled := true;
               FrmManterUsuario.Habilitar;
               self.PodeFechar := true;
               self.Close;
           end;

           if (Usu.getCodUsu = 0) AND (Func.getcpfFunc = '') then
           begin
               MessageDlg('Nenhum funcionário ou usuário foi encontrado com essa descrição no sistema.', mtError, [mbOk], 0);
           end
        end
        else
        begin
           ShowMessage('Informe o dado para efetuar a busca.');
        end
    Except
        MessageDlg('Problema na busca por usuário do sistema.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmBuscarUsuario.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja cancelar a busca por Usuário?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        self.PodeFechar := true;
        self.Close;
    end;
end;

procedure TFrmBuscarUsuario.TrabComponentes;
begin
    FrmManterUsuario.ClearBox;
    FrmManterUsuario.Edit2.ReadOnly := true;
    FrmManterUsuario.Edit2.Color := clMenu;
    FrmManterUsuario.Edit1.ReadOnly := true;
    FrmManterUsuario.BitBtn4.Enabled := false;
    FrmManterUsuario.BitBtn5.Enabled := true;
    FrmManterUsuario.BitBtn6.Enabled := true;
    FrmManterUsuario.BitBtn7.Enabled := true;
    FrmManterUsuario.BitBtn8.Enabled := true;
    FrmManterUsuario.BitBtn3.Enabled := true;
    FrmManterUsuario.BitBtn1.Enabled := true;
    FrmPrincipal.enabled := true;
    FrmBuscarUsuario.Close;
end;

Procedure TFrmBuscarUsuario.HabilitarNavg;
begin
    FrmManterUsuario.BitBtn5.Enabled := true;
    FrmManterUsuario.BitBtn6.Enabled := true;
    FrmManterUsuario.BitBtn7.Enabled := true;
    FrmManterUsuario.BitBtn8.Enabled := true;
end;



procedure TFrmBuscarUsuario.FormShow(Sender: TObject);
begin
    self.PodeFechar := false;
    FrmManterUsuario.DesabilitarNavg;
end;

procedure TFrmBuscarUsuario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

end.
