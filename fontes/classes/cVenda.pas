unit cVenda;

interface

type
    Venda = class (TObject)
    Protected
        codVenda    : integer;
        dataVenda   : TDateTime;
        valTotVenda : real;
        statusVenda : String;
    public
        Constructor Create (codVenda:integer; dataVenda:TDateTime; valTotVenda:real; statusVenda:String);
        Procedure setcodVenda (codVenda:integer);
        Function getcodVenda:integer;
        Procedure setdataVenda(dataVenda:TDateTime);
        Function getdataVenda:TDateTime;
        Procedure setvalTotVenda (valTotVenda:real);
        Function getValTotVenda:real;
        Procedure setStatusVenda(statusVenda:String);
        Function getStatusVenda:String;
    end;

implementation

    Constructor Venda.Create(codVenda:integer; dataVenda:TDateTime; valTotVenda:real; statusVenda:String);
    begin
        self.codVenda := codVenda;
        self.dataVenda := dataVenda;
        self.valTotVenda := valtotvenda;
        self.statusVenda := statusVenda;
    end;

    Procedure Venda.setcodVenda(codVenda : integer);
    begin
        self.codVenda := codVenda;
    end;

    Function Venda.getcodVenda:integer;
    begin
        result := codVenda;
    end;

    Procedure Venda.setdataVenda(dataVenda:TDateTime);
    begin
        self.dataVenda := dataVenda;
    end;

    Function Venda.getdataVenda:TDateTime;
    begin
        result := dataVenda;
    end;

    Procedure Venda.setvalTotVenda(valtotvenda:real);
    begin
        self.valTotVenda := valtotvenda;
    end;

    Function Venda.getValTotVenda:real;
    begin
        result := valtotvenda;
    end;

    Procedure Venda.setStatusVenda(statusVenda:String);
    begin
        self.statusVenda := statusVenda;
    end;

    Function Venda.getstatusVenda:String;
    begin
        result := statusVenda;
    end;

end.
