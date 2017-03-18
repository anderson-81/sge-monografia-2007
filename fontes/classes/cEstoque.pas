unit cEstoque;

interface

type
    Estoque = class (TObject)
    protected
         codEstq : integer;
         qtdPesoEstqAtual : real;
         qtdPesoEstqAntg  : real;
         qtdUnitEstqAtual : integer;
         qtdUnitEstqAntg  : integer;
         qtdMinEstq       : integer;
    public
         Constructor Create (codEstq:integer; qtdPesoEstqAtual:real; qtdPesoEstqAntg:real; qtdUnitEstqAtual:integer; qtdUnitEstqAntg:integer; qtdMinEstq:integer);
         Procedure setcodestq (codEstq : integer);
         Function getcodEstq:integer;
         Procedure setqtdPesoEstqAtual (qtdPesoEstqAtual : real);
         Function getqtdPesoEstqAtual:real;
         Procedure setqtdPesoEstqAntg (qtdPesoEstqAntg : real);
         Function getqtdPesoEstqAntg:real;
         Procedure setqtdUnitestqAtual (qtdUnitestqAtual : integer);
         Function getqtdunitEstqAtual:integer;
         Procedure setqtdUnitEstqAntg (qtdUnitEstqAntg : integer);
         Function getqtdUnitEstqAntg:integer;
         Procedure setqtdMinEstq(qtdMinEstq : integer);
         Function getqtdMinEstq:integer;
    end;

implementation

    Constructor Estoque.Create(codEstq:integer; qtdPesoEstqAtual:real; qtdPesoEstqAntg:real; qtdUnitEstqAtual:integer; qtdUnitEstqAntg:integer; qtdMinEstq:integer);
    begin
        self.codEstq := codestq;
        self.qtdPesoEstqAtual := qtdPesoEstqAtual;
        self.qtdPesoEstqAntg  := qtdPesoEstqAntg;
        self.qtdUnitEstqAtual := qtdUnitEstqAtual;
        self.qtdUnitEstqAntg  := qtdUnitEstqAntg;
        self.qtdMinEstq       := qtdMinEstq;
    end;

    Procedure Estoque.setcodestq(codestq:integer);
    begin
        self.codEstq := codestq;
    end;

    Function Estoque.getcodEstq:integer;
    begin
        result := codestq;
    end;

    Procedure Estoque.setqtdPesoEstqAtual(qtdPesoEstqAtual:real);
    begin
        self.qtdPesoEstqAtual := qtdPesoEstqAtual;
    end;

    Function Estoque.getqtdPesoEstqAtual:real;
    begin
        result := qtdPesoEstqAtual;
    end;

    Procedure Estoque.setqtdPesoEstqAntg(qtdPesoEstqAntg:real);
    begin
        self.qtdPesoEstqAntg := qtdPesoEstqAntg;
    end;

    Function Estoque.getqtdPesoEstqAntg:real;
    begin
        result := qtdPesoEstqAntg;
    end;

    Procedure Estoque.setqtdUnitEstqAtual(qtdUnitEstqAtual:integer);
    begin
        self.qtdUnitEstqAtual := qtdUnitEstqAtual;
    end;

    Function Estoque.getqtdunitEstqAtual:integer;
    begin
        result := qtdUnitEstqAtual;
    end;

    Procedure Estoque.setqtdUnitEstqAntg(qtdUnitEstqAntg:integer);
    begin
        self.qtdUnitEstqAntg := qtdUnitEstqAntg;
    end;

    Function Estoque.getqtdUnitEstqAntg:integer;
    begin
        result := qtdUnitEstqAntg;
    end;

    Procedure Estoque.setqtdMinEstq(qtdMinEstq:integer);
    begin
        self.qtdMinEstq := qtdMinEstq;
    end;

    Function Estoque.getqtdMinEstq:integer;
    begin
        result := qtdMinEstq;
    end;

end.
