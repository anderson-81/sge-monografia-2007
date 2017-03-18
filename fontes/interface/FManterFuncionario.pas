unit FManterFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, FBuscarFunc, ComCtrls, Buttons,
  cControle, cFuncionario, cDataModule, rxToolEdit, rxCurrEdit, AppEvnts,
  rxAppEvent, Menus, FManterTelefone;

type
  TFrmManterFuncionario = class(TForm)
    GroupBox2: TGroupBox;
    Label14: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit3: TEdit;
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    TabSheet2: TTabSheet;
    Label11: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    ComboBox2: TComboBox;
    Label13: TLabel;
    DateTimePicker2: TDateTimePicker;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit6: TMaskEdit;
    CurrencyEdit1: TCurrencyEdit;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    N1: TMenuItem;
    ListarTodososFuncionrios1: TMenuItem;
    Edit6: TEdit;
    MaskEdit1: TMaskEdit;
    Edit7: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    Procedure ClearBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure AtribuirValores;
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    procedure ListarTodososFuncionrios1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure InclusaoTelefone;
  private
      { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManterFuncionario: TFrmManterFuncionario;
  DM: TDM;
  
implementation

{$R *.dfm}

procedure TFrmManterFuncionario.BitBtn2Click(Sender: TObject);
var
    Func : Funcionario;
    Ct   : Controle;
    DM   : TDM;
    sal  : real;
begin
    try

          if ((self.Edit6.Text <> '') AND (self.MaskEdit2.Text <> '') AND  (self.Edit1.Text <> '') AND
              (self.Edit2.Text <> '') AND (self.Edit3.Text <> '') AND (self.MaskEdit3.Text <> '') AND
              (self.Edit4.Text <> '') AND (self.Edit6.Text <> '') AND (self.ComboBox1.Text <> '') AND
              (self.Edit7.Text <> '') AND (self.MaskEdit6.Text <> '') AND (self.ComboBox2.Text <> '') AND
              (self.CurrencyEdit1.Text <> '') AND (self.MaskEdit1.Text <> '')) then
          begin
              DM   := TDM.Create(NIL);
              sal := StrToFloat(self.CurrencyEdit1.Text);
              DecimalSeparator := '.';
              Func := Funcionario.Create(self.MaskEdit1.Text,maskedit2.Text,edit1.Text,edit2.Text,edit3.Text,
                                         StrToInt(maskedit3.Text),edit4.Text,edit5.Text, Edit6.Text,
                                         DateTimePicker1.Date,Combobox1.Text,StrToInt(Edit7.Text),maskedit6.Text,Combobox2.Text,
                                         sal, DateTimePicker2.Date);


              Ct   := Controle.Create(DM,Func);
              Ct.EditarFunc;
              MessageDlg('Edição efetuada com sucesso.', mtInformation, [mbOk], 0);
              DecimalSeparator := ',';
              self.BitBtn5.Enabled := false;
              self.BitBtn6.Enabled := false;
              self.BitBtn7.Enabled := false;
              self.BitBtn8.Enabled := false;
          end
          else
             MessageDlg('Existem campos obrigatórios vazio.', mtWarning, [mbOk], 0);
    except
       MessageDlg('Problema na Edição.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterFuncionario.BitBtn4Click(Sender: TObject);
var
    Func : Funcionario;
    Ct   : Controle;
begin
    try
        Func := Funcionario.Create;
        DM  := TDM.Create(NIL);
        Ct  := Controle.create (DM,Func);

        if Application.MessageBox('Deseja efetuar a exclusão?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
        begin
            Func.setcpfFunc(self.MaskEdit1.Text);
            if(Ct.VerifFuncUsuario = 1)then
            begin
                if(Ct.VerfFuncTelefone = 1)then
                begin
                    Ct.ExcluirFunc;
                    MessageDlg('Exclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
                    ClearBox;
                    self.TabSheet1.Show;
                end
                else
                begin
                    MessageDlg('Não foi possível excluir este Funcionário.', mtInformation, [mbOk], 0);
                    MessageDlg('Este Funcionário possui registro de Telefone associado.', mtInformation, [mbOk], 0);
                end
            end
            else
            begin
                MessageDlg('Não foi possível excluir este Funcionário.', mtInformation, [mbOk], 0);
                MessageDlg('Este Funcionário possui registro de Usuário associado.', mtInformation, [mbOk], 0);
            end
        end;
    except
        MessageDlg('Problema na exclusão do Funcionário.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterFuncionario.BitBtn3Click(Sender: TObject);
begin
    FrmBuscarFunc.ShowModal;
end;

procedure TFrmManterFuncionario.BitBtn1Click(Sender: TObject);
var
    Func : Funcionario;
    Ct   : Controle;
    DM   : TDM;
    sal  : real;
begin
    try

          if ((self.Edit6.Text <> '') AND (self.MaskEdit2.Text <> '') AND  (self.Edit1.Text <> '') AND
              (self.Edit2.Text <> '') AND (self.Edit3.Text <> '') AND (self.MaskEdit3.Text <> '') AND
              (self.Edit4.Text <> '') AND (self.Edit6.Text <> '') AND (self.ComboBox1.Text <> '') AND
              (self.Edit7.Text <> '') AND (self.MaskEdit6.Text <> '') AND (self.ComboBox2.Text <> '') AND
              (self.CurrencyEdit1.Text <> '') AND (self.MaskEdit1.Text <> '')) then
          begin
              DM   := TDM.Create(NIL);
              sal := StrToFloat(self.CurrencyEdit1.Text);
              DecimalSeparator := '.';
              Func := Funcionario.Create(self.MaskEdit1.Text,maskedit2.Text,edit1.Text,edit2.Text,edit3.Text,
                                         StrToInt(maskedit3.Text),edit4.Text,edit5.Text, Edit6.Text,
                                         DateTimePicker1.Date,Combobox1.Text,StrToInt(Edit7.Text),maskedit6.Text,Combobox2.Text,
                                         sal, DateTimePicker2.Date);


              Ct   := Controle.Create(DM,Func);
              Ct.IncluirFunc;

              if Application.MessageBox('Deseja incluir registro de Telefone para este Funcionário?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
              begin
                  self.InclusaoTelefone
              end;

              MessageDlg('Inclusão efetuada com sucesso.', mtInformation, [mbOk], 0);
              ClearBox;
              self.TabSheet1.Show;
              DecimalSeparator := ',';
          end
          else
             MessageDlg('Existem campos obrigatórios vazio.', mtWarning, [mbOk], 0);
    except
        MessageDlg('Problema na Inclusão.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterFuncionario.AtribuirValores;
begin
    try
        self.MaskEdit1.Text := DM.ZQuery1.FieldByName('cpfFunc').AsString;
        self.MaskEdit2.Text := DM.ZQuery1.FieldByName('rgFunc').AsString;
        self.Edit1.Text := DM.ZQuery1.FieldByName('nomeFunc').AsString;
        self.Edit2.Text := DM.ZQuery1.FieldByName('endFunc').AsString;
        self.Edit3.Text := DM.ZQuery1.FieldByName('bairroFunc').AsString;
        self.MaskEdit3.Text := IntToStr(DM.ZQuery1.FieldByName('cepFunc').AsInteger);
        self.Edit4.Text := DM.ZQuery1.FieldByName('cidadeFunc').AsString;
        self.Edit5.Text := DM.ZQuery1.FieldByName('emailFunc').AsString;
        self.Edit6.Text := DM.ZQuery1.FieldByName('numTitEleitFunc').AsString;
        self.DateTimePicker1.DateTime := DM.ZQuery1.FieldByName('dataNascFunc').AsDateTime;
        self.ComboBox1.Text := DM.ZQuery1.FieldByName('sexoFunc').AsString;
        self.Edit7.Text := IntToStr(DM.ZQuery1.FieldByName('numCartProfFunc').AsInteger);
        self.MaskEdit6.Text := DM.ZQuery1.FieldByName('serCartProfFunc').AsString;
        self.ComboBox2.Text := DM.ZQuery1.FieldByName('cargoFunc').AsString;
        self.CurrencyEdit1.Text := FloatToStr(DM.ZQuery1.FieldByName('salFunc').AsFloat);
        self.DateTimePicker2.DateTime := DM.ZQuery1.FieldByName('dataAdmissaoFunc').AsDateTime;
    except
        MessageDlg('Problema na atribuição dos dados sobre Funcionário.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterFuncionario.BitBtn8Click(Sender: TObject);
begin
    try
        DM.ZQuery1.First;
        self.AtribuirValores;
        self.BitBtn8.Enabled := false;
        self.BitBtn7.Enabled := false;
        self.BitBtn6.Enabled := true;
        self.BitBtn5.Enabled := true;
    except
        MessageDlg('Problema na navegação por Funcionário.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterFuncionario.BitBtn7Click(Sender: TObject);
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
        MessageDlg('Problema na navegação por Funcionário.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterFuncionario.BitBtn6Click(Sender: TObject);
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
        MessageDlg('Problema na navegação por Funcionário.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterFuncionario.BitBtn5Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Last;
        self.AtribuirValores;

        self.BitBtn5.Enabled := false;
        self.BitBtn6.Enabled := false;

        self.BitBtn8.Enabled := true;
        self.BitBtn7.Enabled := true;
    except
        MessageDlg('Problema na navegação por Funcionário.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterFuncionario.clearbox;
begin
    self.Edit7.Text := '0';
    self.Edit6.Text := '0';
    self.MaskEdit2.Clear;
    self.Edit1.Clear;
    self.Edit2.Clear;
    self.Edit3.Clear;
    self.MaskEdit3.text := '0';
    self.Edit4.Clear;
    self.Edit5.Clear;
    self.ComboBox1.Clear;
    self.MaskEdit6.Clear;
    self.ComboBox2.Clear;
    self.CurrencyEdit1.Clear;
    self.DateTimePicker1.DateTime := DATE;
    self.ComboBox1.Clear;
    self.ComboBox1.Items.Add('F');
    self.ComboBox1.Items.Add('M');
    self.ComboBox2.Clear;
    self.ComboBox2.Items.Add('Gerente');
    self.ComboBox2.Items.Add('Vendedor');
    self.DateTimePicker2.DateTime := DATE;
    self.BitBtn5.Enabled := false;
    self.BitBtn6.Enabled := false;
    self.BitBtn7.Enabled := false;
    self.BitBtn8.Enabled := false;
    self.BitBtn1.Enabled := true;
    self.BitBtn2.Enabled := false;
    self.BitBtn3.Enabled := true;
    self.BitBtn4.Enabled := false;
    self.MaskEdit1.Clear;
    self.MaskEdit1.ReadOnly := false;
    self.TabSheet1.Show;
    self.Tabsheet1.Caption := 'Pessoais';
    self.Tabsheet2.Caption := 'Trabalhistas';
    self.MaskEdit1.Focused;
    DecimalSeparator := ',';
end;


procedure TFrmManterFuncionario.Limpar1Click(Sender: TObject);
begin
    self.BitBtn2.Enabled := false;
    self.BitBtn4.Enabled := false;
    self.BitBtn5.Enabled := false;
    self.BitBtn6.Enabled := false;
    self.BitBtn7.Enabled := false;
    self.BitBtn8.Enabled := false;
    self.BitBtn1.Enabled := true;
    self.ClearBox;
    self.Edit6.ReadOnly := false;
end;

procedure TFrmManterFuncionario.ListarTodososFuncionrios1Click(
  Sender: TObject);
var
    Func : Funcionario;
    Ct   : Controle;
begin
    try
        Func := Funcionario.Create;
        DM   := TDM.Create(NIL);
        Ct   := Controle.Create(DM,Func);
        Ct.BuscarFuncionario;
        self.AtribuirValores;
        self.BitBtn1.Enabled := false;
        self.BitBtn2.Enabled := true;
        self.BitBtn3.Enabled := true;
        self.BitBtn4.Enabled := true;
        self.BitBtn6.Enabled := true;
        self.BitBtn5.Enabled := true;
        self.BitBtn7.Enabled := false;
        self.BitBtn8.Enabled := false;
    except
        MessageDlg('Problema na navegação por Funcionário.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterFuncionario.Sair1Click(Sender: TObject);
begin
    self.Close;
end;

procedure TFrmManterFuncionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    self.ClearBox;
end;

procedure TFrmManterFuncionario.FormShow(Sender: TObject);
begin
    self.ClearBox;
    self.DateTimePicker1.Date := DATE;
    self.DateTimePicker2.Date := DATE;
    self.MaskEdit1.SetFocus;
end;

procedure TFrmManterFuncionario.Edit6Change(Sender: TObject);
begin
    try
        StrToInt64(self.Edit6.Text);
    except
    begin
        MessageDlg('Valor Inválido para Título de Eleitor.', mtWarning, [mbOk], 0);
        self.Edit6.Text := '0';
    end
    end;
end;

procedure TFrmManterFuncionario.Edit7Change(Sender: TObject);
begin
    try
        StrToInt(self.Edit7.Text);
    except
    begin
        MessageDlg('Valor Inválido para Carteira Profissional.', mtWarning, [mbOk], 0);
        self.Edit7.Text := '0';
    end
    end;
end;
procedure TFrmManterFuncionario.DateTimePicker1Exit(Sender: TObject);
begin
    if(DateTimePicker1.DateTime > Date) then
    begin
        MessageDlg('Data de Nascimento Inválida.', mtWarning, [mbOk], 0);
        DateTimePicker1.DateTime := DATE;
    end;
end;

procedure TFrmManterFuncionario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if Application.MessageBox('Deseja terminar a manutenção de Funcionário?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
    begin
        canClose := true;
    end
    else
       canClose := false;
end;



procedure TFrmManterFuncionario.InclusaoTelefone;
var
    Ct : Controle;
    DM : TDM;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        FrmManterTelefone.Label2.Caption := 'Nome:';
        FrmManterTelefone.Edit3.Text := 'FUNCIONARIO';
        FrmManterTelefone.Edit4.Text := self.MaskEdit1.Text;
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
        self.ClearBox;
        self.DateTimePicker1.Date := DATE;
        self.DateTimePicker2.Date := DATE;
        self.MaskEdit1.SetFocus;
    end;
end;



end.
