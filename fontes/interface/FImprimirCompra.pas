unit FImprimirCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  TFrmImprimirCompra = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRImage1: TQRImage;
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand3: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRBand4: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand5: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImprimirCompra: TFrmImprimirCompra;

implementation

{$R *.dfm}

procedure TFrmImprimirCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Showmessage('Compra Confirmada com Sucesso.');
end;

end.
