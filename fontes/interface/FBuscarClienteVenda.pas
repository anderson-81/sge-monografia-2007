unit FBuscarClienteVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cDataModule, cControle, cCliente, cTelefone;

type
  TFrmBuscarClienteVenda = class(TForm)
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
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    Procedure ClearBox;
    procedure RadioButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarClienteVenda: TFrmBuscarClienteVenda;


implementation

{$R *.dfm}

uses
    FRealizarVenda;

procedure TFrmBuscarClienteVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmRealizarVenda.Enabled := true;
end;

procedure TFrmBuscarClienteVenda.BitBtn1Click(Sender: TObject);
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
                Ct  := Controle.Create (DM,Cli);
                Cli.setNomeCli(self.edit1.Text);
                Ct.BuscarCliNOMEVenda;
            end

            else if (RadioButton2.Checked = true) then
            begin
                Tel := Telefone.Create(0,'','');
                Ct  := Controle.Create(DM,Cli,Tel);
                Tel.setTelCont1(self.Edit1.Text);
                Ct.BuscarCliTELVenda;
            end

            else if (RadioButton3.Checked = true) then
            begin
                Ct  := Controle.Create(DM,Cli);
                Cli.setCodCli(StrToInt(self.edit1.Text));
                Ct.BuscarCliCodVenda;
            end;

            if (Cli.getCodCli <> -1) then
            begin
                FrmRealizarVenda.Edit1.text      := IntToStr(Cli.getCodCli);
                FrmRealizarVenda.Edit2.Text      := Cli.getnomeCli;
                FrmRealizarVenda.BitBtn5.Enabled := true;
                FrmRealizarVenda.BitBtn6.Enabled := true;
                FrmRealizarVenda.BitBtn7.Enabled := false;
                FrmRealizarVenda.BitBtn8.Enabled := false;
                FrmRealizarVenda.BitBtn1.Enabled := true;
                FrmRealizarVenda.BitBtn2.Enabled := true;
                self.ClearBox;
                self.Close;
            end
            else
            begin
                MessageDlg('Nenhum Cliente foi encontrado.', mtInformation, [mbOk], 0);
                self.ClearBox;
                self.RadioButton1.Checked := true;
            end
        end
        else
           MessageDlg('Informe um valor para a busca.', mtWarning, [mbOk], 0);
     except
         On EConvertError do
         begin
             MessageDlg('Valor Inválido para a busca.', mtWarning, [mbOk], 0);
         end
         else
            MessageDlg('Problema na busca por Cliente.', mtError, [mbOk], 0);
     end;
end;

Procedure TFrmBuscarClienteVenda.ClearBox;
begin
    self.RadioButton1.Checked := true;
    self.Edit1.Text := '';
end;


procedure TFrmBuscarClienteVenda.RadioButton2Click(Sender: TObject);
begin
    self.Edit1.Text := '0';
    self.RadioButton2.Hint := 'Informe DDD mais o número.';
    self.ShowHint := true;
end;

procedure TFrmBuscarClienteVenda.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja cancelar a busca por Cliente?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
        self.Close
    else
        self.Close;
end;

procedure TFrmBuscarClienteVenda.Edit1Change(Sender: TObject);
begin
    if(self.RadioButton2.Checked = true) OR (self.RadioButton3.Checked = true) then
    begin
        try
            StrToInt64(self.Edit1.Text);
        except
            MessageDlg('Valor Inválido.', mtWarning, [mbOk], 0);
            self.Edit1.Text := '0';
        end;
    end;
end;

procedure TFrmBuscarClienteVenda.RadioButton3Click(Sender: TObject);
begin
    self.Edit1.Text := '0';
end;

procedure TFrmBuscarClienteVenda.FormShow(Sender: TObject);
begin
    self.ClearBox;
end;

end.
