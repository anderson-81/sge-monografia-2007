unit FManterTelefone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, cTelefone, cControle, cDataModule,
  cCliente, cFornecedor, cFuncionario, Menus;

type
  TFrmManterTelefone = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    Procedure ClearBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure TodosTelCliente;
    Procedure AtribuirValores;
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Habilitar;
    procedure HabilitarNavg;
    procedure DesabilitarNavg;
    procedure HabilitarEdicao;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure AtribuirValoresRegSemTel;
  private
    { Private declarations }
  public
     PodeFechar : Boolean;
     sitfechar : integer;
    { Public declarations }
  end;

var
  FrmManterTelefone: TFrmManterTelefone;
  opc : integer;
  sitFechar : integer;


implementation

uses FBuscarTel, FPrincipal;

{$R *.dfm}

procedure TFrmManterTelefone.FormCreate(Sender: TObject);
begin
    ClearBox;
end;

procedure TFrmManterTelefone.BitBtn3Click(Sender: TObject);
begin
    FrmBuscarTel.ShowModal;
end;

procedure TFrmManterTelefone.BitBtn1Click(Sender: TObject);
var
    Cli  : Cliente;
    Ct   : Controle;
    DM   : TDM;
    Tel  : Telefone;
    Forn : Fornecedor;
    Func : Funcionario;
begin
    try
        if (self.Edit1.Text <> '') AND (self.MaskEdit2.Text <> '') then
        begin

          if(self.Edit3.Text = 'CLIENTE') then
          begin
              DM  := TDM.Create(NIL);
              Cli := Cliente.Create(StrToInt(self.Edit4.Text),'','','','','','','');
              Tel := Telefone.Create(StrToInt(self.Edit1.Text),self.MaskEdit2.Text,self.MaskEdit3.Text);
              Forn := Fornecedor.Create(0,'','','','','','',0,00/00/0000,'','');
              Func := Funcionario.Create;
              Ct  := Controle.Create(DM,Forn,Func,Cli,Tel);
              Ct.IncluirTel;
              MessageDlg('Inclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
              self.ClearBox;
              self.BitBtn1.Enabled := false;
              self.BitBtn5.Enabled := false;
              self.BitBtn6.Enabled := false;
              self.BitBtn7.Enabled := false;
              self.BitBtn8.Enabled := false;

              FrmManterTelefone.MaskEdit2.Enabled := false;
              FrmManterTelefone.MaskEdit3.Enabled := false;

              if(self.sitfechar = 1)then
              begin
                  self.close;
              end;
          end

          else if(self.Edit3.Text = 'FORNECEDOR') then
          begin
              DM  := TDM.Create(NIL);
              Func := Funcionario.Create;
              Cli := Cliente.Create(0,'','','','','','','');
              Tel := Telefone.Create(StrToInt(self.Edit1.Text),self.MaskEdit2.Text,self.MaskEdit3.Text);
              Forn := Fornecedor.Create(StrToInt(self.Edit4.Text),'','','','','','',0,00/00/0000,'','');
              Ct  := Controle.Create(DM,Forn,Func,Cli,Tel);
              Ct.IncluirTel;
              MessageDlg('Inclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
              self.ClearBox;
              self.BitBtn1.Enabled := false;
              self.BitBtn5.Enabled := false;
              self.BitBtn6.Enabled := false;
              self.BitBtn7.Enabled := false;
              self.BitBtn8.Enabled := false;
              FrmManterTelefone.MaskEdit2.Enabled := false;
              FrmManterTelefone.MaskEdit3.Enabled := false;

              if(self.sitfechar = 1)then
              begin
                  self.close;
              end;
          end

          else if(self.Edit3.Text = 'FUNCIONARIO') then
          begin
              DM  := TDM.Create(NIL);
              Cli := Cliente.Create(0,'','','','','','','');
              Tel := Telefone.Create(StrToInt(self.Edit1.Text),self.MaskEdit2.Text,self.MaskEdit3.Text);
              Forn := Fornecedor.Create(0,'','','','','','',0,00/00/0000,'','');
              Func := Funcionario.Create;
              Func.setcpfFunc(self.Edit4.Text);
              Ct  := Controle.Create(DM,Forn,Func,Cli,Tel);
              Ct.IncluirTel;
              MessageDlg('Inclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
              ClearBox;
              self.BitBtn1.Enabled := false;
              self.BitBtn5.Enabled := false;
              self.BitBtn6.Enabled := false;
              self.BitBtn7.Enabled := false;
              self.BitBtn8.Enabled := false;

              FrmManterTelefone.MaskEdit2.Enabled := false;
              FrmManterTelefone.MaskEdit3.Enabled := false;

              if(self.sitfechar = 1)then
              begin
                  self.close;
              end;
          end;
        end
        else
           MessageDlg('Formulário possui campos obrigatórios vazio.', mtError, [mbOk], 0);
     Except
         MessageDlg('Problema na Inclusão.', mtError, [mbOk], 0);
     end;
end;

procedure TFrmManterTelefone.BitBtn4Click(Sender: TObject);
var
    Ct   : Controle;
    DM   : TDM;
    Tel  : Telefone;
begin
    try
        if (Edit1.Text <> '') then
        begin
            Tel := Telefone.Create(StrToInt(self.Edit1.Text),self.MaskEdit2.Text,self.MaskEdit3.Text);
            DM  := TDM.Create(NIL);
            CT  := Controle.Create(DM,Tel);
            Ct.ExcluirTel;
            MessageDlg('Exclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
            self.ClearBox;
            self.BitBtn1.Enabled := false;
            self.BitBtn2.Enabled := false;
            self.BitBtn4.Enabled := false;
            self.BitBtn3.Enabled := true;
            FrmManterTelefone.DesabilitarNavg;
            self.MaskEdit2.Enabled := false;
            self.MaskEdit3.Enabled := false;
            self.sitfechar := 1;
            self.Close;
        end
     Except
         MessageDlg('Problema na Exclusão.', mtError, [mbOk], 0);
     end;
end;

procedure TFrmManterTelefone.BitBtn2Click(Sender: TObject);
var
    Ct   : Controle;
    DM   : TDM;
    Tel  : Telefone;
begin
    try
        if (Edit1.Text <> '') AND (Maskedit2.Text <> '') then
        begin
            Tel := Telefone.Create(StrToInt(self.Edit1.Text),self.MaskEdit2.Text,self.MaskEdit3.Text);
            DM  := TDM.Create(NIL);
            CT  := Controle.Create(DM,Tel);
            Ct.EditarTel;
            MessageDlg('Edição efetuada com sucesso.', mtInformation, [mbOk], 0);
            self.BitBtn5.Enabled := false;
            self.BitBtn6.Enabled := false;
            self.BitBtn7.Enabled := false;
            self.BitBtn8.Enabled := false;
        end
        else
           MessageDlg('Formulário possui campos obrigatórios vazio.', mtError, [mbOk], 0);
     Except
         MessageDlg('Problema na Edição.', mtError, [mbOk], 0);
     end;
end;


Procedure TFrmManterTelefone.ClearBox;
begin
    self.MaskEdit2.Clear;
    self.Edit2.Clear;
    self.MaskEdit3.Clear;
    self.Edit1.Clear;
    self.Edit3.Clear;
    self.Edit4.Clear;
end;

procedure TFrmManterTelefone.FormShow(Sender: TObject);
begin
    if(self.sitfechar <> 1) then
       self.BitBtn3.Enabled := true
    else
       self.BitBtn3.Enabled := false;
    self.PodeFechar := true;
end;

procedure TFrmManterTelefone.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmManterTelefone.MaskEdit2.Enabled := false;
    FrmManterTelefone.MaskEdit3.Enabled := false;
end;


Procedure TFrmManterTelefone.TodosTelCliente;
{
var
    DM  : TDM;
    Ct  : Controle;
}
begin
    //DM := TDM.Create(NIL);
    //Ct := Controle.Create(DM);
    //Ct.BuscarTodosTelCli;
end;

procedure TFrmManterTelefone.BitBtn8Click(Sender: TObject);
begin
    try
        DM.ZQuery1.First;
        if((self.MaskEdit2.Text = '') AND (self.MaskEdit3.Text = '')) then
            self.AtribuirValoresRegSemTel
        else
            self.AtribuirValores;

        BitBtn8.Enabled := false;
        BitBtn7.Enabled := false;

        BitBtn6.Enabled := true;
        BitBtn5.Enabled := true;
    except
        MessageDlg('Problema na navegação pelos registros de telefone.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterTelefone.BitBtn7Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Prior;
        if((self.MaskEdit2.Text = '') AND (self.MaskEdit3.Text = '')) then
            self.AtribuirValoresRegSemTel
        else
            self.AtribuirValores;


        if (DM.ZQuery1.Bof) then
        begin
            BitBtn8.Enabled := false;
            BitBtn7.Enabled := false;
        end;

        BitBtn6.Enabled := true;
        BitBtn5.Enabled := true;
    except
        MessageDlg('Problema na navegação pelos registros de telefone.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterTelefone.BitBtn6Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Next;
        if((self.MaskEdit2.Text = '') AND (self.MaskEdit3.Text = '')) then
            self.AtribuirValoresRegSemTel
        else
            self.AtribuirValores;


        if (DM.ZQuery1.Eof) then
        begin
            BitBtn5.Enabled := false;
            BitBtn6.Enabled := false;
        end;

        BitBtn8.Enabled := true;
        BitBtn7.Enabled := true;
    except
        MessageDlg('Problema na navegação pelos registros de telefone.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterTelefone.BitBtn5Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Last;
        if((self.MaskEdit2.Text = '') AND (self.MaskEdit3.Text = '')) then
            self.AtribuirValoresRegSemTel
        else
            self.AtribuirValores;

        BitBtn5.Enabled := false;
        BitBtn6.Enabled := false;

        BitBtn8.Enabled := true;
        BitBtn7.Enabled := true;
    except
         MessageDlg('Problema na navegação pelos registros de telefone.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterTelefone.AtribuirValores;
begin
    try
        //Atribuindo os dados referente a Cliente.
        if(self.Edit3.Text = 'CLIENTE') then
        begin
            self.Edit2.Text := DM.ZQuery1.FieldByName('nomeCli').AsString;
        end
        //Atribuindo os dados referente a Funcionário
        else if(self.Edit3.Text = 'FUNCIONARIO') then
        begin
            self.Edit2.Text := DM.ZQuery1.FieldByName('nomeFunc').AsString;
        end
        //Atribuindo os dados referente a Fornecedor.
        else if(self.Edit3.Text = 'FORNECEDOR') then
        begin
            self.Edit2.Text := DM.ZQuery1.FieldByName('razaoSocial').AsString;
        end;
        //Atribuindo dados referente ao registro de telefone
        self.Edit1.Text     := IntToStr(DM.ZQuery1.FieldByName('codtel').AsInteger);
        self.MaskEdit2.Text := DM.ZQuery1.FieldByName('telcont1').AsString;
        self.MaskEdit3.Text := DM.ZQuery1.FieldByName('telcont2').AsString;
    except
        MessageDlg('Problema na Atribuição dos dados.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterTelefone.AtribuirValoresRegSemTel;
begin
    try
        //Atribuindo os dados referente a Cliente.
        if(self.Edit3.Text = 'CLIENTE') then
        begin
            self.Edit2.Text := DM.ZQuery1.FieldByName('nomeCli').AsString;
        end
        //Atribuindo os dados referente a Funcionário
        else if(self.Edit3.Text = 'FUNCIONARIO') then
        begin
            self.Edit2.Text := DM.ZQuery1.FieldByName('nomeFunc').AsString;
        end
        //Atribuindo os dados referente a Fornecedor.
        else if(self.Edit3.Text = 'FORNECEDOR') then
        begin
            self.Edit2.Text := DM.ZQuery1.FieldByName('razaoSocial').AsString;
        end;
    except
        MessageDlg('Problema na Atribuição dos dados.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmManterTelefone.Habilitar;
begin
    self.Edit2.Enabled      := true;
    self.MaskEdit2.Enabled  := true;
    self.MaskEdit3.Enabled  := true;
    self.MaskEdit2.ReadOnly := false;
    self.MaskEdit3.ReadOnly := false;
end;

procedure TFrmManterTelefone.HabilitarNavg;
begin
    self.BitBtn5.Enabled := true;
    self.BitBtn6.Enabled := true;
    self.BitBtn7.Enabled := false;
    self.BitBtn8.Enabled := false;
end;


procedure TFrmManterTelefone.DesabilitarNavg;
begin
    self.BitBtn5.Enabled := false;
    self.BitBtn6.Enabled := false;
    self.BitBtn7.Enabled := false;
    self.BitBtn8.Enabled := false;
end;

procedure TFrmManterTelefone.HabilitarEdicao;
begin
    self.BitBtn2.Enabled := true;
    self.BitBtn3.Enabled := true;
    self.BitBtn4.Enabled := true;
    self.BitBtn1.Enabled := false;
end;


procedure TFrmManterTelefone.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if (sitfechar <> 1) then
    begin
        if Application.MessageBox('Deseja terminar a manutenção de Telefone?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
        begin
            canClose := true;
        end
        else
           canClose := false;
    end
    else
       canClose := true;
end;

end.
