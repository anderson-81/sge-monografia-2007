unit FBuscarFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, cFuncionario, cDataModule,
  cControle, cTelefone;


type
  TFrmBuscarFunc = class(TForm)
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox4: TGroupBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarFunc: TFrmBuscarFunc;
  

implementation

uses FManterFuncionario;
{$R *.dfm}

procedure TFrmBuscarFunc.BitBtn1Click(Sender: TObject);
var
    Func : Funcionario;
    Ct   : Controle;
    Tel  : Telefone;
begin
    try
        if (Edit1.Text <> '') then
        begin
            DM   := TDM.Create(NIL);
            Func := Funcionario.Create;

            if (RadioButton1.Checked = true) then
            begin
                Ct  := Controle.Create (DM,Func);
                Func.setnomeFunc(edit1.Text);
                Ct.BuscarFuncNOME;
            end

            else if (RadioButton2.Checked = true) then
            begin
                Tel := Telefone.Create(0,'','');
                Ct  := Controle.Create(DM,Func,Tel);
                Tel.setTelCont1(self.Edit1.Text);
                Tel.setTelCont2(self.Edit1.Text);
                Ct.BuscarFuncTEL;
            end

            else if (RadioButton3.Checked = true) then
            begin
                Ct  := Controle.Create(DM, Func);
                Func.setcpfFunc(Edit1.Text);
                Ct.BuscarFuncCPF;
            end;

            if (Func.getcpfFunc <> '-1') then
            begin
                FrmManterFuncionario.ClearBox;
                FrmManterFuncionario.MaskEdit1.ReadOnly := true;
                FrmManterFuncionario.MaskEdit1.Text := Func.getcpfFunc;
                FrmManterFuncionario.MaskEdit2.Text := Func.getrgFunc;
                FrmManterFuncionario.Edit1.Text := Func.getnomeFunc;
                FrmManterFuncionario.Edit2.Text := Func.getendFunc;
                FrmManterFuncionario.Edit3.Text := Func.getbairroFunc;
                FrmManterFuncionario.MaskEdit3.Text := IntToStr(Func.getcepFunc);
                FrmManterFuncionario.Edit4.Text := Func.getcidadeFunc;
                FrmManterFuncionario.Edit5.Text := Func.getemailFunc;
                FrmManterFuncionario.Edit6.Text := Func.getnumTitEleitFunc;
                FrmManterFuncionario.DateTimePicker1.DateTime := Func.getdataNascFunc;
                FrmManterFuncionario.ComboBox1.Text := Func.getsexoFunc;
                FrmManterFuncionario.Edit7.Text := IntToStr(Func.getnumCartProfFunc);
                FrmManterFuncionario.MaskEdit6.Text := Func.getserCartProfFunc;
                FrmManterFuncionario.ComboBox2.Text := Func.getcargoFunc;
                FrmManterFuncionario.CurrencyEdit1.Text := FloatToStr(Func.getsalFunc);
                FrmManterFuncionario.DateTimePicker2.DateTime := Func.getdataAdmissaoFunc;
                self.Edit1.Clear;
                FrmManterFuncionario.BitBtn5.Enabled := true;
                FrmManterFuncionario.BitBtn6.Enabled := true;
                FrmManterFuncionario.BitBtn7.Enabled := false;
                FrmManterFuncionario.BitBtn8.Enabled := false;
                FrmManterFuncionario.BitBtn1.Enabled := false;
                FrmManterFuncionario.BitBtn2.Enabled := true;
                FrmManterFuncionario.BitBtn3.Enabled := true;
                FrmManterFuncionario.BitBtn4.Enabled := true;
                FrmManterFuncionario.TabSheet1.Show;
                self.Close;
            end
            else
            begin
                MessageDlg('Nenhum Funcionário foi encontrado.', mtInformation, [mbOk], 0);
            end;
        end
        else
        begin
            MessageDlg('Nenhum valor foi informado para a busca.', mtWarning, [mbOk], 0);
            FrmBuscarFunc.Edit1.Clear;
            FrmBuscarFunc.RadioButton1.Checked := true;
            FrmManterFuncionario.BitBtn1.Enabled := true;
        end;
    except
        On EConvertError do
        begin
            MessageDlg('Valor Inválido para busca.', mtError, [mbOk], 0);
            self.Edit1.Clear;
        end;
    end;
end;

procedure TFrmBuscarFunc.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja cancelar a busca por Funcionário?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
       FrmBuscarFunc.Close;
       FrmManterFuncionario.BitBtn1.Enabled := true;
    end;
end;

procedure TFrmBuscarFunc.FormCreate(Sender: TObject);
begin
    Edit1.Text := '';
    RadioButton1.Checked := true;
end;

procedure TFrmBuscarFunc.RadioButton2Click(Sender: TObject);
begin
    self.Edit1.Text := '0';
    FrmBuscarFunc.RadioButton2.Hint := 'Informe DDD mais o número.';
    FrmBuscarFunc.ShowHint := true;
end;

procedure TFrmBuscarFunc.RadioButton1Click(Sender: TObject);
begin
    self.Edit1.Text := '';
end;

procedure TFrmBuscarFunc.RadioButton3Click(Sender: TObject);
begin
    self.Edit1.Text := '0';
end;

procedure TFrmBuscarFunc.Edit1Change(Sender: TObject);
begin
    if(self.RadioButton2.Checked = true) OR (self.RadioButton3.Checked = true) then
    begin
        try
            StrToInt64(self.Edit1.Text);
        except
            MessageDlg('Valor Inválido para busca.', mtWarning, [mbOk], 0);
            self.RadioButton1.Checked := true;
            self.Edit1.Clear;
        end;
    end;
end;

end.

