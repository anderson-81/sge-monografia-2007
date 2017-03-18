unit FCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, cDataModule, cControle;

type
  TFrmCategoria = class(TForm)
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    Editar2: TMenuItem;
    Limpar2: TMenuItem;
    Label1: TLabel;
    Edit2: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCategoria: TFrmCategoria;

implementation

uses FManterProduto;

{$R *.dfm}

procedure TFrmCategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmManterProduto.Enabled := true;
end;

procedure TFrmCategoria.BitBtn1Click(Sender: TObject);
begin
    {
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        if(Ct.VerifExistCatg(Edit1.Text) = 0) then
        begin
           Ct.IncluirCatg(StrToInt(Edit2.Text),Edit1.Text);
        end
        else if(Ct.VerifExistCatg(Edit1.Text) = 0) then
        begin
           Showmessage('Categoria já Cadastrada no Sistema.');
        end
    except
        MessageDlg('Problema na Inclusão de Categoria.', mtError, [mbOk], 0);
    end;
    }
end;

procedure TFrmCategoria.BitBtn2Click(Sender: TObject);
{
var
    DM  : TDM;
    Ct  : Controle;
}
begin
    {
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        if(Ct.VerifExistCatg(Edit1.Text) = 0) then
        begin
           Ct.IncluirCatg(StrToInt(Edit2.Text),Edit1.Text);
        end
        else if(Ct.VerifExistCatg(Edit1.Text) = 0) then
        begin
           Showmessage('Categoria já Cadastrada no Sistema.');
        end
    except
        MessageDlg('Problema na Inclusão de Categoria.', mtError, [mbOk], 0);
    end;
    }
end;


procedure TFrmCategoria.BitBtn3Click(Sender: TObject);
{
var
    DM  : TDM;
    Ct  : Controle;
}
begin
    {
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        if(Ct.VerifExistCatg(Edit1.Text) = 0) then
        begin
           Ct.IncluirCatg(StrToInt(Edit2.Text),Edit1.Text);
        end
        else if(Ct.VerifExistCatg(Edit1.Text) = 0) then
        begin
           Showmessage('Categoria já Cadastrada no Sistema.');
        end
    except
        MessageDlg('Problema na Inclusão de Categoria.', mtError, [mbOk], 0);
    end;
    }
end;


end.
