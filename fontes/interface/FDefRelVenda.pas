unit FDefRelVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Menus, Buttons, ComCtrls,
  FRelVendaTodosProd,  FRelVendaPorCatg, FRelVendaPorCliente, FRelVendaTotaisVenda,
  cControle, cDataModule, cCliente, cProduto, FRelVendaPorProduto, cEstoque;

type
  TFrmDefRelVenda = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox2: TGroupBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    RadioButton4: TRadioButton;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    MaskEdit1: TMaskEdit;
    CheckBox2: TCheckBox;
    Label5: TLabel;
    CheckBox3: TCheckBox;
    Label6: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    GroupBox4: TGroupBox;
    CheckBox1: TCheckBox;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    ComboBox1: TComboBox;
    CheckBox4: TCheckBox;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DateTimePicker5: TDateTimePicker;
    Label11: TLabel;
    DateTimePicker6: TDateTimePicker;
    CheckBox5: TCheckBox;
    GroupBox6: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    CheckBox7: TCheckBox;
    DateTimePicker7: TDateTimePicker;
    DateTimePicker8: TDateTimePicker;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    RadioButton5: TRadioButton;
    GroupBox7: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    ComboBox2: TComboBox;
    DateTimePicker9: TDateTimePicker;
    DateTimePicker10: TDateTimePicker;
    CheckBox6: TCheckBox;
    Label17: TLabel;
    ComboBox3: TComboBox;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RelatorioCompleto;
    procedure ListarTodosOsProdutosPorPeriodo;
    procedure SomatorioPorPeriodo;
    procedure Somatorio;
    procedure ListarTodosOsProdutos;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure AtribuirValores;
    Procedure RelatorioPorCliente;
    Procedure QtdVendaRealizadaPorCliente;
    procedure UltimaVendaCliente;
    procedure PrimeiraVendaCliente;
    procedure VendaMaiorValorCliente;
    procedure VendaMenorValorCliente;
    Procedure ValTotVendaPorCliente;
    Procedure AtribuirDadosCliRel;
    Procedure ProdutosPorCliente;
    procedure RelatorioValoresTotaisDeVenda;
    procedure RelatorioDeVendaPorProduto;
    procedure QuantidadeVendas;
    procedure QtdVendasAbertas;
    procedure QtdVendasFechadas;
    procedure ValorTotalVendaFechada;
    procedure ValorTotalVendaAberta;
    procedure ValorTotalVenda;
    procedure RelatorioPorCategoria;
    procedure SomarValorPagoPorCategoria;
    procedure ProdutosVendidosPorCategoria;
    Procedure ListarCategoria;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    Procedure DadosProdutoRelatorioPorProd;
    procedure ListarProdPorCatg;
    procedure ComboBox2Change(Sender: TObject);
    procedure SomaValorPagoPorProduto;
    procedure SomatorioQuantidadeVendidaDoProduto;
    procedure SomaQuantidadeRelacaoProdutoVenda;
    procedure CheckBox6Click(Sender: TObject);
  private
    PodeFechar : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDefRelVenda: TFrmDefRelVenda;
  tipo_medida : string;

implementation


uses
   FBuscarClienteRelVenda, FControlarVenda;
{$R *.dfm}

procedure TFrmDefRelVenda.RadioButton1Click(Sender: TObject);
begin
    self.GroupBox3.Visible := true;
    self.GroupBox4.Visible := false;
    self.GroupBox5.Visible := false;
    self.GroupBox6.Visible := false;
    self.GroupBox7.Visible := false;
    FrmBuscarClienteRelVenda.ShowModal;
end;

procedure TFrmDefRelVenda.RadioButton4Click(Sender: TObject);
begin
    self.ListarCategoria;
    self.GroupBox3.Visible := false;
    self.GroupBox4.Visible := false;
    self.GroupBox5.Visible := true;
    self.GroupBox6.Visible := false;
    self.GroupBox7.Visible := false;
end;

procedure TFrmDefRelVenda.CheckBox7Click(Sender: TObject);
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

procedure TFrmDefRelVenda.CheckBox4Click(Sender: TObject);
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

procedure TFrmDefRelVenda.CheckBox3Click(Sender: TObject);
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

procedure TFrmDefRelVenda.RadioButton2Click(Sender: TObject);
begin
    self.GroupBox3.Visible := false;
    self.GroupBox4.Visible := true;
    self.GroupBox5.Visible := false;
    self.GroupBox6.Visible := false;
    self.GroupBox7.Visible := false;
end;

procedure TFrmDefRelVenda.RadioButton3Click(Sender: TObject);
begin
    self.GroupBox3.Visible := false;
    self.GroupBox4.Visible := false;
    self.GroupBox5.Visible := false;
    self.GroupBox6.Visible := true;
    self.GroupBox7.Visible := false;
end;

procedure TFrmDefRelVenda.BitBtn1Click(Sender: TObject);
begin
    if(self.RadioButton2.Checked = true) then
    begin
        self.RelatorioCompleto;
    end
    else if(self.RadioButton1.Checked = true) then
    begin
        self.RelatorioPorCliente;
    end
    else if(self.RadioButton4.Checked = true) then
    begin
       self.RelatorioPorCategoria;
    end
    else if(self.RadioButton3.Checked = true) then
    begin
        self.RelatorioValoresTotaisDeVenda;
    end
    else if (self.RadioButton5.Checked = true) then
    begin
        self.RelatorioDeVendaPorProduto;
    end;
end;


procedure TFrmDefRelVenda.RelatorioCompleto;
//var
    //var_dataini : TDateTime;
    //var_datafim : TDateTime;
begin
    try
        if(self.CheckBox4.Checked = true) then
        begin
            //Showmessage(DateToStr(DATE));
            //var_datafim := self.DateTimePicker4.DateTime;
            //var_dataini := self.DateTimePicker3.DateTime;
            //if(var_datafim <= DATE) AND (var_dataini <= var_datafim) then
            //begin
                FrmRelVendaTodosProd.QRLabel7.Caption := 'Relatório sobre Todos os Produtos Vendidos Por Período';
                self.SomatorioPorPeriodo;
                FrmRelVendaTodosProd.QRLabel13.Visible := true;
                FrmRelVendaTodosProd.QRLabel14.Visible := true;
                FrmRelVendaTodosProd.QRLabel22.Visible := true;
                FrmRelVendaTodosProd.QRLabel17.Visible := true;
                FrmRelVendaTodosProd.QRLabel23.Visible := true;

                if(self.CheckBox1.Checked = true) then
                begin
                    self.ListarTodosOsProdutosPorPeriodo;
                end;
                FrmRelVendaTodosProd.QuickRep1.Preview;
            //end
            //else
            //MessageDlg('Data Inválida para Relatório.', mtWarning, [mbOk], 0);
        end
        else if(self.CheckBox4.Checked = false) then
        begin
            FrmRelVendaTodosProd.QRLabel7.Caption := 'Relatório sobre Todos os Produtos Vendidos';
            FrmRelVendaTodosProd.QRLabel13.Visible := false;
            FrmRelVendaTodosProd.QRLabel14.Visible := false;
            FrmRelVendaTodosProd.QRLabel22.Visible := false;
            FrmRelVendaTodosProd.QRLabel17.Visible := false;
            FrmRelVendaTodosProd.QRLabel23.Visible := false;
            self.Somatorio;
            if(self.CheckBox1.Checked = true) then
            begin
                self.ListarTodosOsProdutos;
            end;
            FrmRelVendaTodosProd.QuickRep1.Preview;
        end;
    except
        MessageDlg('Problema na Exibição do Relatório Completo de Venda.', mtError, [mbOk], 0);
    end;

end;

procedure TFrmDefRelVenda.ListarTodosOsProdutosPorPeriodo;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.ListarTodosProdVendPorPeriodo(DateTimePicker3.Date,DateTimePicker4.Date);
        //Atribuição dos Íténs de Venda.
        FrmRelVendaTodosProd.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição dos Dados Referentes aos Produtos Vendidos.
        FrmRelVendaTodosProd.QRDBText1.DataSet := DM.ZQuery1;
        FrmRelVendaTodosProd.QRDBText1.DataField := 'codItemVend';
        FrmRelVendaTodosProd.QRDBText2.DataSet := DM.ZQuery1;
        FrmRelVendaTodosProd.QRDBText2.DataField := 'nomeProd';
        FrmRelVendaTodosProd.QRDBText3.DataSet := DM.ZQuery1;
        FrmRelVendaTodosProd.QRDBText3.DataField := 'catProd';
        FrmRelVendaTodosProd.QRDBText5.DataSet := DM.ZQuery1;
        FrmRelVendaTodosProd.QRDBText5.DataField := 'qtdPesoVend';
        FrmRelVendaTodosProd.QRDBText6.DataSet := DM.ZQuery1;
        FrmRelVendaTodosProd.QRDBText6.DataField := 'qtdUnitVend';
        FrmRelVendaTodosProd.QRDBText10.DataSet := DM.ZQuery1;
        FrmRelVendaTodosProd.QRDBText10.DataField := 'valpag';
        FrmRelVendaTodosProd.QRDBText10.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema na Listagem dos Iténs.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelVenda.SomatorioPorPeriodo;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        //Atribuição do DataSet
        FrmRelVendaTodosProd.QuickRep1.DataSet := DM.ZQuery1;
        Ct.SomaValPagoTodosProdVendPorPeriodo(DateTimePicker3.Date,DateTimePicker4.Date);
        FrmRelVendaTodosProd.QRLabel22.Caption := DateToStr(self.DateTimePicker3.Date);
        FrmRelVendaTodosProd.QRLabel23.Caption := DateToStr(self.DateTimePicker4.Date);
        DecimalSeparator := ',';
        FrmRelVendaTodosProd.QRDBText7.DataSet := DM.ZQuery1;
        FrmRelVendaTodosProd.QRDBText7.DataField := 'sum(valpag)';
        FrmRelVendaTodosProd.QRDBText7.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
         MessageDlg('Problema na Exibição do Somatório das Vendas.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelVenda.Somatorio;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        //Atribuição do DataSet
        FrmRelVendaTodosProd.QuickRep1.DataSet := DM.ZQuery1;
        Ct.SomaValPagoTodosProdVend;
        FrmRelVendaTodosProd.QRLabel22.Caption := '';
        FrmRelVendaTodosProd.QRLabel23.Caption := '';
        DecimalSeparator := ',';
        FrmRelVendaTodosProd.QRDBText7.DataSet := DM.ZQuery1;
        FrmRelVendaTodosProd.QRDBText7.DataField := 'sum(valpag)';
        FrmRelVendaTodosProd.QRDBText7.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
         MessageDlg('Problema na Exibição do Somatório das Vendas.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelVenda.ListarTodosOsProdutos;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.ListarTodosProdVend;
        //Atribuição dos Íténs de Venda.
        FrmRelVendaTodosProd.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição dos Dados Referentes aos Produtos Vendidos.
        FrmRelVendaTodosProd.QRDBText1.DataSet := DM.ZQuery1;
        FrmRelVendaTodosProd.QRDBText1.DataField := 'codItemVend';
        FrmRelVendaTodosProd.QRDBText2.DataSet := DM.ZQuery1;
        FrmRelVendaTodosProd.QRDBText2.DataField := 'nomeProd';
        FrmRelVendaTodosProd.QRDBText3.DataSet := DM.ZQuery1;
        FrmRelVendaTodosProd.QRDBText3.DataField := 'catProd';
        FrmRelVendaTodosProd.QRDBText5.DataSet := DM.ZQuery1;
        FrmRelVendaTodosProd.QRDBText5.DataField := 'qtdPesoVend';
        FrmRelVendaTodosProd.QRDBText6.DataSet := DM.ZQuery1;
        FrmRelVendaTodosProd.QRDBText6.DataField := 'qtdUnitVend';
        FrmRelVendaTodosProd.QRDBText10.DataSet := DM.ZQuery1;
        FrmRelVendaTodosProd.QRDBText10.DataField := 'valpag';
        FrmRelVendaTodosProd.QRDBText10.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
         MessageDlg('Problema na Listagem dos Iténs.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmDefRelVenda.BitBtn6Click(Sender: TObject);
begin
    DM.ZQuery1.Next;
    AtribuirValores;

    if (DM.ZQuery1.EOF) then
    begin
        BitBtn6.Enabled := false;
    end;

    BitBtn7.Enabled := true;
end;

procedure TFrmDefRelVenda.BitBtn7Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Prior;
        AtribuirValores;

        if (DM.ZQuery1.BOF) then
        begin
            BitBtn7.Enabled := false;
        end;
        BitBtn6.Enabled := true;
    except
        on EAccessViolation do
        begin
            showmessage('');
        end;
    end;
end;

procedure TFrmDefRelVenda.AtribuirValores;
begin
    FrmDefRelVenda.MaskEdit1.Text := DM.ZQuery1.FieldByName('codCli').AsString;
    FrmDefRelVenda.Edit2.Text := DM.ZQuery1.FieldByName('nomeCli').AsString;
end;


procedure TFrmDefRelVenda.RelatorioPorCliente;
begin
    try
        //definido por período.
        if(self.CheckBox3.Checked = true) then
        begin
            FrmRelVendaPorCliente.QRLabel7.Caption := 'Relatório de Venda Períodico Por Cliente';
            FrmRelVendaPorCliente.QRLabel20.Caption := DateToStr(self.DateTimePicker1.Date);
            FrmRelVendaPorCliente.QRLabel32.Caption := DateToStr(self.DateTimePicker2.Date);
        end
        //Não definido por período.
        else if(self.CheckBox3.Checked = false) then
        begin
            FrmRelVendaPorCliente.QRLabel7.Caption := 'Relatório de Venda Por Cliente';
            FrmRelVendaPorCliente.QRLabel20.Caption := '';
            FrmRelVendaPorCliente.QRLabel32.Caption := '';
        end;

        //Atribuindo os Dados ao Relatório.
        self.AtribuirDadosCliRel;
        self.QtdVendaRealizadaPorCliente;
        self.UltimaVendaCliente;
        self.PrimeiraVendaCliente;
        self.VendaMaiorValorCliente;
        self.VendaMenorValorCliente;
        self.ValTotVendaPorCliente;

        //Listando os Iténs
        if(self.CheckBox2.Checked = true) then
        begin
            self.ProdutosPorCliente;
        end;
        FrmRelVendaPorCliente.QuickRep1.Preview;
    except
        MessageDlg('Problema na Exibição do Relatório Completo de Venda.', mtError, [mbOk], 0);
    end;

end;


Procedure TFrmDefRelVenda.QtdVendaRealizadaPorCliente;
var
    DM  : TDM;
    Ct  : Controle;
    Cli : Cliente;
begin
    try
        Cli := Cliente.Create(0,'','','','','','','');
        DM  := TDM.Create(NIL);
        Ct  := Controle.Create(DM,Cli);
        Cli.setCodCli(StrToInt(self.MaskEdit1.Text));
        //Quantidade de Venda Por Cliente

        if(self.CheckBox3.Checked = true) then
        begin
            Ct.QtdVendaPorCliPeriod(self.DateTimePicker1.Date,self.DateTimePicker2.Date);
        end
        else
        begin
            Ct.QtdVendaPorCli;
        end;

        FrmRelVendaPorCliente.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText14.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText14.DataField := 'count(codVenda)';
    except
        MessageDlg('Problema na Atribuição da Quantidade de Venda por Cliente.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelVenda.PrimeiraVendaCliente;
var
    DM  : TDM;
    Ct  : Controle;
    Cli : Cliente;
begin
    try
        Cli := Cliente.Create(0,'','','','','','','');
        DM  := TDM.Create(NIL);
        Ct  := Controle.Create(DM,Cli);
        Cli.setCodCli(StrToInt(self.MaskEdit1.Text));

        if(self.CheckBox3.Checked = true) then
        begin
            Ct.DataPrimVendaCliPeriod(self.DateTimePicker1.Date,self.DateTimePicker2.Date);
        end
        else
        begin
            Ct.DataPrimVendaCli;
        end;

        FrmRelVendaPorCliente.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText17.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText17.DataField := 'MIN(dataVenda)';
    except
        MessageDlg('Problema na Atribuição da Data da Primeira Venda por Cliente.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelVenda.UltimaVendaCliente;
var
    DM  : TDM;
    Ct  : Controle;
    Cli : Cliente;
begin
    try
        Cli := Cliente.Create(0,'','','','','','','');
        DM  := TDM.Create(NIL);
        Ct  := Controle.Create(DM,Cli);
        Cli.setCodCli(StrToInt(self.MaskEdit1.Text));

        if(self.CheckBox3.Checked = true) then
        begin
            Ct.DataUltVendaCliPeriod(self.DateTimePicker1.Date,self.DateTimePicker2.Date);
        end
        else
        begin
            Ct.DataUltVendaCli;
        end;

        FrmRelVendaPorCliente.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText18.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText18.DataField := 'MAX(dataVenda)';
    except
        MessageDlg('Problema na Atribuição da Data da Últuma Venda por Cliente.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelVenda.VendaMenorValorCliente;
var
    DM  : TDM;
    Ct  : Controle;
    Cli : Cliente;
begin
    try
        Cli := Cliente.Create(0,'','','','','','','');
        DM  := TDM.Create(NIL);
        Ct  := Controle.Create(DM,Cli);
        Cli.setCodCli(StrToInt(self.MaskEdit1.Text));

        if(self.CheckBox3.Checked = true) then
        begin
            Ct.VendaMenorValorCliPeriod(self.DateTimePicker1.Date,self.DateTimePicker2.Date);
        end
        else
        begin
            Ct.VendaMenorValorCli;
        end;

        FrmRelVendaPorCliente.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText15.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText15.DataField := 'MIN(valtotvenda)';
        DecimalSeparator := ',';
        FrmRelVendaPorCliente.QRDBText15.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema na Atribuição do Menor Valor Total de Venda por Cliente.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelVenda.VendaMaiorValorCliente;
var
    DM  : TDM;
    Ct  : Controle;
    Cli : Cliente;
begin
    try
        Cli := Cliente.Create(0,'','','','','','','');
        DM  := TDM.Create(NIL);
        Ct  := Controle.Create(DM,Cli);
        Cli.setCodCli(StrToInt(self.MaskEdit1.Text));

        if(self.CheckBox3.Checked = true) then
        begin
            Ct.VendaMaiorValorCliPeriod(self.DateTimePicker1.Date,self.DateTimePicker2.Date);
        end
        else
        begin
            Ct.VendaMaiorValorCli;
        end;

        FrmRelVendaPorCliente.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText16.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText16.DataField := 'MAX(valtotvenda)';
        DecimalSeparator := ',';
        FrmRelVendaPorCliente.QRDBText16.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema na Atribuição do Maior Valor Total de Venda por Cliente.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelVenda.ValTotVendaPorCliente;
var
    DM  : TDM;
    Ct  : Controle;
    Cli : Cliente;
begin
    try
        Cli := Cliente.Create(0,'','','','','','','');
        DM  := TDM.Create(NIL);
        Ct  := Controle.Create(DM,Cli);
        Cli.setCodCli(StrToInt(self.MaskEdit1.Text));

        if(self.CheckBox3.Checked = true) then
        begin
            Ct.ValTotVendaPorCliPeriod(self.DateTimePicker1.Date,self.DateTimePicker2.Date);
        end
        else
        begin
            Ct.ValTotVendaPorCli;
        end;

        FrmRelVendaPorCliente.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText7.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText7.DataField := 'SUM(valtotvenda)';
        DecimalSeparator := ',';
        FrmRelVendaPorCliente.QRDBText7.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema na Atribuição do Valor Total de Venda por Cliente.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmDefRelVenda.AtribuirDadosCliRel;
var
    DM  : TDM;
    Ct  : Controle;
    Cli : Cliente;
begin
    try
        Cli := Cliente.Create(0,'','','','','','','');
        DM  := TDM.Create(NIL);
        Ct  := Controle.Create(DM,Cli);
        Cli.setCodCli(StrToInt(self.MaskEdit1.Text));
        Ct.BuscarCliCODIGO;
        FrmRelVendaPorCliente.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText11.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText11.DataField := 'codCli';
        FrmRelVendaPorCliente.QRDBText12.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText12.DataField := 'nomeCli';
        FrmRelVendaPorCliente.QRDBText13.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText13.DataField := 'statusCli';
    except
        MessageDlg('Problema na Atribuição dos Dados sobre Cliente.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelVenda.ProdutosPorCliente;
var
    DM  : TDM;
    Ct  : Controle;
    Cli : Cliente;
begin
    try
        Cli := Cliente.Create(0,'','','','','','','');
        DM  := TDM.Create(NIL);
        Ct  := Controle.Create(DM,Cli);
        Cli.setCodCli(StrToInt(self.MaskEdit1.Text));

        if(self.CheckBox3.Checked = true) then
        begin
            Ct.ListarProdVendaCliPeriod(self.DateTimePicker1.Date,self.DateTimePicker2.Date);
            FrmRelVendaPorCliente.QuickRep1.DataSet := DM.ZQuery1;
        end
        else
        begin
            Ct.ListarProdVendaCli;
            FrmRelVendaPorCliente.QuickRep1.DataSet := DM.ZQuery1;
        end;

        FrmRelVendaPorCliente.QRDBText1.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText1.DataField := 'codItemVend';
        FrmRelVendaPorCliente.QRDBText2.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText2.DataField := 'nomeProd';
        FrmRelVendaPorCliente.QRDBText3.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText3.DataField := 'catProd';
        FrmRelVendaPorCliente.QRDBText5.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText5.DataField := 'qtdPesoVend';
        FrmRelVendaPorCliente.QRDBText6.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText6.DataField := 'qtdUnitVend';
        FrmRelVendaPorCliente.QRDBText10.DataSet := DM.ZQuery1;
        FrmRelVendaPorCliente.QRDBText10.DataField := 'valpag';
        DecimalSeparator := ',';
        FrmRelVendaPorCliente.QRDBText10.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema na Listagem dos Produtos por Cliente.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmDefRelVenda.RelatorioValoresTotaisDeVenda;
begin
    try
        //Relatório definido por período.
        if(self.CheckBox7.Checked = true) then
        begin
            FrmRelVendaTotaisVenda.QRLabel7.Caption := 'Relatório sobre os Totais de Venda Por Período';
            FrmRelVendaTotaisVenda.QRLabel20.Caption := DateToStr(self.DateTimePicker7.Date);
            FrmRelVendaTotaisVenda.QRLabel21.Caption := DateToStr(self.DateTimePicker8.Date);
        end
        //Relatório não definido por período.
        else if(self.CheckBox7.Checked = false) then
        begin
            FrmRelVendaTotaisVenda.QRLabel7.Caption := 'Relatório sobre os Totais de Venda';
            FrmRelVendaTotaisVenda.QRLabel20.Caption := '';
            FrmRelVendaTotaisVenda.QRLabel21.Caption := '';
        end;

        //Atribuindo os Dados sobre Valores Totais de Venda ao Relatório.
        self.QuantidadeVendas;
        self.QtdVendasAbertas;
        self.QtdVendasFechadas;
        self.ValorTotalVendaFechada;
        self.ValorTotalVendaAberta;
        self.ValorTotalVenda;
        FrmRelVendaTotaisVenda.QuickRep1.Preview;
    except
        MessageDlg('Problema na Exibição do Relatório Completo de Venda.', mtError, [mbOk], 0);
    end;

end;


procedure TFrmDefRelVenda.QuantidadeVendas;
var
    DM   : TDM;
    Ct   : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        //Definido por período.
        if(self.CheckBox7.Checked = true) then
        begin
            Ct.QtdVendasRealizadasPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
        end
        //Não definido por período.
        else if(self.CheckBox7.Checked = false) then
        begin
            Ct.QtdVendasRealizadas;
        end;

        FrmRelVendaTotaisVenda.QRDBText1.DataSet := DM.ZQuery1;
        FrmRelVendaTotaisVenda.QRDBText1.DataField := 'count(*)';
    except
         MessageDlg('Problema na Contagem das Vendas Realizadas.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelVenda.QtdVendasAbertas;
var
    DM   : TDM;
    Ct   : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        //Definido por período.
        if(self.CheckBox7.Checked = true) then
        begin
           Ct.QtdVendasAbertaPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
        end
        //Não definido por período.
        else if(self.CheckBox7.Checked = false) then
        begin
            Ct.QtdVendasAberta;
        end;

        FrmRelVendaTotaisVenda.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaTotaisVenda.QRDBText2.DataSet := DM.ZQuery1;
        FrmRelVendaTotaisVenda.QRDBText2.DataField := 'count(*)';
    except
         MessageDlg('Problema na Contagem das Vendas Abertas.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelVenda.QtdVendasFechadas;
var
    DM   : TDM;
    Ct   : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        //Definido por período.
        if(self.CheckBox7.Checked = true) then
        begin
           Ct.QtdVendasFechadasPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
        end
        //Não definido por período.
        else if(self.CheckBox7.Checked = false) then
        begin
            Ct.QtdVendasFechadas;
        end;

        FrmRelVendaTotaisVenda.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaTotaisVenda.QRDBText3.DataSet := DM.ZQuery1;
        FrmRelVendaTotaisVenda.QRDBText3.DataField := 'count(*)';
    except
        MessageDlg('Problema na Contagem das Vendas Fechadas.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmDefRelVenda.ValorTotalVendaFechada;
var
    DM   : TDM;
    Ct   : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        //Definido por período.
        if(self.CheckBox7.Checked = true) then
        begin
            Ct.ValTotVendaFechadaPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
        end
        //Não definido por período.
        else if(self.CheckBox7.Checked = false) then
        begin
            Ct.ValTotVendaFechada;
        end;

        FrmRelVendaTotaisVenda.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaTotaisVenda.QRDBText5.DataSet := DM.ZQuery1;
        FrmRelVendaTotaisVenda.QRDBText5.DataField := 'SUM(valtotvenda)';
        DecimalSeparator := ',';
        FrmRelVendaTotaisVenda.QRDBText5.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema no Calculo do Valor Total de Vendas Fechadas.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmDefRelVenda.ValorTotalVendaAberta;
var
    DM   : TDM;
    Ct   : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        //Definido por período.
        if(self.CheckBox7.Checked = true) then
        begin
           Ct.ValTotVendaAbertaPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
        end
        //Não definido por período.
        else if(self.CheckBox7.Checked = false) then
        begin
            Ct.ValTotVendaAberta;
        end;

        FrmRelVendaTotaisVenda.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaTotaisVenda.QRDBText6.DataSet := DM.ZQuery1;
        FrmRelVendaTotaisVenda.QRDBText6.DataField := 'SUM(valtotvenda)';
        DecimalSeparator := ',';
        FrmRelVendaTotaisVenda.QRDBText6.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema no Calculo do Valor Total de Vendas Abertas.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelVenda.ValorTotalVenda;
var
    DM   : TDM;
    Ct   : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

         //Definido por período.
        if(self.CheckBox7.Checked = true) then
        begin
            Ct.ValTotVendaPeriod(self.DateTimePicker7.Date,self.DateTimePicker8.Date);
        end
        //Não definido por período.
        else if(self.CheckBox7.Checked = false) then
        begin
            Ct.ValTotVenda;
        end;

        FrmRelVendaTotaisVenda.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaTotaisVenda.QRDBText7.DataSet := DM.ZQuery1;
        FrmRelVendaTotaisVenda.QRDBText7.DataField := 'SUM(valtotvenda)';
        DecimalSeparator := ',';
        FrmRelVendaTotaisVenda.QRDBText7.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema no Calculo do Valor Total de Vendas.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelVenda.RelatorioPorCategoria;
begin
    try
        //Relatório definido por período.
        if(self.CheckBox5.Checked = true) then
        begin
            FrmRelVendaPorCatg.QRLabel7.Caption := 'Relatório Por Período de Produtos Vendidos Por Categoria';
            FrmRelVendaPorCatg.QRLabel22.Caption := DateToStr(self.DateTimePicker5.Date);
            FrmRelVendaPorCatg.QRLabel23.Caption := DateToStr(self.DateTimePicker6.Date);
        end
        //Relatório não definido por período.
        else if(self.CheckBox5.Checked = false) then
        begin
            FrmRelVendaPorCatg.QRLabel7.Caption := 'Relatório de Produtos Vendidos Por Categoria';
            FrmRelVendaPorCatg.QRLabel22.Caption := '';
            FrmRelVendaPorCatg.QRLabel23.Caption := '';
        end;

        //Atribuindo os Dados sobre Venda de Produtos por Categoria ao Relatório.
        self.SomarValorPagoPorCategoria;
        self.ProdutosVendidosPorCategoria;
        FrmRelVendaPorCatg.QuickRep1.Preview;
    except
        MessageDlg('Problema na Exibição do Relatório Completo de Venda.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelVenda.ListarCategoria;
var
    DM   : TDM;
    Ct   : Controle;
    Prod : Produto;
begin
    try
        self.ComboBox1.Clear;
        self.ComboBox2.Clear;
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

Procedure TFrmDefRelVenda.SomarValorPagoPorCategoria;
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
            Ct.SomarValorPagoPorCatgPorPeriod(self.DateTimePicker5.Date,self.DateTimePicker6.Date);
        end
        //Somatorio não definido por período.
        else if(self.CheckBox5.Checked = false) then
        begin
            Ct.SomarValorPagoPorCatg;
        end;

        FrmRelVendaPorCatg.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaPorCatg.QRDBText7.DataSet := DM.ZQuery1;
        FrmRelVendaPorCatg.QRDBText7.DataField := 'SUM(valpag)';
        DecimalSeparator := ',';
        FrmRelVendaPorCatg.QRDBText7.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema no Cálculo de Total Valor Pago por Categoria.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmDefRelVenda.ProdutosVendidosPorCategoria;
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
            Ct.ListarProdVendaPorCatgPorPeriod(self.DateTimePicker5.Date,self.DateTimePicker6.Date);
        end
        //Listagem não definida por período.
        else if(self.CheckBox5.Checked = false) then
        begin
            Ct.ListarProdVendaPorCatg;
        end;

        //Atribuição do DataSet.
        FrmRelVendaPorCatg.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição dos Produtos Por Categoria.
        FrmRelVendaPorCatg.QRDBText1.DataSet := DM.ZQuery1;
        FrmRelVendaPorCatg.QRDBText1.DataField := 'codProd';
        FrmRelVendaPorCatg.QRDBText2.DataSet := DM.ZQuery1;
        FrmRelVendaPorCatg.QRDBText2.DataField := 'nomeProd';
        FrmRelVendaPorCatg.QRDBText5.DataSet := DM.ZQuery1;
        FrmRelVendaPorCatg.QRDBText5.DataField := 'qtdPesoVend';
        FrmRelVendaPorCatg.QRDBText6.DataSet := DM.ZQuery1;
        FrmRelVendaPorCatg.QRDBText6.DataField := 'qtdUnitVend';
        FrmRelVendaPorCatg.QRDBText10.DataSet := DM.ZQuery1;
        FrmRelVendaPorCatg.QRDBText10.DataField := 'valpag';
        DecimalSeparator := ',';
        FrmRelVendaPorCatg.QRDBText10.Mask := 'R$ ,0.00;-R$ ,0.00';
        FrmRelVendaPorCatg.QRDBText8.DataSet := DM.ZQuery1;
        FrmRelVendaPorCatg.QRDBText8.DataField := 'dataVenda';
    except
        MessageDlg('Problema na Listagem dos Produtos Vendidos por Categoria.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmDefRelVenda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

procedure TFrmDefRelVenda.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja fechar a tela de definição de Relatório de Venda?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        FrmControlarVenda.Visible := true;
        self.PodeFechar := true;
        self.Close;
    end
end;

procedure TFrmDefRelVenda.FormShow(Sender: TObject);
begin
    self.PodeFechar := false;
end;

procedure TFrmDefRelVenda.RadioButton5Click(Sender: TObject);
begin
    self.ListarCategoria;
    self.GroupBox7.Visible := true;
    self.GroupBox3.Visible := false;
    self.GroupBox4.Visible := false;
    self.GroupBox5.Visible := false;
    self.GroupBox6.Visible := false;
end;

procedure TFrmDefRelVenda.DadosProdutoRelatorioPorProd;
var
    DM : TDM;
    Ct : Controle;
    Prod : Produto;
    Estq : Estoque;
begin
    DM := TDM.Create(NIL);
    Prod := Produto.Create(0,'',0,'','','');
    Estq := Estoque.Create(0,0,0,0,0,0);
    Prod.setnomeProd(self.ComboBox3.Text);
    Ct := Controle.Create(DM,Prod,Estq);
    Ct.BuscarProdPorNome;

    tipo_medida := Prod.gettipoMedProd;

    //Atribuição do DataSet.
    FrmRelVendaPorProduto.QuickRep1.DataSet := DM.ZQuery1;

    //Atribuição dos Produtos Por Categoria.
    FrmRelVendaPorProduto.QRDBText2.DataSet := DM.ZQuery1;
    FrmRelVendaPorProduto.QRDBText2.DataField := 'codProd';
    FrmRelVendaPorProduto.QRDBText1.DataSet := DM.ZQuery1;
    FrmRelVendaPorProduto.QRDBText1.DataField := 'catProd';
    FrmRelVendaPorProduto.QRDBText4.DataSet := DM.ZQuery1;
    FrmRelVendaPorProduto.QRDBText4.DataField := 'tipoMedProd';
    FrmRelVendaPorProduto.QRDBText5.DataSet := DM.ZQuery1;
    FrmRelVendaPorProduto.QRDBText5.DataField := 'precoProd';
    DecimalSeparator := ',';
    FrmRelVendaPorProduto.QRDBText5.Mask := 'R$ ,0.00;-R$ ,0.00';
    FrmRelVendaPorProduto.QRDBText9.DataSet := DM.ZQuery1;
    FrmRelVendaPorProduto.QRDBText9.DataField := 'catProd';
    FrmRelVendaPorProduto.QRDBText1.DataSet := DM.ZQuery1;
    FrmRelVendaPorProduto.QRDBText1.DataField := 'nomeProd';

end;

procedure TFrmDefRelVenda.RelatorioDeVendaPorProduto;
begin
    if(self.ComboBox3.Text <> '') then
    begin
        if(self.CheckBox6.Checked = true) then
        begin
            FrmRelVendaPorProduto.QRLabel7.Caption  := 'Relatório de Venda por Produto definido por Período';
            FrmRelVendaPorProduto.QRLabel22.Caption := DateToStr(self.DateTimePicker9.Date);
            FrmRelVendaPorProduto.QRLabel23.Caption := DateToStr(self.DateTimePicker10.Date);
        end
        else
        begin
            FrmRelVendaPorProduto.QRLabel7.Caption  := 'Relatório de Venda por Produto';
            FrmRelVendaPorProduto.QRLabel22.Caption := '';
            FrmRelVendaPorProduto.QRLabel23.Caption := '';
        end;
        self.DadosProdutoRelatorioPorProd;
        self.SomaValorPagoPorProduto;
        self.SomatorioQuantidadeVendidaDoProduto;
        self.SomaQuantidadeRelacaoProdutoVenda;
        FrmRelVendaPorProduto.QuickRep1.Preview;
    end
    else
       MessageDlg('Selecione um Produto.', mtInformation, [mbOk], 0);
end;

procedure TFrmDefRelVenda.ListarProdPorCatg;
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


procedure TFrmDefRelVenda.ComboBox2Change(Sender: TObject);
begin
    self.ListarProdPorCatg;
end;

procedure TFrmDefRelVenda.SomaValorPagoPorProduto;
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
            Ct.SomaValTotPagPorProdPorPeriod(self.DateTimePicker9.DateTime,self.DateTimePicker10.DateTime);
        end
        //Somatorio não definido por período.
        else if(self.CheckBox6.Checked = false) then
        begin
            Ct.SomaValTotPagPorProd;
        end;

        FrmRelVendaPorProduto.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaPorProduto.QRDBText6.DataSet := DM.ZQuery1;
        FrmRelVendaPorProduto.QRDBText6.DataField := 'SUM(valpag)';
        DecimalSeparator := ',';
        FrmRelVendaPorProduto.QRDBText6.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema no Cálculo de Total Valor Pago por Produto.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelVenda.SomatorioQuantidadeVendidaDoProduto;
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
                FrmRelVendaPorProduto.QuickRep1.DataSet := DM.ZQuery1;
                Ct.SomaQtdVendPorProdPesoPorPeriod(self.DateTimePicker9.DateTime,self.DateTimePicker10.DateTime);
                FrmRelVendaPorProduto.QRDBText3.DataSet := DM.ZQuery1;
                FrmRelVendaPorProduto.QRDBText3.DataField := 'SUM(qtdpesoVend)';
                DecimalSeparator := ',';
            end
            else if(tipo_medida = 'UNIDADE') then
            begin
                FrmRelVendaPorProduto.QuickRep1.DataSet := DM.ZQuery1;
                Ct.SomaQtdVendPorProdUNIDPorPeriod(self.DateTimePicker9.DateTime,self.DateTimePicker10.DateTime);
                FrmRelVendaPorProduto.QRDBText3.DataSet := DM.ZQuery1;
                FrmRelVendaPorProduto.QRDBText3.DataField := 'SUM(qtdUnitVend)';
            end
        end

        //Somatorio não definido por período.
        else if(self.CheckBox6.Checked = false) then
        begin
            if(tipo_medida = 'PESO') then
            begin
                FrmRelVendaPorProduto.QuickRep1.DataSet := DM.ZQuery1;
                Ct.SomaQtdVendPorProdPeso;
                FrmRelVendaPorProduto.QRDBText3.DataSet := DM.ZQuery1;
                FrmRelVendaPorProduto.QRDBText3.DataField := 'SUM(qtdpesoVend)';
                DecimalSeparator := ',';
            end
            else if(tipo_medida = 'UNIDADE') then
            begin
                FrmRelVendaPorProduto.QuickRep1.DataSet := DM.ZQuery1;
                Ct.SomaQtdVendPorProdUNID;
                FrmRelVendaPorProduto.QRDBText3.DataSet := DM.ZQuery1;
                FrmRelVendaPorProduto.QRDBText3.DataField := 'SUM(qtdUnitVend)';
            end
        end;
    except
        MessageDlg('Problema ao calcular a quantidade vendida por Produto.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelVenda.SomaQuantidadeRelacaoProdutoVenda;
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
            Ct.ContaRelacaoProdutoVendaPorPeriod(self.DateTimePicker9.DateTime,self.DateTimePicker10.DateTime);
        end
        //Somatorio não definido por período.
        else if(self.CheckBox6.Checked = false) then
        begin
            Ct.ContaRelacaoProdutoVenda;
        end;
        
        FrmRelVendaPorProduto.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelVendaPorProduto.QRDBText7.DataSet := DM.ZQuery1;
        FrmRelVendaPorProduto.QRDBText7.DataField := 'Count(Venda.codVenda)';
    except
        MessageDlg('Problema ao calcular a quantidade vendida por Produto.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmDefRelVenda.CheckBox6Click(Sender: TObject);
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

end.


