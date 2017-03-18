unit FBuscarClienteRelVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cCliente, cDataModule, cControle, FDefRelVenda;

type
  TFrmBuscarClienteRelVenda = class(TForm)
    Label3: TLabel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Edit1: TEdit;
    GroupBox4: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarClienteRelVenda: TFrmBuscarClienteRelVenda;
  DM  : TDM;

implementation

{$R *.dfm}


procedure TFrmBuscarClienteRelVenda.BitBtn2Click(Sender: TObject);
begin
    self.Close;
end;

procedure TFrmBuscarClienteRelVenda.BitBtn1Click(Sender: TObject);
var
    Cli : Cliente;
    Ct  : Controle;
begin
    try
        if(self.Edit1.Text <> '') then
        begin
            DM := TDM.Create(NIL);
            Cli := Cliente.Create(0,'','','','','','','');
            if(self.RadioButton1.Checked = true) then
            begin
                Cli.setNomeCli(self.Edit1.Text);
                Ct := Controle.Create(DM,Cli);
                Ct.BuscarCliNOME;
            end
            else if(self.RadioButton3.Checked = true) then
            begin
                Cli.setCodCli(StrToInt(self.Edit1.Text));
                Ct := Controle.Create(DM,Cli);
                Ct.BuscarCliCODIGO;
            end;

            if (Cli.getCodCli <> -1) then
            begin
                FrmDefRelVenda.MaskEdit1.Text := IntToStr(Cli.getCodCli);
                FrmDefRelVenda.Edit2.Text := Cli.getnomeCli;
                self.Edit1.Clear;
                self.RadioButton1.Checked := true;
                FrmDefRelVenda.BitBtn6.Enabled := true;
                FrmDefRelVenda.BitBtn7.Enabled := true;
                self.Close;
            end
            else
            begin
                ShowMessage('Nenhum dado sobre Cliente encontrado.');
                self.Edit1.Clear;
                self.RadioButton1.Checked := true;
            end;
        end
        else
        begin
            MessageDlg('Nenhum Valor foi Informado para a Busca.', mtWarning, [mbOk], 0);
        end;
    except
        On EConvertError do
        begin
            MessageDlg('Valor Inválido para busca por Código.', mtError, [mbOk], 0);
            self.Edit1.Clear;
            self.RadioButton1.Checked := true;
        end;
    end;
end;



end.
