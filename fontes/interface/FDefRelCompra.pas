unit FDefRelCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, Buttons, FSelFornRelCompra, FRelCompraPorCatg,
  FRelCompraTodosProd,FRelCompraPorForn, FRelCompraTotaisCompra, cControle, cDataModule,
  rxToolEdit, rxCurrEdit, cProduto, cPessoaFisica, cPessoaJuridica, cFornecedor, FRelCompraPorProduto,
  cEstoque;

type
  TFrmDefRelCompra = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    GroupBox2: TGroupBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    MaskEdit1: TMaskEdit;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    CheckBox1: TCheckBox;
    CheckBox4: TCheckBox;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ComboBox1: TComboBox;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    CheckBox5: TCheckBox;
    GroupBox6: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    CheckBox7: TCheckBox;
    DateTimePicker7: TDateTimePicker;
    DateTimePicker8: TDateTimePicker;
    Edit1: TEdit;
    Edit3: TEdit;
    GroupBox7: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ComboBox2: TComboBox;
    DateTimePicker9: TDateTimePicker;
    DateTimePicker10: TDateTimePicker;
    CheckBox6: TCheckBox;
    ComboBox3: TComboBox;
    RadioButton5: TRadioButton;
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RelatorioCompleto;
    procedure ListarTodosProdutos;
    procedure ValorTotaldeProdComp;
    procedure RelatorioValoresTotais;
    procedure QtdCompras;
    procedure QtdComprasAbertas;
    procedure QtdComprasFechadas;
    procedure ValorTotalDeComprasAbertas;
    procedure ValorTotalDeComprasFechadas;
    procedure ValorTotalDeCompra;
    procedure MaiorValorTotalDeCompra;
    procedure MenorValorTotalDeCompra;
    procedure FornecedorCompraMaiorValor;
    procedure FornecedorCompraMenorValor;
    Procedure RelatorioPorCategoria;
    Procedure ListarCategoria;
    Procedure ProdutosCompradosPorCategoria;
    Procedure SomarValorCompradoPorCategoria;
    Procedure RetornarCategoria;
    Procedure RelatorioPorFornecedor;
    procedure InserirDadosdoFornRelPorForn;
    procedure ProdutosCompradosPorFornecedor;
    procedure QtdCompraporFornecedor;
    procedure ValorMenorCompraPorFornecedor;
    procedure ValorMaiorCompraPorFornecedor;
    procedure DataDaPrimCompraPorFornecedor;
    procedure DataDaUltCompraPorFornecedor;
    procedure ValorTotalDeCompraPorFornecedor;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SomaValorPagoPorProduto;
    procedure SomaQuantidadeRelacaoProdutoCompra;
    procedure SomatorioQuantidadeCompradaDoProduto;
    procedure DadosProdutoRelatorioPorProd;
    procedure RelatorioDeCompraPorProduto;
    procedure ListarProdPorCatg;
    procedure RadioButton5Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
  private
    PodeFechar : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDefRelCompra: TFrmDefRelCompra;
  tipo_medida : string;

implementation

{$R *.dfm}

uses
    FControlarCompra;

procedure TFrmDefRelCompra.RadioButton2Click(Sender: TObject);
begin
    self.GroupBox3.Visible := false;
    self.GroupBox4.Visible := true;
    self.GroupBox5.Visible := false;
    self.GroupBox6.Visible := false;
    self.GroupBox7.Visible := false;
end;

procedure TFrmDefRelCompra.RadioButton1Click(Sender: TObject);
begin
    self.GroupBox3.Visible := true;
    self.GroupBox4.Visible := false;
    self.GroupBox5.Visible := false;
    self.GroupBox6.Visible := false;
    self.GroupBox7.Visible := false;
    FrmSelFornRelCompra.ShowModal;
end;

procedure TFrmDefRelCompra.RadioButton4Click(Sender: TObject);
begin
    self.ListarCategoria;
    self.GroupBox3.Visible := false;
    self.GroupBox4.Visible := false;
    self.GroupBox5.Visible := true;
    self.GroupBox6.Visible := false;
    self.GroupBox7.Visible := false;
end;

procedure TFrmDefRelCompra.CheckBox7Click(Sender: TObject);
begin
    if(self.CheckBox7.Checked = true) then
    begin
        self.DateTimePicker7.Enabled := true;
        self.DateTimePicker8.Enabled := true;
    end
    else if(self.CheckBox7.Checked = false) then
    begin
        self.DateTimePicker7.Enabled := false;
        self.DateTimePicker8.Enabled := false;
    end;
end;

procedure TFrmDefRelCompra.CheckBox5Click(Sender: TObject);
begin
    if(self.CheckBox5.Checked = true) then
    begin
        self.DateTimePicker5.Enabled := true;
        self.DateTimePicker6.Enabled := true;
    end
    else if(self.CheckBox5.Checked = false) then
    begin
        self.DateTimePicker5.Enabled := false;
        self.DateTimePicker6.Enabled := false;
    end;
end;

procedure TFrmDefRelCompra.CheckBox4Click(Sender: TObject);
begin
    if(self.CheckBox4.Checked = true) then
    begin
        self.DateTimePicker3.Enabled := true;
        self.DateTimePicker4.Enabled := true;
    end
    else if(self.CheckBox4.Checked = false) then
    begin
        self.DateTimePicker3.Enabled := false;
        self.DateTimePicker4.Enabled := false;
    end;
end;

procedure TFrmDefRelCompra.CheckBox3Click(Sender: TObject);
begin
    if(self.CheckBox3.Checked = true) then
    begin
        self.DateTimePicker1.Enabled := true;
        self.DateTimePicker2.Enabled := true;
    end
    else if(self.CheckBox3.Checked = false) then
    begin
        self.DateTimePicker1.Enabled := false;
        self.DateTimePicker2.Enabled := false;
    end;
end;

procedure TFrmDefRelCompra.BitBtn1Click(Sender: TObject);
begin
    if(self.RadioButton2.Checked = true) then
    begin
        self.RelatorioCompleto;
    end
    else if(self.RadioButton1.Checked = true) then
    begin
        self.RelatorioPorFornecedor;
    end
    else if(self.RadioButton4.Checked = true) then
    begin
       self.RelatorioPorCategoria;
    end
    else if(self.RadioButton3.Checked = true) then
    begin
        self.RelatorioValoresTotais;
    end
    else if(self.RadioButton5.Checked = true) then
    begin
        self.RelatorioDeCompraPorProduto;
    end;
end;

procedure TFrmDefRelCompra.RelatorioCompleto;
begin
    //Por Período
    if(self.CheckBox4.Checked = true) then
    begin
        FrmRelCompraTodosProd.QRLabel7.Caption := 'Relatório de Produtos Comprados por Período.';
        FrmRelCompraTodosProd.QRLabel22.Caption := DateToStr(self.DateTimePicker3.Date);
        FrmRelCompraTodosProd.QRLabel23.Caption := DateToStr(self.DateTimePicker4.Date);
        self.ValorTotaldeProdComp;
        if(self.CheckBox1.Checked = true)then
        begin
            self.ListarTodosProdutos;
        end;
        FrmRelCompraTodosProd.QuickRep1.Preview;
    end

    //Sem Definição de Período
    else if(self.CheckBox4.Checked = false) then
    begin
        FrmRelCompraTodosProd.QRLabel7.Caption := 'Relatório de Produtos Comprados.';
        FrmRelCompraTodosProd.QRLabel22.Caption := '';
        FrmRelCompraTodosProd.QRLabel23.Caption := '';
        self.ValorTotaldeProdComp;
        if(self.CheckBox1.Checked = true)then
        begin
            self.ListarTodosProdutos;
        end;
        FrmRelCompraTodosProd.QuickRep1.Preview;
    end
end;


procedure TFrmDefRelCompra.ListarTodosProdutos;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        if(self.CheckBox4.Checked = true) then
        begin
            Ct.ListarTodosProdCompradosPorPeriod(self.DateTimePicker3.Date,self.DateTimePicker4.Date);
        end
        else if(self.CheckBox4.Checked = false)then
        begin
            Ct.ListarTodosProdComprados;
        end;

        FrmRelCompraTodosProd.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelCompraTodosProd.QRDBText1.DataSet := DM.ZQuery1;
        FrmRelCompraTodosProd.QRDBText1.DataField := 'codProd';
        FrmRelCompraTodosProd.QRDBText2.DataSet := DM.ZQuery1;
        FrmRelCompraTodosProd.QRDBText2.DataField := 'nomeProd';
        FrmRelCompraTodosProd.QRDBText9.DataSet := DM.ZQuery1;
        FrmRelCompraTodosProd.QRDBText9.DataField := 'catProd';
        FrmRelCompraTodosProd.QRDBText5.DataSet := DM.ZQuery1;
        FrmRelCompraTodosProd.QRDBText5.DataField := 'qtdpesoItemPed';
        FrmRelCompraTodosProd.QRDBText6.DataSet := DM.ZQuery1;
        FrmRelCompraTodosProd.QRDBText6.DataField := 'qtdUnitItemPed';
        FrmRelCompraTodosProd.QRDBText10.DataSet := DM.ZQuery1;
        FrmRelCompraTodosProd.QRDBText10.DataField := 'valorPag';
        DecimalSeparator := ',';
        FrmRelCompraTodosProd.QRDBText10.Mask := 'R$ ,0.00;-R$ ,0.00';
        FrmRelCompraTodosProd.QRDBText3.DataSet := DM.ZQuery1;
        FrmRelCompraTodosProd.QRDBText3.DataField := 'razaoSocial';
    except
        MessageDlg('Problema na Listagem dos Iténs dos Produtos Comprados.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmDefRelCompra.ValorTotaldeProdComp;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        if(self.CheckBox4.Checked = true)then
        begin
           Ct.SomarValorTotalDeCompraPorPeriod(self.DateTimePicker3.Date,self.DateTimePicker4.Date);
        end
        else if(self.CheckBox4.Checked = false)then
        begin
            Ct.SomarValorTotalDeCompra;
        end;

        //Atribuição do DataSet ao QuickReport
        FrmRelCompraTodosProd.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição do Valor Total de Compra.
        FrmRelCompraTodosProd.QRDBText7.DataSet   := DM.ZQuery1;
        FrmRelCompraTodosProd.QRDBText7.DataField := 'SUM(valtotcompra)';
        DecimalSeparator := ',';
        FrmRelCompraTodosProd.QRDBText7.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema no Cálculo do Valor Total Comprado.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmDefRelCompra.RelatorioValoresTotais;
begin
    //Por Período
    if(self.CheckBox7.Checked = true) then
    begin
        FrmRelCompraTotaisCompra.QRLabel7.Caption := 'Relatório sobre Valores Totais de Compra Por Período.';
        FrmRelCompraTotaisCompra.QRLabel20.Caption := DateToStr(self.DateTimePicker7.Date);
        FrmRelCompraTotaisCompra.QRLabel21.Caption := DateToStr(self.DateTimePicker8.Date);
    end

    //Sem Definição de Período
    else if(self.CheckBox7.Checked = false) then
    begin
        FrmRelCompraTotaisCompra.QRLabel7.Caption := 'Relatório sobre Valores Totais de Compra.';
        FrmRelCompraTotaisCompra.QRLabel20.Caption := '';
        FrmRelCompraTotaisCompra.QRLabel21.Caption := '';
    end;

    self.QtdCompras;
    self.QtdComprasAbertas;
    self.QtdComprasFechadas;
    self.ValorTotalDeComprasAbertas;
    self.ValorTotalDeComprasFechadas;
    self.ValorTotalDeCompra;
    self.MaiorValorTotalDeCompra;
    self.MenorValorTotalDeCompra;
    self.FornecedorCompraMaiorValor;
    self.FornecedorCompraMenorValor;
    FrmRelCompraTotaisCompra.QuickRep1.Preview;
end;


procedure TFrmDefRelCompra.QtdCompras;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        if(self.CheckBox7.Checked = true)then
        begin
            Ct.SomarQtdCompraRealizadaPorPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
        end
        else if(self.CheckBox7.Checked = false)then
        begin
            Ct.SomarQtdCompraRealizada;
        end;

        //Atribuição do DataSet ao QuickReport
        FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição do Valor Total de Compra.
        FrmRelCompraTotaisCompra.QRDBText1.DataSet   := DM.ZQuery1;
        FrmRelCompraTotaisCompra.QRDBText1.DataField := 'count(codpedCompra)';
    except
         MessageDlg('Problema no Cálculo das Quantidades de Compras Realizadas.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmDefRelCompra.QtdComprasAbertas;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        if(self.CheckBox7.Checked = true)then
        begin
            Ct.SomarQtdCompraAbertaPorPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
        end
        else if(self.CheckBox7.Checked = false)then
        begin
            Ct.SomarQtdCompraAberta;
        end;

        //Atribuição do DataSet ao QuickReport
        FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição do Valor Total de Compra.
        FrmRelCompraTotaisCompra.QRDBText2.DataSet   := DM.ZQuery1;
        FrmRelCompraTotaisCompra.QRDBText2.DataField := 'count(codpedCompra)';
        
    except
        MessageDlg('Problema no Cálculo das Quantidades de Compras Abertas.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.QtdComprasFechadas;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        if(self.CheckBox7.Checked = true)then
        begin
            Ct.SomarQtdCompraFechadaPorPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
        end
        else if(self.CheckBox7.Checked = false)then
        begin
            Ct.SomarQtdCompraFechada;
        end;

         //Atribuição do DataSet ao QuickReport
        FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição do Valor Total de Compra.
        FrmRelCompraTotaisCompra.QRDBText3.DataSet   := DM.ZQuery1;
        FrmRelCompraTotaisCompra.QRDBText3.DataField := 'count(codpedCompra)';
    except
        MessageDlg('Problema no Cálculo das Quantidades de Compras Fechadas.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.ValorTotalDeComprasAbertas;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        if(self.CheckBox7.Checked = true)then
        begin
            Ct.SomarValorTotalDeCompraAbertaPorPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
        end
        else if(self.CheckBox7.Checked = false)then
        begin
            Ct.SomarValorTotalDeCompraAberta;
        end;

        //Atribuição do DataSet ao QuickReport
        FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição do Valor Total de Compra.
        FrmRelCompraTotaisCompra.QRDBText6.DataSet   := DM.ZQuery1;
        FrmRelCompraTotaisCompra.QRDBText6.DataField := 'SUM(valtotcompra)';
        DecimalSeparator := ',';
        FrmRelCompraTotaisCompra.QRDBText6.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema no Cálculo do Valor Total de Compras Abertas.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.ValorTotalDeComprasFechadas;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        if(self.CheckBox7.Checked = true)then
        begin
            Ct.SomarValorTotalDeCompraFechadaPorPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
        end
        else if(self.CheckBox7.Checked = false)then
        begin
            Ct.SomarValorTotalDeCompraFechada;
        end;

         //Atribuição do DataSet ao QuickReport
        FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição do Valor Total de Compra.
        FrmRelCompraTotaisCompra.QRDBText5.DataSet   := DM.ZQuery1;
        FrmRelCompraTotaisCompra.QRDBText5.DataField := 'SUM(valtotcompra)';
        DecimalSeparator := ',';
        FrmRelCompraTotaisCompra.QRDBText5.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema no Cálculo do Valor Total de Compras Fechadas.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.ValorTotalDeCompra;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        if(self.CheckBox7.Checked = true)then
        begin
            Ct.SomarValorTotalDeCompraPorPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
        end
        else if(self.CheckBox7.Checked = false)then
        begin
            Ct.SomarValorTotalDeCompra;
        end;

         //Atribuição do DataSet ao QuickReport
        FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição do Valor Total de Compra.
        FrmRelCompraTotaisCompra.QRDBText7.DataSet   := DM.ZQuery1;
        FrmRelCompraTotaisCompra.QRDBText7.DataField := 'SUM(valtotcompra)';
        DecimalSeparator := ',';
        FrmRelCompraTotaisCompra.QRDBText7.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema no Cálculo do Valor Total de Compras.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.MaiorValorTotalDeCompra;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        if(self.CheckBox7.Checked = true)then
        begin
            Ct.MaxValorTotalDeCompraPorPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
        end
        else if(self.CheckBox7.Checked = false)then
        begin
            Ct.MaxValorTotalDeCompra;
        end;

         //Atribuição do DataSet ao QuickReport
        FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição do Valor Total de Compra.
        FrmRelCompraTotaisCompra.QRDBText10.DataSet   := DM.ZQuery1;
        FrmRelCompraTotaisCompra.QRDBText10.DataField := 'MAX(valtotcompra)';
        DecimalSeparator := ',';
        FrmRelCompraTotaisCompra.QRDBText10.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema no Cálculo do Maior Valor de Compra.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.MenorValorTotalDeCompra;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        if(self.CheckBox7.Checked = true)then
        begin
            Ct.MenValorTotalDeCompraPorPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
        end
        else if(self.CheckBox7.Checked = false)then
        begin
            Ct.MenValorTotalDeCompra;
        end;

         //Atribuição do DataSet ao QuickReport
        FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição do Valor Total de Compra.
        FrmRelCompraTotaisCompra.QRDBText9.DataSet   := DM.ZQuery1;
        FrmRelCompraTotaisCompra.QRDBText9.DataField := 'MIN(valtotcompra)';
        DecimalSeparator := ',';
        FrmRelCompraTotaisCompra.QRDBText9.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema no Cálculo do Menor Valor de Compra.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.FornecedorCompraMenorValor;
var
     DM : TDM;
     Ct : Controle;
     res : integer;

begin
     try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        if(self.CheckBox7.Checked = true)then
        begin
            res := Ct.BuscarFornecedorPJComMinValorCompraPorPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
            if(res = 1) then
            begin
                //Atribuição do DataSet ao QuickReport
                FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;
                FrmRelCompraTotaisCompra.QRDBText4.DataSet   := DM.ZQuery1;
                FrmRelCompraTotaisCompra.QRDBText4.DataField := 'razaoSocial';
            end
            else if(res = 0) then
            begin
                //Atribuição do DataSet ao QuickReport
                FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;
                Ct.BuscarFornecedorPFComMinValorCompraPorPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
                FrmRelCompraTotaisCompra.QRDBText4.DataSet   := DM.ZQuery1;
                FrmRelCompraTotaisCompra.QRDBText4.DataField := 'nomeForn';
            end;
        end

        else if(self.CheckBox7.Checked = false)then
        begin
            res := Ct.BuscarFornecedorPJComMinValorCompra;
            if(res = 1) then
            begin
                //Atribuição do DataSet ao QuickReport
                FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;
                FrmRelCompraTotaisCompra.QRDBText4.DataSet   := DM.ZQuery1;
                FrmRelCompraTotaisCompra.QRDBText4.DataField := 'razaoSocial';
            end
            else if(res = 0) then
            begin
                FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;
                Ct.BuscarFornecedorPFComMinValorCompra;
                FrmRelCompraTotaisCompra.QRDBText4.DataSet   := DM.ZQuery1;
                FrmRelCompraTotaisCompra.QRDBText4.DataField := 'nomeForn';
            end;
        end
    except
        MessageDlg('Problema no Cálculo do Menor Valor de Compra.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.FornecedorCompraMaiorValor;
var
    DM : TDM;
    Ct : Controle;
    res : integer;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        if(self.CheckBox7.Checked = true)then
        begin
            res := Ct.BuscarFornecedorPJComMaxValorCompraPorPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
            if(res = 1) then
            begin
                //Atribuição do DataSet ao QuickReport
                FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;
                FrmRelCompraTotaisCompra.QRDBText8.DataSet   := DM.ZQuery1;
                FrmRelCompraTotaisCompra.QRDBText8.DataField := 'razaoSocial';
            end
            else if(res = 0) then
            begin
                //Atribuição do DataSet ao QuickReport
                FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;
                Ct.BuscarFornecedorPFComMaxValorCompraPorPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
                FrmRelCompraTotaisCompra.QRDBText8.DataSet   := DM.ZQuery1;
                FrmRelCompraTotaisCompra.QRDBText8.DataField := 'nomeForn';
            end;
        end

        else if(self.CheckBox7.Checked = false)then
        begin
            res := Ct.BuscarFornecedorPJComMaxValorCompra;
            if(res = 1) then
            begin
                //Atribuição do DataSet ao QuickReport
                FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;
                FrmRelCompraTotaisCompra.QRDBText8.DataSet   := DM.ZQuery1;
                FrmRelCompraTotaisCompra.QRDBText8.DataField := 'razaoSocial';
            end
            else if(res = 0) then
            begin
                FrmRelCompraTotaisCompra.QuickRep1.DataSet := DM.ZQuery1;
                Ct.BuscarFornecedorPFComMaxValorCompra;
                FrmRelCompraTotaisCompra.QRDBText8.DataSet   := DM.ZQuery1;
                FrmRelCompraTotaisCompra.QRDBText8.DataField := 'nomeForn';
            end;
        end
    except
        MessageDlg('Problema no Cálculo do Menor Valor de Compra.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelCompra.ListarCategoria;
var
    DM   : TDM;
    Ct   : Controle;
    Prod : Produto;
begin
    try
        self.ComboBox2.Clear;
        self.ComboBox1.Clear;
        DM := TDM.Create(NIL);
        Prod := Produto.Create(0,'',0,'','','');
        Ct := Controle.Create(DM,Prod);
        Ct.ListarCat;

        While (NOT DM.ZQuery1.EOF) do
        begin
            Prod.setcatProd(DM.ZQuery1.FieldByName('catProd').AsString);
            self.ComboBox1.Items.Add(Prod.getcatProd);
            self.ComboBox2.Items.Add(Prod.getcatProd);
            DM.ZQuery1.Next;
        end;
    except
        MessageDlg('Problema na Listagem das Categorias.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmDefRelCompra.RelatorioPorCategoria;
begin
    try
        //Relatório definido por período.
        if(self.CheckBox5.Checked = true) then
        begin
            FrmRelCompraPorCatg.QRLabel7.Caption  := 'Relatório Por Período de Produtos Comprados Por Categoria';
            FrmRelCompraPorCatg.QRLabel22.Caption := DateToStr(self.DateTimePicker5.Date);
            FrmRelCompraPorCatg.QRLabel23.Caption := DateToStr(self.DateTimePicker6.Date);
        end
        //Relatório não definido por período.
        else if(self.CheckBox5.Checked = false) then
        begin
            FrmRelCompraPorCatg.QRLabel7.Caption := 'Relatório de Produtos Comprados Por Categoria';
            FrmRelCompraPorCatg.QRLabel22.Caption := '';
            FrmRelCompraPorCatg.QRLabel23.Caption := '';
        end;

        //Atribuindo os Dados sobre Venda de Produtos por Categoria ao Relatório.
        self.RetornarCategoria;
        self.SomarValorCompradoPorCategoria;
        self.ProdutosCompradosPorCategoria;
        FrmRelCompraPorCatg.QuickRep1.Preview;
    except
        MessageDlg('Problema na Exibição do Relatório de Compra por Categoria.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelCompra.SomarValorCompradoPorCategoria;
var
    DM   : TDM;
    Ct   : Controle;
    Prod : Produto;
begin
    try
        DM := TDM.Create(NIL);
        Prod := Produto.Create(0,'',0,'',self.ComboBox1.Text,'');
        Ct := Controle.Create(DM,Prod);

        //Somatorio definido por período.
        if(self.CheckBox5.Checked = true) then
        begin
            Ct.SomarValorPagoPorCatgCompraPorPeriod(self.DateTimePicker5.Date,self.DateTimePicker6.Date);
        end
        //Somatorio não definido por período.
        else if(self.CheckBox5.Checked = false) then
        begin
            Ct.SomarValorPagoPorCatgCompra;
        end;

        FrmRelCompraPorCatg.QRDBText7.DataSet := DM.ZQuery1;
        FrmRelCompraPorCatg.QRDBText7.DataField := 'SUM(valorpag)';
        DecimalSeparator := ',';
        FrmRelCompraPorCatg.QRDBText7.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema no Cálculo de Total Valor Pago por Categoria.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmDefRelCompra.ProdutosCompradosPorCategoria;
var
    DM   : TDM;
    Ct   : Controle;
    Prod : Produto;
begin
    try
        DM := TDM.Create(NIL);
        Prod := Produto.Create(0,'',0,'',self.ComboBox1.Text,'');
        Ct := Controle.Create(DM,Prod);

        //Listagem definida por período.
        if(self.CheckBox5.Checked = true) then
        begin
            Ct.ListarProdCompraPorCatgPorPeriod(self.DateTimePicker5.Date,self.DateTimePicker6.Date);
        end
        //Listagem não definida por período.
        else if(self.CheckBox5.Checked = false) then
        begin
            Ct.ListarProdCompraPorCatg;
        end;

        //Atribuição do DataSet.
        FrmRelCompraPorCatg.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição dos Produtos Por Categoria.
        FrmRelCompraPorCatg.QRDBText1.DataSet := DM.ZQuery1;
        FrmRelCompraPorCatg.QRDBText1.DataField := 'codProd';
        FrmRelCompraPorCatg.QRDBText2.DataSet := DM.ZQuery1;
        FrmRelCompraPorCatg.QRDBText2.DataField := 'nomeProd';
        FrmRelCompraPorCatg.QRDBText5.DataSet := DM.ZQuery1;
        FrmRelCompraPorCatg.QRDBText5.DataField := 'qtdPesoItemPed';
        FrmRelCompraPorCatg.QRDBText6.DataSet := DM.ZQuery1;
        FrmRelCompraPorCatg.QRDBText6.DataField := 'qtdUnitItemPed';
        FrmRelCompraPorCatg.QRDBText10.DataSet := DM.ZQuery1;
        FrmRelCompraPorCatg.QRDBText10.DataField := 'valorPag';
        DecimalSeparator := ',';
        FrmRelCompraPorCatg.QRDBText10.Mask := 'R$ ,0.00;-R$ ,0.00';
        FrmRelCompraPorCatg.QRDBText4.DataSet := DM.ZQuery1;
        FrmRelCompraPorCatg.QRDBText4.DataField := 'dataCompra';

        //Dados do Fornecedor
        FrmRelCompraPorCatg.QRDBText3.DataSet := DM.ZQuery1;
        FrmRelCompraPorCatg.QRDBText3.DataField := 'razaoSocial';
    except
        MessageDlg('Problema na Listagem dos Produtos Comprados por Categoria.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelCompra.RetornarCategoria;
var
    DM   : TDM;
    Ct   : Controle;
    Prod : Produto;
begin
    try
        DM := TDM.Create(NIL);
        Prod := Produto.Create(0,'',0,'',self.ComboBox1.Text,'');
        Ct := Controle.Create(DM,Prod);
        Ct.RetornarCatg;
        //Atribuição do DataSet.
        FrmRelCompraPorCatg.QuickRep1.DataSet := DM.ZQuery1;
        //Atribuição dos Produtos Por Categoria.
        FrmRelCompraPorCatg.QRDBText9.DataSet := DM.ZQuery1;
        FrmRelCompraPorCatg.QRDBText9.DataField := 'catProd';
    except
        MessageDlg('Problema no retono da Categoria Selecionada.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelCompra.RelatorioPorFornecedor;
begin
    //Relatório definido por período.
    if(self.CheckBox3.Checked = true) then
    begin
        FrmRelCompraPorForn.QRLabel7.Caption  := 'Relatório de Compra Por Fornecedor Definido por Período';
        FrmRelCompraPorForn.QRLabel32.Caption := DateToStr(self.DateTimePicker1.Date);
        FrmRelCompraPorForn.QRLabel33.Caption := DateToStr(self.DateTimePicker2.Date);
    end
    //Relatório não definido por período.
    else if(self.CheckBox3.Checked = false) then
    begin
        FrmRelCompraPorForn.QRLabel7.Caption := 'Relatório de Compra Por Fornecedor';
        FrmRelCompraPorForn.QRLabel32.Caption := '';
        FrmRelCompraPorForn.QRLabel33.Caption := '';
    end;

    //Atribuindo os dados sobre Compra de Produtos Por Fornecedor.
    self.InserirDadosdoFornRelPorForn;
    self.QtdCompraporFornecedor;
    self.ValorMenorCompraPorFornecedor;
    self.ValorMaiorCompraPorFornecedor;
    self.DataDaPrimCompraPorFornecedor;
    self.DataDaUltCompraPorFornecedor;
    self.ValorTotalDeCompraPorFornecedor;

    if(self.CheckBox2.Checked = true) then
    begin
        self.ProdutosCompradosPorFornecedor;
    end;
    FrmRelCompraPorForn.QuickRep1.Preview;
end;

procedure TFrmDefRelCompra.InserirDadosdoFornRelPorForn;
var
    PJ : PessoaJuridica;
    PF : PessoaFisica;
    Ct : Controle;
    DM : TDM;
begin
    try
        DM := TDM.Create(NIL);
        //Exibindo os Valores Mediante o Tipo do Fornecedor (Pessoa Jurídica ou Física).
        //Se Pessoa Jurídica.
        if(self.Edit3.Text = 'PJ') then
        begin
            PJ := PessoaJuridica.Create(0,'','','','','','',0,00/00/0000,'','','');
            Ct := Controle.Create(DM, PJ);
            PJ.setrazaoSocial(self.Edit2.Text);
            Ct.BuscarFornPorRazaoSocial;
            FrmRelCompraPorForn.QuickRep1.DataSet := DM.ZQuery1;
            FrmRelCompraPorForn.QRLabel23.Caption := 'CNPJ:';
            FrmRelCompraPorForn.QRDBText11.DataSet := DM.ZQuery1;
            FrmRelCompraPorForn.QRDBText11.DataField := 'cnpj';
            FrmRelCompraPorForn.QRDBText12.DataSet := DM.ZQuery1;
            FrmRelCompraPorForn.QRLabel24.Caption := 'R.Social:';
            FrmRelCompraPorForn.QRDBText12.DataField := 'razaoSocial';
            FrmRelCompraPorForn.QRDBText13.DataSet := DM.ZQuery1;
            FrmRelCompraPorForn.QRDBText13.DataField := 'statusForn';
        end
        //Se Pessoa Física.
        else if(self.Edit3.Text = 'PF') then
        begin
            PF := PessoaFisica.Create(0,'','','','','','',0,00/00/0000,'','','');
            Ct := Controle.Create(DM, PF);
            PF.setnome(self.Edit2.Text);
            Ct.BuscarFornPorNome;
            FrmRelCompraPorForn.QuickRep1.DataSet := DM.ZQuery1;
            FrmRelCompraPorForn.QRLabel23.Caption := 'CPF:';
            FrmRelCompraPorForn.QRDBText11.DataSet := DM.ZQuery1;
            FrmRelCompraPorForn.QRDBText11.DataField := 'cpfForn';
            FrmRelCompraPorForn.QRDBText12.DataSet := DM.ZQuery1;
            FrmRelCompraPorForn.QRLabel24.Caption := 'Nome:';
            FrmRelCompraPorForn.QRDBText12.DataField := 'nomeForn';
            FrmRelCompraPorForn.QRDBText13.DataSet := DM.ZQuery1;
            FrmRelCompraPorForn.QRDBText13.DataField := 'statusForn';
        end;
    except
        MessageDlg('Problema na Atribuição dos Dados sobre o Fornecedor.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.ProdutosCompradosPorFornecedor;
var
    Forn : Fornecedor;
    Ct   : Controle;
    DM   : TDM;
begin
    try
        DM := TDM.Create(NIL);
        Forn := Fornecedor.Create(StrToInt(self.Edit1.Text),'','','','','','',0,00/00/0000,'','');
        Ct := Controle.Create(DM,Forn);

        //Definido por período.
        if(self.CheckBox3.Checked = true) then
        begin
            Ct.ListarProdCompraPorFornPorPeriod(self.DateTimePicker1.Date,self.DateTimePicker2.Date);
        end
        //Não definido por período.
        else if(self.CheckBox3.Checked = false) then
        begin
            Ct.ListarProdCompraPorForn;
        end;

        //Atribuição do DATASET.
        FrmRelCompraPorForn.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição dos Produtos.
        FrmRelCompraPorForn.QRDBText1.DataSet := DM.ZQuery1;
        FrmRelCompraPorForn.QRDBText1.DataField := 'codProd';
        FrmRelCompraPorForn.QRDBText2.DataSet := DM.ZQuery1;
        FrmRelCompraPorForn.QRDBText2.DataField := 'nomeProd';
        FrmRelCompraPorForn.QRDBText3.DataSet := DM.ZQuery1;
        FrmRelCompraPorForn.QRDBText3.DataField := 'catProd';
        FrmRelCompraPorForn.QRDBText5.DataSet := DM.ZQuery1;
        FrmRelCompraPorForn.QRDBText5.DataField := 'qtdPesoItemPed';
        FrmRelCompraPorForn.QRDBText6.DataSet := DM.ZQuery1;
        FrmRelCompraPorForn.QRDBText6.DataField := 'qtdunitItemPed';
        FrmRelCompraPorForn.QRDBText10.DataSet := DM.ZQuery1;
        FrmRelCompraPorForn.QRDBText10.DataField := 'valorPag';
        DecimalSeparator := ',';
        FrmRelCompraPorForn.QRDBText10.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema na Atribuição dos Dados sobre o Fornecedor.', mtError, [mbOk], 0);
    end;
end;



procedure TFrmDefRelCompra.QtdCompraporFornecedor;
var
    Forn : Fornecedor;
    Ct   : Controle;
    DM   : TDM;
begin
    try
        DM := TDM.Create(NIL);
        Forn := Fornecedor.Create(StrToInt(self.Edit1.Text),'','','','','','',0,00/00/0000,'','');
        Ct := Controle.Create(DM,Forn);

        //Definido por período.
        if(self.CheckBox3.Checked = true) then
        begin
            Ct.QtdCompraPorFornecedorPorPeriod(self.DateTimePicker1.Date,self.DateTimePicker2.Date);
        end
        //Não definido por período.
        else if(self.CheckBox3.Checked = false) then
        begin
            Ct.QtdCompraPorFornecedor;
        end;

        //Atribuição do DATASET.
        FrmRelCompraPorForn.QuickRep1.DataSet := DM.ZQuery1;
        //Atribuição da Quantidade de Compras Realizadas à este Fornecedor.
        FrmRelCompraPorForn.QRDBText14.DataSet := DM.ZQuery1;
        FrmRelCompraPorForn.QRDBText14.DataField := 'COUNT(codPedCompra)';
    except
        MessageDlg('Problema na Atribuição dos Dados sobre o Fornecedor.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.ValorMenorCompraPorFornecedor;
var
    Forn : Fornecedor;
    Ct   : Controle;
    DM   : TDM;
begin
    try
        DM := TDM.Create(NIL);
        Forn := Fornecedor.Create(StrToInt(self.Edit1.Text),'','','','','','',0,00/00/0000,'','');
        Ct := Controle.Create(DM,Forn);

        //Definido por período.
        if(self.CheckBox3.Checked = true) then
        begin
            Ct.CompraComMinValTotCompraPorFornPorPeriod(self.DateTimePicker1.Date,self.DateTimePicker2.Date);
        end
        //Não definido por período.
        else if(self.CheckBox3.Checked = false) then
        begin
            Ct.CompraComMinValTotCompraPorForn;
        end;

        //Atribuição do DATASET.
        FrmRelCompraPorForn.QuickRep1.DataSet := DM.ZQuery1;
        //Atribuição do Menor Valor de Compra.
        FrmRelCompraPorForn.QRDBText15.DataSet := DM.ZQuery1;
        FrmRelCompraPorForn.QRDBText15.DataField := 'MIN(valtotcompra)';
        DecimalSeparator := ',';
        FrmRelCompraPorForn.QRDBText15.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema na Atribuição dos Dados sobre o Fornecedor.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.ValorMaiorCompraPorFornecedor;
var
    Forn : Fornecedor;
    Ct   : Controle;
    DM   : TDM;
begin
    try
        DM := TDM.Create(NIL);
        Forn := Fornecedor.Create(StrToInt(self.Edit1.Text),'','','','','','',0,00/00/0000,'','');
        Ct := Controle.Create(DM,Forn);

        //Definido por período.
        if(self.CheckBox3.Checked = true) then
        begin
            Ct.CompraComMaxValTotCompraPorFornPorPeriod(self.DateTimePicker1.Date,self.DateTimePicker2.Date);
        end
        //Não definido por período.
        else if(self.CheckBox3.Checked = false) then
        begin
            Ct.CompraComMaxValTotCompraPorForn;
        end;

        //Atribuição do DATASET.
        FrmRelCompraPorForn.QuickRep1.DataSet := DM.ZQuery1;
        //Atribuição do Maior Valor de Compra.
        FrmRelCompraPorForn.QRDBText16.DataSet := DM.ZQuery1;
        FrmRelCompraPorForn.QRDBText16.DataField := 'MAX(valtotcompra)';
        DecimalSeparator := ',';
        FrmRelCompraPorForn.QRDBText16.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema na Atribuição dos Dados sobre o Fornecedor.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.DataDaPrimCompraPorFornecedor;
var
    Forn : Fornecedor;
    Ct   : Controle;
    DM   : TDM;
begin
    try
        DM := TDM.Create(NIL);
        Forn := Fornecedor.Create(StrToInt(self.Edit1.Text),'','','','','','',0,00/00/0000,'','');
        Ct := Controle.Create(DM,Forn);

        //Definido por período.
        if(self.CheckBox3.Checked = true) then
        begin
            Ct.DataDaPrimCompraPorFornPorPeriod(self.DateTimePicker1.Date,self.DateTimePicker2.Date);
        end
        //Não definido por período.
        else if(self.CheckBox3.Checked = false) then
        begin
            Ct.DataDaPrimCompraPorForn;
        end;

        //Atribuição do DATASET.
        FrmRelCompraPorForn.QuickRep1.DataSet := DM.ZQuery1;
        //Atribuição da Data da Primeira Compra.
        FrmRelCompraPorForn.QRDBText17.DataSet := DM.ZQuery1;
        FrmRelCompraPorForn.QRDBText17.DataField := 'MIN(dataCompra)';
    except
        MessageDlg('Problema na Atribuição dos Dados sobre o Fornecedor.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.DataDaUltCompraPorFornecedor;
var
    Forn : Fornecedor;
    Ct   : Controle;
    DM   : TDM;
begin
    try
        DM := TDM.Create(NIL);
        Forn := Fornecedor.Create(StrToInt(self.Edit1.Text),'','','','','','',0,00/00/0000,'','');
        Ct := Controle.Create(DM,Forn);

        //Definido por período.
        if(self.CheckBox3.Checked = true) then
        begin
            Ct.DataDaUltCompraPorFornPorPeriod(self.DateTimePicker1.Date,self.DateTimePicker2.Date);
        end
        //Não definido por período.
        else if(self.CheckBox3.Checked = false) then
        begin
            Ct.DataDaUltCompraPorForn;
        end;

        //Atribuição do DATASET.
        FrmRelCompraPorForn.QuickRep1.DataSet := DM.ZQuery1;
        //Atribuição da Data da Última Compra.
        FrmRelCompraPorForn.QRDBText18.DataSet := DM.ZQuery1;
        FrmRelCompraPorForn.QRDBText18.DataField := 'MAX(dataCompra)';
    except
        MessageDlg('Problema na Atribuição dos Dados sobre o Fornecedor.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.ValorTotalDeCompraPorFornecedor;
var
    Forn : Fornecedor;
    Ct   : Controle;
    DM   : TDM;
begin
    try
        DM := TDM.Create(NIL);
        Forn := Fornecedor.Create(StrToInt(self.Edit1.Text),'','','','','','',0,00/00/0000,'','');
        Ct := Controle.Create(DM,Forn);

        //Definido por período.
        if(self.CheckBox3.Checked = true) then
        begin
            Ct.ValTotCompraPorFornPorPeriod(self.DateTimePicker1.Date,self.DateTimePicker2.Date);
        end
        //Não definido por período.
        else if(self.CheckBox3.Checked = false) then
        begin
            Ct.ValTotCompraPorForn;
        end;

        //Atribuição do DATASET.
        FrmRelCompraPorForn.QuickRep1.DataSet := DM.ZQuery1;
        //Atribuição do Valor Total de Compra.
        FrmRelCompraPorForn.QRDBText7.DataSet := DM.ZQuery1;
        FrmRelCompraPorForn.QRDBText7.DataField := 'SUM(valtotcompra)';
        DecimalSeparator := ',';
        FrmRelCompraPorForn.QRDBText7.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema na Atribuição dos Dados sobre o Fornecedor.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmControlarCompra.Visible := true;
end;

procedure TFrmDefRelCompra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

procedure TFrmDefRelCompra.FormShow(Sender: TObject);
begin
    self.PodeFechar := false;
    self.GroupBox4.Visible := true;
    self.RadioButton2.Checked := true;
    self.GroupBox3.Visible := false;
    self.GroupBox5.Visible := false;
    self.GroupBox6.Visible := false;
    self.GroupBox7.Visible := false;
end;

procedure TFrmDefRelCompra.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja sair da tela de definição de Relatório sobre Compra?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        self.PodeFechar := true;
        self.Close;
    end;
end;


procedure TFrmDefRelCompra.SomaValorPagoPorProduto;
var
    DM   : TDM;
    Ct   : Controle;
    Prod : Produto;
begin
    try
        DM := TDM.Create(NIL);
        Prod := Produto.Create(0,'',0,'','','');
        Prod.setnomeProd(self.ComboBox3.Text);
        Ct := Controle.Create(DM,Prod);

        //Somatorio definido por período.
        if(self.CheckBox6.Checked = true) then
        begin
            Ct.SomaValTotPagCompraPorProdPeriod(self.DateTimePicker9.DateTime,self.DateTimePicker10.DateTime);
        end
        //Somatorio não definido por período.
        else if(self.CheckBox6.Checked = false) then
        begin
            Ct.SomaValTotPagCompraPorProd;
        end;

        FrmRelCompraPorProduto.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelCompraPorProduto.QRDBText6.DataSet := DM.ZQuery1;
        FrmRelCompraPorProduto.QRDBText6.DataField := 'SUM(valorPag)';
        DecimalSeparator := ',';
        FrmRelCompraPorProduto.QRDBText6.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema no Cálculo de Total Valor Pago por Produto.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.SomatorioQuantidadeCompradaDoProduto;
var
    DM   : TDM;
    Ct   : Controle;
    Prod : Produto;
begin
    try
        DM := TDM.Create(NIL);
        Prod := Produto.Create(0,'',0,'','','');
        Prod.setnomeProd(self.ComboBox3.Text);
        Ct := Controle.Create(DM,Prod);

         //Somatorio definido por período.
        if(self.CheckBox6.Checked = true) then
        begin
            if(tipo_medida = 'PESO') then
            begin
                FrmRelCompraPorProduto.QuickRep1.DataSet := DM.ZQuery1;
                Ct.SomaQtdCompraPorProdCompraPesoPorPeriod(self.DateTimePicker9.DateTime,self.DateTimePicker10.DateTime);
                FrmRelCompraPorProduto.QRDBText3.DataSet := DM.ZQuery1;
                FrmRelCompraPorProduto.QRDBText3.DataField := 'SUM(qtdpesoItemPed)';
                DecimalSeparator := ',';
            end
            else if(tipo_medida = 'UNIDADE') then
            begin
                FrmRelCompraPorProduto.QuickRep1.DataSet := DM.ZQuery1;
                Ct.SomaQtdCompraPorProdUNIDPorPeriod(self.DateTimePicker9.DateTime,self.DateTimePicker10.DateTime);
                FrmRelCompraPorProduto.QRDBText3.DataSet := DM.ZQuery1;
                FrmRelCompraPorProduto.QRDBText3.DataField := 'SUM(qtdunitItemPed)';
            end
        end

        //Somatorio não definido por período.
        else if(self.CheckBox6.Checked = false) then
        begin
            if(tipo_medida = 'PESO') then
            begin
                FrmRelCompraPorProduto.QuickRep1.DataSet := DM.ZQuery1;
                Ct.SomaQtdCompraPorProdCompraPeso;
                FrmRelCompraPorProduto.QRDBText3.DataSet := DM.ZQuery1;
                FrmRelCompraPorProduto.QRDBText3.DataField := 'SUM(qtdpesoItemPed)';
                DecimalSeparator := ',';
            end
            else if(tipo_medida = 'UNIDADE') then
            begin
                FrmRelCompraPorProduto.QuickRep1.DataSet := DM.ZQuery1;
                Ct.SomaQtdCompraPorProdUNID;
                FrmRelCompraPorProduto.QRDBText3.DataSet := DM.ZQuery1;
                FrmRelCompraPorProduto.QRDBText3.DataField := 'SUM(qtdunitItemPed)';
            end
        end;
    except
        MessageDlg('Problema ao calcular a quantidade comprada por Produto.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.SomaQuantidadeRelacaoProdutoCompra;
var
    DM   : TDM;
    Ct   : Controle;
    Prod : Produto;
begin
    try
        DM := TDM.Create(NIL);
        Prod := Produto.Create(0,'',0,'','','');
        Prod.setnomeProd(self.ComboBox3.Text);
        Ct := Controle.Create(DM,Prod);

         //Somatorio definido por período.
        if(self.CheckBox6.Checked = true) then
        begin
            Ct.ContaRelacaoProdutoCompraPorPeriod(self.DateTimePicker9.DateTime,self.DateTimePicker10.DateTime);
        end
        //Somatorio não definido por período.
        else if(self.CheckBox6.Checked = false) then
        begin
            Ct.ContaRelacaoProdutoCompra;
        end;
        
        FrmRelCompraPorProduto.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelCompraPorProduto.QRDBText7.DataSet := DM.ZQuery1;
        FrmRelCompraPorProduto.QRDBText7.DataField := 'COUNT(PedidoDeCompra.codPedCompra)';
    except
        MessageDlg('Problema ao calcular a quantidade de compras relacionadas ao Produto.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.DadosProdutoRelatorioPorProd;
var
    DM : TDM;
    Ct : Controle;
    Prod : Produto;
    Estq : Estoque;
begin
    try
        DM := TDM.Create(NIL);
        Prod := Produto.Create(0,'',0,'','','');
        Estq := Estoque.Create(0,0,0,0,0,0);
        Prod.setnomeProd(self.ComboBox3.Text);
        Ct := Controle.Create(DM,Prod,Estq);
        Ct.BuscarProdPorNome;

        tipo_medida := Prod.gettipoMedProd;

        //Atribuição do DataSet.
        FrmRelCompraPorProduto.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição dos Produtos Por Categoria.
        FrmRelCompraPorProduto.QRDBText2.DataSet := DM.ZQuery1;
        FrmRelCompraPorProduto.QRDBText2.DataField := 'codProd';
        FrmRelCompraPorProduto.QRDBText1.DataSet := DM.ZQuery1;
        FrmRelCompraPorProduto.QRDBText1.DataField := 'catProd';
        FrmRelCompraPorProduto.QRDBText4.DataSet := DM.ZQuery1;
        FrmRelCompraPorProduto.QRDBText4.DataField := 'tipoMedProd';
        FrmRelCompraPorProduto.QRDBText5.DataSet := DM.ZQuery1;
        FrmRelCompraPorProduto.QRDBText5.DataField := 'precoProd';
        DecimalSeparator := ',';
        FrmRelCompraPorProduto.QRDBText5.Mask := 'R$ ,0.00;-R$ ,0.00';
        FrmRelCompraPorProduto.QRDBText9.DataSet := DM.ZQuery1;
        FrmRelCompraPorProduto.QRDBText9.DataField := 'catProd';
        FrmRelCompraPorProduto.QRDBText1.DataSet := DM.ZQuery1;
        FrmRelCompraPorProduto.QRDBText1.DataField := 'nomeProd';
    except
        MessageDlg('Problema ao atribuir os dados sobre Produto.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.RelatorioDeCompraPorProduto;
begin
    if(self.ComboBox3.Text <> '') then
    begin
        if(self.CheckBox6.Checked = true) then
        begin
            FrmRelCompraPorProduto.QRLabel7.Caption  := 'Relatório de Compra por Produto definido por Período';
            FrmRelCompraPorProduto.QRLabel22.Caption := DateToStr(self.DateTimePicker9.Date);
            FrmRelCompraPorProduto.QRLabel23.Caption := DateToStr(self.DateTimePicker10.Date);
        end
        else
        begin
            FrmRelCompraPorProduto.QRLabel7.Caption  := 'Relatório de Compra por Produto';
            FrmRelCompraPorProduto.QRLabel22.Caption := '';
            FrmRelCompraPorProduto.QRLabel23.Caption := '';
        end;
        self.DadosProdutoRelatorioPorProd;
        self.SomaValorPagoPorProduto;
        self.SomatorioQuantidadeCompradaDoProduto;
        self.SomaQuantidadeRelacaoProdutoCompra;
        FrmRelCompraPorProduto.QuickRep1.Preview;
    end
    else
       MessageDlg('Selecione um Produto.', mtInformation, [mbOk], 0);
end;


procedure TFrmDefRelCompra.ListarProdPorCatg;
var
    DM : TDM;
    Prod : Produto;
    Ct  : Controle;
Begin
    try
        self.ComboBox3.Clear;
        DM   := TDM.create (NIL);
        Prod := Produto.Create(0,'',0,'','','');
        Ct   := Controle.Create(DM, Prod);

        Prod.setcatProd(self.Combobox2.Text);
        Ct.ListarProd;

        While (NOT DM.ZQuery1.EOF) do
        begin
            Prod.setnomeProd(DM.ZQuery1.FieldByName('nomeProd').AsString);
            self.Combobox3.Items.Add(Prod.getnomeProd);
            DM.ZQuery1.Next;
        end;
    Except
       MessageDlg('Problema na Listagem das categorias de produtos.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelCompra.RadioButton5Click(Sender: TObject);
begin
    self.ListarCategoria;
    self.GroupBox3.Visible := false;
    self.GroupBox4.Visible := false;
    self.GroupBox5.Visible := false;
    self.GroupBox6.Visible := false;
    self.GroupBox7.Visible := true;
end;

procedure TFrmDefRelCompra.ComboBox2Change(Sender: TObject);
begin
    self.ListarProdPorCatg;
end;

procedure TFrmDefRelCompra.CheckBox6Click(Sender: TObject);
begin
    if(self.CheckBox6.Checked = true) then
    begin
        self.DateTimePicker9.Enabled := true;
        self.DateTimePicker10.Enabled := true;
    end
    else if(self.CheckBox6.Checked = false) then
    begin
        self.DateTimePicker9.Enabled := false;
        self.DateTimePicker10.Enabled := false;
    end;
end;

procedure TFrmDefRelCompra.RadioButton3Click(Sender: TObject);
begin
    self.GroupBox3.Visible := false;
    self.GroupBox4.Visible := false;
    self.GroupBox5.Visible := false;
    self.GroupBox6.Visible := true;
    self.GroupBox7.Visible := false;
end;

end.
