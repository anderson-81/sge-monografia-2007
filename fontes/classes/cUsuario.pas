unit cUsuario;

interface

type
      Usuario = class (TObject)
      protected
           codUsu    : integer;
           logUsu    : string;
           senhaUsu  : string;
           nivelUsu  : string;
           statusUsu : String;
      public
           Constructor Create (codUsu:integer; logUsu:string; senhaUsu:string; nivelUsu:String; statusUsu:String);
           Procedure setCodUsu(codUsu:integer);
           Function getCodUsu:integer;
           Procedure setLogUsu(logUsu:string);
           Function getLogUsu:string;
           Procedure setsenhaUsu(senhaUsu:string);
           Function getsenhaUsu:string;
           Procedure setnivelUsu(nivelUsu:string);
           Function getnivelUsu:string;
           Procedure setStatusUsu(statusUsu:String);
           Function getStatusUsu:String;
      end;

implementation

      Constructor Usuario.Create(codUsu : integer; logUsu : string; senhaUsu : string ; nivelUsu:String; statusUsu : String);
      begin
          self.codUsu    := codUsu;
          self.logUsu    := logUsu;
          self.senhaUsu  := senhaUsu;
          self.nivelUsu  := nivelUsu;
          self.statusUsu := statusUsu;
      end;

      Procedure Usuario.setCodUsu(codUsu:integer);
      begin
          self.codUsu   := codUsu;
      end;

      Function Usuario.getCodUsu:integer;
      begin
          result := codUsu;
      end;

      Procedure Usuario.setLogUsu(logUsu:string);
      begin
          self.logUsu := logUsu;
      end;

      Function Usuario.getLogUsu:string;
      begin
          result := logUsu;
      end;

      Procedure Usuario.setsenhaUsu(senhaUsu:string);
      begin
          self.senhaUsu := senhaUsu;
      end;

      Function Usuario.getsenhaUsu:string;
      begin
          result := senhaUsu;
      end;

      Procedure Usuario.setnivelUsu(nivelUsu:string);
      begin
          self.nivelUsu := nivelUsu;
      end;

      Function Usuario.getnivelUsu:string;
      begin
          result := nivelUsu;
      end;

      Procedure Usuario.setStatusUsu(statusUsu:String);
      begin
          self.statusUsu := statusUsu;
      end;

      Function Usuario.getStatusUsu:String;
      begin
          result := statusUsu;
      end;
end.
