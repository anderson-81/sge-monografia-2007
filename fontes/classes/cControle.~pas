unit cControle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ImgList, ExtCtrls, DB,
  jpeg, cFuncionario, cUsuario,  cDataModule, cCliente, cFornecedor, cTelefone,
  cProduto, cPessoaJuridica, cPessoaFisica, cEstoque, cItemDeVenda, cVenda,
  cPagamento, cPagamentoCartao, cPagamentoComCheque, cPedidoDeCompra, cItemDePedido;

type
      Controle = class
      protected
            DM      : TDM;
            Func    : Funcionario;
            Usu     : Usuario;
            Cli     : Cliente;
            Forn    : Fornecedor;
            Tel     : Telefone;
            Prod    : Produto;
            PJ      : PessoaJuridica;
            PF      : PessoaFisica;
            Estq    : Estoque;
            ItVend  : ItemDeVenda;
            Vd      : Venda;
            Pg      : Pagamento;
            PgCart  : PagamentoCartao;
            PgCheq  : PagamentoComCheque;
            PdComp  : PedidoDeCompra;
            ItemPed : ItemDePedido;

      public
            //Controlar Funcionário
            Procedure IncluirFunc;
            Procedure EditarFunc;
            Procedure BuscarFuncCPF;
            Procedure BuscarFuncNOME;
            Procedure BuscarFuncTEL;
            Procedure AtribDadosFunc;
            Procedure BuscarFuncionario;
            function  VerifFuncUsuario:integer;
            Procedure ExcluirFunc;
            function VerfFuncTelefone:integer;

            //Controlar Telefone
            Procedure BuscarTelFunc;
            Procedure BuscarTelForn;
            Procedure BuscarFornPorNomeRSocial;
            Procedure BuscarTelCli;
            Procedure EditarTel;
            Function  MaxCodTel:integer;
            Procedure IncluirTel;
            Procedure BuscarTodosTelCli;
            Procedure ExcluirTel;
            
            //Controlar Usuário
            Procedure BuscarFuncUsuarioPorNome;
            Procedure BuscarFuncUsuarioPorCPF;
            Procedure IncluirUsu;
            Procedure EditarUsu;
            function  MaxCodigoUsu:integer;
            Procedure BuscarTodosUsu;
            Procedure AtribDadosUsu;
            function  VerifUsuarioAtendCliente:integer;
            Procedure ExcluirUsu;
            Procedure ListarTodosUsuarios;
            Procedure ListarFuncNaoUsuario;

            //Efetuar Login
            function EfetuarLogin:integer;

            //Manter Cliente
            Procedure RetMaxCodCli;
            Procedure IncluirCli(codusu:integer;cpf:String);
            Procedure EditarCli;
            Procedure BuscarCliNOME;
            Procedure BuscarCliTEL;
            Procedure BuscarCliCODIGO;
            procedure BuscarCliente;
            function  VerifClienteVenda:integer;
            function  VerifClienteTelefone:integer;
            Procedure ExcluirCli;
            Procedure AtriBDadosCliente;

            //Manter Fornecedor
            Procedure IncluirFornPJ;
            Procedure IncluirFornPF;
            Procedure RetMaxCodForn;
            Procedure ListarTodosFornPF;
            Procedure ListarTodosFornPJ;
            Procedure AtribDadosFornPF;
            Procedure AtribDadosFornPJ;
            Procedure BuscarFornPorRazaoSocial;
            Procedure BuscarFornPorNome;
            Procedure EditarFornPF;
            Procedure EditarFornPJ;
            Procedure ExcluirFornPF;
            Procedure ExcluirFornPJ;
            Procedure BuscarForn;
            function VerifFornecComPdCompra:integer;
            function VerifFornecComTelefone:integer;

            //Procedure AtribDadosForn;
            //Procedure EditarForn;
            //Procedure ListarForn;
            //Procedure ListarTodosForn;
            Procedure ExibirForn;
            Procedure BuscarFornecedor;
            //function  VerifFornPedidoDeCompra:integer;
            //Procedure ExcluirForn;


            //Controlar Produto
            Procedure RetMaxCodProd;
            Procedure IncluirProd;
            Procedure EditarProd;
            Procedure ListarCat;
            Procedure ListarProd;
            Procedure BuscarProdPorNome;
            Procedure AtribDadosProd;
            Procedure ExcluirProd;
            Procedure ListarTodosProd;
            Procedure RetMaxCodEstq;
            Procedure ExcluirEstq;
            function VerifNomeExistenteProd:integer;
            function VerifProdutoComItemPed:integer;
            function VerifProdComItemVenda:integer;

            //Manter Estoque
            Procedure EditarEstq;
            function ListarProdSemEstq:integer;
            function ListarProdComEstq:integer;
            procedure RecalcularEstoque;
           
            //Realizar Venda
            Procedure BuscarCliNOMEVenda;
            Procedure BuscarCliTELVenda;
            function  MaxCodigoItemDeVenda:integer;
            Procedure IncluirItemDeVenda;
            function  MaxCodVenda:integer;
            procedure CriarRegVenda;
            procedure ListarItensPorCodVenda;
            procedure ConfirmarVenda;
            function  MaxCodPagto:integer;
            Procedure CriarRegPagamento;
            Procedure AlterarEstqVenda;
            function  VerifarProdNaLista:integer;
            procedure AlterarEstqParaVendaCancelada;
            procedure ExcluirTodosItemDeVenda;
            procedure ExcluirVenda;
            procedure ExcluirUnicoItemDeVendaDaLista;
            procedure ClienteVenda;
            procedure ProdutosVenda;
            Procedure SomaValPagoItemDeVenda;
            function  VerifarClientePorVendaAberta:integer;
            Procedure BuscarCliCodVenda;

            //Realizar Pagamento
            Procedure BuscarVendasRealizadasPorCliente;
            Procedure ListarTodasVendasRealizadasPorCliente;
            Procedure BuscarRegPagtoPorVendaNP;
            Procedure AtribDadosPagto;
            Procedure AtribDadosVenda;
            function  MaxCodCartao:integer;
            Procedure IncluirCartao(DM:TDM);
            Procedure IncluirCheque(DM:TDM);
            Procedure AlterarRegPagto(DM:TDM);
            Procedure AlterarRegVenda(DM:TDM);
            Procedure BuscarVendasRealizadasPorClienteCodCli;
            Procedure BuscarVendasRealizadasPorClienteTelCli;
            Procedure FecharVenda(codigo:integer; DM:TDM);

            //Realizar Compra
            Procedure ListarPessoaJuridica;
            Procedure ListarPessoaFisica;
            function  GerarMaxPedComp:integer;
            procedure CriarRegPedCompra;
            Function  GerarMaxItemPed:integer;
            Procedure IncluirItemPed;
            Procedure ListarItensPorCodPedidoDeCompra;
            procedure ExcluirUnicoItemDePedidoDaLista;
            procedure CancelarRealizacaoDeCompra;
            procedure AlterarPedCompra;
            procedure BuscarPJPedidoDeCompra;
            procedure BuscarPFPedidoDeCompra;
            Procedure AtribuiDadosPedidoDeCompra;
            Procedure ListarProdutosCompra;
            Procedure SomaValorPagoItemPed;
            function  VerifarItemPedNaLista:integer;
            function  VerifarFornecedorPorCompraAberta:integer;

            //Consultar Preço
            Procedure ConsultarPreco;

            //Controlar Estoque
            //Relatório
            Procedure ListarTodosEstq;
            Procedure SomaQtdProdEstq;
            Procedure SomatorioPrecoQtdEstoque;
            Procedure ListarTodosProdEstqZero;
            Procedure QtdProdEstqZero;
            Procedure SomaEstqPorCatg;
            Procedure ListarTodosEstqPorCatg;
            Procedure QtdProdEstqAbaixoDoMin;
            Procedure ListarTodosProdEstqAbaixoDoMin;
            Procedure ListarProdPorPorcAcimaDoEstq(valor:real);

            //Controlar Venda
            //Relatório
            Procedure ListarTodosProdVend;
            Procedure SomaValPagoTodosProdVend;
            Procedure ListarTodosProdVendPorPeriodo(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure SomaValPagoTodosProdVendPorPeriodo(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure QtdVendaPorCli;
            Procedure DataPrimVendaCli;
            Procedure DataUltVendaCli;
            Procedure VendaMenorValorCli;
            Procedure VendaMaiorValorCli;
            Procedure ValTotVendaPorCli;
            Procedure ListarProdVendaCli;
            Procedure QtdVendaPorCliPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure DataPrimVendaCliPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure DataUltVendaCliPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure VendaMenorValorCliPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure VendaMaiorValorCliPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure ValTotVendaPorCliPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure ListarProdVendaCliPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure QtdVendasRealizadas;
            Procedure QtdVendasAberta;
            Procedure QtdVendasFechadas;
            Procedure ValTotVendaAberta;
            Procedure ValTotVendaFechada;
            Procedure ValTotVenda;
            Procedure QtdVendasRealizadasPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure QtdVendasAbertaPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure QtdVendasFechadasPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure ValTotVendaAbertaPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure ValTotVendaFechadaPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure ValTotVendaPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure SomarValorPagoPorCatg;
            Procedure ListarProdVendaPorCatg;
            Procedure SomarValorPagoPorCatgPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure ListarProdVendaPorCatgPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure SomaValTotPagPorProd;
            Procedure SomaValTotPagPorProdPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure SomaQtdVendPorProdUNID;
            Procedure SomaQtdVendPorProdUNIDPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure SomaQtdVendPorProdPeso;
            Procedure SomaQtdVendPorProdPesoPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure ContaRelacaoProdutoVenda;
            Procedure ContaRelacaoProdutoVendaPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);

            //Controle
            procedure BuscarCliNOMEVendaAberta;
            procedure BuscarCliCODVendaAberta;
            Procedure BuscarCliTELVendaAberta;
            Procedure BuscarDadosVendaRealizada;
            procedure AlterarValorVenda;
            function  ContarItensVenda:integer;
            Procedure ExcluirRegPagamento;
            procedure BuscarDadosFornPJCompraAberta;
            procedure BuscarDadosFornPFCompraAberta;
            function  VerificarPossuiProdNaLista:integer;

            //Controlar Compra
            //Relatorio
            procedure ListarTodosProdComprados;
            procedure SomarValorTotalDeCompra;
            procedure ListarTodosProdCompradosPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            procedure SomarValorTotalDeCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            procedure SomarQtdCompraRealizada;
            procedure SomarQtdCompraAberta;
            procedure SomarQtdCompraFechada;
            procedure SomarValorTotalDeCompraFechada;
            procedure SomarValorTotalDeCompraAberta;
            Procedure MaxValorTotalDeCompra;
            Procedure MenValorTotalDeCompra;
            procedure SomarQtdCompraRealizadaPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            procedure SomarQtdCompraAbertaPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            procedure SomarQtdCompraFechadaPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            procedure SomarValorTotalDeCompraFechadaPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            procedure SomarValorTotalDeCompraAbertaPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure MaxValorTotalDeCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure MenValorTotalDeCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            function  BuscarFornecedorPJComMinValorCompra:integer;
            procedure BuscarFornecedorPFComMinValorCompra;
            function  BuscarFornecedorPJComMaxValorCompra:integer;
            procedure BuscarFornecedorPFComMaxValorCompra;
            function  BuscarFornecedorPJComMinValorCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime):integer;
            procedure BuscarFornecedorPFComMinValorCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            function  BuscarFornecedorPJComMaxValorCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime):integer;
            procedure BuscarFornecedorPFComMaxValorCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure SomarValorPagoPorCatgCompra;
            Procedure ListarProdCompraPorCatg;
            Procedure SomarValorPagoPorCatgCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure ListarProdCompraPorCatgPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure RetornarCatg;
            Procedure ListarProdCompraPorForn;
            Procedure QtdCompraPorFornecedor;
            Procedure CompraComMinValTotCompraPorForn;
            Procedure CompraComMaxValTotCompraPorForn;
            Procedure DataDaPrimCompraPorForn;
            Procedure DataDaUltCompraPorForn;
            Procedure ValTotCompraPorForn;
            Procedure ListarProdCompraPorFornPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure QtdCompraPorFornecedorPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure CompraComMinValTotCompraPorFornPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure CompraComMaxValTotCompraPorFornPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure DataDaUltCompraPorFornPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure DataDaPrimCompraPorFornPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure ValTotCompraPorFornPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure SomaValTotPagCompraPorProd;
            Procedure SomaValTotPagCompraPorProdPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure SomaQtdCompraPorProdCompraPeso;
            Procedure SomaQtdCompraPorProdCompraPesoPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure SomaQtdCompraPorProdUNID;
            Procedure SomaQtdCompraPorProdUNIDPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure ContaRelacaoProdutoCompra;
            Procedure ContaRelacaoProdutoCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);


            //Manutenção das Compras
            Procedure BuscarCompraPorCodForn;
            Procedure ListarFornPorRazaoSocialCompraAberta;
            Procedure ListarFornPorNomeCompraAberta;
            Procedure ListarProdutosPedCompraPorCodForn;
            Procedure AlterarValorDePedidoDeCompra;
            function  ContarItensCompra:integer;
            Procedure AlterarEstqParaCompraFechada;
            Procedure AlterarCompraParaFechada;

            //Controlar Pagamento
            Procedure BuscarDadosPagtoPorCodPag;
            Procedure BuscarPagtoRealizadoPorCodCli(dataInicio:TDateTime; dataFim:TDateTime);
            Procedure BuscarDadosPagtoCartao;
            Procedure BuscarDadosPagtoCheque;
            Procedure AtribuirPagtoCheque;
            Procedure AtribuirPagtoCartao;
            Procedure ListarItensDeVendaPorCodPagto;
            Procedure SomaValPagoItemDeVendaPorCodPag;
            Procedure ExcluirCheque;
            Procedure ExcluirCartao;
          
            //Construtores da Classe cControle
            Constructor Create(DM:TDM);overload;
            Constructor Create(DM:TDM; Func:Funcionario); overload;
            Constructor Create(DM:TDM; Usu:Usuario); overload;
            Constructor Create(DM:TDM; Func:Funcionario; Usu:Usuario); overload;
            Constructor Create(DM:TDM; Cli:Cliente);  Overload;
            Constructor Create(DM:TDM; Forn:Fornecedor); overload;
            Constructor Create(DM:TDM; Cli:Cliente; Tel:Telefone); overload;
            Constructor Create(DM:TDM; Forn:Fornecedor; Tel:Telefone); overload;
            Constructor Create(DM:TDM; Func:Funcionario; Tel:Telefone); overload;
            Constructor Create(DM:TDM; Prod:Produto); overload;
            Constructor Create(DM:TDM; Tel:Telefone); overload;
            Constructor Create(DM:TDM; PJ:PessoaJuridica); overload;
            Constructor Create(DM:TDM; PF:PessoaFisica); overload;
            Constructor Create(DM:TDM; Prod:Produto; Estq:Estoque);  overload;
            Constructor Create(DM:TDM; Estq:Estoque);  overload;
            Constructor Create(DM:TDM; ItVend:ItemDeVenda);overload;
            Constructor Create(DM:TDM; Vd:Venda; Cli:Cliente); overload;
            Constructor Create(DM:TDM; Vd:Venda; ItVend:ItemDeVenda; Prod:Produto); overload;
            Constructor Create(DM:TDM; Vd:Venda); overload;
            Constructor Create(DM:TDM; Vd:Venda; Pg:Pagamento); overload;
            Constructor Create(DM:TDM; Vd:Venda; ItVend:ItemDeVenda; Prod:Produto; Estq:Estoque); overload;
            Constructor Create(DM:TDM; Prod:Produto; Vd:Venda); overload;
            Constructor Create(DM:TDM; ItVend:ItemDeVenda; Vd:Venda); overload;
            Constructor Create(DM:TDM; Vd:Venda; Cli:Cliente; Pg:Pagamento); overload;
            Constructor Create(DM:TDM; PgCart:PagamentoCartao; Pg:Pagamento); overload;
            Constructor Create(DM:TDM; PgCheq : PagamentoComCheque ; Pg:Pagamento); overload;
            Constructor Create(DM:TDM; Pg:Pagamento); overload;
            Constructor Create(DM:TDM; PdComp:PedidoDeCompra; Forn:Fornecedor); overload;
            Constructor Create(DM:TDM; PdComp:PedidoDeCompra; ItemPed:ItemDePedido; Prod:Produto); overload;
            Constructor Create(DM:TDM; PdComp:PedidoDeCompra); overload;
            Constructor Create(DM:TDM; PdComp:PedidoDeCompra; ItemPed:ItemDePedido); overload;
            Constructor Create(DM:TDM; PdComp:PedidoDeCompra; PJ:PessoaJuridica); overload;
            Constructor Create(DM:TDM; PdComp:PedidoDeCompra; PF:PessoaFisica); overload;
            Constructor Create(DM:TDM; Cli:Cliente; Pg:Pagamento);  Overload;
            Constructor Create(DM:TDM; Cli:Cliente; Pg:Pagamento; PgCheq:PagamentoComCheque; PgCartao:PagamentoCartao; Vd:Venda); Overload;
            Constructor Create(DM:TDM; Pg:Pagamento; Func:Funcionario; Usu:Usuario; Vd:Venda); overload;
            Constructor Create(DM:TDM; Forn:Fornecedor; Func:Funcionario; Cli:Cliente; Tel:Telefone); overload;
            Constructor Create(DM:TDM; PJ:PessoaJuridica; PF:PessoaFisica; Tel:Telefone); overload;
            Constructor Create(DM:TDM; Cli:Cliente; Vd:Venda; Tel:Telefone); Overload;
      end;

implementation

//CONSTRUTOR DA CLASSE CONTROLE

      Constructor Controle.Create(DM:TDM);
      begin
          self.DM  := DM;
      end;

      Constructor Controle.Create(DM:TDM; Func:Funcionario);
      begin
          self.DM   := DM;
          self.Func := Func;
      end;

      Constructor Controle.Create(DM:TDM; Usu:Usuario);
      begin
          self.DM  := DM;
          self.Usu := Usu;
      end;

      Constructor Controle.Create(DM:TDM; Func:Funcionario; Usu:Usuario);
      begin
          self.DM   := DM;
          self.Func := Func;
          self.Usu  := Usu;
      end;

      Constructor Controle.Create(DM:TDM; Cli:Cliente);
      begin
          self.DM  := DM;
          self.Cli := Cli;
      end;

      Constructor Controle.Create(DM:TDM; Forn:Fornecedor);
      begin
          self.DM   := DM;
          self.Forn := Forn;
      end;

      Constructor Controle.Create(DM:TDM; Cli:Cliente; Tel:Telefone);
      begin
          self.DM  := DM;
          self.Cli := Cli;
          self.Tel := Tel;
      end;

      Constructor Controle.Create(DM:TDM; Forn:Fornecedor; Tel:Telefone);
      begin
          self.DM   := DM;
          self.Forn := Forn;
          self.Tel  := Tel;
      end;

      Constructor Controle.Create(DM:TDM; Func:Funcionario; Tel:Telefone);
      begin
          self.DM   := DM;
          self.Func := Func;
          self.Tel  := Tel;
      end;

      Constructor Controle.Create(DM:TDM; Prod:Produto);
      begin
          self.DM   := DM;
          self.Prod := Prod;
      end;

      Constructor Controle.Create(DM:TDM; Tel:Telefone);
      begin
          self.DM  := DM;
          self.Tel := Tel;
      end;

      Constructor Controle.Create(DM:TDM; PJ:PessoaJuridica);
      begin
          self.DM  := DM;
          self.PJ  := PJ;
      end;

      Constructor Controle.Create(DM:TDM; PF:PessoaFisica);
      begin
          self.DM  := DM;
          self.PF  := PF;
      end;

      Constructor Controle.Create(DM:TDM; Prod:Produto; Estq:Estoque);
      begin
          self.DM   := DM;
          self.Prod := Prod;
          self.Estq := Estq;
      end;

      Constructor Controle.Create(DM:TDM; Estq:Estoque);
      begin
          self.DM := DM;
          self.Estq := Estq;
      end;

      Constructor Controle.Create(DM:TDM; ItVend:ItemDeVenda);
      begin
          self.DM := DM;
          self.ItVend := ItVend;
      end;

      Constructor Controle.Create(DM:TDM; Vd:Venda; Cli:Cliente);
      begin
          self.DM  := DM;
          self.Vd  := Vd;
          self.Cli := Cli;
      end;

      Constructor Controle.Create(DM:TDM; Vd:Venda; ItVend:ItemDeVenda; Prod:Produto);
      begin
          self.DM     := DM;
          self.Vd     := Vd;
          self.ItVend := ItVend;
          self.Prod   := Prod;
      end;

      Constructor Controle.Create(DM:TDM; Vd:Venda);
      begin
          self.DM     := DM;
          self.Vd     := Vd;
      end;

      Constructor Controle.Create(DM:TDM; Vd:Venda; Pg:Pagamento);
      begin
          self.DM := DM;
          self.Vd := Vd;
          self.Pg := Pg;
      end;

      Constructor Controle.Create(DM:TDM; Vd:Venda; ItVend:ItemDeVenda; Prod:Produto; Estq:Estoque);
      begin
          self.DM     := DM;
          self.Vd     := Vd;
          self.ItVend := ItVend;
          self.Prod   := Prod;
          self.Estq   := Estq;
      end;

      Constructor Controle.Create(DM:TDM; Prod:Produto; Vd:Venda);
      begin
          self.DM     := DM;
          self.Vd     := Vd;
          self.Prod   := Prod;
      end;

      Constructor Controle.Create(DM:TDM; ItVend:ItemDeVenda; Vd:Venda); 
      begin
          self.DM := DM;
          self.ItVend := ItVend;
          self.Vd := Vd;
      end;

      Constructor Controle.Create(DM:TDM; Vd:Venda; Cli:Cliente; Pg:Pagamento);
      begin
          self.DM := DM;
          self.Vd := VD;
          self.Cli := Cli;
          self.Pg := Pg;
      end;

      Constructor Controle.Create(DM:TDM; PgCart:PagamentoCartao; Pg:Pagamento);
      begin
          self.PgCart := PgCart;
          self.Pg     := Pg;
      end;

      Constructor Controle.Create(DM:TDM; PgCheq:PagamentoComCheque; Pg:Pagamento);
      begin
          self.PgCheq := PgCheq;
          self.Pg     := Pg;
      end;

      Constructor Controle.Create(DM:TDM; Pg:Pagamento);
      begin
          self.Pg     := Pg;
      end;

      Constructor Controle.Create(DM:TDM; PdComp:PedidoDeCompra; Forn:Fornecedor);
      begin
          self.DM := DM;
          self.PdComp := PdComp;
          self.Forn := Forn;
      end;

      Constructor Controle.Create(DM:TDM; PdComp:PedidoDeCompra; ItemPed:ItemDePedido; Prod:Produto);
      begin
          self.DM := DM;
          self.PdComp := PdComp;
          self.ItemPed := ItemPed;
          self.Prod := Prod;
      end;

      Constructor Controle.Create(DM:TDM; PdComp:PedidoDeCompra);
      begin
          self.DM := DM;
          self.PdComp := PdComp;
      end;

      Constructor Controle.Create(DM:TDM; PdComp:PedidoDeCompra; ItemPed:ItemDePedido);
      begin
          self.DM := DM;
          self.PdComp := PdComp;
          self.ItemPed := ItemPed;
      end;

      Constructor Controle.Create(DM:TDM; PdComp:PedidoDeCompra; PJ:PessoaJuridica);
      begin
          self.DM := DM;
          self.PdComp := PdComp;
          self.PJ := PJ;
      end;

      Constructor Controle.Create(DM:TDM; PdComp:PedidoDeCompra; PF:PessoaFisica);
      begin
          self.DM := DM;
          self.PdComp := PdComp;
          self.PF := PF;
      end;

      Constructor Controle.Create(DM:TDM; Cli:Cliente; Pg:Pagamento);
      begin
          self.DM := DM;
          self.Cli := Cli;
          self.Pg := Pg;
      end;

      Constructor Controle.Create(DM:TDM; Cli:Cliente; Pg:Pagamento; PgCheq:PagamentoComCheque; PgCartao:PagamentoCartao; Vd:Venda);
      begin
          self.DM := DM;
          self.Cli := Cli;
          self.Pg := Pg;
          self.PgCheq := PgCheq;
          self.PgCart := PgCart;
          self.Vd := Vd;
      end;

      Constructor Controle.Create(DM:TDM; Pg:Pagamento; Func:Funcionario; Usu:Usuario; Vd:Venda);
      begin
          self.DM := DM;
          self.Pg := Pg;
          self.Func := Func;
          self.Usu := Usu;
          self.Vd := Vd;
      end;

      Constructor Controle.Create(DM:TDM; Forn:Fornecedor; Func:Funcionario; Cli:Cliente; Tel:Telefone);
      begin
          self.DM := DM;
          self.Forn := Forn;
          self.Func := Func;
          self.Cli := Cli;
          self.Tel := Tel;
      end;

      Constructor Controle.Create(DM:TDM; PJ:PessoaJuridica; PF:PessoaFisica; Tel:Telefone);
      begin
          self.DM := DM;
          self.PJ := PJ;
          self.PF := PF;
          self.Tel := Tel;
      end;

      Constructor Controle.Create(DM:TDM; Cli:Cliente; Vd:Venda; Tel:Telefone);
      begin
          self.DM := DM;
          self.Cli := Cli;
          self.Vd := Vd;
          self.Tel := Tel;
      end;

//PROGRAMAÇÃO DOS CASOS DE USO:

//CONTROLAR FUNCIONARIO

      Procedure Controle.IncluirFunc;
      begin
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('INSERT INTO Funcionario VALUES (' + #39 + Func.getcpfFunc                              + #39 + ','
                                                                + #39 + Func.getrgFunc                               + #39 + ','
                                                                + #39 + Func.getnomeFunc                             + #39 + ','
                                                                + #39 + Func.getendFunc                              + #39 + ','
                                                                + #39 + Func.getbairroFunc                           + #39 + ','
                                                                + #39 + Func.getcidadeFunc                           + #39 + ','
                                                                + IntToStr(Func.getcepFunc)                          +       ','
                                                                + #39 + Func.getemailFunc                            + #39 + ','
                                                                + FormatDateTime('YYYYMMDD',Func.getDataNascFunc)    +       ','
                                                                + IntToStr(Func.getNumCartProfFunc)                  +       ','
                                                                + #39 + Func.getNumTitEleitFunc                      + #39 + ','
                                                                + FormatDateTime('YYYYMMDD',Func.getdataAdmissaoFunc)+       ','
                                                                + #39 + Func.getsexoFunc                             + #39 + ','
                                                                + #39 + Func.getserCartProfFunc                      + #39 + ','
                                                                + FloatToStr(Func.getsalFunc)                        +       ','
                                                                + #39 + Func.getcargoFunc                            + #39 + 
                                                              ')');
          DM.ZQuery1.ExecSQL;
      end;


      Procedure Controle.EditarFunc;
      begin
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add  ('UPDATE Funcionario SET rgFunc              = ' + #39 + Func.getrgFunc                                + #39 +
                                                      ', nomeFunc         = ' + #39 + Func.getnomeFunc                              + #39 +
                                                      ', endFunc          = ' + #39 + Func.getendFunc                               + #39 +
                                                      ', bairroFunc       = ' + #39 + Func.getbairroFunc                            + #39 +
                                                      ', cidadeFunc       = ' + #39 + Func.getcidadeFunc                            + #39 +
                                                      ', cepFunc          = ' + IntToStr(Func.getcepFunc)                           +
                                                      ', emailFunc        = ' + #39 + Func.getemailFunc                             + #39 +
                                                      ', dataNascFunc     = ' + FormatDateTime('YYYYMMDD',Func.getDataNascFunc)     +
                                                      ', numCartProfFunc  = ' + IntToStr(Func.getNumCartProfFunc)                   +
                                                      ', numTitEleitFunc  = ' + #39 + Func.getNumTitEleitFunc                       + #39 +
                                                      ', dataAdmissaoFunc = ' + FormatDateTime('YYYYMMDD',Func.getdataAdmissaoFunc) +
                                                      ', sexoFunc         = ' + #39 + Func.getsexoFunc                              + #39 +
                                                      ', serCartProfFunc  = ' + #39 + Func.getserCartProfFunc                       + #39 +
                                                      ', salFunc          = ' + FloatToStr(Func.getsalFunc)                         +
                                                      ', cargoFunc        = ' + #39 + Func.getcargoFunc                             + #39 +
                                                      '  WHERE cpfFunc    = ' + #39 + Func.getcpfFunc + #39 + '');
         DM.ZQuery1.ExecSQL;
      end;


      Procedure Controle.BuscarFuncCPF;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Funcionario WHERE cpfFunc = ' + #39 + Func.getcpfFunc + #39 + '');
          DM.ZQuery1.Open;

          if(NOT DM.ZQuery1.EOF) then
          begin
              AtribDadosFunc;
          end
          else
              Func.setcpfFunc('-1');
     end;
     


      Procedure Controle.BuscarFuncNOME;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Funcionario WHERE nomeFunc LIKE ' + #39 + Func.getnomeFunc + #39 + '"%"');
          DM.ZQuery1.Open;

          if(NOT DM.ZQuery1.EOF) then
          begin
              AtribDadosFunc;
          end
          else
              Func.setcpfFunc(IntToStr(-1));
      end;


      Procedure Controle.BuscarFuncTEL;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Telefone, Funcionario WHERE Funcionario_cpfFunc = cpfFunc AND telcont1 = ' + #39 + Tel.getTelCont1 + #39 + '');
          DM.ZQuery1.Open;

          if(NOT DM.ZQuery1.EOF) then
          begin
              self.AtribDadosFunc;
          end
          else
          begin
              DM.ZQuery1.Close;
              DM.ZQuery1.SQL.Clear;
              DM.ZQuery1.SQL.Add('SELECT * FROM Telefone, Funcionario WHERE Funcionario_cpfFunc = cpfFunc  AND telcont2 = ' + #39 + Tel.getTelCont1 + #39 + '');
              DM.ZQuery1.Open;

              if(NOT DM.ZQuery1.EOF) then
              begin
                 self.AtribDadosFunc;
              end
              else
              begin
                  Func.setcpfFunc('-1');
              end;
          end;
     end;

     Procedure Controle.AtribDadosFunc;
     begin
          Func.setcpfFunc(DM.ZQuery1.FieldByName('cpfFunc').AsString);
          Func.setrgFunc(DM.ZQuery1.FieldByName('rgFunc').AsString);
          Func.setnomeFunc(DM.ZQuery1.FieldByName('nomeFunc').AsString);
          Func.setendFunc(DM.ZQuery1.FieldByName('endFunc').AsString);
          Func.setbairroFunc(DM.ZQuery1.FieldByName('bairroFunc').AsString);
          Func.setcidadeFunc(DM.ZQuery1.FieldByName('cidadeFunc').AsString);
          Func.setcepFunc(DM.ZQuery1.FieldByName('cepFunc').AsInteger);
          Func.setemailFunc(DM.ZQuery1.FieldByName('emailFunc').AsString);
          Func.setdataNascFunc(DM.ZQuery1.FieldByName('dataNascFunc').AsDateTime);
          Func.setnumCartProfFunc(DM.ZQuery1.FieldByName('numCartProfFunc').AsInteger);
          Func.setnumTitEleitFunc(DM.ZQuery1.FieldByName('numTitEleitFunc').AsString);
          Func.setdataAdmissaoFunc(DM.ZQuery1.FieldByName('dataAdmissaoFunc').AsDateTime);
          Func.setsexoFunc(DM.ZQuery1.FieldByName('sexoFunc').AsString);
          Func.setserCartProfFunc(DM.ZQuery1.FieldByName('serCartProfFunc').AsString);
          Func.setcargoFunc(DM.ZQuery1.FieldByName('cargoFunc').AsString);
          Func.setsalFunc(DM.ZQuery1.FieldByName('salFunc').AsFloat);
      end;

      Procedure Controle.ExcluirFunc;
      begin
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('DELETE FROM Funcionario WHERE cpfFunc =  ' + #39 + Func.getcpfFunc + #39 + '');
          DM.ZQuery1.ExecSQL;
      end;

      function Controle.VerifFuncUsuario:integer;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Funcionario, Usuario WHERE Funcionario_cpfFunc = cpfFunc AND cpfFunc =  ' + #39 + Func.getcpfFunc + #39 + '');
          DM.ZQuery1.Open;

          if(DM.ZQuery1.EOF) then
          begin
              result := 1;
          end
          else
              result := 0;
      end;

      Procedure Controle.BuscarFuncionario;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Funcionario');
          DM.ZQuery1.Open;

          if(NOT DM.ZQuery1.EOF) then
          begin
              AtribDadosFunc;
          end
          else
              //Func.setcpfFunc(-1);
     end;

     function Controle.VerfFuncTelefone:integer;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Telefone, Funcionario');
         DM.ZQuery1.SQL.Add('WHERE Telefone.Funcionario_cpfFunc = Funcionario.cpfFunc');
         DM.ZQuery1.SQL.Add('AND Funcionario.cpfFunc = '+ #39 + Func.getcpfFunc + #39 + '');
         DM.ZQuery1.Open;

         if(DM.ZQuery1.EOF) then
         begin
             result := 1;
         end
         else
             result := 0;
     end;

//CONTROLAR USUÁRIO

    Procedure Controle.BuscarFuncUsuarioPorNome;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM Funcionario, Usuario WHERE Funcionario_cpfFunc = cpfFunc AND nomeFunc LIKE '+ #39 + Func.getnomeFunc + #39 + '"%"');
        DM.ZQuery1.Open;

        if(NOT DM.ZQuery1.Eof) then
        begin
            self.AtribDadosFunc;
            Usu.setCodUsu(DM.ZQuery1.FieldByName('codusu').AsInteger);
            Usu.setLogUsu(DM.ZQuery1.FieldByName('logUsu').AsString);
            Usu.setsenhaUsu(DM.ZQuery1.FieldByName('senhaUsu').AsString);
            Usu.setnivelUsu(DM.ZQuery1.FieldByName('nivelUsu').AsString);
            Usu.setStatusUsu(DM.ZQuery1.FieldByName('statusUsu').AsString);
        end
        else if (DM.ZQuery1.Eof) then
        begin
            self.BuscarFuncNOME;
            
            if(NOT DM.ZQuery1.Eof) then
            begin
                self.AtribDadosFunc;
                Usu.setCodUsu(0);
                Usu.setLogUsu('');
                Usu.setsenhaUsu('');
                Usu.setnivelUsu('');
                Usu.setStatusUsu('');
            end
         end;
     end;

    Procedure Controle.BuscarFuncUsuarioPorCPF;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM Funcionario, Usuario WHERE Funcionario_cpfFunc = cpfFunc AND cpfFunc =  '+ #39 + Func.getcpfFunc + #39 +'');
        DM.ZQuery1.Open;

        if(NOT DM.ZQuery1.Eof) then
        begin
            self.AtribDadosFunc;
            Usu.setCodUsu(DM.ZQuery1.FieldByName('codusu').AsInteger);
            Usu.setLogUsu(DM.ZQuery1.FieldByName('logUsu').AsString);
            Usu.setsenhaUsu(DM.ZQuery1.FieldByName('senhaUsu').AsString);
            Usu.setnivelUsu(DM.ZQuery1.FieldByName('nivelUsu').AsString);
            Usu.setStatusUsu(DM.ZQuery1.FieldByName('statusUsu').AsString);
        end
        else if (DM.ZQuery1.Eof) then
        begin
            self.BuscarFuncCPF;

            if(NOT DM.ZQuery1.Eof) then
            begin
                self.AtribDadosFunc;
                Usu.setCodUsu(0);
                Usu.setLogUsu('');
                Usu.setsenhaUsu('');
                Usu.setnivelUsu('');
                Usu.setStatusUsu('');
            end
            else
                Usu.setCodUsu(-1);
         end;
     end;


     function Controle.MaxCodigoUsu:integer;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT MAX(codUsu) FROM USUARIO');
         DM.ZQuery1.Open;
         result := DM.ZQuery1.FieldByName('MAX(codUsu)').AsInteger;
     end;



     Procedure Controle.IncluirUsu;
     begin
          DM.ZQuery1.SQL.Clear;

          DM.ZQuery1.SQL.Add('INSERT INTO Usuario VALUES (' + IntToStr(Usu.getCodUsu)   +       ','
                                                            + #39 + Func.getcpfFunc     + #39 + ','
                                                            + #39 + Usu.getLogUsu       + #39 + ','
                                                            + #39 + Usu.getsenhaUsu     + #39 + ','
                                                            + #39 + Usu.getnivelUsu     + #39 + ','
                                                            + #39 + Usu.getStatusUsu    + #39 +
                                                          ')');

          DM.ZQuery1.ExecSQL;
      end;


      Procedure Controle.EditarUsu;
      begin
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add  ('UPDATE Usuario SET  logUsu        = ' + #39 + Usu.getLogUsu     + #39 +
                                                ', senhaUsu      = ' + #39 + Usu.getsenhaUsu   + #39 +
                                                ', nivelUsu      = ' + #39 + Usu.getnivelUsu   + #39 +
                                                ', statusUsu     = ' + #39 + Usu.getStatusUsu  + #39 +
                                                '  WHERE codUsu  = ' + IntToStr(Usu.getCodUsu) +   '');
         DM.ZQuery1.ExecSQL;
      end;

      Procedure Controle.BuscarTodosUsu;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Funcionario, Usuario WHERE cpf = Funcionario_cpfFunc');
          DM.ZQuery1.Open;

          if(NOT DM.ZQuery1.EOF) then
          begin
              self.AtribDadosUsu;
          end
          else
              Usu.setCodUsu(-1);
     end;

     Procedure Controle.AtribDadosUsu;
     begin
         self.AtribDadosFunc;
         Usu.setCodUsu(DM.ZQuery1.FieldByName('codusu').AsInteger);
         Usu.setLogUsu(DM.ZQuery1.FieldByName('logUsu').AsString);
         Usu.setsenhaUsu(DM.ZQuery1.FieldByName('senhaUsu').AsString);
         Usu.setnivelUsu(DM.ZQuery1.FieldByName('nivelUsu').AsString);
         Usu.setStatusUsu(DM.ZQuery1.FieldByName('statusUsu').AsString);
     end;

     function Controle.VerifUsuarioAtendCliente:integer;
     begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM Usuario, Cliente WHERE Usuario_codUsu = codUsu AND codUsu = ' + IntToStr(Usu.getCodUsu) + '');
        DM.ZQuery1.Open;

        if(DM.ZQuery1.EOF) then
        begin
            result := 1;
        end
        else
            result := 0;
     end;

     Procedure Controle.ExcluirUsu;
     begin
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('DELETE FROM Usuario WHERE codUsu =  ' + IntToStr(Usu.getCodUsu) + '');
         DM.ZQuery1.ExecSQL;
     end;

     Procedure Controle.ListarTodosUsuarios;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Usuario, Funcionario WHERE Funcionario_cpfFunc = cpfFunc ');
         DM.ZQuery1.Open;
     end;

     Procedure Controle.ListarFuncNaoUsuario;
     begin
         {
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Usuario, Funcionario WHERE Funcionario_cpfFunc  cpfFunc ');
         DM.ZQuery1.Open;
         }
     end;


//EFETUAR LOGIN

     function Controle.EfetuarLogin:integer;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Usuario, Funcionario WHERE Funcionario_cpfFunc = cpfFunc AND logUsu = ' + #39 + Usu.getLogUsu + #39 + 'AND senhaUsu = '+ #39 + Usu.getsenhaUsu + #39 + 'AND nivelusu = '+ #39 + Usu.getnivelUsu + #39 + '');
         DM.ZQuery1.Open;

         if (NOT DM.ZQuery1.EOF) then
         begin
             self.AtribDadosFunc;
             Usu.setCodUsu(DM.ZQuery1.FieldByName('codUsu').AsInteger);
             Usu.setLogUsu(DM.ZQuery1.FieldByName('logUsu').AsString);
             Usu.setsenhaUsu(DM.ZQuery1.FieldByName('senhaUsu').AsString);
             Usu.setnivelUsu(DM.ZQuery1.FieldByName('nivelusu').AsString);
             Usu.setStatusUsu(DM.ZQuery1.FieldByName('statusUsu').AsString);
             result := 1;
         end
         else
             result := 0;
     end;


//CONTROLAR TELEFONE


      Function Controle.MaxCodTel:integer;
      begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT MAX(codtel) FROM Telefone');
         DM.ZQuery1.Open;
         result := DM.ZQuery1.FieldByName('MAX(codtel)').AsInteger;
      end;

      Procedure Controle.IncluirTel;
      begin
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('INSERT INTO Telefone VALUES (' + IntToStr(Tel.getCodTel)   +       ','
                                                             + IntToStr(Forn.getcodForn) +       ','
                                                             + IntToStr(Cli.getCodCli)   +       ','
                                                             + #39 + Func.getcpfFunc     + #39 + ','
                                                             + #39 + Tel.getTelCont1     + #39 + ','
                                                             + #39 + Tel.getTelCont2     + #39 +
                                                           ')');

          DM.ZQuery1.ExecSQL;
      end;

      Procedure Controle.EditarTel;
      begin
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add ('UPDATE Telefone SET  telcont1      = ' + #39 + Tel.getTelCont1     + #39 +
                                                ',  telcont2      = ' + #39 + Tel.getTelCont2     + #39 +
                                                '   WHERE codtel  = ' + IntToStr(Tel.getCodTel)   +    '');
          DM.ZQuery1.ExecSQL;
      end;

      Procedure Controle.ExcluirTel;
      begin
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('DELETE FROM Telefone WHERE codTel =  ' + IntToStr(Tel.getCodTel) + '');
          DM.ZQuery1.ExecSQL;
      end;

     Procedure Controle.BuscarTelCli;
     begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM Cliente, Telefone WHERE Cliente_codCli = codCli AND nomeCli LIKE '+ #39 + Cli.getnomeCli + #39 + '"%"');
        DM.ZQuery1.Open;

        //Se Encontrado informação sobre Telefone de contato desse Cliente.
        if(NOT DM.ZQuery1.EOF) then
        begin
            self.AtriBDadosCliente;
            Tel.setCodTel  (DM.ZQuery1.FieldByName('codTel').AsInteger);
            Tel.setTelCont1(DM.ZQuery1.FieldByName('telcont1').AsString);
            Tel.setTelCont2(DM.ZQuery1.FieldByName('telcont2').AsString);
        end
        //Senão Encontrado nenhuma informação sobre Telefone de contato desse Cliente.
        //Será Atribuído as Informações sobre esse Cliente, mas Reg de Tel vazio.
        else if (DM.ZQuery1.Eof) then
        begin
            self.BuscarCliNOME;
            if(NOT DM.ZQuery1.Eof) then
            begin
                Tel.setCodTel(0);
                Tel.setTelCont1('0');
                Tel.setTelCont2('0');
            end;
        end;
     end;


     Procedure Controle.BuscarTelForn;
     begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM PessoaJuridica, Fornecedor, Telefone WHERE');
        DM.ZQuery1.SQL.Add('PessoaJuridica.Fornecedor_codForn = codForn AND');
        DM.ZQuery1.SQL.Add('codForn = Telefone.Fornecedor_codForn AND razaoSocial LIKE ' + #39 + PJ.getrazaoSocial + #39 + '"%"');
        DM.ZQuery1.SQL.Add('UNION');
        DM.ZQuery1.SQL.Add('SELECT * FROM PessoaFisica, Fornecedor, Telefone  WHERE');
        DM.ZQuery1.SQL.Add('PessoaFisica.Fornecedor_codForn = codForn AND');
        DM.ZQuery1.SQL.Add('codForn = Telefone.Fornecedor_codForn AND nomeForn LIKE ' + #39 + PF.getnome + #39 + '"%"');
        DM.ZQuery1.Open;

        if(NOT DM.ZQuery1.EOF) then
        begin
            self.AtribDadosFornPF;
            self.AtribDadosFornPJ;
            Tel.setCodTel(DM.ZQuery1.FieldByName('codTel').AsInteger);
            Tel.setTelCont1(DM.ZQuery1.FieldByName('telcont1').AsString);
            Tel.setTelCont2(DM.ZQuery1.FieldByName('telcont2').AsString);
        end
        else if (DM.ZQuery1.Eof) then
        begin
            self.BuscarFornPorNomeRSocial;
            if(NOT DM.ZQuery1.Eof) then
            begin
                Tel.setCodTel(0);
                Tel.setTelCont1('0');
                Tel.setTelCont2('0');
            end;
        end;
     end;
    

     Procedure Controle.BuscarFornPorNomeRSocial;
     begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM PessoaJuridica, Fornecedor WHERE');
        DM.ZQuery1.SQL.Add('PessoaJuridica.Fornecedor_codForn = codForn AND');
        DM.ZQuery1.SQL.Add('razaoSocial LIKE ' + #39 + PJ.getrazaoSocial + #39 + '"%"');
        DM.ZQuery1.SQL.Add('UNION');
        DM.ZQuery1.SQL.Add('SELECT * FROM PessoaFisica, Fornecedor  WHERE');
        DM.ZQuery1.SQL.Add('PessoaFisica.Fornecedor_codForn = codForn AND');
        DM.ZQuery1.SQL.Add('nomeForn LIKE ' + #39 + PF.getnome + #39 + '"%"');
        DM.ZQuery1.Open;

        if(NOT DM.ZQuery1.EOF) then
        begin
            self.AtribDadosFornPF;
            self.AtribDadosFornPJ;
        end
        else
        begin
            PJ.setcodForn(-1);
        end;
     end;


     Procedure Controle.BuscarTodosTelCli;
     begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Cliente, Telefone WHERE Cliente_codCli = codCli');
          DM.ZQuery1.Open;

          if(NOT DM.ZQuery1.EOF) then
          begin
              AtriBDadosCliente;
              Tel.setCodTel(DM.ZQuery1.FieldByName('codTel').AsInteger);
              Tel.setTelCont1(DM.ZQuery1.FieldByName('telcont1').AsString);
              Tel.setTelCont2(DM.ZQuery1.FieldByName('telcont2').AsString);
          end
          else
              Cli.setCodCli(-1);
     end;

     Procedure Controle.BuscarTelFunc;
     begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM Funcionario, Telefone WHERE Funcionario_cpffunc = cpffunc AND nomefunc LIKE '+ #39 + Func.getnomeFunc + #39 + '"%"');
        DM.ZQuery1.Open;

        if(NOT DM.ZQuery1.EOF) then
        begin
            self.AtribDadosFunc;
            Tel.setCodTel(DM.ZQuery1.FieldByName('codTel').AsInteger);
            Tel.setTelCont1(DM.ZQuery1.FieldByName('telcont1').AsString);
            Tel.setTelCont2(DM.ZQuery1.FieldByName('telcont2').AsString);
        end
        else if (DM.ZQuery1.EOF) then
        begin
            self.BuscarFuncNOME;
            if(NOT DM.ZQuery1.Eof) then
            begin
                Tel.setCodTel(0);
                Tel.setTelCont1('0');
                Tel.setTelCont2('0');
            end;
        end;
     end;



//CONTROLAR CLIENTE

      Procedure Controle.RetMaxCodCli;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT MAX(codCli) FROM Cliente');
          DM.ZQuery1.Open;
          Cli.setCodCli(DM.ZQuery1.FieldByName('MAX(codCli)').AsInteger);
      end;

      Procedure Controle.IncluirCli(codusu:integer ; cpf:String);
      begin
          try
            DM.ZQuery1.SQL.Clear;
            DM.ZQuery1.SQL.Add('INSERT INTO Cliente VALUES (' + IntToStr(Cli.getCodCli) +       ','
                                                            + #39 + cpf               + #39 + ','
                                                            + IntToStr(codusu)        +       ','
                                                            + #39 + Cli.getnomeCli    + #39 + ','
                                                            + #39 + Cli.getendCli     + #39 + ','
                                                            + #39 + Cli.getbairroCli  + #39 + ','
                                                            + #39 + Cli.getcidCli     + #39 + ','
                                                            + #39 + Cli.getemailCli   + #39 + ','
                                                            + #39 + Cli.getobsCli     + #39 + ','
                                                            + #39 + Cli.getStatusCli  + #39 +
                                                            ')');
            DM.ZQuery1.ExecSQL;
          except
            Exit;
          end;
      end;

      Procedure Controle.EditarCli;
      begin
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('UPDATE Cliente SET nomeCli = '+ #39 + Cli.getnomeCli  + #39 + ', endCli = ' + #39 + Cli.getendCli + #39 + ', bairroCli = ' + #39 + Cli.getbairroCli  + #39 + ', cidCli = ' + #39 + Cli.getcidCli  + #39 + ', emailCli  = ' + #39 + Cli.getemailCli + #39 + ', obsCli = ' + #39 + Cli.getobsCli + #39 + ' , statusCli = ' + #39 + Cli.getStatusCli + #39 + ' WHERE codCli  = '+ IntToStr(Cli.getCodCli) + '');
          DM.ZQuery1.ExecSQL;
      end;


     Procedure Controle.BuscarCliNOME;
     begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Cliente WHERE nomeCli LIKE ' + #39 + Cli.getnomeCli + #39 + '"%"');
          DM.ZQuery1.Open;

          if(NOT DM.ZQuery1.EOF) then
          begin
              AtriBDadosCliente;
          end
          else
              Cli.setCodCli(-1);
     end;

     Procedure Controle.BuscarCliTEL;
     begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Telefone, Cliente WHERE Cliente_codCli = codCli AND telcont1 = ' + #39 + Tel.getTelCont1 + #39 +'');
          DM.ZQuery1.Open;

          if(NOT DM.ZQuery1.EOF) then
          begin
              self.AtriBDadosCliente;
          end
          else
          begin
              DM.ZQuery1.Close;
              DM.ZQuery1.SQL.Clear;
              DM.ZQuery1.SQL.Add('SELECT * FROM Telefone, Cliente WHERE Cliente_codCli = codCli AND telcont2 = ' + #39 + Tel.getTelCont1 + #39 +'');
              DM.ZQuery1.Open;

              if(NOT DM.ZQuery1.EOF) then
              begin
                 self.AtriBDadosCliente;
              end
              else
              begin
                 Cli.setCodCli(-1);
              end;
          end;
     end;


     Procedure Controle.BuscarCliCODIGO;
     begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Cliente WHERE codCli = '+ IntToStr(Cli.getCodCli) + '');
          DM.ZQuery1.Open;

          if(NOT DM.ZQuery1.EOF) then
          begin
              AtriBDadosCliente;
          end
          else
              Cli.setCodCli(-1);
     end;

     Procedure Controle.AtriBDadosCliente;
     begin
         Cli.setCodCli(DM.ZQuery1.FieldByName('codCli').AsInteger);
         Cli.setNomeCli(DM.ZQuery1.FieldByName('nomeCli').AsString);
         Cli.setendCli(DM.ZQuery1.FieldByName('endCli').AsString);
         Cli.setBairroCli(DM.ZQuery1.FieldByName('bairroCli').AsString);
         Cli.setcidCli(DM.ZQuery1.FieldByName('cidCli').AsString);
         Cli.setemailCli(DM.ZQuery1.FieldByName('emailCli').AsString);
         Cli.setobsCli(DM.ZQuery1.FieldByName('obsCli').AsString);
         Cli.setstatusCli(DM.ZQuery1.FieldByName('statusCli').AsString);
     end;

     function Controle.VerifClienteVenda:integer;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Cliente, Venda WHERE Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
         DM.ZQuery1.Open;

         if(DM.ZQuery1.EOF) then
         begin
             result := 1;
         end
         else
             result := 0;
     end;

     function Controle.VerifClienteTelefone:integer;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Cliente, Telefone WHERE Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
         DM.ZQuery1.Open;

         if(DM.ZQuery1.EOF) then
         begin
             result := 1;
         end
         else
             result := 0;
     end;



     Procedure Controle.ExcluirCli;
     begin
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('DELETE FROM Cliente WHERE codCli =  ' + IntToStr(Cli.getCodCli) + '');
         DM.ZQuery1.ExecSQL;
     end;

     Procedure Controle.BuscarCliente;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Cliente');
         DM.ZQuery1.Open;

         if(NOT DM.ZQuery1.EOF) then
         begin
             AtriBDadosCliente;
         end
         else
             Cli.setCodCli(-1);
     end;


//MANTER FORNECEDOR

     Procedure Controle.IncluirFornPJ;
     begin
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('INSERT INTO Fornecedor VALUES (' + IntToStr(PJ.getcodForn)                          +       ','
                                                              + #39 + PJ.getendForn                              + #39 + ','
                                                              + #39 + PJ.getbairroForn                           + #39 + ','
                                                              + #39 + PJ.getcidadeForn                           + #39 + ','
                                                              + #39 + PJ.getemailForn                            + #39 + ','
                                                              + #39 + PJ.getestadoForn                           + #39 + ','
                                                              + #39 + PJ.getdescForn                             + #39 + ','
                                                              + IntToStr(PJ.getcepForn)                          +       ','
                                                              + FormatDateTime('YYYYMMDD',PJ.getdataAdmissaoForn)+       ','
                                                              + #39 + PJ.getstatusForn                           + #39 + ','
                                                              + #39 + PJ.gettipoForn                             + #39 +
                                                             ')');


         DM.ZQuery1.ExecSQL;


         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('INSERT INTO PessoaJuridica VALUES (' + #39 + PJ.getCnpj           + #39 + ','
                                                                  + IntToStr(PJ.getcodForn)    +       ','
                                                                  + #39 + PJ.getrazaoSocial    + #39 +
                                                                ')');

         DM.ZQuery1.ExecSQL;
      end;

      Procedure Controle.IncluirFornPF;
      begin
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('INSERT INTO Fornecedor VALUES (' + IntToStr(PF.getcodForn)                          +       ','
                                                              + #39 + PF.getendForn                              + #39 + ','
                                                              + #39 + PF.getbairroForn                           + #39 + ','
                                                              + #39 + PF.getcidadeForn                           + #39 + ','
                                                              + #39 + PF.getemailForn                            + #39 + ','
                                                              + #39 + PF.getestadoForn                           + #39 + ','
                                                              + #39 + PF.getdescForn                             + #39 + ','
                                                              + IntToStr(PF.getcepForn)                          +       ','
                                                              + FormatDateTime('YYYYMMDD',PF.getdataAdmissaoForn)+       ','
                                                              + #39 + PF.getstatusForn                           + #39 + ','
                                                              + #39 + PF.gettipoForn                             + #39 +
                                                             ')');


         DM.ZQuery1.ExecSQL;


         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('INSERT INTO PessoaFisica VALUES (' + #39 + PF.getcpf         + #39 + ','
                                                                + IntToStr(PF.getcodForn) +       ','
                                                                + #39 + PF.getnome  + #39 +
                                                                ')');
         DM.ZQuery1.ExecSQL;
      end;

      Procedure Controle.RetMaxCodForn;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT MAX(codForn) FROM Fornecedor');
          DM.ZQuery1.Open;
      end;


      Procedure Controle.ListarTodosFornPF;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Fornecedor, PessoaFisica WHERE Fornecedor_codForn = codForn');
          DM.ZQuery1.Open;
      end;

      Procedure Controle.ListarTodosFornPJ;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Fornecedor, PessoaJuridica WHERE Fornecedor_codForn = codForn');
          DM.ZQuery1.Open;
      end;

      Procedure Controle.AtribDadosFornPF;
      begin
          try
              PF.setcodForn(DM.ZQuery1.FieldByName('codForn').AsInteger);
              PF.setcpf(DM.ZQuery1.FieldByName('cpfForn').AsString);
              PF.setnome(DM.ZQuery1.FieldByName('nomeForn').AsString);
              PF.setendForn(DM.ZQuery1.FieldByName('endForn').AsString);
              PF.setBairroForn(DM.ZQuery1.FieldByName('bairroForn').AsString);
              PF.setcidadeForn(DM.ZQuery1.FieldByName('cidadeForn').AsString);
              PF.setemailForn(DM.ZQuery1.FieldByName('emailForn').AsString);
              PF.setestadoForn(DM.ZQuery1.FieldByName('estadoForn').AsString);
              PF.setdescForn(DM.ZQuery1.FieldByName('descForn').AsString);
              PF.setcepForn(DM.ZQuery1.FieldByName('cepForn').AsInteger);
              PF.setdataAdmissaoForn(DM.ZQuery1.FieldByName('dataAdmissao').AsDateTime);
              PF.setstatusForn(DM.ZQuery1.FieldByName('statusForn').AsString);
              PF.settipoForn(DM.ZQuery1.FieldByName('tipoForn').AsString);
          except
              On EDataBaseError Do
              begin
                  self.AtribDadosFornPJ;
              end;
          end;
      end;

      Procedure Controle.AtribDadosFornPJ;
      begin
          try
              PJ.setcodForn(DM.ZQuery1.FieldByName('codForn').AsInteger);
              PJ.setCnpj(DM.ZQuery1.FieldByName('cnpj').AsString);
              PJ.setrazaoSocial(DM.ZQuery1.FieldByName('razaosocial').AsString);
              PJ.setendForn(DM.ZQuery1.FieldByName('endForn').AsString);
              PJ.setBairroForn(DM.ZQuery1.FieldByName('bairroForn').AsString);
              PJ.setcidadeForn(DM.ZQuery1.FieldByName('cidadeForn').AsString);
              PJ.setemailForn(DM.ZQuery1.FieldByName('emailForn').AsString);
              PJ.setestadoForn(DM.ZQuery1.FieldByName('estadoForn').AsString);
              PJ.setdescForn(DM.ZQuery1.FieldByName('descForn').AsString);
              PJ.setcepForn(DM.ZQuery1.FieldByName('cepForn').AsInteger);
              PJ.setdataAdmissaoForn(DM.ZQuery1.FieldByName('dataAdmissao').AsDateTime);
              PJ.setstatusForn(DM.ZQuery1.FieldByName('statusForn').AsString);
              PJ.settipoForn(DM.ZQuery1.FieldByName('tipoForn').AsString);
          except
              On EDataBaseError Do
              begin
                  self.AtribDadosFornPF;
              end;
          end;
      end;


      Procedure Controle.BuscarFornPorRazaoSocial;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Fornecedor, PessoaJuridica WHERE Fornecedor_codForn = codForn AND razaoSocial = '+ #39 + PJ.getrazaoSocial + #39 + '');
          DM.ZQuery1.Open;
          self.AtribDadosFornPJ;
      end;

      
      Procedure Controle.BuscarFornPorNome;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Fornecedor, PessoaFisica WHERE Fornecedor_codForn = codForn AND nomeForn = '+ #39 + PF.getnome + #39 + '');
          DM.ZQuery1.Open;
          self.AtribDadosFornPF;
      end;


      Procedure Controle.EditarFornPJ;
      begin
          //Atualizando Tabela Fornecedor.
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('UPDATE Fornecedor SET    endForn       = ' + #39 + PJ.getendForn                              + #39 +
                                                    ', bairroForn    = ' + #39 + PJ.getbairroForn                           + #39 +
                                                    ', cidadeForn    = ' + #39 + PJ.getcidadeForn                           + #39 +
                                                    ', emailForn     = ' + #39 + PJ.getemailForn                            + #39 +
                                                    ', estadoForn    = ' + #39 + PJ.getestadoForn                           + #39 +
                                                    ', descForn      = ' + #39 + PJ.getdescForn                             + #39 +
                                                    ', cepForn       = ' + IntToStr(PJ.getcepForn)                          +
                                                    ', dataAdmissao  = ' + FormatDateTime('YYYYMMDD',PJ.getdataAdmissaoForn)+
                                                    ', statusForn    = ' + #39 + PJ.getstatusForn                           + #39 +
                                                    '  WHERE codForn = '+ IntToStr(PJ.getcodForn) + '');
          DM.ZQuery1.ExecSQL;

          //Atualizando Tabela PessoaJuridica.
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('UPDATE PessoaJuridica SET razaoSocial = ' + #39 + PJ.getrazaoSocial + #39 +
                                                     '  WHERE cnpj  = ' + #39 + PJ.getCnpj        + #39 + '');
          DM.ZQuery1.ExecSQL;

      end;

      Procedure Controle.EditarFornPF;
      begin
          //Atualizando Tabela Fornecedor.
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('UPDATE Fornecedor SET    endForn       = ' + #39 + PF.getendForn                              + #39 +
                                                    ', bairroForn    = ' + #39 + PF.getbairroForn                           + #39 +
                                                    ', cidadeForn    = ' + #39 + PF.getcidadeForn                           + #39 +
                                                    ', emailForn     = ' + #39 + PF.getemailForn                            + #39 +
                                                    ', estadoForn    = ' + #39 + PF.getestadoForn                           + #39 +
                                                    ', descForn      = ' + #39 + PF.getdescForn                             + #39 +
                                                    ', cepForn       = ' + IntToStr(PF.getcepForn)                          +
                                                    ', dataAdmissao  = ' + FormatDateTime('YYYYMMDD',PF.getdataAdmissaoForn)+
                                                    ', statusForn    = ' + #39 + PF.getstatusForn                           + #39 +
                                                    '  WHERE codForn = '+ IntToStr(PF.getcodForn) + '');
          DM.ZQuery1.ExecSQL;

          //Atualizando Tabela PessoaFisica
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('UPDATE PessoaFisica SET nomeForn      = '+ #39 + PF.getnome + #39 +
                                              ' WHERE cpfForn = '+ #39 + PF.getcpf  + #39 + '');
          DM.ZQuery1.ExecSQL;

      end;

      Procedure Controle.ExcluirFornPJ;
      begin
          //Excluindo Registro de Pessoa Jurídica.
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('DELETE FROM PessoaJuridica WHERE Fornecedor_codForn =  '+ IntToStr(Forn.getcodForn) + '');
          DM.ZQuery1.ExecSQL;
          //Excluindo Registro de Fornecedor.
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('DELETE FROM Fornecedor WHERE codForn =  ' + IntToStr(Forn.getcodForn) + '');
          DM.ZQuery1.ExecSQL;
      end;


      Procedure Controle.ExcluirFornPF;
      begin
          //Excluindo Registro de Pessoa Física.
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('DELETE FROM PessoaFisica WHERE Fornecedor_codForn =  '+ IntToStr(Forn.getcodForn) + '');
          DM.ZQuery1.ExecSQL;
          //Excluindo Registro de Fornecedor.
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('DELETE FROM Fornecedor WHERE codForn   =  ' + IntToStr(Forn.getcodForn) + '');
          DM.ZQuery1.ExecSQL;
      end;



      Procedure Controle.BuscarForn;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          //DM.ZQuery1.SQL.Add('SELECT * FROM Fornecedor WHERE cnpj = '+ IntToStr(Forn.getCnpj) +'');
          DM.ZQuery1.Open;
          //AtribDadosForn;
      end;

      function Controle.VerifFornecComPdCompra:integer;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM PedidoDeCompra, Fornecedor');
          DM.ZQuery1.SQL.Add('WHERE PedidoDeCompra.Fornecedor_codForn = Fornecedor.codForn');
          DM.ZQuery1.SQL.Add('AND Fornecedor.codForn = '+ IntToStr(Forn.getcodForn) +'');
          DM.ZQuery1.Open;

          if(DM.ZQuery1.EOF) then
              result := 1 //Não possui registro associado a nenhum PedidoDeCompra.
          else
              result := 0;//Possui registro associado a nenhum PedidoDeCompra.
      end;

      function Controle.VerifFornecComTelefone;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Telefone, Fornecedor');
          DM.ZQuery1.SQL.Add('WHERE Telefone.Fornecedor_codForn = Fornecedor.codForn');
          DM.ZQuery1.SQL.Add('AND Fornecedor.codForn = '+ IntToStr(Forn.getcodForn) +'');
          DM.ZQuery1.Open;

          if(DM.ZQuery1.EOF) then
              result := 1  //Não possui registro associado a nenhum Telefone.
          else
              result := 0; //Possui registro associado a nenhum PedidoDeCompra.
      end;

      Procedure Controle.BuscarFornecedor;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Fornecedor');
          DM.ZQuery1.Open;

          if(NOT DM.ZQuery1.EOF) then
          begin
              //AtribDadosForn;
          end;
          //else
              //Forn.setCnpj(-1);
      end;


      Procedure Controle.ExibirForn;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          //DM.ZQuery1.SQL.Add('SELECT * FROM Fornecedor WHERE razaoSocial = ' + #39 + Forn.getRazaoSocial + #39 + '');
          DM.ZQuery1.Open;

          //AtribDadosForn;
      end;

     {
     function Controle.VerifFornPedidoDeCompra:integer;
     begin
         {
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         //DM.ZQuery1.SQL.Add('SELECT * FROM Fornecedor, PedidoDeCompra WHERE Fornecedor_cnpj = cnpj AND cnpj = ' + IntToStr(Forn.getCnpj) + '');
         DM.ZQuery1.Open;

         if(DM.ZQuery1.EOF) then
         begin
             self.ExcluirForn;
             result := 1;
         end
         else
             result := 0;
         }
     //end;





//CONTROLAR PRODUTO

      Procedure Controle.RetMaxCodProd;
      begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT MAX(codProd) FROM Produto');
          DM.ZQuery1.Open;
      end;

      Procedure Controle.IncluirProd;
      begin
          //Inclui dados do Produto.
          DM.ZQuery1.SQL.Clear;
          DecimalSeparator := '.';
          DM.ZQuery1.SQL.Add('INSERT INTO Produto VALUES (' + IntToStr(Prod.getcodProd)      +       ','
                                                            + #39 + Prod.getnomeProd         + #39 + ','
                                                            + FloatToStr(Prod.getprecoProd)  +       ','
                                                            + #39 + Prod.getdescProd         + #39 + ','
                                                            + #39 + Prod.getcatProd          + #39 + ','
                                                            + #39 + Prod.gettipoMedProd      + #39 +
                                                        ')');

          DM.ZQuery1.ExecSQL;

          //Cria um Registro de estoque ZERADO para o produto incluído.
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('INSERT INTO Estoque VALUES (' + IntToStr(Estq.getcodEstq)            + ','
                                                            + IntToStr(Prod.getcodProd)            + ','
                                                            + FloatToStr(Estq.getqtdPesoEstqAtual) + ','
                                                            + FloatToStr(Estq.getqtdPesoEstqAntg)  + ','
                                                            + IntToStr(Estq.getqtdunitEstqAtual)   + ','
                                                            + IntToStr(Estq.getqtdUnitEstqAntg)    + ','
                                                            + IntToStr(Estq.getqtdMinEstq)         +
                                                       ')');

          DM.ZQuery1.ExecSQL;
      end;

      Procedure Controle.EditarProd;
      begin
          DM.ZQuery1.SQL.Clear;
          DecimalSeparator := '.';
          DM.ZQuery1.SQL.Add('UPDATE Produto SET  nomeProd      = ' + #39 + Prod.getnomeProd       + #39 +
                                               ', precoProd     = ' + FloatToStr(Prod.getprecoProd)      +
                                               ', descprod      = ' + #39 + Prod.getdescProd       + #39 +
                                               ', catprod       = ' + #39 + Prod.getcatProd        + #39 +
                                               ', tipomedProd   = ' + #39 + Prod.gettipoMedProd    + #39 +
                                               '  WHERE codprod = ' + IntToStr(Prod.getcodProd)    +   '');
          DM.ZQuery1.ExecSQL;
     end;


     Procedure Controle.ListarCat;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT DISTINCT Produto.catProd FROM Produto');
         DM.ZQuery1.Open;
     end;

     Procedure Controle.ListarProd;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT nomeProd FROM Produto WHERE catProd = '+ #39 + Prod.getcatProd + #39 + '');
         DM.ZQuery1.Open;
     end;

     Procedure Controle.BuscarProdPorNome;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Produto, Estoque WHERE Produto_codProd = codProd AND nomeProd = '+ #39 + Prod.getnomeProd + #39 + '');
         DM.ZQuery1.Open;

         if(NOT DM.ZQuery1.EOF) then
         begin
             self.AtribDadosProd;
         end
         else
             Prod.setCodProd(-1);
     end;
     
     Procedure Controle.AtribDadosProd;
     var
         peso  : real;
         preco : real;
     begin
         Prod.setCodProd(DM.ZQuery1.FieldByName('codProd').AsInteger);
         Prod.setnomeProd(DM.ZQuery1.FieldByName('nomeProd').AsString);
         DecimalSeparator := '.';
         preco := DM.ZQuery1.FieldByName('precoProd').AsFloat;
         Prod.setprecoProd(preco);
         Prod.setdescProd(DM.ZQuery1.FieldByName('descProd').AsString);
         Prod.setcatProd(DM.ZQuery1.FieldByName('catProd').AsString);
         Prod.settipoMedProd(DM.ZQuery1.FieldByName('tipoMedProd').AsString);
         Estq.setcodestq(DM.ZQuery1.FieldByName('codEstq').AsInteger);
         DecimalSeparator := '.';
         peso := DM.ZQuery1.FieldByName('qtdPesoEstqAtual').AsFloat;
         Estq.setqtdPesoEstqAtual(peso);
         Estq.setqtdPesoEstqAntg(DM.ZQuery1.FieldByName('qtdPesoEstqAntg').AsFloat);
         Estq.setqtdUnitestqAtual(DM.ZQuery1.FieldByName('qtdUnitEstqAtual').AsInteger);
         Estq.setqtdUnitEstqAntg(DM.ZQuery1.FieldByName('qtdUnitEstqAntg').AsInteger);
         Estq.setqtdminEstq(DM.ZQuery1.FieldByName('qtdMinEstq').AsInteger);
     end;

     Procedure Controle.ExcluirProd;
     begin
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('DELETE FROM Produto WHERE codProd = '+ IntToStr(Prod.getcodProd) + '');
         DM.ZQuery1.Open;
     end;

     Procedure Controle.ExcluirEstq;
     begin
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('DELETE FROM Estoque WHERE Produto_codProd =  ' + IntToStr(Prod.getcodProd) + '');
         DM.ZQuery1.Open;
     end;

     Procedure Controle.ListarTodosProd;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Produto, Estoque WHERE Produto_codProd = codProd');
         DM.ZQuery1.Open;
     end;

     function Controle.VerifNomeExistenteProd:integer;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Produto WHERE nomeProd = '+ #39 + Prod.getnomeProd + #39 + '');
         DM.ZQuery1.Open;

         if(DM.ZQuery1.EOF) then
         begin
             result := 1;
         end
         else
             result := 0;
     end;

     function Controle.VerifProdComItemVenda:integer;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM ItemDeVenda, Produto WHERE Produto_codProd = codProd AND codProd = '+ IntToStr(Prod.getcodProd) +'');
         DM.ZQuery1.Open;

         if(DM.ZQuery1.EOF) then
         begin
             result := 1;
         end
         else
             result := 0;
     end;

     function Controle.VerifProdutoComItemPed:integer;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Produto, ItemDePedido WHERE Produto.codProd = ItemDePedido.Produto_codProd AND codProd = '+ IntToStr(Prod.getcodProd) +'');
         DM.ZQuery1.Open;

         if(DM.ZQuery1.EOF) then
         begin
             result := 1;
         end
         else
             result := 0;
     end;



//MANTER ESTOQUE

     Procedure Controle.EditarEstq;
     begin
         DM.ZQuery1.SQL.Clear;
         DecimalSeparator := '.';
         DM.ZQuery1.SQL.Add('UPDATE Estoque SET   qtdPesoEstqAtual = ' + FloatToStr(Estq.getqtdPesoEstqAtual) +
                                               ', qtdPesoEstqAntg  = ' + FloatToStr(Estq.getqtdPesoEstqAntg)  +
                                               ', qtdUnitEstqAtual = ' + IntToStr  (Estq.getqtdunitEstqAtual) +
                                               ', qtdUnitEstqAntg  = ' + IntToStr  (Estq.getqtdUnitEstqAntg)  +
                                               '  WHERE codEstq    = ' + IntToStr  (Estq.getcodEstq)          + '');
         DM.ZQuery1.ExecSQL;
     end;

     function Controle.ListarProdSemEstq:integer;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Produto, Estoque WHERE Produto_codProd = codProd');
         DM.ZQuery1.SQL.Add('AND qtdPesoEstqAtual = 0 AND qtdUnitEstqAtual = 0');
         DM.ZQuery1.Open;

         if(NOT DM.ZQuery1.EOF) then
         begin
              result := 1;
         end
         else
         begin
              result := 0;
         end;
     end;


     function Controle.ListarProdComEstq:integer;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Produto, Estoque');
         DM.ZQuery1.SQL.Add('WHERE Produto.codProd = Estoque.Produto_codProd');
         DM.ZQuery1.SQL.Add('AND Estoque.qtdPesoEstqAtual > 0 AND Estoque.qtdUnitEstqAtual = 0');
         DM.ZQuery1.SQL.Add('UNION');
         DM.ZQuery1.SQL.Add('SELECT * FROM Produto, Estoque');
         DM.ZQuery1.SQL.Add('WHERE Produto.codProd = Estoque.Produto_codProd');
         DM.ZQuery1.SQL.Add('AND Estoque.qtdPesoEstqAtual = 0 AND Estoque.qtdUnitEstqAtual > 0');
         DM.ZQuery1.Open;

         if(NOT DM.ZQuery1.EOF) then
         begin
              result := 1;
         end
         else
         begin
              result := 0;
         end;
     end;

     Procedure Controle.RecalcularEstoque;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT (qtdPesoEstqAtual * precoProd) AS result FROM Estoque, Produto');
         DM.ZQuery1.SQL.Add('WHERE Estoque.Produto_codProd = Produto.codProd AND');
         DM.ZQuery1.SQL.Add('codProd = '+ IntToStr(Prod.getcodProd) +'');
         DM.ZQuery1.Open;
     end;

//CONSULTAR PREÇO

     Procedure Controle.ConsultarPreco;
     begin
         BuscarProdPorNome;
     end;

//CONTROLAR ESTOQUE

     Procedure Controle.RetMaxCodEstq;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT MAX(codEstq) FROM Estoque');
         DM.ZQuery1.Open;
     end;


//REALIZAR VENDA:

     Procedure Controle.BuscarCliNOMEVenda;
     begin
          DM.ZQuery1.Close;
          DM.ZQuery1.SQL.Clear;
          DM.ZQuery1.SQL.Add('SELECT * FROM Cliente WHERE statusCli = ' + #39 + 'Ativo' + #39 + ' AND nomeCli LIKE ' + #39 + Cli.getnomeCli + #39 + '"%"');
          DM.ZQuery1.Open;

          if(NOT DM.ZQuery1.EOF) then
          begin
              AtriBDadosCliente;
          end
          else
              Cli.setCodCli(-1);
     end;

     Procedure Controle.BuscarCliTELVenda;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Cliente, Telefone');
         DM.ZQuery1.SQL.Add('WHERE statusCli = '+ #39 + 'Ativo' + #39 +' AND ');
         DM.ZQuery1.SQL.Add('codCli = Cliente_codCli');
         DM.ZQuery1.SQL.Add('AND Telefone.telcont1 = '+ #39 + Tel.getTelCont1 + #39 +'');
         DM.ZQuery1.SQL.Add('OR  Telefone.telcont2 = '+ #39 + Tel.getTelCont1 + #39 +'');
         DM.ZQuery1.Open;

         if(NOT DM.ZQuery1.EOF) then
         begin
             self.AtriBDadosCliente;
         end
         else
         begin
             Cli.setCodCli(1);
         end;
     end;

     Procedure Controle.BuscarCliCodVenda;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Cliente');
         DM.ZQuery1.SQL.Add('WHERE statusCli = '+ #39 + 'Ativo' + #39 +' AND ');
         DM.ZQuery1.SQL.Add('codCli = '+ IntToStr(Cli.getCodCli) + '');
         DM.ZQuery1.Open;

         if(NOT DM.ZQuery1.EOF) then
         begin
             self.AtriBDadosCliente;
         end
         else
         begin
             Cli.setCodCli(1);
         end;
     end;


     function Controle.MaxCodigoItemDeVenda:integer;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT MAX(codItemVend) FROM ItemDeVenda');
         DM.ZQuery1.Open;
         result := DM.ZQuery1.FieldByName('MAX(codItemVend)').AsInteger;
     end;



     Procedure Controle.IncluirItemDeVenda;
     begin
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('INSERT INTO ItemDeVenda VALUES (' + IntToStr(ItVend.getcodItemVend)       + ','
                                                               + IntToStr(Vd.getcodVenda)              + ','
                                                               + IntToStr(Prod.getcodProd)             + ','
                                                               + IntToStr(ItVend.getqtdUnitItemVend)   + ','
                                                               + FloatToStr(ItVend.getvalPagItemVend)  + ','
                                                               + FloatToStr(ItVend.getqtdPesoItemVend) +
                                                             ')');
         DM.ZQuery1.ExecSQL;
     end;

     function Controle.MaxCodVenda:integer;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT MAX(codVenda) FROM Venda');
         DM.ZQuery1.Open;
         result := DM.ZQuery1.FieldByName('MAX(codVenda)').AsInteger;
     end;

     procedure Controle.CriarRegVenda;
     begin
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('INSERT INTO Venda VALUES (' + IntToStr(Vd.getcodVenda)                   + ','
                                                         + IntToStr(Cli.getCodCli)                    + ','
                                                         + FormatDateTime('YYYYMMDD',Vd.getdataVenda) + ','
                                                         + FloatToStr(Vd.getValTotVenda)              + ','
                                                         + #39 + Vd.getstatusVenda              + #39 +
                                                       ')');
         DM.ZQuery1.ExecSQL;
     end;
     
     procedure Controle.ListarItensPorCodVenda;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Produto, Venda, ItemDeVenda WHERE Produto_codProd = codProd AND Venda_codvenda = codVenda AND codVenda = '+ IntToStr(Vd.getcodVenda) + '');
         DM.ZQuery1.Open;
     end;

     procedure Controle.ConfirmarVenda;
     begin
         //Atualiza o Registro de Venda com o Valor Total...
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('UPDATE Venda SET valtotvenda    = ' + FloatToStr(Vd.getValTotVenda) +
                                            ' WHERE codVenda = ' + IntToStr(Vd.getcodVenda)      + '');
         DM.ZQuery1.ExecSQL;
     end;


     Procedure Controle.CriarRegPagamento;
     begin
         //Cria um Registro de Pagamento para Venda...
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('INSERT INTO Pagamento VALUES (' + IntToStr(Pg.getcodPag)                     + ','
                                                             + IntToStr(Vd.getcodVenda)                   + ','
                                                             + #39 + Pg.getstatusPag                + #39 + ','
                                                             + FloatToStr(Pg.getvalpag)                   + ','
                                                             + FormatDateTime('YYYYMMDD',Vd.getdataVenda) + ','
                                                             + #39 + Pg.getTipoPag                  + #39 +
                                                           ')');
         DM.ZQuery1.ExecSQL;
     end;

     function Controle.MaxCodPagto:integer;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT MAX(codPag) FROM Pagamento');
         DM.ZQuery1.Open;
         result := DM.ZQuery1.FieldByName('MAX(codPag)').AsInteger;
     end;

     Procedure Controle.AlterarEstqVenda;
     begin
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('UPDATE Estoque SET   qtdPesoEstqAtual = ' + FloatToStr(Estq.getqtdPesoEstqAtual) +
                                               ', qtdPesoEstqAntg  = ' + FloatToStr(Estq.getqtdPesoEstqAntg)  +
                                               ', qtdUnitEstqAtual = ' + IntToStr  (Estq.getqtdunitEstqAtual) +
                                               ', qtdUnitEstqAntg  = ' + IntToStr  (Estq.getqtdUnitEstqAntg)  +
                                               '  WHERE codEstq    = ' + IntToStr  (Estq.getcodEstq)          + '');
         DM.ZQuery1.ExecSQL;
     end;

     function Controle.VerifarProdNaLista:integer;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Produto, ItemDeVenda, Venda WHERE Produto_codProd = codProd AND Venda_codVenda = codVenda AND codVenda = ' + IntToStr(Vd.getcodVenda) + ' AND nomeProd = ' + #39 + Prod.getnomeProd + #39 + '');
         DM.ZQuery1.Open;

         if(DM.ZQuery1.EOF) then
         begin
             result := 1;
         end
         else
         begin
             result := 0;
         end;
     end;

     Procedure Controle.AlterarEstqParaVendaCancelada;
     var
         codigo : integer;
         DM2    : TDM;
     begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT codProd FROM Produto, ItemDeVenda, Venda WHERE Produto.codProd = ItemDeVenda.Produto_codProd AND ItemDeVenda.Venda_codVenda = Venda.codVenda AND Venda.codVenda = '+ IntToStr(Vd.getcodVenda) + '');
         DM.ZQuery1.Open;

         DM2 := TDM.Create(NIL);
         While (NOT DM.ZQuery1.EOF) do
         begin
             codigo := DM.ZQuery1.FieldByName('codProd').AsInteger;

             DM2.ZQuery1.SQL.Clear;
             DM2.ZQuery1.SQL.Add('UPDATE Estoque SET qtdPesoEstqAtual = qtdPesoEstqAtual + (qtdPesoEstqAntg  -  qtdPesoEstqAtual) WHERE Estoque.Produto_codProd = ' + IntToStr(codigo) + '');
             DM2.ZQuery1.ExecSQL;

             DM2.ZQuery1.SQL.Clear;
             DM2.ZQuery1.SQL.Add('UPDATE Estoque SET qtdUnitEstqAtual = qtdUnitEstqAtual + (qtdUnitEstqAntg  -  qtdUnitEstqAtual) WHERE Estoque.Produto_codProd = ' + IntToStr(codigo) + '');
             DM2.ZQuery1.ExecSQL;

             DM.ZQuery1.Next;
         end;
     end;

     Procedure Controle.ExcluirTodosItemDeVenda;
     begin
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('DELETE FROM itemdevenda WHERE Venda_codVenda = ' + IntToStr(Vd.getcodVenda) + '');
         DM.ZQuery1.ExecSQL;
     end;

     Procedure Controle.ExcluirVenda;
     begin
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('DELETE FROM Venda WHERE codVenda = ' + IntToStr(Vd.getcodVenda) + '');
         DM.ZQuery1.ExecSQL;
     end;


     procedure Controle.ExcluirUnicoItemDeVendaDaLista;
     begin
         //Alterando o Estoque para Atual para Antigo.
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('UPDATE Estoque SET qtdPesoEstqAtual = qtdPesoEstqAtual + (qtdPesoEstqAntg  -  qtdPesoEstqAtual) WHERE Estoque.Produto_codProd = ' + IntToStr(Prod.getcodProd) + '');
         DM.ZQuery1.ExecSQL;

         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('UPDATE Estoque SET qtdUnitEstqAtual = qtdUnitEstqAtual + (qtdUnitEstqAntg  -  qtdUnitEstqAtual) WHERE Estoque.Produto_codProd = ' + IntToStr(Prod.getcodProd) + '');
         DM.ZQuery1.ExecSQL;

         //Excluindo um único item da lista de venda.
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('DELETE FROM ItemDeVenda WHERE codItemVend = ' + IntToStr(ItVend.getcodItemVend) + ' AND Venda_codVenda = ' + IntToStr(Vd.getcodVenda) + '');
         DM.ZQuery1.ExecSQL;

         //Recalcular Valor Total de Venda
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT sum(valpag) FROM itemdevenda WHERE Venda_codVenda = ' + IntToStr(Vd.getcodVenda) + '');
         DM.ZQuery1.Open;
         Vd.setvalTotVenda(DM.ZQuery1.FieldByName('sum(valpag)').AsFloat);
     end;

     procedure Controle.ClienteVenda;
     begin
         //Buscar dados de cliente relacionado a venda...
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Cliente, Venda WHERE codCli = Cliente_codCli AND codVenda = ' + IntToStr(Vd.getcodVenda) + '');
         DM.ZQuery1.Open;
     end;

     procedure Controle.ProdutosVenda;
     begin
         //Buscar Dados relacionado aos Produtos da Venda.
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Produto, ItemDeVenda, Venda WHERE codProd = Produto_codProd AND  Venda_codVenda = codVenda AND codVenda = ' + IntToStr(Vd.getcodVenda) + '');
         DM.ZQuery1.Open;
     end;

     Procedure Controle.SomaValPagoItemDeVenda;
     begin
         //Recalcular Valor Total de Venda
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Add('SELECT sum(valpag) FROM itemdevenda WHERE Venda_codVenda = ' + IntToStr(Vd.getcodVenda) + '');
         DM.ZQuery1.Open;
     end;

     function Controle.VerifarClientePorVendaAberta:integer;
     var
         status : string;
     begin
         status := 'A';
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Cliente, Venda WHERE statusVenda = ' + #39 + status + #39 + ' AND Cliente_codCli = codCli AND codCli = '+ IntToStr(Cli.getCodCli) + '');
         DM.ZQuery1.Open;

         if(DM.ZQuery1.EOF) then
         begin
             result := 0;
         end
         else
         begin
             result := 1;
         end;
     end;


//Realizar Pagamento

    Procedure Controle.BuscarVendasRealizadasPorCliente;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM Pagamento, Venda, Cliente WHERE statusPag = ' + #39 + 'NP' + #39 + ' AND Venda_codVenda = codVenda AND statusVenda = ' + #39 + 'A' + #39 + ' AND Cliente_codCli = codCli AND nomeCli LIKE ' + #39 + Cli.getnomeCli + #39 + '"%"''''ORDER BY nomeCli');
        DM.ZQuery1.Open;

        if(NOT DM.ZQuery1.EOF) then
        begin
            self.AtriBDadosCliente;
        end
        else
        begin
            Cli.setCodCli(-1);
        end;
    end;

    Procedure Controle.BuscarVendasRealizadasPorClienteCodCli;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM Pagamento, Venda, Cliente');
        DM.ZQuery1.SQL.Add('WHERE Pagamento.statusPag = '+ #39 + 'NP' + #39 +' AND Pagamento.Venda_codVenda = Venda.codVenda');
        DM.ZQuery1.SQL.Add('AND statusVenda = '+ #39 + 'A' + #39 +' AND Venda.Cliente_codCli = Cliente.codCli');
        DM.ZQuery1.SQL.Add('AND Cliente.codCli = '+ IntToStr(Cli.getCodCli) +'');
        DM.ZQuery1.Open;

        if(NOT DM.ZQuery1.EOF) then
        begin
            self.AtriBDadosCliente;
        end
        else
        begin
            Cli.setCodCli(-1);
        end;
    end;

    Procedure Controle.BuscarVendasRealizadasPorClienteTelCli;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM Pagamento, Venda, Cliente, Telefone ');
        DM.ZQuery1.SQL.Add('WHERE Pagamento.statusPag = '+ #39 + 'NP'+ #39 +' AND Pagamento.Venda_codVenda = Venda.codVenda');
        DM.ZQuery1.SQL.Add('AND statusVenda = '+ #39 + 'A' + #39 +' AND Venda.Cliente_codCli = Cliente.codCli');
        DM.ZQuery1.SQL.Add('AND Cliente.codCli = Telefone.Cliente_codCli ');
        DM.ZQuery1.SQL.Add('AND Telefone.telcont1 = '+ #39 + Tel.getTelCont1 + #39 +' OR Telefone.telcont2 = '+ #39 + Tel.getTelCont2 + #39 +'');
        DM.ZQuery1.Open;

        if(NOT DM.ZQuery1.EOF) then
        begin
            self.AtriBDadosCliente;
        end
        else
        begin
            Cli.setCodCli(-1);
        end;
    end;

    Procedure Controle.ListarTodasVendasRealizadasPorCliente;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM Pagamento, Venda, Cliente WHERE statusPag = ' + #39 + 'NP' + #39 + ' AND Venda_codVenda = codVenda AND statusVenda = ' + #39 + 'A' + #39 + ' AND Cliente_codCli = codCli ORDER BY nomeCli');
        DM.ZQuery1.Open;
    end;

    Procedure Controle.BuscarRegPagtoPorVendaNP;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM Cliente, Venda, Pagamento WHERE Venda_codVenda = codVenda AND statusPag = '+ #39 + 'NP' + #39 +' AND statusVenda = '+ #39 + 'A' + #39 +' AND Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
        DM.ZQuery1.Open;

        self.AtriBDadosCliente;
        self.AtribDadosVenda;
        self.AtribDadosPagto;
    end;

    Procedure Controle.AtribDadosVenda;
    begin
        Vd.setcodVenda(DM.ZQuery1.FieldByName('codVenda').AsInteger);
        Vd.setdataVenda(DM.ZQuery1.FieldByName('dataVenda').AsDateTime);
        Vd.setvalTotVenda(DM.ZQuery1.FieldByName('valtotvenda').AsFloat);
        Vd.setStatusVenda(DM.ZQuery1.FieldByName('statusVenda').AsString);
    end;

    Procedure Controle.AtribDadosPagto;
    begin
        Pg.setcodPag(DM.ZQuery1.FieldByName('codPag').AsInteger);
        Pg.setvalpag(DM.ZQuery1.FieldByName('valorPagto').AsFloat);
        Pg.setstatusPag(DM.ZQuery1.FieldByName('statusPag').AsString);
        Pg.setdataPag(DM.ZQuery1.FieldByName('dataVenda').AsDateTime);
        Pg.setTipoPag(DM.ZQuery1.FieldByName('tipoPag').AsString);
    end;

    function Controle.MaxCodCartao:integer;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT MAX(codCartao) FROM pagamentocartao');
        DM.ZQuery1.Open;
        result := DM.ZQuery1.FieldByName('MAX(codCartao)').AsInteger;
    end;

    Procedure Controle.AlterarRegPagto(DM:TDM);
    begin
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('UPDATE Pagamento SET statusPag = ' + #39 + Pg.getstatusPag              + #39 +
                                          ', valorPagto    = ' + FloatToStr(Pg.getvalpag)                 +
                                          ', dataPag       = ' + FormatDateTime('YYYYMMDD',Pg.getdataPag) +
                                          ', tipoPag       = ' + #39 + Pg.getTipoPag                + #39 +
                                          '  WHERE codPag  = ' + IntToStr(Pg.getcodPag)                   + '');
        DM.ZQuery1.ExecSQL;
    end;

    Procedure Controle.AlterarRegVenda(DM:TDM);
    begin
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('UPDATE Venda SET dataVenda      = ' + FormatDateTime('YYYYMMDD',Vd.getdataVenda) +
                                          ', valtotvenda    = ' + FloatToStr(Vd.getValTotVenda)              +
                                          ', statusVenda    = ' + #39 + Vd.getStatusVenda                    + #39 +
                                          '  WHERE codVenda = ' + IntToStr(Vd.getcodVenda)                   +   '');
        DM.ZQuery1.ExecSQL;
    end;

    Procedure Controle.IncluirCartao(DM:TDM);
    begin
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('INSERT INTO PagamentoCartao VALUES (' + IntToStr(PgCart.getcodCartao)                       + ','
                                                                  + IntToStr(Pg.getcodPag)                              + ','
                                                                  + #39 + PgCart.getbandCartao                    + #39 + ','
                                                                  + FormatDateTime('YYYYMMDD',PgCart.getdataVencCartao) +
                                                                ')');
        DM.ZQuery1.ExecSQL;
    end;

    Procedure Controle.IncluirCheque(DM:TDM);
    begin
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('INSERT INTO PagamentoCheque VALUES (' + IntToStr(PgCheq.getnumCheq)      + ','
                                                                  + IntToStr(Pg.getcodPag)           + ','
                                                                  + IntToStr(PgCheq.getcontaCheq)    + ','
                                                                  + IntToStr(PgCheq.getagenciaCheq)  + ','
                                                                  + #39 + PgCheq.getbancoCheq + #39  +
                                                                ')');
        DM.ZQuery1.ExecSQL;
    end;

    Procedure Controle.FecharVenda(codigo:integer; DM:TDM);
    begin
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('UPDATE Venda SET statusVenda    = ' + #39 +    'F'       + #39 +
                                          ' WHERE codVenda  = ' + IntToStr(codigo)   + '');
        DM.ZQuery1.ExecSQL;
    end;

    //Realizar Compra
    Procedure Controle.ListarPessoaJuridica;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM PessoaJuridica, Fornecedor WHERE Fornecedor_codForn = codForn AND statusForn = ' + #39 + 'Ativo' + #39 + '');
        DM.ZQuery1.Open;
    end;

    Procedure Controle.ListarPessoaFisica;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM PessoaFisica, Fornecedor WHERE Fornecedor_codForn = codForn AND statusForn = ' + #39 + 'Ativo' + #39 + '');
        DM.ZQuery1.Open;
    end;

    Function Controle.GerarMaxPedComp:integer;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT MAX(codPedCompra) FROM PedidoDeCompra');
        DM.ZQuery1.Open;
        result := DM.ZQuery1.FieldByName('MAX(codPedCompra)').AsInteger;
    end;

    Function Controle.GerarMaxItemPed:integer;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT MAX(codItemPed) FROM ItemDePedido');
        DM.ZQuery1.Open;
        result := DM.ZQuery1.FieldByName('MAX(codItemPed)').AsInteger;
    end;


    Procedure Controle.CriarRegPedCompra;
    begin
        DM.ZQuery1.SQL.Clear;

        DM.ZQuery1.SQL.Add('INSERT INTO PedidoDeCompra VALUES (' + IntToStr(PdComp.getcodPedCompra)                   + ','
                                                                 + IntToStr(Forn.getcodForn)                          + ','
                                                                 + FloatToStr(PdComp.getValTotPedCompra)              + ','
                                                                 + FormatDateTime('YYYYMMDD',PdComp.getdataPedCompra) + ','
                                                                 + #39 + pdComp.getstatusCompra                 + #39 +
                                                               ')');
        DM.ZQuery1.ExecSQL;
    end;

    Procedure Controle.IncluirItemPed;
    begin
        DM.ZQuery1.SQL.Clear;
        DecimalSeparator := '.';
        DM.ZQuery1.SQL.Add('INSERT INTO ItemDePedido VALUES (' + IntToStr(ItemPed.getcodItemPed)       + ','
                                                               + IntToStr(Prod.getcodProd)             + ','
                                                               + IntToStr(PdComp.getcodPedCompra)      + ','
                                                               + IntToStr(ItemPed.getqtdUnitItemPed)   + ','
                                                               + FloatToStr(ItemPed.getvalPagItemPed)  + ','
                                                               + FloatToStr(ItemPed.getqtdPesoItemPed) +
                                                             ')');
        DM.ZQuery1.ExecSQL;
    end;

    Procedure Controle.ListarItensPorCodPedidoDeCompra;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM ItemDePedido, PedidoDeCompra, Produto WHERE codProd = Produto_codProd AND PedidoDeCompra_codPedCompra = codPedCompra AND codPedCompra = ' + IntToStr(PdComp.getcodPedCompra) + '');
        DM.ZQuery1.Open;
    end;

    procedure Controle.ExcluirUnicoItemDePedidoDaLista;
    begin
        //Excluindo um único item da lista de venda.
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('DELETE FROM ItemDePedido WHERE codItemPed = ' + IntToStr(ItemPed.getcodItemPed) + ' AND PedidoDeCompra_codPedCompra = ' + IntToStr(PdComp.getcodPedCompra) + '');
        DM.ZQuery1.ExecSQL;

        //Recalcular Valor Total do Pedido de Compra
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT sum(valorPag) FROM itemdepedido WHERE PedidoDeCompra_codPedCompra = ' + IntToStr(PdComp.getcodPedCompra) + '');
        DM.ZQuery1.Open;
        PdComp.setvalTotPedCompra(DM.ZQuery1.FieldByName('sum(valorPag)').AsFloat);
   end;

   procedure Controle.CancelarRealizacaoDeCompra;
   begin
       //Excluindo todos os iténs do Pedido de Compra.
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('DELETE FROM ItemDePedido WHERE PedidoDeCompra_codPedCompra = ' + IntToStr(PdComp.getcodPedCompra) + '');
       DM.ZQuery1.ExecSQL;

       //Excluindo Registro de Pedido de Compra.
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('DELETE FROM PedidoDeCompra WHERE codPedCompra = ' + IntToStr(PdComp.getcodPedCompra) + '');
       DM.ZQuery1.ExecSQL;
   end;

   Procedure Controle.AlterarPedCompra;
   begin
       DM.ZQuery1.SQL.Clear;
       DecimalSeparator := '.';
       DM.ZQuery1.SQL.Add ('UPDATE PedidoDeCompra SET valtotcompra       = ' + FloatToStr(PdComp.getValTotPedCompra)               +
                                                   ', dataCompra         = ' + FormatDateTime('YYYYMMDD',PdComp.getdataPedCompra)  +
                                                   ', statusCompra       = ' + #39 + PdComp.getstatusCompra                        + #39 +
                                                   '  WHERE codPedCompra = ' + IntToStr(PdComp.getcodPedCompra)                    +   '');


        DM.ZQuery1.ExecSQL;
   end;

   Procedure Controle.BuscarPJPedidoDeCompra;
   begin
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PessoaJuridica, Fornecedor WHERE Fornecedor_codForn = (SELECT codForn FROM Fornecedor, PedidoDeCompra WHERE codForn = Fornecedor_codForn AND codPedCompra = ' + IntToStr(PdComp.getcodPedCompra) + ')');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.BuscarPFPedidoDeCompra;
   begin
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PessoaFisica, Fornecedor, PedidoDeCompra WHERE PessoaFisica.Fornecedor_codForn = codForn AND codForn = PedidoDeCompra.Fornecedor_codForn AND codPedCompra = ' + IntToStr(PdComp.getcodPedCompra) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ListarProdutosCompra;
   begin
       //Buscar Dados relacionado aos Produtos da compra.
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Produto, ItemDePedido, PedidoDeCompra WHERE codProd = Produto_codProd AND  PedidoDeCompra_codPedCompra = codPedCompra AND codPedCompra = ' + IntToStr(PdComp.getcodPedCompra) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.AtribuiDadosPedidoDeCompra;
   begin
       DecimalSeparator := ',';
       PdComp.setcodPedCompra(DM.ZQuery1.FieldByName('codPedCompra').AsInteger);
       PdComp.setdataPedCompra(DM.ZQuery1.FieldByName('dataCompra').AsDateTime);
       PdComp.setvalTotPedCompra(DM.ZQuery1.FieldByName('valTotCompra').AsFloat);
       PdComp.setstatusCompra(DM.ZQuery1.FieldByName('statusCompra').AsString);
   end;

   Procedure Controle.SomaValorPagoItemPed;
   begin
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT sum(valorPag) FROM ItemDePedido, PedidoDeCompra WHERE PedidoDeCompra_codPedCompra = codPedCompra AND codPedCompra = ' + IntToStr(PdComp.getcodPedCompra) + '');
       DM.ZQuery1.Open;
   end;

   function Controle.VerifarItemPedNaLista:integer;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Produto, ItemDePedido, PedidoDeCompra WHERE Produto_codProd = codProd AND PedidoDeCompra_codPedCompra = codPedCompra AND codPedCompra = ' + IntToStr(PdComp.getcodPedCompra) + ' AND nomeProd = ' + #39 + Prod.getnomeProd + #39 + '');
       DM.ZQuery1.Open;

       if(DM.ZQuery1.EOF) then
       begin
           result := 0;
       end
       else
       begin
           result := 1;
       end;
   end;


    function Controle.VerifarFornecedorPorCompraAberta:integer;
    var
        status : string;
    begin
        status := 'A';
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM Fornecedor, pedidodecompra WHERE statuscompra = ' + #39 + status + #39 + ' AND Fornecedor_codForn = codForn AND codForn = '+ IntToStr(Forn.getcodForn) + '');
        DM.ZQuery1.Open;

        if(DM.ZQuery1.EOF) then
        begin
            result := 0;
        end
        else
        begin
            result := 1;
        end;
    end;




//Controlar Estoque

    Procedure Controle.ListarTodosEstq;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT precoProd, codProd, nomeProd, catProd, qtdUnitEstqAtual, qtdPesoEstqAtual, (QtdUnitEstqAtual * precoProd), tipoMedProd FROM Produto, Estoque WHERE codProd = Produto_codProd AND (QtdUnitEstqAtual * precoProd) > 0 AND qtdUnitEstqAtual > 0 ');
        DM.ZQuery1.SQL.Add('UNION SELECT precoProd, codProd, nomeProd, catProd, qtdUnitEstqAtual, qtdPesoEstqAtual, (QtdPesoEstqAtual * precoProd), tipoMedProd FROM Produto, Estoque ');
        DM.ZQuery1.SQL.Add('WHERE codProd = Produto_codProd AND (QtdPesoEstqAtual * precoProd) > 0 AND qtdPesoEstqAtual > 0 ');
        DM.ZQuery1.Open;
    end;

    Procedure Controle.SomaQtdProdEstq;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT count(codProd) from Produto, Estoque WHERE Produto_codProd = codProd');
        DM.ZQuery1.Open;
    end;


    Procedure Controle.SomatorioPrecoQtdEstoque;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT SUM(precoProd * qtdUnitEstqAtual + precoProd * qtdPesoEstqAtual) from Produto, Estoque WHERE Produto_codProd = codProd ');
        DM.ZQuery1.Open;
    end;

    Procedure Controle.SomaEstqPorCatg;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT sum(precoProd) from Produto, Estoque WHERE Produto_codProd = codProd ');
        DM.ZQuery1.Open;
    end;

    Procedure Controle.ListarTodosEstqPorCatg;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.Open;
    end;

    Procedure Controle.ListarTodosProdEstqZero;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM Produto, Estoque WHERE');
        DM.ZQuery1.SQL.Add('codProd = Produto_codProd AND');
        DM.ZQuery1.SQL.Add('Estoque.qtdPesoEstqAtual = 0 ');
        DM.ZQuery1.SQL.Add('AND Estoque.qtdUnitEstqAtual = 0');
        DM.ZQuery1.Open;
    end;

    Procedure Controle.QtdProdEstqZero;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('Select count(codProd) FROM Estoque, Produto WHERE codProd = Produto_codProd AND qtdPesoEstqAtual = 0 AND qtdUnitEstqAtual = 0');
        DM.ZQuery1.Open;
    end;

    Procedure Controle.ListarTodosProdEstqAbaixoDoMin;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM Produto, Estoque WHERE');
        DM.ZQuery1.SQL.Add('Produto.codProd = Estoque.Produto_codProd AND');
        DM.ZQuery1.SQL.Add('Estoque.qtdPesoEstqAtual < Estoque.qtdMinEstq AND');
        DM.ZQuery1.SQL.Add('Estoque.qtdUnitEstqAtual < Estoque.qtdMinEstq');
        DM.ZQuery1.Open;
    end;

    Procedure Controle.ListarProdPorPorcAcimaDoEstq(valor:real);
    var
        porc : real;
    begin
        DecimalSeparator := '.';
        porc := (valor/100) + 1;
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT * FROM Produto, Estoque ');
        DM.ZQuery1.SQL.Add('WHERE Produto.codProd = Estoque.Produto_codProd ');
        DM.ZQuery1.SQL.Add('AND ((qtdPesoEstqAtual >= (qtdMinEstq * '+ FloatToStr(porc) + ')))');
        DM.ZQuery1.SQL.Add('UNION');
        DM.ZQuery1.SQL.Add('SELECT * FROM Produto, Estoque ');
        DM.ZQuery1.SQL.Add('WHERE Produto.codProd = Estoque.Produto_codProd ');
        DM.ZQuery1.SQL.Add('AND ((qtdUnitEstqAtual >= (qtdMinEstq * ' + FloatToStr(porc) + ')))');
        DM.ZQuery1.Open;
    end;

    Procedure Controle.QtdProdEstqAbaixoDoMin;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT COUNT(*) FROM Produto, Estoque WHERE');
        DM.ZQuery1.SQL.Add('Produto.codProd = Estoque.Produto_codProd AND');
        DM.ZQuery1.SQL.Add('Estoque.qtdPesoEstqAtual < Estoque.qtdMinEstq AND');
        DM.ZQuery1.SQL.Add('Estoque.qtdUnitEstqAtual < Estoque.qtdMinEstq');
        DM.ZQuery1.Open;
    end;


//Controlar Venda


    //Relatório de Todos Produtos Vendidos
    Procedure Controle.ListarTodosProdVend;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add ('SELECT * ');
        DM.ZQuery1.SQL.Add ('FROM Produto, ItemDeVenda, Venda ');
        DM.ZQuery1.SQL.Add ('WHERE');
        DM.ZQuery1.SQL.Add ('codProd = Produto_codProd ');
        DM.ZQuery1.SQL.Add ('AND Venda_codVenda = codVenda');
        DM.ZQuery1.Open;
    end;

    Procedure Controle.SomaValPagoTodosProdVend;
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT sum(valpag) FROM Produto, ItemDeVenda, Venda ');
        DM.ZQuery1.SQL.Add('WHERE codProd = Produto_codProd AND ');
        DM.ZQuery1.SQL.Add('Venda_codVenda = codVenda ');
        DM.ZQuery1.Open;
    end;

     //Por Período
    Procedure Controle.ListarTodosProdVendPorPeriodo(dataInicio:TDateTime; dataFim:TDateTime);
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add ('SELECT * ');
        DM.ZQuery1.SQL.Add ('FROM Produto, ItemDeVenda, Venda ');
        DM.ZQuery1.SQL.Add ('WHERE');
        DM.ZQuery1.SQL.Add ('codProd = Produto_codProd ');
        DM.ZQuery1.SQL.Add ('AND Venda_codVenda = codVenda');
        DM.ZQuery1.SQL.Add ('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
        DM.ZQuery1.Open;
    end;

    Procedure Controle.SomaValPagoTodosProdVendPorPeriodo(dataInicio:TDateTime; dataFim:TDateTime);
    begin
        DM.ZQuery1.Close;
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('SELECT sum(valpag) FROM Produto, ItemDeVenda, Venda ');
        DM.ZQuery1.SQL.Add('WHERE codProd = Produto_codProd AND ');
        DM.ZQuery1.SQL.Add('Venda_codVenda = codVenda ');
        DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
        DM.ZQuery1.Open;
   end;

   //Relatório por Cliente
   Procedure Controle.QtdVendaPorCli;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(codVenda) FROM Cliente, Venda ');
       DM.ZQuery1.SQL.Add('WHERE Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.DataPrimVendaCli;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MIN(dataVenda) FROM Cliente, Venda');
       DM.ZQuery1.SQL.Add('WHERE Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.DataUltVendaCli;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MAX(dataVenda) FROM Cliente, Venda');
       DM.ZQuery1.SQL.Add('WHERE Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.VendaMenorValorCli;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MIN(valtotvenda) FROM Cliente, Venda');
       DM.ZQuery1.SQL.Add('WHERE Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.VendaMaiorValorCli;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MAX(valtotvenda) FROM Cliente, Venda');
       DM.ZQuery1.SQL.Add('WHERE Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ValTotVendaPorCli;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotvenda) FROM Cliente, Venda');
       DM.ZQuery1.SQL.Add('WHERE Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ListarProdVendaCli;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Produto, ItemDeVenda, Venda, Cliente');
       DM.ZQuery1.SQL.Add('WHERE codProd = Produto_codProd AND Venda_codVenda = codVenda AND');
       DM.ZQuery1.SQL.Add('Cliente_codCli = codCli AND');
       DM.ZQuery1.SQL.Add('codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.Open;
   end;

   //Relatório por Cliente (Periódico)
   Procedure Controle.QtdVendaPorCliPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(codVenda) FROM Cliente, Venda ');
       DM.ZQuery1.SQL.Add('WHERE Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.DataPrimVendaCliPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MIN(dataVenda) FROM Cliente, Venda');
       DM.ZQuery1.SQL.Add('WHERE Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.DataUltVendaCliPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MAX(dataVenda) FROM Cliente, Venda');
       DM.ZQuery1.SQL.Add('WHERE Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.VendaMenorValorCliPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MIN(valtotvenda) FROM Cliente, Venda');
       DM.ZQuery1.SQL.Add('WHERE Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.VendaMaiorValorCliPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MAX(valtotvenda) FROM Cliente, Venda');
       DM.ZQuery1.SQL.Add('WHERE Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ValTotVendaPorCliPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotvenda) FROM Cliente, Venda');
       DM.ZQuery1.SQL.Add('WHERE Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ListarProdVendaCliPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Produto, ItemDeVenda, Venda, Cliente');
       DM.ZQuery1.SQL.Add('WHERE codProd = Produto_codProd AND Venda_codVenda = codVenda AND');
       DM.ZQuery1.SQL.Add('Cliente_codCli = codCli AND');
       DM.ZQuery1.SQL.Add('codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   function Controle.VerificarPossuiProdNaLista:integer;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM ItemDeVenda, Venda');
       DM.ZQuery1.SQL.Add('WHERE ItemDeVenda.Venda_codVenda = codVenda');
       DM.ZQuery1.SQL.Add('AND codVenda = ' + IntToStr(Vd.getcodVenda) +'');
       DM.ZQuery1.Open;

       if(DM.ZQuery1.EOF) then
       begin
           result := 1;  //Não possui produto na lista.
       end
       else
       begin
           result := 0;  //Possui produto na lista.
       end;
    end;

   //Relatório sobre os Valores Totais de Venda.
   Procedure Controle.QtdVendasRealizadas;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(*) FROM Venda');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.QtdVendasAberta;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(*) FROM Venda');
       DM.ZQuery1.SQL.Add('WHERE statusVenda = ' + #39 + 'A' + #39 + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.QtdVendasFechadas;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(*) FROM Venda');
       DM.ZQuery1.SQL.Add('WHERE statusVenda = ' + #39 + 'F' + #39 + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ValTotVendaAberta;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotvenda) FROM Venda');
       DM.ZQuery1.SQL.Add('WHERE statusVenda = ' + #39 + 'F' + #39 + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ValTotVendaFechada;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotvenda) FROM Venda');
       DM.ZQuery1.SQL.Add('WHERE statusVenda = ' + #39 + 'A' + #39 + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ValTotVenda;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotvenda) FROM Venda');
       DM.ZQuery1.Open;
   end;

   //Relatório sobre os Valores Totais de Venda Por Período.
   Procedure Controle.QtdVendasRealizadasPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(*) FROM Venda WHERE');
       DM.ZQuery1.SQL.Add('dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.QtdVendasAbertaPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(*) FROM Venda');
       DM.ZQuery1.SQL.Add('WHERE statusVenda = ' + #39 + 'A' + #39 + '');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.QtdVendasFechadasPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(*) FROM Venda');
       DM.ZQuery1.SQL.Add('WHERE statusVenda = ' + #39 + 'F' + #39 + '');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ValTotVendaAbertaPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotvenda) FROM Venda');
       DM.ZQuery1.SQL.Add('WHERE statusVenda = ' + #39 + 'F' + #39 + '');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ValTotVendaFechadaPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotvenda) FROM Venda');
       DM.ZQuery1.SQL.Add('WHERE statusVenda = ' + #39 + 'A' + #39 + '');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ValTotVendaPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotvenda) FROM Venda');
       DM.ZQuery1.SQL.Add('WHERE dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   //Relatório sobre Produtos Vendidos
   Procedure Controle.SomaValTotPagPorProd;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valpag) FROM ItemDeVenda, Produto WHERE');
       DM.ZQuery1.SQL.Add('ItemDeVenda.Produto_codProd = Produto.codProd');
       DM.ZQuery1.SQL.Add('AND Produto.nomeProd = ' + #39 + Prod.getnomeProd + #39 + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.SomaValTotPagPorProdPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valpag) FROM ItemDeVenda, Produto, Venda');
       DM.ZQuery1.SQL.Add('WHERE ItemDeVenda.Produto_codProd = Produto.codProd');
       DM.ZQuery1.SQL.Add('AND Produto.nomeProd = ' + #39 + Prod.getnomeProd + #39 + '');
       DM.ZQuery1.SQL.Add('AND ItemDeVenda.Venda_codVenda = Venda.codVenda');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.SomaQtdVendPorProdPeso;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(qtdpesoVend) FROM ItemDeVenda, Produto  WHERE');
       DM.ZQuery1.SQL.Add('ItemDeVenda.Produto_codProd = Produto.codProd');
       DM.ZQuery1.SQL.Add('AND Produto.nomeProd = ' + #39 + Prod.getnomeProd + #39 +'');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.SomaQtdVendPorProdPesoPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(qtdpesoVend) FROM ItemDeVenda, Produto, Venda');
       DM.ZQuery1.SQL.Add('WHERE ItemDeVenda.Produto_codProd = Produto.codProd');
       DM.ZQuery1.SQL.Add('AND Produto.nomeProd = ' + #39 + Prod.getnomeProd + #39 + '');
       DM.ZQuery1.SQL.Add('AND ItemDeVenda.Venda_codVenda = Venda.codVenda');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.SomaQtdVendPorProdUNID;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(qtdUnitVend) FROM ItemDeVenda, Produto  WHERE');
       DM.ZQuery1.SQL.Add('ItemDeVenda.Produto_codProd = Produto.codProd');
       DM.ZQuery1.SQL.Add('AND Produto.nomeProd = ' + #39 + Prod.getnomeProd + #39 +'');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.SomaQtdVendPorProdUNIDPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(qtdunitVend) FROM ItemDeVenda, Produto, Venda');
       DM.ZQuery1.SQL.Add('WHERE ItemDeVenda.Produto_codProd = Produto.codProd');
       DM.ZQuery1.SQL.Add('AND Produto.nomeProd = ' + #39 + Prod.getnomeProd + #39 + '');
       DM.ZQuery1.SQL.Add('AND ItemDeVenda.Venda_codVenda = Venda.codVenda');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ContaRelacaoProdutoVenda;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT Count(Venda.codVenda) FROM Venda, ItemDeVenda, Produto');
       DM.ZQuery1.SQL.Add('WHERE Venda.codVenda = ItemDeVenda.Venda_codVenda AND');
       DM.ZQuery1.SQL.Add('ItemDeVenda.Produto_codProd = Produto.codProd AND');
       DM.ZQuery1.SQL.Add('Produto.nomeProd = '+ #39 + Prod.getNomeProd + #39 +'');
       DM.ZQuery1.Open;
   end;
   
   Procedure Controle.ContaRelacaoProdutoVendaPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT Count(Venda.codVenda) FROM Venda, ItemDeVenda, Produto');
       DM.ZQuery1.SQL.Add('WHERE Venda.codVenda = ItemDeVenda.Venda_codVenda AND');
       DM.ZQuery1.SQL.Add('ItemDeVenda.Produto_codProd = Produto.codProd AND');
       DM.ZQuery1.SQL.Add('Produto.nomeProd = '+ #39 + Prod.getNomeProd + #39 +'');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   //Relatório sobre Venda por Categoria de Produtos:
   Procedure Controle.SomarValorPagoPorCatg;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valpag) FROM Venda, ItemDeVenda, Produto where');
       DM.ZQuery1.SQL.Add('codVenda = Venda_codVenda AND Produto_codProd = codProd');
       DM.ZQuery1.SQL.Add('AND catProd = ' + #39 + Prod.getcatProd  + #39 + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ListarProdVendaPorCatg;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Venda, ItemDeVenda, Produto WHERE');
       DM.ZQuery1.SQL.Add('codVenda = Venda_codVenda AND Produto_codProd = codProd');
       DM.ZQuery1.SQL.Add('AND catProd = ' + #39 + Prod.getcatProd  + #39 + '');
       DM.ZQuery1.Open;
   end;

   //Relatório sobre Venda por Categoria de Produtos num dado Período
   Procedure Controle.SomarValorPagoPorCatgPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valpag) FROM Venda, ItemDeVenda, Produto where');
       DM.ZQuery1.SQL.Add('codVenda = Venda_codVenda AND Produto_codProd = codProd');
       DM.ZQuery1.SQL.Add('AND catProd = ' + #39 + Prod.getcatProd  + #39 + '');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ListarProdVendaPorCatgPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Venda, ItemDeVenda, Produto WHERE');
       DM.ZQuery1.SQL.Add('codVenda = Venda_codVenda AND Produto_codProd = codProd');
       DM.ZQuery1.SQL.Add('AND catProd = ' + #39 + Prod.getcatProd  + #39 + '');
       DM.ZQuery1.SQL.Add('AND dataVenda BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

    //Controle
   Procedure Controle.BuscarCliNOMEVendaAberta;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Cliente, Venda ');
       DM.ZQuery1.SQL.Add('WHERE codCli = Venda.Cliente_codCli AND ');
       DM.ZQuery1.SQL.Add('statusVenda = '+ #39 + 'A' + #39 +'');
       DM.ZQuery1.SQL.Add('AND nomeCli LIKE ' + #39 + Cli.getnomeCli + #39 + '"%"');
       DM.ZQuery1.Open;

       if(NOT DM.ZQuery1.EOF) then
       begin
           self.AtriBDadosCliente;
           self.AtribDadosVenda;
       end
       else
       begin
           Cli.setCodCli(-1);
       end;
   end;

   Procedure Controle.BuscarCliTELVendaAberta;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Venda, Cliente, Telefone');
       DM.ZQuery1.SQL.Add('WHERE Venda.statusVenda = '+ #39 + 'A' + #39 +'');
       DM.ZQuery1.SQL.Add('AND Venda.Cliente_codCli = Cliente.codCli AND');
       DM.ZQuery1.SQL.Add('Cliente.codCli = Telefone.Cliente_codCli AND');
       DM.ZQuery1.SQL.Add('Telefone.telcont1 = '+ #39 + Tel.getTelCont1 + #39 + 'OR');
       DM.ZQuery1.SQL.Add('Telefone.telcont2 = '+ #39 + Tel.getTelCont1 + #39 + '');
       DM.ZQuery1.Open;

       if(NOT DM.ZQuery1.EOF) then
       begin
           self.AtriBDadosCliente;
           self.AtribDadosVenda;
       end
       else
       begin
           Cli.setCodCli(-1);
       end;
   end;


   Procedure Controle.BuscarCliCODVendaAberta;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Cliente, Venda ');
       DM.ZQuery1.SQL.Add('WHERE codCli = Venda.Cliente_codCli AND ');
       DM.ZQuery1.SQL.Add('statusVenda = '+ #39 + 'A' + #39 +'');
       DM.ZQuery1.SQL.Add('AND codCli = '+ IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.Open;

       if(NOT DM.ZQuery1.EOF) then
       begin
           self.AtriBDadosCliente;
           self.AtribDadosVenda;
       end
       else
       begin
           Cli.setCodCli(-1);
       end;
   end;

   Procedure Controle.BuscarDadosVendaRealizada;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Produto, ItemDeVenda, Venda, Cliente');
       DM.ZQuery1.SQL.Add('WHERE codProd = ItemDeVenda.Produto_codProd AND ItemDeVenda.Venda_codVenda = codVenda AND');
       DM.ZQuery1.SQL.Add('statusVenda = '+ #39 + 'A' + #39 +'  AND codVenda = '+ IntToStr(Vd.getcodVenda) +' AND Venda.Cliente_codCli = codCli AND codCli = '+ IntToStr(Cli.getCodCli) +'');
       DM.ZQuery1.Open;

       if(NOT DM.ZQuery1.EOF) then
       begin
           self.AtriBDadosCliente;
           self.AtribDadosVenda;
       end;
   end;


   Procedure Controle.AlterarValorVenda;
   begin
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add  ('UPDATE Venda SET valtotvenda = ' + FloatToStr(Vd.getValTotVenda)               +
                                                            ' WHERE codVenda = ' + IntToStr(Vd.getcodVenda) + '');
       DM.ZQuery1.ExecSQL;
   end;


   //Controlar Compra
   //Manutenção das Compras
   Procedure Controle.ListarFornPorNomeCompraAberta;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * from PessoaFisica, Fornecedor, PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE PessoaFisica.Fornecedor_codForn = codForn ');
       DM.ZQuery1.SQL.Add('AND codForn = PedidoDeCompra.Fornecedor_codForn AND');
       DM.ZQuery1.SQL.Add('statusCompra = '+ #39 + 'A' + #39 +'');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ListarFornPorRazaoSocialCompraAberta;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * from PessoaJuridica, Fornecedor, PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE PessoaJuridica.Fornecedor_codForn = codForn ');
       DM.ZQuery1.SQL.Add('AND codForn = PedidoDeCompra.Fornecedor_codForn AND');
       DM.ZQuery1.SQL.Add('statusCompra = '+ #39 + 'A' + #39 +'');
       DM.ZQuery1.Open;
   end;

   

   //Relatório de Todos os Produtos comprados
   procedure Controle.ListarTodosProdComprados;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * From Produto, ItemDePedido, PedidoDeCompra, Fornecedor, PessoaJuridica ');
       DM.ZQuery1.SQL.Add('WHERE codProd = Produto_codProd AND PedidoDeCompra_codPedCompra = codPedCompra AND');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.Fornecedor_codForn = codForn AND PessoaJuridica.Fornecedor_codForn = codForn');
       DM.ZQuery1.SQL.Add('UNION');
       DM.ZQuery1.SQL.Add('SELECT * From Produto, ItemDePedido, PedidoDeCompra, Fornecedor, PessoaFisica');
       DM.ZQuery1.SQL.Add('WHERE codProd = Produto_codProd AND PedidoDeCompra_codPedCompra = codPedCompra AND');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.Fornecedor_codForn = codForn AND PessoaFisica.Fornecedor_codForn = codForn');
       DM.ZQuery1.Open;
   end;

   procedure Controle.SomarValorTotalDeCompra;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('select sum(valTotCompra) from PedidoDeCompra');
       DM.ZQuery1.Open;
   end;

   function Controle.ContarItensVenda:integer;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(*) FROM ItemDeVenda, Venda');
       DM.ZQuery1.SQL.Add('WHERE ItemDeVenda.Venda_codVenda = codVenda');
       DM.ZQuery1.SQL.Add('AND codVenda = ' + IntToStr(Vd.getcodVenda) + '');
       DM.ZQuery1.Open;
       result := DM.ZQuery1.FieldByName('count(*)').AsInteger;
   end;

   Procedure Controle.ExcluirRegPagamento;
   begin
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('DELETE FROM Pagamento WHERE Pagamento.Venda_codVenda = ' + IntToStr(Vd.getcodVenda) + '');
       DM.ZQuery1.ExecSQL;
   end;


   //Relatório de Todos os Produtos comprados por Período
   procedure Controle.ListarTodosProdCompradosPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * From Produto, ItemDePedido, PedidoDeCompra, Fornecedor, PessoaJuridica ');
       DM.ZQuery1.SQL.Add('WHERE codProd = Produto_codProd AND PedidoDeCompra_codPedCompra = codPedCompra AND');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.Fornecedor_codForn = codForn AND PessoaJuridica.Fornecedor_codForn = codForn');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.SQL.Add('UNION');
       DM.ZQuery1.SQL.Add('SELECT * From Produto, ItemDePedido, PedidoDeCompra, Fornecedor, PessoaFisica');
       DM.ZQuery1.SQL.Add('WHERE codProd = Produto_codProd AND PedidoDeCompra_codPedCompra = codPedCompra AND');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.Fornecedor_codForn = codForn AND PessoaFisica.Fornecedor_codForn = codForn');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   procedure Controle.SomarValorTotalDeCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotcompra) FROM PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   //Relatório sobre os Valores Totais de Compra:
   //Sem Período:
   procedure Controle.SomarQtdCompraRealizada;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(codpedCompra) FROM PedidoDeCompra');
       DM.ZQuery1.Open;
   end;

   procedure Controle.SomarQtdCompraAberta;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(codpedCompra) FROM PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE statusCompra = ' + #39 + 'A' + #39 +' ');
       DM.ZQuery1.Open;
   end;


   procedure Controle.SomarQtdCompraFechada;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(codpedCompra) FROM PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE statusCompra = ' + #39 + 'F' + #39 +' ');
       DM.ZQuery1.Open;
   end;

   procedure Controle.SomarValorTotalDeCompraFechada;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotcompra) FROM PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE statusCompra = ' + #39 + 'F' + #39 +' ');
       DM.ZQuery1.Open;
   end;

   procedure Controle.SomarValorTotalDeCompraAberta;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotcompra) FROM PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE statusCompra = ' + #39 + 'A' + #39 +' ');
       DM.ZQuery1.Open;
   end;

   procedure Controle.MaxValorTotalDeCompra;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MAX(valtotcompra) FROM PedidoDeCompra');
       DM.ZQuery1.Open;
   end;

   procedure Controle.MenValorTotalDeCompra;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MIN(valtotcompra) FROM PedidoDeCompra');
       DM.ZQuery1.Open;
   end;

   //Com Período:
   procedure Controle.SomarQtdCompraRealizadaPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(codpedCompra) FROM PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   procedure Controle.SomarQtdCompraAbertaPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(codpedCompra) FROM PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE statusCompra = ' + #39 + 'A' + #39 +' ');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;


   procedure Controle.SomarQtdCompraFechadaPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(codpedCompra) FROM PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE statusCompra = ' + #39 + 'F' + #39 +' ');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   procedure Controle.SomarValorTotalDeCompraFechadaPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotcompra) FROM PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE statusCompra = ' + #39 + 'F' + #39 +' ');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   procedure Controle.SomarValorTotalDeCompraAbertaPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotcompra) FROM PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE statusCompra = ' + #39 + 'A' + #39 +' ');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   procedure Controle.MaxValorTotalDeCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MAX(valtotcompra) FROM PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   procedure Controle.MenValorTotalDeCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MIN(valtotcompra) FROM PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

//--------------------------------------------------------------------------------------------

   //Relatório sobre Venda por Categoria de Produtos:
   Procedure Controle.SomarValorPagoPorCatgCompra;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valorpag) FROM PedidoDeCompra, ItemDePedido, Produto WHERE');
       DM.ZQuery1.SQL.Add('codPedCompra = PedidoDeCompra_codPedCompra AND Produto_codProd = codProd');
       DM.ZQuery1.SQL.Add('AND catProd = ' + #39 + Prod.getcatProd  + #39 + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ListarProdCompraPorCatg;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PessoaJuridica, Fornecedor, PedidoDeCompra, ItemDePedido, Produto WHERE');
       DM.ZQuery1.SQL.Add('PessoaJuridica.Fornecedor_codForn = codForn AND codForn = PedidoDeCompra.Fornecedor_codForn AND codPedCompra = PedidoDeCompra_codPedCompra AND Produto_codProd = codProd');
       DM.ZQuery1.SQL.Add('AND catProd = ' + #39 + Prod.getcatProd  + #39 + 'AND  PessoaJuridica.Fornecedor_codForn <> 0');
       DM.ZQuery1.SQL.Add('UNION');
       DM.ZQuery1.SQL.Add('SELECT * FROM PessoaFisica, Fornecedor, PedidoDeCompra, ItemDePedido, Produto WHERE');
       DM.ZQuery1.SQL.Add('PessoaFisica.Fornecedor_codForn = codForn AND codForn = PedidoDeCompra.Fornecedor_codForn AND  codPedCompra = PedidoDeCompra_codPedCompra AND Produto_codProd = codProd');
       DM.ZQuery1.SQL.Add('AND catProd = ' + #39 + Prod.getcatProd  + #39 + ' AND PessoaFisica.Fornecedor_codForn <> 0');
       DM.ZQuery1.Open;
   end;



   //Relatório sobre Compra por Categoria de Produtos num dado Período
   Procedure Controle.SomarValorPagoPorCatgCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valorpag) FROM PedidoDeCompra, ItemDePedido, Produto WHERE');
       DM.ZQuery1.SQL.Add('codPedCompra = PedidoDeCompra_codPedCompra AND Produto_codProd = codProd');
       DM.ZQuery1.SQL.Add('AND catProd = ' + #39 + Prod.getcatProd  + #39 + '');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ListarProdCompraPorCatgPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PessoaJuridica, Fornecedor, PedidoDeCompra, ItemDePedido, Produto WHERE');
       DM.ZQuery1.SQL.Add('PessoaJuridica.Fornecedor_codForn = codForn AND codForn = PedidoDeCompra.Fornecedor_codForn AND codPedCompra = PedidoDeCompra_codPedCompra AND Produto_codProd = codProd');
       DM.ZQuery1.SQL.Add('AND catProd = ' + #39 + Prod.getcatProd  + #39 + 'AND  PessoaJuridica.Fornecedor_codForn <> 0');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.SQL.Add('UNION');
       DM.ZQuery1.SQL.Add('SELECT * FROM PessoaFisica, Fornecedor, PedidoDeCompra, ItemDePedido, Produto WHERE');
       DM.ZQuery1.SQL.Add('PessoaFisica.Fornecedor_codForn = codForn AND codForn = PedidoDeCompra.Fornecedor_codForn AND  codPedCompra = PedidoDeCompra_codPedCompra AND Produto_codProd = codProd');
       DM.ZQuery1.SQL.Add('AND catProd = ' + #39 + Prod.getcatProd  + #39 + ' AND PessoaFisica.Fornecedor_codForn <> 0 ');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.RetornarCatg;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT catProd FROM Produto WHERE');
       DM.ZQuery1.SQL.Add('catProd = ' + #39 + Prod.getcatProd  + #39 + '');
       DM.ZQuery1.Open;
   end;

   function Controle.BuscarFornecedorPJComMinValorCompra:integer;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PessoaJuridica');
       DM.ZQuery1.SQL.Add('Where Fornecedor_codForn = ');
       DM.ZQuery1.SQL.Add('(SELECT codForn FROM Fornecedor, ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra where');
       DM.ZQuery1.SQL.Add('codForn = Fornecedor_codForn AND ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.valTotCompra = ');
       DM.ZQuery1.SQL.Add('(SELECT MIN(valtotcompra)');
       DM.ZQuery1.SQL.Add('FROM PedidoDeCompra))');
       DM.ZQuery1.Open;

       if(NOT DM.ZQuery1.Eof) then
       begin
           result := 1;
       end
       else
       begin
           result := 0;
       end;
   end;

   procedure Controle.BuscarFornecedorPFComMinValorCompra;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PessoaFisica');
       DM.ZQuery1.SQL.Add('Where Fornecedor_codForn = ');
       DM.ZQuery1.SQL.Add('(SELECT codForn FROM Fornecedor, ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra where');
       DM.ZQuery1.SQL.Add('codForn = Fornecedor_codForn AND ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.valTotCompra = ');
       DM.ZQuery1.SQL.Add('(SELECT MIN(valtotcompra)');
       DM.ZQuery1.SQL.Add('FROM PedidoDeCompra))');
       DM.ZQuery1.Open;
   end;

   function Controle.BuscarFornecedorPJComMaxValorCompra:integer;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PessoaJuridica');
       DM.ZQuery1.SQL.Add('Where Fornecedor_codForn = ');
       DM.ZQuery1.SQL.Add('(SELECT codForn FROM Fornecedor, ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra where');
       DM.ZQuery1.SQL.Add('codForn = Fornecedor_codForn AND ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.valTotCompra = ');
       DM.ZQuery1.SQL.Add('(SELECT MAX(valtotcompra)');
       DM.ZQuery1.SQL.Add('FROM PedidoDeCompra))');
       DM.ZQuery1.Open;

       if(NOT DM.ZQuery1.Eof) then
       begin
           result := 1;
       end
       else
       begin
           result := 0;
       end;
   end;
  
   procedure Controle.BuscarFornecedorPFComMaxValorCompra;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PessoaFisica');
       DM.ZQuery1.SQL.Add('Where Fornecedor_codForn = ');
       DM.ZQuery1.SQL.Add('(SELECT codForn FROM Fornecedor, ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra where');
       DM.ZQuery1.SQL.Add('codForn = Fornecedor_codForn AND ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.valTotCompra = ');
       DM.ZQuery1.SQL.Add('(SELECT MAX(valtotcompra)');
       DM.ZQuery1.SQL.Add('FROM PedidoDeCompra))');
       DM.ZQuery1.Open;
   end;

   function Controle.BuscarFornecedorPJComMinValorCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime):integer;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PessoaJuridica');
       DM.ZQuery1.SQL.Add('Where Fornecedor_codForn = ');
       DM.ZQuery1.SQL.Add('(SELECT codForn FROM Fornecedor, ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra where');
       DM.ZQuery1.SQL.Add('codForn = Fornecedor_codForn AND ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.valTotCompra = ');
       DM.ZQuery1.SQL.Add('(SELECT MIN(valtotcompra)');
       DM.ZQuery1.SQL.Add('FROM PedidoDeCompra WHERE dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '))');
       DM.ZQuery1.Open;

       if(NOT DM.ZQuery1.Eof) then
       begin
           result := 1;
       end
       else
       begin
           result := 0;
       end;
   end;

   procedure Controle.BuscarFornecedorPFComMinValorCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PessoaFisica');
       DM.ZQuery1.SQL.Add('Where Fornecedor_codForn = ');
       DM.ZQuery1.SQL.Add('(SELECT codForn FROM Fornecedor, ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra where');
       DM.ZQuery1.SQL.Add('codForn = Fornecedor_codForn AND ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.valTotCompra = ');
       DM.ZQuery1.SQL.Add('(SELECT MIN(valtotcompra)');
       DM.ZQuery1.SQL.Add('FROM PedidoDeCompra WHERE dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '))');
       DM.ZQuery1.Open;
   end;

   function Controle.BuscarFornecedorPJComMaxValorCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime):integer;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PessoaJuridica');
       DM.ZQuery1.SQL.Add('Where Fornecedor_codForn = ');
       DM.ZQuery1.SQL.Add('(SELECT codForn FROM Fornecedor, ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra where');
       DM.ZQuery1.SQL.Add('codForn = Fornecedor_codForn AND ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.valTotCompra = ');
       DM.ZQuery1.SQL.Add('(SELECT MAX(valtotcompra)');
       DM.ZQuery1.SQL.Add('FROM PedidoDeCompra WHERE dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '))');
       DM.ZQuery1.Open;

       if(NOT DM.ZQuery1.Eof) then
       begin
           result := 1;
       end
       else
       begin
           result := 0;
       end;
   end;
  
   procedure Controle.BuscarFornecedorPFComMaxValorCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PessoaFisica');
       DM.ZQuery1.SQL.Add('Where Fornecedor_codForn = ');
       DM.ZQuery1.SQL.Add('(SELECT codForn FROM Fornecedor, ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra where');
       DM.ZQuery1.SQL.Add('codForn = Fornecedor_codForn AND ');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.valTotCompra = ');
       DM.ZQuery1.SQL.Add('(SELECT MAX(valtotcompra)');
       DM.ZQuery1.SQL.Add('FROM PedidoDeCompra WHERE dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '))');
       DM.ZQuery1.Open;
   end;

   //Relatório de Compra por Fornecedor.
   //Sem Definição de Período.
   Procedure Controle.ListarProdCompraPorForn;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Produto, ItemDePedido, PedidoDeCompra,');
       DM.ZQuery1.SQL.Add('Fornecedor WHERE codProd = ItemdePedido.Produto_codProd AND');
       DM.ZQuery1.SQL.Add('ItemDePedido.PedidoDeCompra_codPedCompra = codPedCompra AND');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.Fornecedor_codForn = codForn AND codForn = ' + IntToStr(Forn.getcodForn) +'');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.QtdCompraPorFornecedor;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT COUNT(codPedCompra) FROM PedidoDeCompra, Fornecedor');
       DM.ZQuery1.SQL.Add('WHERE Fornecedor_codForn = codForn AND codForn = ' + IntToStr(Forn.getcodForn) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.CompraComMinValTotCompraPorForn;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MIN(valtotcompra) FROM PedidoDeCompra, Fornecedor');
       DM.ZQuery1.SQL.Add('WHERE Fornecedor_codForn = codForn AND codForn = ' + IntToStr(Forn.getcodForn) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.CompraComMaxValTotCompraPorForn;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MAX(valtotcompra) FROM PedidoDeCompra, Fornecedor');
       DM.ZQuery1.SQL.Add('WHERE Fornecedor_codForn = codForn AND codForn = ' + IntToStr(Forn.getcodForn) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.DataDaPrimCompraPorForn;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MIN(dataCompra) FROM PedidoDeCompra, Fornecedor');
       DM.ZQuery1.SQL.Add('WHERE Fornecedor_codForn = codForn AND codForn = ' + IntToStr(Forn.getcodForn) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.DataDaUltCompraPorForn;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MAX(dataCompra) FROM PedidoDeCompra, Fornecedor');
       DM.ZQuery1.SQL.Add('WHERE Fornecedor_codForn = codForn AND codForn = ' + IntToStr(Forn.getcodForn) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ValTotCompraPorForn;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotcompra) FROM PedidoDeCompra, Fornecedor');
       DM.ZQuery1.SQL.Add('WHERE Fornecedor_codForn = codForn AND codForn = ' + IntToStr(Forn.getcodForn) + '');
       DM.ZQuery1.Open;
   end;

   //Definido por Período
   Procedure Controle.ListarProdCompraPorFornPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * From Produto, ItemDePedido, PedidoDeCompra, Fornecedor');
       DM.ZQuery1.SQL.Add('WHERE codProd = ItemDePedido.Produto_codProd AND ');
       DM.ZQuery1.SQL.Add('ItemDePedido.PedidoDeCompra_codPedCompra = PedidoDeCompra.codPedCompra');
       DM.ZQuery1.SQL.Add('AND Fornecedor_codForn = codForn AND codForn = ' + IntToStr(Forn.getcodForn) +'');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.QtdCompraPorFornecedorPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT COUNT(codPedCompra) FROM PedidoDeCompra, Fornecedor');
       DM.ZQuery1.SQL.Add('WHERE Fornecedor_codForn = codForn AND codForn = ' + IntToStr(Forn.getcodForn) + '');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.CompraComMinValTotCompraPorFornPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MIN(valtotcompra) FROM PedidoDeCompra, Fornecedor');
       DM.ZQuery1.SQL.Add('WHERE Fornecedor_codForn = codForn AND codForn = ' + IntToStr(Forn.getcodForn) + '');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.CompraComMaxValTotCompraPorFornPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MAX(valtotcompra) FROM PedidoDeCompra, Fornecedor');
       DM.ZQuery1.SQL.Add('WHERE Fornecedor_codForn = codForn AND codForn = ' + IntToStr(Forn.getcodForn) + '');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.DataDaPrimCompraPorFornPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MIN(dataCompra) FROM PedidoDeCompra, Fornecedor');
       DM.ZQuery1.SQL.Add('WHERE Fornecedor_codForn = codForn AND codForn = ' + IntToStr(Forn.getcodForn) + '');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.DataDaUltCompraPorFornPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT MAX(dataCompra) FROM PedidoDeCompra, Fornecedor');
       DM.ZQuery1.SQL.Add('WHERE Fornecedor_codForn = codForn AND codForn = ' + IntToStr(Forn.getcodForn) + '');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ValTotCompraPorFornPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valtotcompra) FROM PedidoDeCompra, Fornecedor');
       DM.ZQuery1.SQL.Add('WHERE Fornecedor_codForn = codForn AND codForn = ' + IntToStr(Forn.getcodForn) + '');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   //Relatório sobre Produtos Comprados
   Procedure Controle.SomaValTotPagCompraPorProd;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valorPag) FROM ItemDePedido, Produto WHERE');
       DM.ZQuery1.SQL.Add('ItemDePedido.Produto_codProd = Produto.codProd');
       DM.ZQuery1.SQL.Add('AND Produto.nomeProd = ' + #39 + Prod.getnomeProd + #39 + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.SomaValTotPagCompraPorProdPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(valorPag) FROM ItemDePedido, Produto, PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE ItemDePedido.Produto_codProd = Produto.codProd');
       DM.ZQuery1.SQL.Add('AND Produto.nomeProd = ' + #39 + Prod.getnomeProd + #39 + '');
       DM.ZQuery1.SQL.Add('AND ItemDePedido.PedidoDeCompra_codPedCompra = PedidoDeCompra.codPedCompra');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.SomaQtdCompraPorProdCompraPeso;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(qtdpesoItemPed) FROM ItemDePedido, Produto  WHERE');
       DM.ZQuery1.SQL.Add('ItemDePedido.Produto_codProd = Produto.codProd');
       DM.ZQuery1.SQL.Add('AND Produto.nomeProd = ' + #39 + Prod.getnomeProd + #39 +'');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.SomaQtdCompraPorProdCompraPesoPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(qtdpesoItemPed) FROM ItemDePedido, Produto, PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE ItemDePedido.Produto_codProd = Produto.codProd');
       DM.ZQuery1.SQL.Add('AND Produto.nomeProd = ' + #39 + Prod.getnomeProd + #39 + '');
       DM.ZQuery1.SQL.Add('AND ItemDePedido.PedidoDeCompra_codPedCompra = PedidoDeCompra.codPedCompra');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.SomaQtdCompraPorProdUNID;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(qtdunitItemPed) FROM ItemDePedido, Produto  WHERE');
       DM.ZQuery1.SQL.Add('ItemDePedido.Produto_codProd = Produto.codProd');
       DM.ZQuery1.SQL.Add('AND Produto.nomeProd = ' + #39 + Prod.getnomeProd + #39 +'');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.SomaQtdCompraPorProdUNIDPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT SUM(qtdunitItemPed) FROM ItemDePedido, Produto, PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE ItemDePedido.Produto_codProd = Produto.codProd');
       DM.ZQuery1.SQL.Add('AND Produto.nomeProd = ' + #39 + Prod.getnomeProd + #39 + '');
       DM.ZQuery1.SQL.Add('AND ItemDePedido.PedidoDeCompra_codPedCompra = PedidoDeCompra.codPedCompra');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ContaRelacaoProdutoCompra;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT COUNT(PedidoDeCompra.codPedCompra) FROM PedidoDeCompra, ItemDePedido, Produto');
       DM.ZQuery1.SQL.Add('WHERE PedidoDeCompra.codPedCompra = ItemDePedido.PedidoDeCompra_codPedCompra AND');
       DM.ZQuery1.SQL.Add('ItemDePedido.Produto_codProd = Produto.codProd AND');
       DM.ZQuery1.SQL.Add('Produto.nomeProd = '+ #39 + Prod.getNomeProd + #39 +'');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ContaRelacaoProdutoCompraPorPeriod(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT COUNT(PedidoDeCompra.codPedCompra) FROM PedidoDeCompra, ItemDePedido, Produto');
       DM.ZQuery1.SQL.Add('WHERE PedidoDeCompra.codPedCompra = ItemDePedido.PedidoDeCompra_codPedCompra AND');
       DM.ZQuery1.SQL.Add('ItemDePedido.Produto_codProd = Produto.codProd AND');
       DM.ZQuery1.SQL.Add('Produto.nomeProd = '+ #39 + Prod.getNomeProd + #39 +'');
       DM.ZQuery1.SQL.Add('AND dataCompra BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;
   end;

   //Manutenção dos Dados de Compra.
   Procedure Controle.BuscarDadosFornPFCompraAberta;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PedidoDeCompra, Fornecedor, PessoaFisica');
       DM.ZQuery1.SQL.Add('WHERE');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.Fornecedor_codForn = codForn AND');
       DM.ZQuery1.SQL.Add('codForn = PessoaFisica.Fornecedor_codForn AND ');
       DM.ZQuery1.SQL.Add('PessoaFisica.nomeForn = '+ #39 + PF.getnome + #39 + '');
       DM.ZQuery1.Open;

       self.AtribDadosFornPF;
       self.AtribuiDadosPedidoDeCompra;
   end;

   Procedure Controle.BuscarDadosFornPJCompraAberta;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PedidoDeCompra, Fornecedor, PessoaJuridica');
       DM.ZQuery1.SQL.Add('WHERE');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.Fornecedor_codForn = codForn AND');
       DM.ZQuery1.SQL.Add('codForn = PessoaJuridica.Fornecedor_codForn AND ');
       DM.ZQuery1.SQL.Add('PessoaJuridica.razaoSocial = '+ #39 + PJ.getrazaoSocial + #39 + '');
       DM.ZQuery1.Open;

       self.AtribDadosFornPJ;
       self.AtribuiDadosPedidoDeCompra;
   end;

   Procedure Controle.ListarProdutosPedCompraPorCodForn;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Produto, ItemDePedido, PedidodeCompra, Fornecedor ');
       DM.ZQuery1.SQL.Add('WHERE Produto.codProd = ItemDePedido.Produto_codProd AND');
       DM.ZQuery1.SQL.Add('ItemDePedido.PedidoDeCompra_codPedCompra = codPedCompra AND codPedCompra = '+ IntToStr(PdComp.getcodPedCompra) +' AND');
       DM.ZQuery1.SQL.Add('PedidoDeCompra.Fornecedor_codForn = codForn AND');
       DM.ZQuery1.SQL.Add('codForn = '+ IntToStr(Forn.getcodForn) +'');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.AlterarValorDePedidoDeCompra;
   begin
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add  ('UPDATE PedidoDeCompra SET valtotCompra = ' + FloatToStr(PdComp.getValTotPedCompra)       +
                                                                      ' WHERE codPedCompra = ' + IntToStr(PdComp.getcodPedCompra) + '');
       DM.ZQuery1.ExecSQL;
   end;

   function Controle.ContarItensCompra:integer;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT count(*) FROM ItemDePedido, PedidoDeCompra');
       DM.ZQuery1.SQL.Add('WHERE ItemDePedido.PedidoDeCompra_codPedCompra = codPedCompra');
       DM.ZQuery1.SQL.Add('AND codPedCompra = ' + IntToStr(PdComp.getcodPedCompra) + '');
       DM.ZQuery1.Open;
       result := DM.ZQuery1.FieldByName('count(*)').AsInteger;
   end;

   Procedure Controle.BuscarCompraPorCodForn;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PedidoDeCompra, Fornecedor');
       DM.ZQuery1.SQL.Add('WHERE PedidoDeCompra.Fornecedor_codForn = Fornecedor.codForn');
       DM.ZQuery1.SQL.Add('AND Fornecedor.codForn = ' + IntToStr(Forn.getcodForn) + '');
       DM.ZQuery1.Open;
       self.AtribuiDadosPedidoDeCompra;
   end;


   Procedure Controle.AlterarEstqParaCompraFechada;
   var
         codProd : integer;
         pesoPed : Real;
         unidPed : integer;
         DM2     : TDM;
   begin
         DM.ZQuery1.Close;
         DM.ZQuery1.SQL.Clear;
         DM.ZQuery1.SQL.Add('SELECT * FROM Produto,');
         DM.ZQuery1.SQL.Add('ItemDePedido, PedidoDeCompra');
         DM.ZQuery1.SQL.Add('WHERE Produto.codProd = ItemDePedido.Produto_codProd');
         DM.ZQuery1.SQL.Add('AND ItemDePedido.PedidoDeCompra_codPedCompra = PedidoDeCompra.codPedCompra');
         DM.ZQuery1.SQL.Add('AND PedidoDeCompra.codPedCompra = ' + IntToStr(PdComp.getcodPedCompra) +'');
         DM.ZQuery1.Open;

         DM2 := TDM.Create(NIL);
         While (NOT DM.ZQuery1.EOF) do
         begin
             codProd := DM.ZQuery1.FieldByName('codProd').AsInteger;
             DecimalSeparator := '.';
             pesoPed := DM.ZQuery1.FieldByName('qtdpesoItemPed').AsFloat;
             UnidPed := DM.ZQuery1.FieldByName('qtdunitItemPed').AsInteger;

             DM2.ZQuery1.SQL.Clear;
             DM2.ZQuery1.SQL.Add('UPDATE Estoque SET qtdPesoEstqAtual = qtdPesoEstqAtual + ' + FloatToStr(pesoPed) + ' WHERE Estoque.Produto_codProd = ' + IntToStr(codProd) + '');
             DM2.ZQuery1.ExecSQL;

             DM2.ZQuery1.SQL.Clear;
             DM2.ZQuery1.SQL.Add('UPDATE Estoque SET qtdUnitEstqAtual = qtdUnitEstqAtual + ' + IntToStr(unidPed)   + ' WHERE Estoque.Produto_codProd = ' + IntToStr(codProd) + '');
             DM2.ZQuery1.ExecSQL;

             DM.ZQuery1.Next;
         end;
    end;

    Procedure Controle.AlterarCompraParaFechada;
    begin
        DM.ZQuery1.SQL.Clear;
        DM.ZQuery1.SQL.Add('UPDATE PedidoDeCompra SET statusCompra = '+ #39 + PdComp.getstatusCompra + #39 +'');
        DM.ZQuery1.SQL.Add('WHERE PedidoDeCompra.codPedCompra = '+ IntToStr(PdComp.getcodPedCompra) +'');
        DM.ZQuery1.ExecSQL;
    end;

//Controlar Pagamento

   Procedure Controle.BuscarPagtoRealizadoPorCodCli(dataInicio:TDateTime; dataFim:TDateTime);
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Pagamento, Venda, Cliente');
       DM.ZQuery1.SQL.Add('WHERE statusPag = ' + #39 + 'PG' + #39 +' AND Pagamento.Venda_codVenda = codVenda AND');
       DM.ZQuery1.SQL.Add('Venda.Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.SQL.Add('AND dataPag BETWEEN ' + FormatDateTime('YYYYMMDD', dataInicio) + ' AND ' + FormatDateTime('YYYYMMDD',dataFim) + '');
       DM.ZQuery1.Open;

       if(NOT DM.ZQuery1.EOF) then
       begin
           self.AtriBDadosCliente;
       end
       else
           Cli.setCodCli(-1);
   end;

   Procedure Controle.BuscarDadosPagtoPorCodPag;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Pagamento, Venda, Cliente');
       DM.ZQuery1.SQL.Add('WHERE statusPag = ' + #39 + 'PG' + #39 +' AND Pagamento.Venda_codVenda = codVenda AND');
       DM.ZQuery1.SQL.Add('Venda.Cliente_codCli = codCli AND codCli = ' + IntToStr(Cli.getCodCli) + '');
       DM.ZQuery1.SQL.Add('AND codPag = '+ IntToStr(Pg.getcodPag) +'');
       DM.ZQuery1.Open;

       if(NOT DM.ZQuery1.EOF) then
       begin
           self.AtriBDadosCliente;
           self.AtribDadosPagto;
           self.AtribDadosVenda;
       end
   end;

   Procedure Controle.BuscarDadosPagtoCheque;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PagamentoCheque, Pagamento');
       DM.ZQuery1.SQL.Add('WHERE PagamentoCheque.Pagamento_codPag = codPag');
       DM.ZQuery1.SQL.Add('AND codPag = ' + IntToStr(Pg.getcodPag) +'');
       DM.ZQuery1.Open;

       if(NOT DM.ZQuery1.EOF) then
       begin
           self.AtribuirPagtoCheque;
       end
   end;

   Procedure Controle.AtribuirPagtoCheque;
   begin
       PgCheq.setnumCheq(DM.ZQuery1.FieldByName('numCheq').AsInteger);
       PgCheq.setcontaCheq(DM.ZQuery1.FieldByName('contaCheq').AsInteger);
       PgCheq.setagenciaCheq(DM.ZQuery1.FieldByName('agenciaCheq').AsInteger);
       PgCheq.setbancoCheq(DM.ZQuery1.FieldByName('bancoCheq').AsString);
   end;

   Procedure Controle.BuscarDadosPagtoCartao;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM PagamentoCartao, Pagamento');
       DM.ZQuery1.SQL.Add('WHERE PagamentoCartao.Pagamento_codPag = codPag');
       DM.ZQuery1.SQL.Add('AND codPag = ' + IntToStr(Pg.getcodPag) +'');
       DM.ZQuery1.Open;
       {
       if(NOT DM.ZQuery1.EOF) then
       begin
           self.AtribuirPagtoCartao;
       end
       }
   end;

   Procedure Controle.AtribuirPagtoCartao;
   begin
       PgCart.setcodPag(DM.ZQuery1.FieldByName('codPag').AsInteger);
       PgCart.setvalpag(DM.ZQuery1.FieldByName('valorPagto').AsFloat);
       PgCart.setstatusPag(DM.ZQuery1.FieldByName('statusPag').AsString);
       PgCart.setdataPag(DM.ZQuery1.FieldByName('dataVenda').AsDateTime);
       PgCart.setTipoPag(DM.ZQuery1.FieldByName('tipoPag').AsString);
       PgCart.setcodCartao(DM.ZQuery1.FieldByName('codCartao').AsInteger);
       PgCart.setdataVencCartao(DM.ZQuery1.FieldByName('dataVencCartao').AsDateTime);
       PgCart.setbandCartao(DM.ZQuery1.FieldByName('bandCartao').AsString);
   end;

   Procedure Controle.ListarItensDeVendaPorCodPagto;
   begin
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('SELECT * FROM Produto, ItemdeVenda, Venda, Pagamento');
       DM.ZQuery1.SQL.Add('WHERE codProd = ItemDeVenda.Produto_codProd AND ');
       DM.ZQuery1.SQL.Add('ItemDeVenda.Venda_codVenda = codVenda AND ');
       DM.ZQuery1.SQL.Add('codVenda = Pagamento.Venda_codVenda AND codPag = '+ IntToStr(Pg.getcodPag) +'');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.SomaValPagoItemDeVendaPorCodPag;
   begin
       //Recalcular Valor Total de Venda
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.Close;
       DM.ZQuery1.SQL.Add('SELECT SUM(valpag) FROM ItemdeVenda, Venda, Pagamento');
       DM.ZQuery1.SQL.Add('WHERE ItemDeVenda.Venda_codVenda = codVenda AND');
       DM.ZQuery1.SQL.Add('Venda.codVenda = Pagamento.Venda_codVenda AND');
       DM.ZQuery1.SQL.Add('codPag = ' + IntToStr(Pg.getcodPag) + '');
       DM.ZQuery1.Open;
   end;

   Procedure Controle.ExcluirCheque;
   begin
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('DELETE FROM PagamentoCheque WHERE Pagamento_codPag =  ' + IntToStr(Pg.getcodPag) + '');
       DM.ZQuery1.ExecSQL;
   end;

   Procedure Controle.ExcluirCartao;
   begin
       DM.ZQuery1.SQL.Clear;
       DM.ZQuery1.SQL.Add('DELETE FROM PagamentoCartao WHERE Pagamento_codPag =  ' + IntToStr(Pg.getcodPag) + '');
       DM.ZQuery1.ExecSQL;
   end;
end.
