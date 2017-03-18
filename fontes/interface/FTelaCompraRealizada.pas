unit FTelaCompraRealizada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, rxToolEdit, rxCurrEdit, StdCtrls, Buttons, Grids, DBGrids,
  cPedidoDeCompra, cControle, cDataModule, cItemDePedido, FSelItemPedCompraRealizada,
  FImprimirCompra, cFornecedor, cEstoque, cProduto;

type
  TFrmTelaCompraRealizada = class(TForm)
    Venda: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    GroupBox3: TGroupBox;
    BitBtn4: TBitBtn;
    MaskEdit1: TMaskEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn5: TBitBtn;
    BitBtn3: TBitBtn;
    Edit2: TEdit;
    Edit6: TEdit;
    Edit3: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SomarValorTotal;
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SomarValorTotalPago;
    Procedure ImprimirCompra;
    Procedure ProdutosCompra;
    procedure FornecedorCompra;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MostrarItens;
    procedure CalcValTotPedCompra;
    procedure MaskEdit1Enter(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCompraRealizada: TFrmTelaCompraRealizada;
  statusExcluir : integer;

implementation

{$R *.dfm}

uses
    FPrincipal,
    FControlarCompra;

procedure TFrmTelaCompraRealizada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmControlarCompra.Visible := true;
end;

procedure TFrmTelaCompraRealizada.DBGrid1ColEnter(Sender: TObject);
begin
    try
        self.Edit3.Text := DBGrid1.DataSource.DataSet.FieldByName('codItemPed').AsString;
        self.Edit4.Text := DBGrid1.DataSource.DataSet.FieldByName('codProd').AsString;
    except
        MessageDlg('Problema na Seleção do Item de Pedido.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaCompraRealizada.BitBtn1Click(Sender: TObject);
var
    ItemPed : ItemDePedido;
    PdComp  : PedidoDeCompra;
    DM      : TDM;
    Ct      : Controle;
begin
    try
        if (self.Edit3.Text <> '') AND (self.Edit4.Text <> '') then
        begin
            DM := TDM.Create(NIL);
            ItemPed := ItemDePedido.Create(StrToInt(self.Edit3.Text),0,0,0);
            PdComp  := PedidoDeCompra.Create(StrToInt(self.Edit6.Text),00/00/0000,0,'');
            Ct := Controle.Create(DM,PdComp,ItemPed);
            Ct.ExcluirUnicoItemDePedidoDaLista;
            self.CurrencyEdit1.Text := FloatToStr(PdComp.getValTotPedCompra);
            Ct.ListarItensPorCodPedidoDeCompra;

            //Atualiza o DBGrid
            DM.DS1.DataSet := DM.ZQuery1;
            self.DBGrid1.DataSource := DM.DS1;

            if(self.CurrencyEdit1.Text = '') then
            begin
                self.BitBtn1.Enabled := false;
            end;
            self.CalcValTotPedCompra;
        end
        else
        begin
            MessageDlg('Nenhum Produto foi selecionado para Exclusão.', mtWarning, [mbOk], 0);
        end;
    except
        MessageDlg('Problema na Exclusão do Item de Pedido.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaCompraRealizada.FormShow(Sender: TObject);
begin
    self.MostrarItens;
    statusExcluir := 0;
end;

procedure TFrmTelaCompraRealizada.BitBtn2Click(Sender: TObject);
begin
    FrmSelItemPedCompraRealizada.Edit5.Text := self.Edit6.Text;
    FrmSelItemPedCompraRealizada.ShowModal;
end;

procedure TFrmTelaCompraRealizada.SomarValorTotalPago;
var
    DM     : TDM;
    Ct     : Controle;
    PdComp : PedidodeCompra;
    valor  : real;
begin
    try
        DM := TDM.Create(NIL);
        PdComp := PedidoDeCompra.Create(0,00/00/0000,0,'');
        PdComp.setcodPedCompra(StrToInt(self.Edit6.Text));
        Ct := Controle.Create(DM,PdComp);
        Ct.SomaValorPagoItemPed;
        self.CurrencyEdit1.Text := DM.ZQuery1.FieldByName('sum(valorPag)').AsString;
        valor := DM.ZQuery1.FieldByName('sum(valorPag)').AsFloat;
        PdComp.setvalTotPedCompra(valor);
        Ct.AlterarValorDePedidoDeCompra;
    except
        MessageDlg('Problema no Somatório do Valor Total dos Iténs de Venda.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaCompraRealizada.FornecedorCompra;
var
    PdComp : PedidoDeCompra;
    Ct : Controle;
    DM : TDM;
begin
    try
        PdComp  := PedidoDeCompra.Create(StrToInt(self.Edit6.Text),00/00/0000,0,'');
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM,PdComp);

        //Atribui o Objeto DataSet ao QuickReport.
        FrmImprimirCompra.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuindo os Dados sobre Fornecedor Vinculado a Compra Realizada.
        if(self.Label1.Caption = 'CNPJ:') then
        begin
            Ct.BuscarPJPedidoDeCompra;
            FrmImprimirCompra.QRDBText1.DataSet := DM.ZQuery1;
            FrmImprimirCompra.QRDBText1.DataField := 'razaoSocial';
            FrmImprimirCompra.QRDBText4.DataSet := DM.ZQuery1;
            FrmImprimirCompra.QRDBText4.DataField := 'cnpj';
        end
        else if(self.Label1.Caption = 'CPF:') then
        begin
            Ct.BuscarPFPedidoDeCompra;
            FrmImprimirCompra.QRDBText1.DataSet := DM.ZQuery1;
            FrmImprimirCompra.QRDBText1.DataField := 'nomeForn';
            FrmImprimirCompra.QRDBText4.DataSet := DM.ZQuery1;
            FrmImprimirCompra.QRDBText4.DataField := 'cpfForn';
        end;

        FrmImprimirCompra.QRDBText2.DataSet := DM.ZQuery1;
        FrmImprimirCompra.QRDBText2.DataField := 'endForn';
        FrmImprimirCompra.QRDBText3.DataSet := DM.ZQuery1;
        FrmImprimirCompra.QRDBText3.DataField := 'cidadeForn';
        FrmImprimirCompra.QRDBText5.DataSet := DM.ZQuery1;
        FrmImprimirCompra.QRDBText5.DataField := 'bairroForn';
        FrmImprimirCompra.QRDBText6.DataSet := DM.ZQuery1;
        FrmImprimirCompra.QRDBText6.DataField := 'estadoForn';
    except
        MessageDlg('Problema na Impressão dos Dados do Fornecedor da Compra Realizada.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmTelaCompraRealizada.ProdutosCompra;
var
    PdComp : PedidoDeCompra;
    Ct : Controle;
    DM : TDM;
begin
    try
        self.SomarValorTotal;
        PdComp  := PedidoDeCompra.Create(StrToInt(self.Edit6.Text),00/00/0000,0,'');
        DM := TDM.Create(NIL);

        //Buscar Dados sobre Produtos Relacionados a Compra.
        Ct := Controle.Create(DM,PdComp);
        Ct.ListarProdutosCompra;
        
        //Atribui o Objeto DATASET ao QuickReport.
        FrmImprimirCompra.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuindo Dado sobre Pedido De Compra.
        FrmImprimirCompra.QRDBText8.DataSet := DM.ZQuery1;
        FrmImprimirCompra.QRDBText8.DataField := 'codPedCompra';
        FrmImprimirCompra.QRDBText15.DataSet := DM.ZQuery1;
        FrmImprimirCompra.QRDBText15.DataField := 'dataCompra';

        //Atribuição dos Dados referentes aos produtos comprados
        FrmImprimirCompra.QRDBText9.DataSet := DM.ZQuery1;
        FrmImprimirCompra.QRDBText9.DataField := 'codProd';
        FrmImprimirCompra.QRDBText10.DataSet := DM.ZQuery1;
        FrmImprimirCompra.QRDBText10.DataField := 'nomeProd';
        FrmImprimirCompra.QRDBText11.DataSet := DM.ZQuery1;
        FrmImprimirCompra.QRDBText11.DataField := 'qtdpesoItemPed';
        FrmImprimirCompra.QRDBText12.DataSet := DM.ZQuery1;
        FrmImprimirCompra.QRDBText12.DataField := 'qtdunitItemPed';
        FrmImprimirCompra.QRDBText13.DataSet := DM.ZQuery1;
        DecimalSeparator := ',';
        FrmImprimirCompra.QRDBText13.DataField := 'valorPag';
        FrmImprimirCompra.QRDBText13.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema na Impressão dos Iténs de Pedido.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmTelaCompraRealizada.SomarValorTotal;
var
    PdComp : PedidoDeCompra;
    Ct : Controle;
    DM : TDM;
begin
    PdComp  := PedidoDeCompra.Create(StrToInt(self.Edit6.Text),00/00/0000,0,'');
    DM := TDM.Create(NIL);

    //Buscar Dados sobre Produtos Relacionados a Compra.
    Ct := Controle.Create(DM,PdComp);
    Ct.SomaValorPagoItemPed;

   //Atribui o Objeto DATASET ao QuickReport.
    FrmImprimirCompra.QuickRep1.DataSet := DM.ZQuery1;

    //Atribuição do Valor Referente ao Somatório Total dos Valores Pagos por Iténs.
    FrmImprimirCompra.QRDBText14.DataSet := DM.ZQuery1;
    DecimalSeparator := ',';
    FrmImprimirCompra.QRDBText14.DataField := 'sum(valorPag)';
    FrmImprimirCompra.QRDBText14.Mask := 'R$ ,0.00;-R$ ,0.00';
end;


Procedure TFrmTelaCompraRealizada.ImprimirCompra;
begin
    self.FornecedorCompra;
    self.ProdutosCompra;
    FrmImprimirCompra.QuickRep1.Preview;
end;


procedure TFrmTelaCompraRealizada.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
    Ct : Controle;
    PdComp : PedidoDeCompra;
    DM : TDM;
begin
    try
        DM := TDM.Create(NIL);
        PdComp := PedidoDeCompra.Create(StrToInt(self.Edit6.Text),00/00/0000,0,'');
        Ct := Controle.Create(DM,PdComp);

        if(statusExcluir <> 1) then
        begin
            if(Ct.ContarItensCompra = 0) then
            begin
                MessageDlg('Compra sem Nenhum Produto Relacionado.', mtWarning, [mbOk], 0);
                if MessageDlg('Deseja sair e excluir essa Compra e as informações relacionadas a ela?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
                begin
                    Ct.CancelarRealizacaoDeCompra;
                    CanClose := true;
                end
                else
                begin
                    CanClose := false;
                end;
            end
        end
        else
           CanClose := true;
    except
        MessageDlg('Problema com Fechamento do Formulário.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaCompraRealizada.BitBtn5Click(Sender: TObject);
begin
    self.ImprimirCompra;
end;

procedure TFrmTelaCompraRealizada.BitBtn3Click(Sender: TObject);
var
    DM   : TDM;
    Ct   : Controle;
    Estq : Estoque;
    PdComp : PedidoDeCompra;
    Prod : Produto;
begin
    try
        if MessageDlg('Deseja Fechar a Compra e Atribuir as Quantidades Compradas ao Estoque Atual?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
            DM := TDM.Create(NIL);
            PdComp := PedidoDeCompra.Create(0,NOW,0,'');
            PdComp.setcodPedCompra(StrToInt(self.Edit6.Text));
            PdComp.setstatusCompra('F');
            Ct := Controle.Create(DM,PdComp);
            Ct.AlterarEstqParaCompraFechada;
            Ct.AlterarCompraParaFechada;
            MessageDlg('Compra fechada.', mtInformation, [mbOk], 0);
            MessageDlg('Quantidades compradas atribuídas ao Estoque com sucesso.', mtInformation, [mbOk], 0);
            statusExcluir := 1;
            self.Close;
        end
        else
        begin
            MessageDlg('Compra não fechada.', mtInformation, [mbOk], 0);
        end;
    except
        MessageDlg('Problema ao fechar a compra.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaCompraRealizada.BitBtn4Click(Sender: TObject);
var
    Ct : Controle;
    PdComp : PedidoDeCompra;
    DM : TDM;
begin
    try
        if MessageDlg('Deseja Excluir essa Compra e as informações relacionadas a ela?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
            DM := TDM.Create(NIL);
            PdComp := PedidoDeCompra.Create(StrToInt(self.Edit6.Text),00/00/0000,0,'');
            Ct := Controle.Create(DM,PdComp);
            Ct.CancelarRealizacaoDeCompra;
            MessageDlg('Compra excluída com sucesso.', mtInformation, [mbOk], 0);
            statusExcluir := 1;
            self.close;
        end
    except
        MessageDlg('Problema na Exclusão da Compra e seus Iténs.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmTelaCompraRealizada.MostrarItens;
var
    Ct : Controle;
    PdComp : PedidoDeCompra;
    Forn  : Fornecedor;
    DM : TDM;
begin
    try
        //---Inicilializando os Objetos.
        DM := TDM.Create(NIL);
        PdComp := PedidoDeCompra.Create(StrToInt(self.Edit6.Text),00/00/0000,0,'');
        Forn := Fornecedor.Create(StrToInt(self.Edit5.Text),'','','','','','',0,00/00/0000,'','');
        Ct := Controle.Create(DM,PdComp,Forn);

        //---Atribuindo o DataSet ao DBGRID
        DM.DS1.DataSet := DM.ZQuery1;
        self.DBGrid1.DataSource := DM.DS1;

        //---Chamando o Metodo de Listagem de Produtos da Compra na Classe de Controle.
        Ct.ListarProdutosPedCompraPorCodForn;

        //----Incluindo os Produtos da Compra Realizada.
        self.DBGrid1.Columns[0].FieldName := 'codProd';
        self.DBGrid1.Columns[1].FieldName := 'nomeProd';
        DecimalSeparator := ',';
        self.DBGrid1.Columns[2].FieldName := 'qtdpesoItemPed';
        self.DBGrid1.Columns[3].FieldName := 'qtdunitItemPed';
        DecimalSeparator := ',';
        self.DBGrid1.Columns[4].FieldName := 'valorPag';
    except
        MessageDlg('Problema na listagem dos Itens de Compra.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmTelaCompraRealizada.CalcValTotPedCompra;
var
    Ct : Controle;
    PdComp : PedidoDeCompra;
    DM : TDM;
    valor : real;
begin
    try
        //---Inicilializando os Objetos.
        DM := TDM.Create(NIL);
        PdComp := PedidoDeCompra.Create(StrToInt(self.Edit6.Text),NOW,0,'A');
        Ct := Controle.Create(DM,PdComp);
        Ct.SomaValorPagoItemPed;
        valor := DM.ZQuery1.FieldByName('sum(valorPag)').AsFloat;
        DecimalSeparator := '.';
        PdComp.setvalTotPedCompra(valor);
        Ct.AlterarPedCompra;
        DecimalSeparator := ',';
        self.CurrencyEdit1.Text := FloatToStr(PdComp.getValTotPedCompra);
    except
        MessageDlg('Problema no Calculo do Valor Total de Compra.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaCompraRealizada.MaskEdit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmTelaCompraRealizada.Edit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmTelaCompraRealizada.CurrencyEdit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

end.




