unit cPagamentoComCheque;

interface

uses
    cPagamento;

type
    PagamentoComCheque = class (Pagamento)
    protected
        numCheq      : integer;
        contaCheq    : integer;
        agenciaCheq  : integer;
        bancoCheq    : string;
    public
        Constructor Create(codPag : integer; valPag : real;
                           statusPag : string; dataPag : TDateTime; tipoPag : string;
                           numCheq : integer; contaCheq : integer;
                           agenciaCheq : integer; bancoCheq : string);

        Procedure setnumCheq(numCheq:integer);
        Function getnumCheq:integer;
        Procedure setcontaCheq(contaCheq:integer);
        Function getcontaCheq:integer;
        Procedure setagenciaCheq(agenciaCheq:integer);
        Function getagenciaCheq:integer;
        Procedure setbancoCheq(bancoCheq:string);
        Function getbancoCheq:string;
    end;

implementation

    Constructor PagamentoComCheque.Create(codPag : integer; valPag : real;
                                          statusPag : string; dataPag : TDateTime; tipoPag : string;
                                          numCheq : integer; contaCheq : integer;
                                          agenciaCheq : integer; bancoCheq : string);
    begin
        inherited Create  (codPag,valPag,statusPag,dataPag, tipoPag);
        self.numCheq      := numCheq;
        self.contaCheq    := contaCheq;
        self.agenciaCheq  := agenciaCheq;
        self.bancoCheq    := bancoCheq;
    end;

    Procedure PagamentoComCheque.setnumCheq(numCheq:integer);
    begin
        self.numCheq    := numCheq;
    end;

    Function PagamentoComCheque.getnumCheq:integer;
    begin
        result := numCheq;
    end;

    Procedure PagamentoComCheque.setcontaCheq(contaCheq:integer);
    begin
        self.contaCheq    := contaCheq;
    end;

    Function PagamentoComCheque.getcontaCheq:integer;
    begin
        result := contaCheq;
    end;

    Procedure PagamentoComCheque.setagenciaCheq(agenciaCheq:integer);
    begin
        self.agenciaCheq := agenciaCheq;
    end;

    Function PagamentoComCheque.getagenciaCheq:integer;
    begin
        result := agenciaCheq;
    end;

    Procedure PagamentoComCheque.setbancoCheq(bancoCheq:string);
    begin
        self.bancoCheq   := bancoCheq;
    end;

    Function PagamentoComCheque.getbancoCheq:string;
    begin
        result := bancoCheq;
    end;

end.

