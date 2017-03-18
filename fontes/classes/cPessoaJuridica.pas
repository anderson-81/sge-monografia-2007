unit cPessoaJuridica;

interface

uses
    cFornecedor;

type
    PessoaJuridica = class(Fornecedor)
    protected
        cnpj : String;
        RazaoSocial : String;
    public
         Constructor Create( codForn: integer; endForn : string;
                             bairroForn : string;  cidadeForn : string;
                             emailForn : string; estadoForn : string;
                             descForn : string; cepForn : integer;
                             dataAdmissaoForn : TDateTime ; statusForn : String; cnpj:String; RazaoSocial : String);

         Procedure setCnpj (cnpj:String);
         Function getCnpj:String;
         Procedure setrazaoSocial (razaoSocial : String);
         Function getrazaoSocial : String;
    end;

implementation

     Constructor PessoaJuridica.Create(codForn: integer; endForn : string;
                                       bairroForn : string;  cidadeForn : string;
                                       emailForn : string; estadoForn : string;
                                       descForn : string; cepForn : integer;
                                       dataAdmissaoForn : TDateTime ; statusForn : String; cnpj:String; RazaoSocial : String);
     begin
          inherited Create(codForn, endForn, bairroForn, cidadeForn,
                           emailForn, estadoForn, descForn, cepForn,
                           dataAdmissaoForn, statusForn, tipoForn);

          self.cnpj := cnpj;
          self.RazaoSocial := razaosocial;
     end;

     Procedure PessoaJuridica.setCnpj(cnpj:String);
     begin
          self.cnpj := cnpj;
     end;

     Function PessoaJuridica.getCnpj:String;
     begin
         result := cnpj;
     end;

     Procedure PessoaJuridica.setrazaoSocial(razaoSocial:String);
     begin
         self.RazaoSocial := RazaoSocial;
     end;

     Function PessoaJuridica.getrazaoSocial:String;
     begin
         result := RazaoSocial;
     end;
end.
