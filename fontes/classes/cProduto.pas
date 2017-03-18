unit cProduto;

interface

type
      Produto = class (TObject)
      protected
          codProd     : integer;
          nomeProd    : string;
          precoProd   : Real;
          descProd    : string;
          catProd     : string;
          tipoMedProd : String;
      public
          Constructor Create (codProd : integer; nomeProd : string;  precoProd : Real; descProd : string; catProd : string; tipoMedProd : String);
          Procedure setCodProd(codProd:integer);
          Function getcodProd:integer;
          Procedure setnomeProd(nomeProd:string);
          Function getnomeProd:string;
          Procedure setprecoProd(precoProd:Real);
          Function getprecoProd:Real;
          Procedure setdescProd(descProd:string);
          Function getdescProd:string;
          Procedure setcatProd(catProd:string);
          Function getcatProd:string;
          Procedure settipoMedProd(tipoMedProd : String);
          Function gettipoMedProd : String;
      end;

implementation

      Constructor Produto.Create(codProd : integer; nomeProd : string;  precoProd : Real; descProd : string; catProd : string; tipoMedProd : String);
      begin
          self.codProd     := codProd;
          self.nomeProd    := nomeProd;
          self.precoProd   := precoProd;
          self.descProd    := descProd;
          self.catProd     := catProd;
          self.tipoMedProd := tipoMedProd;
      end;

      Procedure Produto.setCodProd(codProd:integer);
      begin
          self.codProd := codProd;
      end;

      Function Produto.getcodProd:integer;
      begin
          result := codProd;
      end;

      Procedure Produto.setnomeProd(nomeProd:string);
      begin
          self.nomeProd := nomeProd;
      end;

      Function Produto.getnomeProd:string;
      begin
          result := nomeProd;
      end;

      Procedure Produto.setprecoProd(precoProd:Real);
      begin
          self.precoProd := precoProd;
      end;

      Function Produto.getprecoProd:Real;
      begin
          result := precoProd;
      end;

      Procedure Produto.setdescProd(descProd:string);
      begin
          self.descProd := descProd;
      end;

      Function Produto.getdescProd:string;
      begin
          result := descProd;
      end;

      Procedure Produto.setcatProd(catProd:string);
      begin
          self.catProd := catProd;
      end;

      Function Produto.getcatProd:string;
      begin
          result := catProd;
      end;

      Procedure Produto.settipoMedProd(tipoMedProd : String);
      begin
          self.tipoMedProd := tipoMedProd;
      end;

      Function Produto.gettipoMedProd:String;
      begin
          result := tipoMedProd;
      end;
end.
