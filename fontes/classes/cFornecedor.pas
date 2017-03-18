unit cFornecedor;

interface

uses
      SysUtils;

type
      Fornecedor = class (TObject)
      protected
          codForn          : integer;
          endForn          : string;
          bairroForn       : string;
          cidadeForn       : string;
          emailForn        : string;
          estadoForn       : string;
          descForn         : string;
          cepForn          : integer;
          dataAdmissaoForn : TDateTime;
          statusForn       : String;
          tipoForn         : string;
      public
          Constructor Create( codForn: integer; endForn : string;
                              bairroForn : string;  cidadeForn : string;
                              emailForn : string; estadoForn : string;
                              descForn : string; cepForn : integer;
                              dataAdmissaoForn : TDateTime ; statusForn : String; tipoForn : string);

          Procedure setcodForn(codForn:integer);
          Function getcodForn : integer;
          Procedure setendForn(endForn:string);
          Function getendForn:string;
          Procedure setBairroForn(bairroForn:string);
          Function getbairroForn:string;
          Procedure setcidadeForn(cidadeForn:string);
          Function getcidadeForn:string;
          Procedure setemailForn(emailForn:string);
          Function getemailForn:string;
          Procedure setestadoForn(estadoForn:string);
          Function getestadoForn:string;
          Procedure setdescForn(descForn:string);
          Function getdescForn:string;
          Procedure setcepForn(cepForn:integer);
          Function getcepForn:integer;
          Procedure setdataAdmissaoForn(dataAdmissaoForn:TDateTime);
          Function getdataAdmissaoForn:TDateTime;
          Procedure setstatusForn(statusForn:String);
          Function getstatusForn:String;
          Procedure settipoForn(tipoForn:String);
          Function gettipoForn:String;
      end;


implementation

      Constructor Fornecedor.Create( codForn: integer; endForn : string;
                                     bairroForn : string;  cidadeForn : string;
                                     emailForn : string; estadoForn : string;
                                     descForn : string; cepForn : integer;
                                     dataAdmissaoForn : TDateTime ; statusForn : String; tipoForn:string);
      begin
          self.codForn          := codForn;
          self.endForn          := endForn;
          self.bairroForn       := bairroForn;
          self.cidadeForn       := cidadeForn;
          self.emailForn        := emailForn;
          self.estadoForn       := estadoForn;
          self.descForn         := descForn;
          self.cepForn          := cepForn;
          self.dataAdmissaoForn := dataAdmissaoForn;
          self.statusForn       := statusForn;
      end;

      Procedure Fornecedor.setcodForn(codForn:integer);
      begin
          self.codForn := codForn;
      end;

      Function Fornecedor.getcodForn:integer;
      begin
          result := codForn;
      end;

      Procedure Fornecedor.setendForn(endForn:string);
      begin
          self.endForn := endForn;
      end;

      Function Fornecedor.getendForn:string;
      begin
          result := endForn;
      end;

      Procedure Fornecedor.setBairroForn(bairroForn:string);
      begin
          self.bairroForn       := bairroForn;
      end;

      Function Fornecedor.getbairroForn:string;
      begin
          result := bairroForn;
      end;

      Procedure Fornecedor.setcidadeForn(cidadeForn:string);
      begin
          self.cidadeForn := cidadeForn;
      end;

      Function Fornecedor.getcidadeForn:string;
      begin
          result := cidadeForn;

      end;

      Procedure Fornecedor.setemailForn(emailForn:string);
      begin
          self.emailForn := emailForn;
      end;

      Function Fornecedor.getemailForn:string;
      begin
          result := emailForn;
      end;

      Procedure Fornecedor.setestadoForn(estadoForn:string);
      begin
          self.estadoForn := estadoForn;
      end;

      Function Fornecedor.getestadoForn:string;
      begin
          result := estadoForn;
      end;

      Procedure Fornecedor.setdescForn(descForn:string);
      begin
          self.descForn := descForn;
      end;

      Function Fornecedor.getdescForn:string;
      begin
          result := descForn;
      end;

      Procedure Fornecedor.setcepForn(cepForn:integer);
      begin
          self.cepForn := cepForn;
      end;

      Function Fornecedor.getcepForn:integer;
      begin
          result := cepForn;
      end;

      Procedure Fornecedor.setdataAdmissaoForn(dataAdmissaoForn:TDateTime);
      begin
          self.dataAdmissaoForn := dataAdmissaoForn;
      end;

      Function Fornecedor.getdataAdmissaoForn:TDateTime;
      begin
          result := dataAdmissaoForn;
      end;

      Procedure Fornecedor.setstatusForn(statusForn:String);
      begin
          self.statusForn := statusForn;
      end;

      Function Fornecedor.getstatusForn:String;
      begin
          result := statusForn;
      end;

      Procedure Fornecedor.settipoForn(tipoForn:string);
      begin
          self.tipoForn := tipoForn;
      end;

      Function Fornecedor.gettipoForn:string;
      begin
          result := tipoForn;
      end;
end.
