unit FControlarVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Buttons, cDataModule,  FDefRelVenda,
  cCliente, cControle, FTelaVendaRealizada, FImprimirVenda;

type
  TFrmControlarVenda = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    Edit3: TEdit;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure AtribuirValores;
    procedure ClearBox;
    procedure Limpar1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControlarVenda: TFrmControlarVenda;

implementation

{$R *.dfm}

uses
    FPrincipal, FBuscarVendaRealizada;

procedure TFrmControlarVenda.BitBtn2Click(Sender: TObject);
begin
    FrmBuscarVendaRealizada.ShowModal;
end;

procedure TFrmControlarVenda.BitBtn1Click(Sender: TObject);
begin
    FrmTelaVendaRealizada.Edit1.Text := self.Edit1.Text;
    FrmTelaVendaRealizada.Edit2.Text := self.Edit2.Text;
    FrmTelaVendaRealizada.Edit3.Text := self.Edit3.Text;
    FrmControlarVenda.Visible := false;
    FrmTelaVendaRealizada.MostrarItens;
    FrmTelaVendaRealizada.CalcularVenda;
    FrmTelaVendaRealizada.ShowModal;
end;

procedure TFrmControlarVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmPrincipal.Enabled := true;
    self.ClearBox;
end;

procedure TFrmControlarVenda.BitBtn5Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Last;
        AtribuirValores;

        BitBtn5.Enabled := false;
        BitBtn6.Enabled := false;

        BitBtn8.Enabled := true;
        BitBtn7.Enabled := true;
    except
        MessageDlg('Problema na navegação por registros.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmControlarVenda.BitBtn6Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Next;
        AtribuirValores;

        if (DM.ZQuery1.Eof) then
        begin
            BitBtn5.Enabled := false;
            BitBtn6.Enabled := false;
        end;

        BitBtn8.Enabled := true;
        BitBtn7.Enabled := true;
    except
        MessageDlg('Problema na navegação por registros.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmControlarVenda.BitBtn7Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Prior;
        AtribuirValores;

        if (DM.ZQuery1.Bof) then
        begin
            BitBtn8.Enabled := false;
            BitBtn7.Enabled := false;
        end;

        BitBtn6.Enabled := true;
        BitBtn5.Enabled := true;
    except
        MessageDlg('Problema na navegação por registros.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmControlarVenda.BitBtn8Click(Sender: TObject);
begin
    try
        DM.ZQuery1.First;
        AtribuirValores;
        BitBtn8.Enabled := false;
        BitBtn7.Enabled := false;
        BitBtn6.Enabled := true;
        BitBtn5.Enabled := true;
    except
        MessageDlg('Problema na navegação por registros.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmControlarVenda.AtribuirValores;
begin
    try
        FrmControlarVenda.Edit1.text := IntToStr(DM.ZQuery1.FieldByName('codCli').AsInteger);
        FrmControlarVenda.Edit2.Text := DM.ZQuery1.FieldByName('nomeCli').AsString;
    except
        MessageDlg('Problema na Atribuição dos valores.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmControlarVenda.ClearBox;
begin
    Edit1.Clear;
    Edit2.Clear;
    BitBtn1.Enabled := false;
    BitBtn2.Enabled := true;
    BitBtn6.Enabled := false;
    BitBtn5.Enabled := false;
    BitBtn8.Enabled := false;
    BitBtn7.Enabled := false;
end;

procedure TFrmControlarVenda.Limpar1Click(Sender: TObject);
begin
    self.ClearBox;  
end;

procedure TFrmControlarVenda.BitBtn3Click(Sender: TObject);
begin
    self.Visible := false;
    FrmDefRelVenda.ShowModal;
end;

procedure TFrmControlarVenda.Edit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmControlarVenda.Edit2Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

end.
