unit FBuscarVendaPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, cControle, cDataModule, cCliente, cTelefone,
  FRealizarPagamento;

type
  TFrmBuscarVendaPagto = class(TForm)
    Label3: TLabel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Edit1: TEdit;
    GroupBox4: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarVendaPagto: TFrmBuscarVendaPagto;
  DM:TDM;

implementation

{$R *.dfm}

procedure TFrmBuscarVendaPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmRealizarPagamento.Enabled := true;
end;

procedure TFrmBuscarVendaPagto.BitBtn1Click(Sender: TObject);
var
    Ct  : Controle;
    Cli : Cliente;
    Tel : Telefone;
begin
    try
        if (self.Edit1.Text <> '') then
        begin
            DM  := TDM.create (NIL);
            Cli := Cliente.Create(0,'','','','','','','');

            if (self.RadioButton1.Checked = true) then
            begin
                Cli.setNomeCli(self.edit1.Text);
                Ct  := Controle.Create (DM,Cli);
                Ct.BuscarVendasRealizadasPorCliente;
            end

            else if (self.RadioButton2.Checked = true) then
            begin
                Tel := Telefone.Create(0,self.Edit1.Text,self.Edit1.Text);
                Ct  := Controle.Create(DM,Cli,Tel);
                Ct.BuscarVendasRealizadasPorClienteTelCli;
            end

            else if (self.RadioButton3.Checked = true) then
            begin
                Ct  := Controle.Create(DM,Cli);
                Cli.setCodCli(StrToInt(self.edit1.Text));
                Ct.BuscarVendasRealizadasPorClienteCodCli;
            end;

            if (Cli.getCodCli <> -1) then
            begin
                FrmRealizarPagamento.Edit1.Text := IntToStr(Cli.getCodCli);
                FrmRealizarPagamento.Edit2.Text := Cli.getnomeCli;
                FrmRealizarPagamento.BitBtn5.Enabled := true;
                FrmRealizarPagamento.BitBtn6.Enabled := true;
                FrmRealizarPagamento.BitBtn1.Enabled := true;
                self.Close;
            end
            else
            begin
                MessageDlg('Nenhum Cliente encontrado.', mtInformation, [mbOk], 0);
                self.RadioButton1.Checked := true;
                self.Edit1.Text := '';
            end
        end
        else
           MessageDlg('Informe um dado para a busca.', mtWarning, [mbOk], 0);
    except
        On EConvertError do
        begin
            MessageDlg('Valor Inválido.', mtWarning, [mbOk], 0);
            self.RadioButton1.Checked := true;
            self.Edit1.Text := '0';
        end;
        else
            MessageDlg('Problema na busca por Cliente relacionado a Venda.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmBuscarVendaPagto.Edit1Change(Sender: TObject);
begin
    if(self.RadioButton2.Checked = true) OR (self.RadioButton3.Checked = true) then
    begin
        try
             StrToInt(self.Edit1.Text);
        except
            On EConvertError do
            begin
                MessageDlg('Valor Inválido.', mtWarning, [mbOk], 0);
                self.Edit1.Text := '0';
            end
         end
    end;
end;

procedure TFrmBuscarVendaPagto.RadioButton2Click(Sender: TObject);
begin
    self.Edit1.Text := '0';
end;

procedure TFrmBuscarVendaPagto.RadioButton3Click(Sender: TObject);
begin
    self.Edit1.Text := '0';
end;

end.


