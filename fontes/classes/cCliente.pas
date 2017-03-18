unit cCliente;

interface

type
      Cliente = class (TObject)
      protected
          codCli    : integer;
          nomeCli   : string;
          endCli    : string;
          bairroCli : string;
          cidCli    : string;
          emailCli  : string;
          obsCli    : string;
          statusCli : String;
      public
           Constructor Create ( codCli : integer; nomeCli  : string;  endCli : string;
                                bairroCli : string; cidCli : string;  
                                emailCli  : string; obsCli : string;  statusCli : String);

           Procedure setCodCli (codCli:integer);
           Function getCodCli:integer;
           Procedure setNomeCli(nomeCli:string);
           Function getnomeCli:string;
           Procedure setendCli (endCli:string);
           Function getendCli:string;
           Procedure setBairroCli (bairroCli:string);
           Function getbairroCli:string;
           Procedure setcidCli (cidCli:string);
           Function getcidCli:string;
           Procedure setemailCli(emailCli:string);
           Function getemailCli:string;
           Procedure setobsCli(obsCli:string);
           Function getobsCli:string;
           Procedure setstatusCli (statusCli : String);
           Function getStatusCli : String;
      end;

implementation

      Constructor Cliente.Create (codCli : integer;  nomeCli : string; endCli : string;
                                  bairroCli : string; cidCli : string;
                                  emailCli  : string; obsCli : string; statusCli : String);
      begin
          self.codCli := codCli;
          self.nomeCli := nomeCli;
          self.endCli := endCli;
          self.bairroCli := bairroCli;
          self.cidCli := cidCli;
          self.emailCli := emailCli;
          self.obsCli := obsCli;
          self.statusCli := statusCli;
      end;

      Procedure Cliente.setCodCli(codCli:integer);
      begin
          self.codCli := codCli;
      end;

      Function Cliente.getCodCli:integer;
      begin
          result := codCli;
      end;

      Procedure Cliente.setNomeCli(nomeCli:string);
      begin
          self.nomeCli := nomeCli;
      end;

      Function Cliente.getnomeCli:string;
      begin
          result := nomeCli;
      end;

      Procedure Cliente.setendCli(endCli:string);
      begin
          self.endCli := endCli;
      end;

      Function Cliente.getendCli:string;
      begin
          result := endCli;
      end;

      Procedure Cliente.setBairroCli(bairroCli:string);
      begin
          self.bairroCli := bairroCli;
      end;

      Function Cliente.getbairroCli:string;
      begin
          result := bairroCli;
      end;

      Procedure Cliente.setcidCli(cidCli:string);
      begin
          self.cidCli := cidCli;
      end;

      Function Cliente.getcidCli:string;
      begin
          result := cidCli;
      end;

      Procedure Cliente.setemailCli(emailCli:string);
      begin
          self.emailCli := emailCli;
      end;

      Function Cliente.getemailCli:string;
      begin
          result := emailCli;
      end;

      Procedure Cliente.setobsCli(obsCli:string);
      begin
          self.obsCli := obsCli;
      end;

      Function Cliente.getobsCli:string;
      begin
          result := obsCli;
      end;

      Procedure Cliente.setstatusCli(statusCli:String);
      begin
          self.statusCli := statusCli;
      end;

      Function Cliente.getStatusCli:String;
      begin
          result := statusCli;
      end;
end.
