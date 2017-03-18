unit cTelefone;

interface


type
      Telefone = class (TOBject)
      protected
          codTel   : integer;
          telcont1 : String;
          telcont2 : String;
      public
          Constructor Create (codTel:integer; telcont1:String; telcont2:String);
          Procedure setCodTel(codTel:integer);
          Function getCodTel:integer;
          Procedure setTelCont1(telcont1:String);
          Function getTelCont1:String;
          Procedure setTelCont2(telcont2:String);
          Function getTelCont2:String;
      end;



implementation

      Constructor Telefone.Create(codTel:integer; telcont1:String; telcont2:String);
      begin
           self.codTel   := codTel;
           self.telcont1 := telcont1;
           self.telcont2 := telcont2;
      end;

      Procedure Telefone.setCodTel(codTel:integer);
      begin
           self.codTel := codTel;
      end;

      Function Telefone.getCodTel:integer;
      begin
           result := codTel;
      end;

      Procedure Telefone.setTelCont1(telcont1:String);
      begin
           self.telcont1 := telcont1;
      end;

      Function Telefone.getTelCont1:String;
      begin
           result := telcont1;
      end;

      Procedure Telefone.setTelCont2(telcont2:String);
      begin
           self.telcont2 := telcont2;
      end;

      Function Telefone.getTelCont2:String;
      begin
           result := telcont2;
      end;
end.
