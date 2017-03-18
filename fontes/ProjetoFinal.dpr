program ProjetoFinal;

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, OleCtrls, 
  FTelaVendaRealizada in 'interface\FTelaVendaRealizada.pas' {FrmTelaVendaRealizada},
  FTelaVenda in 'interface\FTelaVenda.pas' {FrmTelaVenda},
  FTelaPagtoEfetuado in 'interface\FTelaPagtoEfetuado.pas' {FrmTelaPagtoEfetuado},
  FTelaPagto in 'interface\FTelaPagto.pas' {FrmTelaPagto},
  FTelaCompraRealizada in 'interface\FTelaCompraRealizada.pas' {FrmTelaCompraRealizada},
  FTelaCompra in 'interface\FTelaCompra.pas' {FrmTelaCompra},
  FTaxaPagto in 'interface\FTaxaPagto.pas' {FrmTaxaPagto},
  FSplash in 'interface\FSplash.pas' {FrmSplash},
  FSobre in 'interface\FSobre.pas' {FrmSobre},
  FSelVendaPagto in 'interface\FSelVendaPagto.pas' {Form2},
  FSelProdEstq in 'interface\FSelProdEstq.pas' {FrmSelProdEstq},
  FSelProd in 'interface\FSelProd.pas' {FrmSelProd},
  FSelItemVendaRealizada in 'interface\FSelItemVendaRealizada.pas' {FrmSelItemVendaRealizada},
  FSelItemPedCompraRealizada in 'interface\FSelItemPedCompraRealizada.pas' {FrmSelItemPedCompraRealizada},
  FSelItemPed in 'interface\FSelItemPed.pas' {FrmSelItemPed},
  FSelItem in 'interface\FSelItem.pas' {FrmSelItem},
  FSelFornRelCompra in 'interface\FSelFornRelCompra.pas' {FrmSelFornRelCompra},
  FSelFornCompra in 'interface\FSelFornCompra.pas' {FrmSelFornCompra},
  FSelForn in 'interface\FSelForn.pas' {FrmSelForn},
  FSelCompraRealizada in 'interface\FSelCompraRealizada.pas' {FrmSelCompraRealizada},
  FRelVendaTotaisVenda in 'interface\FRelVendaTotaisVenda.pas' {FrmRelVendaTotaisVenda},
  FRelVendaTodosProd in 'interface\FRelVendaTodosProd.pas' {FrmRelVendaTodosProd},
  FRelVendaPorProduto in 'interface\FRelVendaPorProduto.pas' {FrmRelVendaPorProduto},
  FRelVendaPorCliente in 'interface\FRelVendaPorCliente.pas' {FrmRelVendaPorCliente},
  FRelVendaPorCatg in 'interface\FRelVendaPorCatg.pas' {FrmRelVendaPorCatg},
  FRelPorcAcimaEstq in 'interface\FRelPorcAcimaEstq.pas' {FrmRelPorcAcimaEstq},
  FRelEstqZero in 'interface\FRelEstqZero.pas' {FrmRelEstqZero},
  FRelEstqPorcAcimaDoMin in 'interface\FRelEstqPorcAcimaDoMin.pas' {FrmRelEstqPorcAcimaDoMin},
  FRelEstqComp in 'interface\FRelEstqComp.pas' {FrmRelEstqComp},
  FRelEstqAbaixoDoMin in 'interface\FRelEstqAbaixoDoMin.pas' {FrmRelEstqAbaixoDoMin},
  FRelCompraTotaisCompra in 'interface\FRelCompraTotaisCompra.pas' {FrmRelCompraTotaisCompra},
  FRelCompraTodosProd in 'interface\FRelCompraTodosProd.pas' {FrmRelCompraTodosProd},
  FRelCompraPorProduto in 'interface\FRelCompraPorProduto.pas' {FrmRelCompraPorProduto},
  FRelCompraPorForn in 'interface\FRelCompraPorForn.pas' {FrmRelCompraPorForn},
  FRelCompraPorCatg in 'interface\FRelCompraPorCatg.pas' {FrmRelCompraPorCatg},
  FRealizarVenda in 'interface\FRealizarVenda.pas' {FrmRealizarVenda},
  FRealizarPagamento in 'interface\FRealizarPagamento.pas' {FrmRealizarPagamento},
  FRealizarCompra in 'interface\FRealizarCompra.pas' {FrmRealizarCompra},
  FPrincipal in 'interface\FPrincipal.pas' {FrmPrincipal},
  FManterUsuario in 'interface\FManterUsuario.pas' {FrmManterUsuario},
  FManterTelefone in 'interface\FManterTelefone.pas' {FrmManterTelefone},
  FManterProduto in 'interface\FManterProduto.pas' {FrmManterProduto},
  FManterFuncionario in 'interface\FManterFuncionario.pas' {FrmManterFuncionario},
  FManterForn in 'interface\FManterForn.pas' {FrmManterForn},
  FManterEstq in 'interface\FManterEstq.pas' {FrmManterEstq},
  FManterCliente in 'interface\FManterCliente.pas' {FrmManterCliente},
  FListItensVenda in 'interface\FListItensVenda.pas' {FrmListItensVenda},
  FListItensDeVendaPagto in 'interface\FListItensDeVendaPagto.pas' {FrmListItensDeVendaPagto},
  FImprimirVenda in 'interface\FImprimirVenda.pas' {FrmImprimirVenda},
  FImprimirCompra in 'interface\FImprimirCompra.pas' {FrmImprimirCompra},
  FEfetuarLoginCancelarPagto in 'interface\FEfetuarLoginCancelarPagto.pas' {FrmEfetuarLoginCancelarPagto},
  FEfetuarLogin in 'interface\FEfetuarLogin.pas' {FrmEfetuarLogin},
  FDefRelVenda in 'interface\FDefRelVenda.pas' {FrmDefRelVenda},
  FDefRelEstoque in 'interface\FDefRelEstoque.pas' {FrmDefRelEstoque},
  FDefRelCompra in 'interface\FDefRelCompra.pas' {FrmDefRelCompra},
  FControlarVenda in 'interface\FControlarVenda.pas' {FrmControlarVenda},
  FControlarPagto in 'interface\FControlarPagto.pas' {FrmControlarPagto},
  FControlarEstq in 'interface\FControlarEstq.pas' {FrmControlarEstq},
  FControlarCompra in 'interface\FControlarCompra.pas' {FrmControlarCompra},
  FConsultarPreco in 'interface\FConsultarPreco.pas' {FrmConsultarPreco},
  FCategoria in 'interface\FCategoria.pas' {FrmCategoria},
  FBuscarVendaRealizada in 'interface\FBuscarVendaRealizada.pas' {FrmBuscarVendaRealizada},
  FBuscarVendaPagto in 'interface\FBuscarVendaPagto.pas' {FrmBuscarVendaPagto},
  FBuscarUsuario in 'interface\FBuscarUsuario.pas' {FrmBuscarUsuario},
  FBuscarTel in 'interface\FBuscarTel.pas' {FrmBuscarTel},
  FBuscarPagto in 'interface\FBuscarPagto.pas' {FrmBuscarPagto},
  FBuscarFunc in 'interface\FBuscarFunc.pas' {FrmBuscarFunc},
  FBuscarClienteVenda in 'interface\FBuscarClienteVenda.pas' {FrmBuscarClienteVenda},
  FBuscarClienteRelVenda in 'interface\FBuscarClienteRelVenda.pas' {FrmBuscarClienteRelVenda},
  FBuscarCliente in 'interface\FBuscarCliente.pas' {FrmBuscarCliente},
  cDataModule in 'interface\cDataModule.pas' {DM: TDataModule},
  cVenda in 'classes\cVenda.pas',
  cUsuario in 'classes\cUsuario.pas',
  cTelefone in 'classes\cTelefone.pas',
  cProduto in 'classes\cProduto.pas',
  cPessoaJuridica in 'classes\cPessoaJuridica.pas',
  cPessoaFisica in 'classes\cPessoaFisica.pas',
  cPedidoDeCompra in 'classes\cPedidodeCompra.pas',
  cPagamentoComCheque in 'classes\cPagamentoComCheque.pas',
  cPagamentoCartao in 'classes\cPagamentoCartao.pas',
  cPagamento in 'classes\cPagamento.pas',
  cItemDeVenda in 'classes\cItemDeVenda.pas',
  cItemDePedido in 'classes\cItemDePedido.pas',
  cFuncionario in 'classes\cFuncionario.pas',
  cFornecedor in 'classes\cFornecedor.pas',
  cEstoque in 'classes\cEstoque.pas',
  cControle in 'classes\cControle.pas',
  cCliente in 'classes\cCliente.pas';

{$R *.res}

begin
  Application.Initialize;
  //Trabalhando com SPLASHSCREEN
  FrmSplash := TFrmSplash.Create(Application);
  //Exibe o formulario
  FrmSplash.Show;
  FrmSplash.Refresh;
  Sleep(3000);
  FrmSplash.Free;

  //Telas do Sistema
  Application.Title := 'SGE';
  Application.CreateForm(TFrmEfetuarLogin, FrmEfetuarLogin);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmControlarPagto, FrmControlarPagto);
  Application.CreateForm(TFrmTelaVendaRealizada, FrmTelaVendaRealizada);
  Application.CreateForm(TFrmTelaVenda, FrmTelaVenda);
  Application.CreateForm(TFrmTelaPagtoEfetuado, FrmTelaPagtoEfetuado);
  Application.CreateForm(TFrmTelaPagto, FrmTelaPagto);
  Application.CreateForm(TFrmTelaCompraRealizada, FrmTelaCompraRealizada);
  Application.CreateForm(TFrmTelaCompra, FrmTelaCompra);
  Application.CreateForm(TFrmTaxaPagto, FrmTaxaPagto);
  Application.CreateForm(TFrmSobre, FrmSobre);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFrmSelProdEstq, FrmSelProdEstq);
  Application.CreateForm(TFrmSelProd, FrmSelProd);
  Application.CreateForm(TFrmSelItemVendaRealizada, FrmSelItemVendaRealizada);
  Application.CreateForm(TFrmSelItemPedCompraRealizada, FrmSelItemPedCompraRealizada);
  Application.CreateForm(TFrmSelItemPed, FrmSelItemPed);
  Application.CreateForm(TFrmSelItem, FrmSelItem);
  Application.CreateForm(TFrmSelFornRelCompra, FrmSelFornRelCompra);
  Application.CreateForm(TFrmSelFornCompra, FrmSelFornCompra);
  Application.CreateForm(TFrmSelForn, FrmSelForn);
  Application.CreateForm(TFrmSelCompraRealizada, FrmSelCompraRealizada);
  Application.CreateForm(TFrmRelVendaTotaisVenda, FrmRelVendaTotaisVenda);
  Application.CreateForm(TFrmRelVendaTodosProd, FrmRelVendaTodosProd);
  Application.CreateForm(TFrmRelVendaPorProduto, FrmRelVendaPorProduto);
  Application.CreateForm(TFrmRelVendaPorCliente, FrmRelVendaPorCliente);
  Application.CreateForm(TFrmRelVendaPorCatg, FrmRelVendaPorCatg);
  Application.CreateForm(TFrmRelPorcAcimaEstq, FrmRelPorcAcimaEstq);
  Application.CreateForm(TFrmRelEstqZero, FrmRelEstqZero);
  Application.CreateForm(TFrmRelEstqPorcAcimaDoMin, FrmRelEstqPorcAcimaDoMin);
  Application.CreateForm(TFrmRelEstqComp, FrmRelEstqComp);
  Application.CreateForm(TFrmRelEstqAbaixoDoMin, FrmRelEstqAbaixoDoMin);
  Application.CreateForm(TFrmRelCompraTotaisCompra, FrmRelCompraTotaisCompra);
  Application.CreateForm(TFrmRelCompraTodosProd, FrmRelCompraTodosProd);
  Application.CreateForm(TFrmRelCompraPorProduto, FrmRelCompraPorProduto);
  Application.CreateForm(TFrmRelCompraPorForn, FrmRelCompraPorForn);
  Application.CreateForm(TFrmRelCompraPorCatg, FrmRelCompraPorCatg);
  Application.CreateForm(TFrmRealizarVenda, FrmRealizarVenda);
  Application.CreateForm(TFrmRealizarPagamento, FrmRealizarPagamento);
  Application.CreateForm(TFrmRealizarCompra, FrmRealizarCompra);
  Application.CreateForm(TFrmManterUsuario, FrmManterUsuario);
  Application.CreateForm(TFrmManterTelefone, FrmManterTelefone);
  Application.CreateForm(TFrmManterProduto, FrmManterProduto);
  Application.CreateForm(TFrmManterFuncionario, FrmManterFuncionario);
  Application.CreateForm(TFrmManterForn, FrmManterForn);
  Application.CreateForm(TFrmManterEstq, FrmManterEstq);
  Application.CreateForm(TFrmManterCliente, FrmManterCliente);
  Application.CreateForm(TFrmListItensVenda, FrmListItensVenda);
  Application.CreateForm(TFrmListItensDeVendaPagto, FrmListItensDeVendaPagto);
  Application.CreateForm(TFrmImprimirVenda, FrmImprimirVenda);
  Application.CreateForm(TFrmImprimirCompra, FrmImprimirCompra);
  Application.CreateForm(TFrmEfetuarLoginCancelarPagto, FrmEfetuarLoginCancelarPagto);
  Application.CreateForm(TFrmDefRelVenda, FrmDefRelVenda);
  Application.CreateForm(TFrmDefRelEstoque, FrmDefRelEstoque);
  Application.CreateForm(TFrmDefRelCompra, FrmDefRelCompra);
  Application.CreateForm(TFrmControlarVenda, FrmControlarVenda);
  Application.CreateForm(TFrmControlarEstq, FrmControlarEstq);
  Application.CreateForm(TFrmControlarCompra, FrmControlarCompra);
  Application.CreateForm(TFrmConsultarPreco, FrmConsultarPreco);
  Application.CreateForm(TFrmCategoria, FrmCategoria);
  Application.CreateForm(TFrmBuscarVendaRealizada, FrmBuscarVendaRealizada);
  Application.CreateForm(TFrmBuscarVendaPagto, FrmBuscarVendaPagto);
  Application.CreateForm(TFrmBuscarUsuario, FrmBuscarUsuario);
  Application.CreateForm(TFrmBuscarTel, FrmBuscarTel);
  Application.CreateForm(TFrmBuscarPagto, FrmBuscarPagto);
  Application.CreateForm(TFrmBuscarFunc, FrmBuscarFunc);
  Application.CreateForm(TFrmBuscarClienteVenda, FrmBuscarClienteVenda);
  Application.CreateForm(TFrmBuscarClienteRelVenda, FrmBuscarClienteRelVenda);
  Application.CreateForm(TFrmBuscarCliente, FrmBuscarCliente);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
