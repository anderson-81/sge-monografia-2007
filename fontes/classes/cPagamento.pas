unit cPagamento;

interface

uses
   SysUtils;
   
type
    Pagamento = class (TObject)
    protected
        codPag    : integer;
        valPag    : real;
        statusPag : string;
        dataPag   : TDateTime;
        tipoPag   : string;
    public
        Constructor Create(codPag:integer; valPag : real; statusPag : string; dataPag : TDateTime; tipoPag   : string);
        Procedure setcodPag(codPag:integer);
        Procedure setvalpag(valPag:real);
        Procedure setstatusPag(statusPag:string);
        Procedure setdataPag(dataPag:TDateTime);
        Procedure setTipoPag(tipoPag : string);
        Function getcodPag:integer;
        Function getvalpag:real;
        Function getstatusPag:string;
        Function getdataPag:TDateTime;
        Function getTipoPag:string;
    end;

implementation

    Constructor Pagamento.Create(codPag : integer; valPag : real; statusPag : string; dataPag : TDateTime; tipoPag:string);
    begin
        self.codPag    := codPag;
        self.valPag    := valPag;
        self.statusPag := statusPag;
        self.dataPag   := dataPag;
        self.tipoPag   := tipoPag;
    end;

    Procedure Pagamento.setcodPag(codPag:integer);
    begin
        self.codPag    := codPag;
    end;

    Function Pagamento.getcodPag:integer;
    begin
        result := codPag;
    end;

    Procedure Pagamento.setvalpag(valPag:real);
    begin
        self.valPag    := valPag;
    end;

    Function Pagamento.getvalpag:real;
    begin
        result := valPag;
    end;

    Procedure Pagamento.setstatusPag(statusPag:string);
    begin
        self.statusPag := statusPag;
    end;

    Function Pagamento.getstatusPag:string;
    begin
        result := statusPag;
    end;

    Procedure Pagamento.setdataPag(dataPag:TDateTime);
    begin
        self.dataPag   := dataPag;
    end;

    Function Pagamento.getdataPag:TDateTime;
    begin
        result := dataPag;
    end;

    Procedure Pagamento.setTipoPag(tipopag:string);
    begin
        self.tipoPag := tipopag;
    end;

    Function Pagamento.getTipoPag:string;
    begin
        result := tipopag;
    end;
end.
