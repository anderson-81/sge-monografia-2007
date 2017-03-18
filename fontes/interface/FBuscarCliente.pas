unit FBuscarCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, cCliente, cDataModule, cControle,
  FManterCliente, cTelefone;

type
  TFrmBuscarCliente = class(TForm)
    GroupBox3: TGroupBox;
    Label2: TLabel;
    GroupBox4: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject); overload;
    procedure BitBtn2Click(Sender: TObject);
    procedure ClearBox;
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
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
    FrmBuscarCliente: TFrmBuscarCliente;
    DM : TDM;


implementation

{$R *.dfm}

procedure TFrmBuscarCliente.BitBtn1Click(Sender: TObject);
var
    Ct  : Controle;
    Cli : Cliente;
    Tel : Telefone;
begin
    try
        if (self.Edit1.Text <> '') OR (self.MaskEdit1.Text <> '') then
        begin
            DM  := TDM.create (NIL);
            Cli := Cliente.Create(0,'','','','','','','');

            if (RadioButton1.Checked = true) then
            begin
                Cli.setNomeCli(self.edit1.Text);
                Ct  := Controle.Create (DM,Cli);
                Ct.BuscarCliNOME;
            end

            else if (RadioButton2.Checked = true) then
            begin
                Tel := Telefone.Create(0,self.MaskEdit1.Text,self.MaskEdit1.Text);
                Ct  := Controle.Create(DM,Cli,Tel);
                Ct.BuscarCliTEL;
            end

            else if (RadioButton3.Checked = true) then
            begin
                Ct  := Controle.Create(DM,Cli);
                Cli.setCodCli(StrToInt(self.edit1.Text));
                Ct.BuscarCliCODIGO;
            end;

            if (Cli.getCodCli <> -1) then
            begin
                FrmManterCliente.Edit1.text      := IntToStr(Cli.getCodCli);
                FrmManterCliente.Edit2.Text      := Cli.getnomeCli;
                FrmManterCliente.Edit3.Text      := Cli.getendCli;
                FrmManterCliente.Edit4.Text      := Cli.getbairroCli;
                FrmManterCliente.Edit5.Text      := Cli.getcidCli;
                FrmManterCliente.Edit6.Text      := Cli.getemailCli;
                FrmManterCliente.Memo1.Text      := Cli.getobsCli;
                FrmManterCliente.Edit7.Text      := Cli.getStatusCli;
                FrmManterCliente.BitBtn5.Enabled := true;
                FrmManterCliente.BitBtn6.Enabled := true;
                FrmManterCliente.BitBtn7.Enabled := false;
                FrmManterCliente.BitBtn8.Enabled := false;
                FrmManterCliente.BitBtn1.Enabled := false;
                FrmManterCliente.BitBtn2.Enabled := true;
                FrmManterCliente.BitBtn4.Enabled := true;
                FrmManterCliente.BitBtn3.Enabled := true;
                self.ClearBox;
                self.PodeFechar := true;
                self.Close;
            end
            else
            begin
                MessageDlg('Nenhum Cliente encontrado.', mtInformation, [mbOk], 0);
                self.ClearBox;
                self.RadioButton1.Checked := true;
            end
        end
        else
           MessageDlg('Informe um dado para a busca.', mtWarning, [mbOk], 0);
    except
        On EConvertError do
        begin
            MessageDlg('Valor Inválido para busca por Código.', mtError, [mbOk], 0);
            self.ClearBox;
            self.RadioButton1.Checked := true;
        end;
    end;
end;

procedure TFrmBuscarCliente.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja cancelar a busca por Cliente?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        self.PodeFechar := true;
        self.Close;
    end;
end;

Procedure TFrmBuscarCliente.ClearBox;
begin
    Edit1.Clear;
    RadioButton1.Checked := true;
end;

procedure TFrmBuscarCliente.RadioButton2Click(Sender: TObject);
begin
    self.ShowHint := true;
    self.MaskEdit1.Visible := true;
    self.Edit1.Visible := false;
end;

procedure TFrmBuscarCliente.RadioButton1Click(Sender: TObject);
begin
    self.MaskEdit1.Visible := false;
    self.Edit1.Visible := true;
end;

procedure TFrmBuscarCliente.RadioButton3Click(Sender: TObject);
begin
    self.MaskEdit1.Visible := false;
    self.Edit1.Visible := true;
end;

procedure TFrmBuscarCliente.FormShow(Sender: TObject);
begin
    self.MaskEdit1.Visible := false;
    self.Edit1.Visible := true;
    self.Edit1.Clear;
    self.BitBtn1.Visible := true;
    PodeFechar := false;
end;

procedure TFrmBuscarCliente.FormCreate(Sender: TObject);
begin
    self.PodeFechar := false;
end;

procedure TFrmBuscarCliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

end.
