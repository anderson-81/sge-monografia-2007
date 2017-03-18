unit cItemDePedido;

interface

type
      ItemDePedido = class (TObject)
      protected
          codItemPed     : integer;
          qtdUnitItemPed : integer;
          qtdPesoItemPed : real;
          valPagItemPed  : real;
      public
          Constructor Create (codItemPed:integer; qtdUnitItemPed:integer; qtdPesoItemPed:real;valPagItemPed:real);
          Procedure setcodItemPed(codItemPed:integer);
          Function getcodItemPed:integer;
          Procedure setqtdUnitItemPed(qtdUnitItemPed:integer);
          Function getqtdUnitItemPed:integer;
          Procedure setqtdPesoItemPed(qtdPesoItemPed:real);
          Function getqtdPesoItemPed:real;
          Procedure setvalPagItemPed(valPagItemPed:real);
          Function getvalPagItemPed:real;
      end;

implementation

    Constructor ItemDePedido.Create(codItemPed:integer; qtdUnitItemPed:integer; qtdPesoItemPed:real; valPagItemPed:real);
    begin
        self.codItemPed     := codItemPed;
        self.qtdUnitItemPed := qtdUnitItemPed;
        self.qtdPesoItemPed := qtdPesoItemPed;
        self.valPagItemPed  := valPagItemPed;
    end;

    Procedure ItemDePedido.setcodItemPed(codItemPed:integer);
    begin
        self.codItemPed := codItemPed;
    end;

    Function ItemDePedido.getcodItemPed:integer;
    begin
        result := codItemPed;
    end;

    Procedure ItemDePedido.setqtdUnitItemPed(qtdUnitItemPed:integer);
    begin
        self.qtdUnitItemPed := qtdUnitItemPed;
    end;

    Function ItemDePedido.getqtdUnitItemPed:integer;
    begin
        result := qtdUnitItemPed;
    end;

    Procedure ItemDePedido.setqtdPesoItemPed(qtdPesoItemPed:real);
    begin
         self.qtdPesoItemPed := qtdPesoItemPed;
    end;

    Function ItemDePedido.getqtdPesoItemPed:real;
    begin
        result := qtdPesoItemPed;
    end;

    Procedure ItemDePedido.setvalPagItemPed(valPagItemPed:real);
    begin
        self.valPagItemPed := valPagItemPed;
    end;

    Function ItemDePedido.getvalPagItemPed:real;
    begin
        result := valPagItemPed;
    end;
end.


