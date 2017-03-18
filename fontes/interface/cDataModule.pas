unit cDataModule;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZConnection, ZAbstractTable, ZAbstractConnection;

type
  TDM = class(TDataModule)
    ZCon1: TZConnection;
    ZQuery1: TZQuery;
    DS1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
