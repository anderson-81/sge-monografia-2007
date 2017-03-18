unit FBuscarVendaRealizada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, cControle, cDataModule, cCliente, cVenda,
  FControlarVenda, cTelefone;

type
  TFrmBuscarVendaRealizada = class(TForm)
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
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    PodeFechar : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarVendaRealizada: TFrmBuscarVendaRealizada;
  DM : TDM;
  
implementation

{$R *.dfm}

procedure TFrmBuscarVendaRealizada.BitBtn1Click(Sender: TObject);
var
    Cli : Cliente;
    Ct : Controle;
    Vd : Venda;
    Tel : Telefone;
begin
    if(self.Edit1.Text <> '') then
    begin
        DM := TDM.Create(NIL);
        Cli:= Cliente.Create(0,'','','','','','','');
        Vd := Venda.Create(0,00/00/0000,0,'');


        if(self.RadioButton1.Checked = true) then
        begin
            Cli.setNomeCli(self.Edit1.Text);
            Ct := Controle.Create(DM,Vd,Cli);
            Ct.BuscarCliNOMEVendaAberta;
        end
        else if(self.RadioButton2.Checked = true) then
        begin
            Tel := Telefone.Create(0,self.Edit1.Text,self.Edit1.Text);
            Ct := Controle.Create(DM,Cli,Vd,Tel);
            Ct.BuscarCliTELVendaAberta;
        end
        else if(self.RadioButton3.Checked = true) then
        begin
            Cli.setCodCli(StrToInt(self.Edit1.Text));
            Ct := Controle.Create(DM,Vd,Cli);
            Ct.BuscarCliCODVendaAberta;
        end;

        if(Cli.getCodCli <> -1)  then
        begin
            FrmControlarVenda.Edit1.Text := IntToStr(Cli.getCodCli);
            FrmControlarVenda.Edit2.Text := Cli.getnomeCli;
            FrmControlarVenda.Edit3.Text := IntToStr(Vd.getcodVenda);
            FrmControlarVenda.BitBtn5.Enabled := true;
            FrmControlarVenda.BitBtn6.Enabled := true;
            FrmControlarVenda.BitBtn7.Enabled := false;
            FrmControlarVenda.BitBtn8.Enabled := false;
            FrmControlarVenda.BitBtn1.Enabled := true;
            FrmControlarVenda.BitBtn2.Enabled := true;
            self.RadioButton1.Checked := true;
            self.Edit1.Clear;
            self.PodeFechar := true;
            self.Close;
        end
        else
        begin
            ShowMessage('Nenhum dado sobre Cliente relacionado foi Encontrado.');
            FrmBuscarVendaRealizada.Edit1.Clear;
            FrmBuscarVendaRealizada.RadioButton1.Checked := true;
            FrmControlarVenda.BitBtn1.Enabled := true;
        end;
    end
    else
    begin
       MessageDlg('Nenhum Valor Foi Informado para a Busca.', mtWarning, [mbOk], 0);
    end;
end;

procedure TFrmBuscarVendaRealizada.FormShow(Sender: TObject);
begin
    self.PodeFechar := false;
end;

procedure TFrmBuscarVendaRealizada.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

procedure TFrmBuscarVendaRealizada.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja cancelar a busca por Cliente?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        self.PodeFechar := true;
        self.Close;
    end
end;

procedure TFrmBuscarVendaRealizada.FormCreate(Sender: TObject);
begin
    self.PodeFechar := false;
end;

procedure TFrmBuscarVendaRealizada.Edit1Change(Sender: TObject);
begin
    if(self.RadioButton2.Checked = true) then
    begin
        try
            StrToInt64(self.Edit1.Text);
        except
            MessageDlg('Valor Inválido.', mtWarning, [mbOk], 0);
            self.RadioButton1.Checked := true;
        end;
    end;
end;

procedure TFrmBuscarVendaRealizada.RadioButton2Click(Sender: TObject);
begin
    self.Edit1.Text := '0';
end;

end.
