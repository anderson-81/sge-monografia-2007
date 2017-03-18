unit cFuncionario;

interface

uses
    SysUtils;

type
    Funcionario = class (TObject)
    protected
        cpfFunc : String;
        rgFunc : string;
        nomeFunc : string;
        endFunc : string;
        bairroFunc : string;
        cidadeFunc : string;
        cepFunc : Integer;
        emailFunc : string;
        dataNascFunc : TDateTime;
        numCartProfFunc : Integer;
        serCartProfFunc : string;
        numTitEleitFunc : String;
        sexoFunc : string;
        cargoFunc : string;
        salFunc : Currency;
        dataAdmissaoFunc : TDateTime;

    public
        Constructor Create; overload;

        Constructor Create(cpfFunc : String; rgFunc : string; nomeFunc : string; endFunc : string;
                           bairroFunc : string; cepFunc : Integer; cidadeFunc : string;
                           emailFunc : string; numTitEleitFunc : String; dataNascFunc : TDateTime;
                           sexoFunc : string; numCartProfFunc : Integer; serCartProfFunc : string;
                           cargoFunc : string; salFunc : Currency; dataAdmissaoFunc:TDateTime);  overload;

        procedure setcpfFunc(cpfFunc:String);
        function getcpfFunc:String;
        procedure setrgFunc (rgFunc:string);
        function getrgFunc:string;
        procedure setnomeFunc(nomeFunc:string);
        function getnomeFunc:string;
        procedure setendFunc (endFunc:string);
        function getendFunc:string;
        procedure setbairroFunc(bairroFunc:string);
        function getbairroFunc:string;
        procedure setcidadeFunc (cidadeFunc:string);
        function getcidadeFunc:string;
        procedure setcepFunc(cepFunc:Integer);
        function getcepFunc:Integer;
        procedure setemailFunc(emailFunc:string);
        function getemailFunc:string;
        procedure setdataNascFunc(dataNascFunc:TDateTime);
        function getdataNascFunc:TDateTime;
        procedure setnumCartProfFunc(numCartProfFunc:Integer);
        function getnumCartProfFunc:Integer;
        procedure setserCartProfFunc(serCartProfFunc:string);
        function getserCartProfFunc:string;
        procedure setnumTitEleitFunc(numTitEleitFunc:String);
        function getnumTitEleitFunc:String;
        procedure setsexoFunc(sexoFunc:string);
        function getsexoFunc:string;
        procedure setcargoFunc(cargoFunc:string);
        function getcargoFunc:string;
        procedure setsalFunc(salFunc:Currency);
        function getsalFunc:Currency;
        procedure setdataAdmissaoFunc(dataAdmissaoFunc:TDateTime);
        function getdataAdmissaoFunc:TDateTime;

    end;

implementation

    Constructor Funcionario.Create;
    begin
         self.cpfFunc := '';
         self.rgFunc := '';
         self.nomeFunc := '';
         self.endFunc := '';
         self.bairroFunc := '';
         self.cidadeFunc := '';
         self.cepFunc := 0;
         self.emailFunc := '';
         self.dataNascFunc := 00/00/0000;
         self.numCartProfFunc := 0;
         self.serCartProfFunc := '';
         self.numTitEleitFunc := '';
         self.sexoFunc := '';
         self.cargoFunc := '';
         self.salFunc := 0.0;
         self.dataAdmissaoFunc:= 00/00/0000;
    end;


    Constructor Funcionario.Create(cpfFunc : String ; rgFunc : string; nomeFunc : string; endFunc : string;
                                   bairroFunc : string; cepFunc : Integer; cidadeFunc : string;
                                   emailFunc : string; numTitEleitFunc : String; dataNascFunc : TDateTime;
                                   sexoFunc : string; numCartProfFunc : Integer; serCartProfFunc : string;
                                   cargoFunc : string; salFunc : Currency; dataAdmissaoFunc:TDateTime);
    begin
         self.cpfFunc := cpfFunc;
         self.rgFunc := rgFunc;
         self.nomeFunc := nomeFunc;
         self.endFunc := endFunc;
         self.bairroFunc := bairroFunc;
         self.cidadeFunc := cidadeFunc;
         self.cepFunc := cepFunc;
         self.emailFunc := emailFunc;
         self.dataNascFunc := dataNascFunc;
         self.numCartProfFunc := numCartProfFunc;
         self.serCartProfFunc := serCartProfFunc;
         self.numTitEleitFunc := numTitEleitFunc;
         self.sexoFunc := sexoFunc;
         self.cargoFunc := cargoFunc;
         self.salFunc := salFunc;
         self.dataAdmissaoFunc:=dataAdmissaoFunc;
    end;

    procedure Funcionario.setcpfFunc(cpfFunc:String);
    begin
         self.cpfFunc := cpfFunc;
    end;

    function Funcionario.getcpfFunc:String;
    begin
          result := cpfFunc;
    end;

    procedure Funcionario.setrgFunc(rgFunc:string);
    begin
         self.rgFunc := rgFunc;
    end;

    function Funcionario.getrgFunc:string;
    begin
         result := rgFunc;
    end;

    procedure Funcionario.setnomeFunc(nomeFunc:string);
    begin
         self.nomeFunc := nomeFunc;
    end;

    function Funcionario.getnomeFunc:string;
    begin
         result := nomeFunc;
    end;

    procedure Funcionario.setendFunc(endFunc:string);
    begin
         self.endFunc := endFunc;
    end;

    function Funcionario.getendFunc:string;
    begin
         result := endFunc;
    end;

    procedure Funcionario.setbairroFunc(bairroFunc:string);
    begin
         self.bairroFunc := bairroFunc;
    end;

    function Funcionario.getbairroFunc:string;
    begin
         result := bairroFunc;
    end;

    procedure Funcionario.setcidadeFunc(cidadeFunc:string);
    begin
         self.cidadeFunc := cidadeFunc;
    end;

    function Funcionario.getcidadeFunc:string;
    begin
         result := cidadeFunc;
    end;

    procedure Funcionario.setcepFunc(cepFunc:Integer);
    begin
         self.cepFunc := cepFunc;
    end;

    function Funcionario.getcepFunc:Integer;
    begin
         result := cepFunc;
    end;

    procedure Funcionario.setemailFunc(emailFunc:string);
    begin
         self.emailFunc := emailFunc;
    end;

    function Funcionario.getemailFunc:string;
    begin
         result := emailFunc;
    end;

    procedure Funcionario.setdataNascFunc(dataNascFunc:TDateTime);
    begin
         self.dataNascFunc := dataNascFunc;
    end;

    function Funcionario.getdataNascFunc:TDateTime;
    begin
          result := dataNascFunc;
    end;

    procedure Funcionario.setnumCartProfFunc(numCartProfFunc:Integer);
    begin
          self.numCartProfFunc := numCartProfFunc;
    end;

    function Funcionario.getnumCartProfFunc:Integer;
    begin
         result := numCartProfFunc;
    end;

    procedure Funcionario.setserCartProfFunc(serCartProfFunc:string);
    begin
         self.serCartProfFunc := serCartProfFunc;
    end;

    function Funcionario.getserCartProfFunc:string;
    begin
         result := serCartProfFunc;
    end;

    procedure Funcionario.setnumTitEleitFunc(numTitEleitFunc:String);
    begin
         self.numTitEleitFunc := numTitEleitFunc;
    end;

    function Funcionario.getnumTitEleitFunc:String;
    begin
         result := numTitEleitFunc;
    end;

    procedure Funcionario.setsexoFunc(sexoFunc:string);
    begin
         self.sexoFunc := sexoFunc;
    end;

    function Funcionario.getsexoFunc:string;
    begin
         result := sexoFunc;
    end;

    procedure Funcionario.setcargoFunc(cargoFunc:string);
    begin
         self.cargoFunc := cargoFunc;
    end;

    function Funcionario.getcargoFunc:string;
    begin
          result := cargoFunc;
    end;

    procedure Funcionario.setsalFunc(salFunc:Currency);
    begin
         self.salFunc := salFunc;
    end;

    function Funcionario.getsalFunc:Currency;
    begin
          result := salFunc;
    end;

    procedure Funcionario.setdataAdmissaoFunc(dataAdmissaoFunc:TDateTime);
    begin
          self.dataAdmissaoFunc := dataAdmissaoFunc;
    end;

    function Funcionario.getdataAdmissaoFunc:TDateTime;
    begin
          result := dataAdmissaoFunc;
    end;
end.
