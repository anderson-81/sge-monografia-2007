unit FControlarEstq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, FDefRelEstoque;

type
  TFrmControlarEstq = class(TForm)
    Label3: TLabel;
    GroupBox2: TGroupBox;
    BitBtn3: TBitBtn;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Editar1: TMenuItem;
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControlarEstq: TFrmControlarEstq;

implementation

{$R *.dfm}

procedure TFrmControlarEstq.BitBtn3Click(Sender: TObject);
begin
    FrmControlarEstq.Visible := false;
    FrmDefRelEstoque.ShowModal;
end;

end.
