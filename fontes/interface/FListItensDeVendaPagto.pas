unit FListItensDeVendaPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, rxToolEdit, rxCurrEdit;

type
  TFrmListItensDeVendaPagto = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListItensDeVendaPagto: TFrmListItensDeVendaPagto;

implementation

{$R *.dfm}

uses
    FControlarPagto;

procedure TFrmListItensDeVendaPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmControlarPagto.Enabled := true;
end;

end.
