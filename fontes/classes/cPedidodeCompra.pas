unit cPedidoDeCompra;

interface

type
    PedidodeCompra = class (TObject)
    protected
        codPedCompra    : integer;
        dataPedCompra   : TDateTime;
        valTotPedCompra : real;
        statusCompra    : string;
    public
        Constructor Create (codPedCompra : integer; dataPedCompra : TDateTime; valTotPedCompra : real; statusCompra:string);
        Procedure setcodPedCompra (codPedCompra:integer);
        Function getcodPedCompra:integer;
        Procedure setdataPedCompra(dataPedCompra:TDateTime);
        Function getdataPedCompra:TDateTime;
        Procedure setvalTotPedCompra (valTotPedCompra:real);
        Function getValTotPedCompra:real;
        Procedure setstatusCompra (statusCompra:string);
        Function getstatusCompra:string;
    end;

implementation

    Constructor PedidodeCompra.Create(codPedCompra:integer; dataPedCompra:TDateTime; valTotPedCompra:real; statusCompra:string);
    begin
        self.codPedCompra    := codPedCompra;
        self.dataPedCompra   := dataPedCompra;
        self.valTotPedCompra := valTotPedCompra;
        self.statusCompra    := statusCompra;
    end;

    Procedure PedidodeCompra.setcodPedCompra(codPedCompra:integer);
    begin
        self.codPedCompra := codPedCompra;
    end;

    Function PedidodeCompra.getcodPedCompra:integer;
    begin
        result := codPedCompra;
    end;

    Procedure PedidodeCompra.setdataPedCompra(dataPedCompra:TDateTime);
    begin
        self.dataPedCompra := dataPedCompra;
    end;

    Function PedidodeCompra.getdataPedCompra:TDateTime;
    begin
        result := dataPedCompra;
    end;

    Procedure PedidodeCompra.setvalTotPedCompra(valTotPedCompra:real);
    begin
        self.valTotPedCompra := valTotPedCompra;
    end;

    Function PedidodeCompra.getValTotPedCompra:real;
    begin
        result := valTotPedCompra;
    end;

    Procedure PedidodeCompra.setstatusCompra(statusCompra:string);
    begin
        self.statusCompra := statusCompra;
    end;

    Function PedidodeCompra.getstatusCompra:string;
    begin
        result := statusCompra;
    end;
end.
