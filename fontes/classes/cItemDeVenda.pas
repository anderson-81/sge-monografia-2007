unit cItemDeVenda;

interface

type
      ItemDeVenda = class (TObject)
      protected
          codItemVend     : integer;
          qtdUnitItemVend : integer;
          qtdPesoItemVend : real;
          valPagItemVend  : real;
      public
          Constructor Create (codItemVend:integer; qtdUnitItemVend:integer; qtdPesoItemVend:real;valPagItemVend:real);
          Procedure setcodItemVend(codItemVend:integer);
          Function getcodItemVend:integer;
          Procedure setqtdUnitItemVend(qtdUnitItemVend:integer);
          Function getqtdUnitItemVend:integer;
          Procedure setqtdPesoItemVend(qtdPesoItemVend:real);
          Function getqtdPesoItemVend:real;
          Procedure setvalPagItemVend(valPagItemVend:real);
          Function getvalPagItemVend:real;
      end;

implementation

    Constructor ItemDeVenda.Create(codItemVend:integer; qtdUnitItemVend:integer; qtdPesoItemVend:real; valPagItemVend:real);
    begin
        self.codItemVend     := codItemVend;
        self.qtdUnitItemVend := qtdUnitItemVend;
        self.qtdPesoItemVend := qtdPesoItemVend;
        self.valPagItemVend  := valPagItemVend;
    end;

    Procedure ItemDeVenda.setcodItemVend(codItemVend:integer);
    begin
        self.codItemVend := codItemVend;
    end;

    Function ItemDeVenda.getcodItemVend:integer;
    begin
        result := codItemVend;
    end;

    Procedure ItemDeVenda.setqtdUnitItemVend(qtdUnitItemVend:integer);
    begin
        self.qtdUnitItemVend := qtdUnitItemVend;
    end;

    Function ItemDeVenda.getqtdUnitItemVend:integer;
    begin
        result := qtdUnitItemVend;
    end;

    Procedure ItemDeVenda.setqtdPesoItemVend(qtdPesoItemVend:real);
    begin
         self.qtdPesoItemVend := qtdPesoItemVend;
    end;

    Function ItemDeVenda.getqtdPesoItemVend:real;
    begin
        result := qtdPesoItemVend;
    end;

    Procedure ItemDeVenda.setvalPagItemVend(valPagItemVend:real);
    begin
        self.valPagItemVend := valPagItemVend;
    end;

    Function ItemDeVenda.getvalPagItemVend:real;
    begin
        result := valPagItemVend;
    end;
end.

