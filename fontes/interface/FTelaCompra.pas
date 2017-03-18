unit FTelaCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, rxToolEdit, rxCurrEdit, StdCtrls, Buttons, Grids, DBGrids,
  FSelItemPed, cPedidoDeCompra, cControle, cDataModule, cFornecedor,
  ComCtrls, cItemDePedido, cProduto, cPessoaFisica, cPessoaJuridica, FImprimirCompra;

type
  TFrmTelaCompra = class(TForm)
    Venda: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    GroupBox3: TGroupBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure GerarCodPedCompra;
    procedure CriarRegPedCompra;
    procedure FormShow(Sender: TObject);
    Procedure SomaValorTotal;
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ClearBox;
    procedure FornecedorCompra;
    procedure ProdutosCompra;
    Procedure ImprimirCompra;
    procedure SomarValorTotal;
    Procedure MostrarItens;
    procedure BitBtn4Click(Sender: TObject);
    procedure CancelarCompra;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
  private
    PodeFechar : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCompra: TFrmTelaCompra;
  vatual : real;
  vtotal : real;

implementation

{$R *.dfm}

uses
    FRealizarCompra;

procedure TFrmTelaCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    DM  : TDM;
    Ct  : Controle;
    PdComp : PedidoDeCompra;
begin
    if(Edit3.Text <> '') then
    begin
        try
           DM  := TDM.Create(NIL);
           PdComp := PedidoDeCompra.Create(StrToInt(self.Edit4.Text),00/00/0000,0,'');
           Ct := Controle.Create(DM,PdComp);
           Ct.CancelarRealizacaoDeCompra;
           self.DBGrid1.DataSource := DM.DS1;
           self.DBGrid1.DataSource.Destroy;
           self.ClearBox;
        except
            MessageDlg('Problema na Cancelamento da Compra.', mtError, [mbOk], 0);
        end;
    end;
    FrmRealizarCompra.Close;
end;

procedure TFrmTelaCompra.BitBtn2Click(Sender: TObject);
begin
    FrmSelItemPed.ShowModal;
end;

procedure TFrmTelaCompra.GerarCodPedCompra;
var
    DM  : TDM;
    Ct  : Controle;
    res : integer;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        res := Ct.GerarMaxPedComp;
        Edit4.Text := IntToStr(res + 1);
    except
        MessageDlg('Problema na Geração do Código de Pedido de Compra.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaCompra.CriarRegPedCompra;
var
    PdComp : PedidoDeCompra;
    DM     : TDM;
    Ct     : Controle;
    Forn   : Fornecedor;
begin
    try
        Forn   := Fornecedor.Create(StrToInt(Edit3.Text),'','','','','','',0,00/00/0000,'','');
        DM     := TDM.Create(NIL);
        PdComp := PedidoDeCompra.Create(StrToInt(self.Edit4.Text),NOW,0,'A');
        Ct     := Controle.Create(DM,PdComp,Forn);
        Ct.CriarRegPedCompra;
    except
        MessageDlg('Problema na Criação do Registro de Pedido de Compra.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmTelaCompra.FormShow(Sender: TObject);
begin
    self.PodeFechar := false;
    self.GerarCodPedCompra;
    self.CriarRegPedCompra;
end;

Procedure TFrmTelaCompra.SomaValorTotal;
var
    Ct : Controle;
    DM : TDM;
    PdComp : PedidoDeCompra;
begin
    try
        DM := TDM.Create(NIL);
        PdComp := PedidoDeCompra.Create(StrToInt(self.Edit4.Text),00/00/0000,0,'');
        Ct := Controle.Create(DM,PdComp);
        Ct.SomaValorPagoItemPed;
        self.CurrencyEdit1.Text := DM.ZQuery1.FieldByName('sum(valorPag)').AsString;
    except
        MessageDlg('Problema ao Calcular o Valor Total de Compra.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaCompra.DBGrid1ColEnter(Sender: TObject);
begin
    try
        self.Edit2.Text := DBGrid1.DataSource.DataSet.FieldByName('codItemPed').AsString;
    except
        MessageDlg('Problema ao atribuir o código do Item de Pedido.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaCompra.BitBtn1Click(Sender: TObject);
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
            ItemPed := ItemDePedido.Create(StrToInt(self.Edit2.Text),0,0,0);
            PdComp  := PedidoDeCompra.Create(StrToInt(self.Edit4.Text),00/00/0000,0,'');

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
                self.BitBtn3.Enabled := false;
                self.DBGrid1.Enabled := false;
            end;
        end
        else
        begin
            MessageDlg('Nenhum Produto foi selecionado para Exclusão.', mtError, [mbOk], 0);
        end;
    except
        MessageDlg('Problema na Exclusão do Item de Pedido.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmTelaCompra.BitBtn3Click(Sender: TObject);
var
    PdComp  : PedidoDeCompra;
    DM      : TDM;
    Ct      : Controle;
    val_tot : real;
begin
    try
        DM := TDM.Create(NIL);
        val_tot := StrToFloat(self.CurrencyEdit1.Text);
        DecimalSeparator := '.';
        PdComp := PedidoDeCompra.Create(StrToInt(self.Edit4.Text),NOW,val_tot,'A');
        Ct := Controle.Create(DM,PdComp);
        Ct.AlterarPedCompra;

        if MessageDlg('Deseja Imprimir Informações sobre a Compra Realizada?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
            self.ImprimirCompra;
        end
        else
        begin
            MessageDlg('Compra Confirmada com Sucesso.', mtInformation, [mbOk], 0);
        end;
        self.ClearBox;
        self.PodeFechar := true;
        self.Close;
    except
        MessageDlg('Problema na Confirmação da Compra.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaCompra.ClearBox;
begin
    self.Edit1.Text := '';
    self.Edit2.Text := '';
    self.Edit3.Text := '';
    self.Edit4.Text := '';
    self.CurrencyEdit1.Text := '';
end;

procedure TFrmTelaCompra.FornecedorCompra;
var
    PdComp : PedidoDeCompra;
    Ct : Controle;
    DM : TDM;
begin
    try
        PdComp  := PedidoDeCompra.Create(StrToInt(self.Edit4.Text),00/00/0000,0,'');
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM,PdComp);

        //Atribui o Objeto DataSet ao QuickReport.
        FrmImprimirCompra.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuindo os Dados sobre Fornecedor Vinculado a Compra Realizada.
        if(self.Label1.Caption = 'CNPJ:') then
        begin
            Ct.BuscarPJPedidoDeCompra;
            FrmImprimirCompra.QRLabel4.Caption := 'CNPJ:';
            FrmImprimirCompra.QRLabel8.Caption := 'Razão Social:';
            FrmImprimirCompra.QRDBText1.DataSet := DM.ZQuery1;
            FrmImprimirCompra.QRDBText1.DataField := 'razaoSocial';
            FrmImprimirCompra.QRDBText4.DataSet := DM.ZQuery1;
            FrmImprimirCompra.QRDBText4.DataField := 'cnpj';
        end
        else if(self.Label1.Caption = 'CPF:') then
        begin
            Ct.BuscarPFPedidoDeCompra;
            FrmImprimirCompra.QRLabel4.Caption := 'CPF:';
            FrmImprimirCompra.QRLabel8.Caption := 'Nome:';
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

Procedure TFrmTelaCompra.ProdutosCompra;
var
    PdComp : PedidoDeCompra;
    Ct : Controle;
    DM : TDM;
begin
    try
        PdComp  := PedidoDeCompra.Create(StrToInt(self.Edit4.Text),00/00/0000,0,'');
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
        FrmImprimirCompra.QuickRep1.Preview;
    except
        MessageDlg('Problema na Impressão dos Iténs de Pedido.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmTelaCompra.SomarValorTotal;
var
    PdComp : PedidoDeCompra;
    Ct : Controle;
    DM : TDM;
begin
    PdComp  := PedidoDeCompra.Create(StrToInt(self.Edit4.Text),00/00/0000,0,'');
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


Procedure TFrmTelaCompra.ImprimirCompra;
begin
    self.FornecedorCompra;
    self.SomarValorTotal;
    self.ProdutosCompra;
end;

Procedure TFrmTelaCompra.MostrarItens;
var
    DM     : TDM;
    PdComp : PedidoDeCompra;
    Ct     : Controle;
begin
    //Listando os Itens de Pedido no DBGRID na Tela Compra:
    try
        DM := TDM.Create(NIL);
        PdComp := PedidoDeCompra.Create(StrToInt(self.Edit4.Text),00/00/0000,0,'');
        Ct := Controle.Create(DM,PdComp);
        self.DBGrid1.Enabled := true;
        DM.DS1.DataSet := DM.ZQuery1;
        self.DBGrid1.DataSource := DM.DS1;
        Ct.ListarItensPorCodPedidoDeCompra;
        DecimalSeparator := ',';
        FrmTelaCompra.DBGrid1.Columns[0].FieldName := 'codProd';
        FrmTelaCompra.DBGrid1.Columns[1].FieldName := 'nomeProd';
        FrmTelaCompra.DBGrid1.Columns[2].FieldName := 'qtdpesoItemPed';
        FrmTelaCompra.DBGrid1.Columns[3].FieldName := 'qtdunitItemPed';
        FrmTelaCompra.DBGrid1.Columns[4].FieldName := 'valorPag';
    except
        MessageDlg('Problema na Listagem dos Iténs de Venda.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmTelaCompra.BitBtn4Click(Sender: TObject);
begin
    if MessageDlg('Deseja cancelar a realização de compra?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        self.CancelarCompra;
        self.PodeFechar := true;
        self.Close;
        FrmRealizarCompra.Close;
    end;
end;

procedure TFrmTelaCompra.CancelarCompra;
var
    DM  : TDM;
    Ct  : Controle;
    PdComp : PedidoDeCompra;
begin
    try
       DM  := TDM.Create(NIL);
       PdComp := PedidoDeCompra.Create(StrToInt(self.Edit4.Text),00/00/0000,0,'');
       Ct := Controle.Create(DM,PdComp);
       Ct.CancelarRealizacaoDeCompra;
       self.DBGrid1.DataSource := DM.DS1;
       self.DBGrid1.DataSource.Destroy;
       self.ClearBox;
    except
       MessageDlg('Problema no Cancelamento da Compra.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaCompra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

procedure TFrmTelaCompra.MaskEdit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmTelaCompra.Edit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmTelaCompra.CurrencyEdit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

end.
