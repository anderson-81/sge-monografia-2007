unit FTaxaPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit, Menus;

type
  TFrmTaxaPagto = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label3: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    procedure clearbox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTaxaPagto: TFrmTaxaPagto;

implementation

{$R *.dfm}


uses
    FTelaPagto;

procedure TFrmTaxaPagto.clearbox;
begin
    self.CurrencyEdit2.Clear;
    self.BitBtn1.Enabled := false;
end;

procedure TFrmTaxaPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    self.clearbox;
end;

procedure TFrmTaxaPagto.FormActivate(Sender: TObject);
begin
    self.clearbox;
end;

procedure TFrmTaxaPagto.BitBtn2Click(Sender: TObject);
var
    vant : real;
    calc : real;
    taxa : real;
begin
    try
        if (self.CurrencyEdit2.Text <> '') then
        begin
           vant := StrToFloat(self.CurrencyEdit1.Text);
           taxa := StrToFloat(self.CurrencyEdit2.Text);
           calc := vant + taxa;
           self.CurrencyEdit1.Text := FloatToStr(calc);
           self.BitBtn1.Enabled := true;
        end
        else
           MessageDlg('Campo de Taxa Adicional Vazio.', mtWarning, [mbOk], 0);
    except
        MessageDlg('Problema na Inclusão de Taxa Adicional.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTaxaPagto.BitBtn1Click(Sender: TObject);
begin
    FrmTelaPagto.CurrencyEdit2.Text := self.CurrencyEdit1.Text;
    FrmTaxaPagto.Close;
end;

procedure TFrmTaxaPagto.CurrencyEdit1Enter(Sender: TObject);
begin
    self.CurrencyEdit2.SetFocus;
end;

end.
