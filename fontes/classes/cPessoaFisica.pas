unit cPessoaFisica;

interface

uses
    cFornecedor;

type
    PessoaFisica = class(Fornecedor)
    protected
        cpf  : String;
        nome : String;
    public
         Constructor Create( codForn: integer; endForn : string;
                             bairroForn : string;  cidadeForn : string;
                             emailForn : string; estadoForn : string;
                             descForn : string; cepForn : integer;
                             dataAdmissaoForn : TDateTime ; statusForn : String; cpf:String; nome : String);

         Procedure setcpf (cpf:String);
         Function getcpf:String;
         Procedure setnome (nome : String);
         Function getnome : String;
    end;

implementation

     Constructor PessoaFisica.Create(codForn: integer; endForn : string;
                                     bairroForn : string;  cidadeForn : string;
                                     emailForn : string; estadoForn : string;
                                     descForn : string; cepForn : integer;
                                     dataAdmissaoForn : TDateTime ; statusForn : String; cpf:String; nome : String);
     begin
          inherited Create(codForn, endForn, bairroForn, cidadeForn,
                           emailForn, estadoForn, descForn, cepForn,
                           dataAdmissaoForn, statusForn, tipoForn);

          self.cpf := cpf;
          self.nome := nome;
     end;

     Procedure PessoaFisica.setcpf(cpf:String);
     begin
          self.cpf := cpf;
     end;

     Function PessoaFisica.getcpf:String;
     begin
         result := cpf;
     end;

     Procedure PessoaFisica.setnome(nome:String);
     begin
         self.nome := nome;
     end;

     Function PessoaFisica.getnome:String;
     begin
         result := nome;
     end;
end.

