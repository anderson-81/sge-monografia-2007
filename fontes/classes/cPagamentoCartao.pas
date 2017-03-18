unit cPagamentoCartao;

interface

uses
    cPagamento;

type
    PagamentoCartao = class (Pagamento)
    protected
        codCartao      : integer;
        bandCartao     : string;
        dataVencCartao : TDateTime;
    public
        Constructor Create(codPag : integer; valPag : real;
                           statusPag : string; dataPag : TDateTime;
                           tipoPag : string; codCartao : integer;
                           dataVencCartao : TDateTime;
                           bandCartao : string);
        Procedure setcodCartao(codCartao:integer);
        Function getcodCartao:integer;
        Procedure setbandCartao(bandCartao:string);
        Function getbandCartao:string;
        Procedure setdataVencCartao(dataVencCartao:TDateTime);
        Function getdataVencCartao:TDateTime;
    end;

implementation

    Constructor PagamentoCartao.Create(codPag : integer; valPag : real;
                                       statusPag : string; dataPag : TDateTime;
                                       tipoPag : string; codCartao : integer;
                                       dataVencCartao : TDateTime;
                                       bandCartao : string);
    begin
        inherited Create (codPag,valPag,statusPag,dataPag,tipoPag);
        self.codCartao      := codCartao;
        self.dataVencCartao := dataVencCartao;
        self.bandCartao     := bandCartao;
    end;

    Procedure PagamentoCartao.setcodCartao(codCartao:integer);
    begin
        self.codCartao := codCartao;
    end;

    Function PagamentoCartao.getcodCartao:integer;
    begin
        result := codCartao;
    end;

    Procedure PagamentoCartao.setbandCartao(bandCartao:string);
    begin
        self.bandCartao   := bandCartao;
    end;

    Function PagamentoCartao.getbandCartao:string;
    begin
        result := bandCartao;
    end;

    Procedure PagamentoCartao.setdataVencCartao(dataVencCartao:TDateTime);
    begin
        self.dataVencCartao := dataVencCartao;
    end;

    Function PagamentoCartao.getdataVencCartao:TDateTime;
    begin
        result := dataVencCartao;
    end;

end.


