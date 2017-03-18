unit FTelaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Mask, rxToolEdit, rxCurrEdit, Buttons,
  FSelItem, ComCtrls, cControle, cDataModule, cCliente, cVenda, cPagamento, cProduto,
  cItemDeVenda, FImprimirVenda;

type
  TFrmTelaVenda = class(TForm)
    titulo: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    GroupBox3: TGroupBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Edit3: TEdit;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GerarCodVenda;
    procedure CriarRegVenda;
    Procedure GerarCodPagto;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Procedure ClienteVenda;
    procedure ProdutosVenda;
    procedure SomaValorPagoImpr;
    procedure ImprimirVenda;
    procedure FormShow(Sender: TObject);
    procedure CalcularVenda;
    procedure MostrarItens;
    procedure CancelarVenda;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
  private
    PodeFechar : Boolean;  
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaVenda: TFrmTelaVenda;
  vatual : real;
  vtotal : real;

implementation

{$R *.dfm}

uses
    FRealizarVenda;

procedure TFrmTelaVenda.BitBtn2Click(Sender: TObject);
begin
    FrmSelItem.Show;
    FrmSelItem.Edit4.Text := FrmTelaVenda.Edit3.Text;
    FrmTelaVenda.Enabled := false;
end;

procedure TFrmTelaVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    DM  : TDM;
    Ct  : Controle;
    Vd  : Venda;  
begin
    if(Edit3.Text <> '') then
    begin
        try
           DM  := TDM.Create(NIL);
           Vd  := Venda.Create(0,00/00/0000,0,'');
           Vd.setcodVenda(StrToInt(Edit3.Text));
           Ct := Controle.Create(DM,VD);
           Ct.AlterarEstqParaVendaCancelada;
           Ct.ExcluirTodosItemDeVenda;
           Ct.ExcluirVenda;
           FrmTelaVenda.DBGrid1.DataSource := DM.DS1;
           FrmTelaVenda.DBGrid1.DataSource.Destroy;
        except
            MessageDlg('Erro no Cancelamento da Venda.', mtError, [mbOk], 0);
        end;
    end;
    FrmRealizarVenda.Close;
end;


procedure TFrmTelaVenda.GerarCodVenda;
var
    Ct  : Controle;
    DM  : TDM;
    res : integer;
begin
    try
        DM  := TDM.Create(NIL);
        Ct  := Controle.Create(DM);
        res := Ct.MaxCodVenda;
        FrmTelaVenda.Edit3.Text := IntToStr(res + 1);
    except
    begin
        MessageDlg('Erro na Geração de Código de Venda.', mtError, [mbOk], 0);
        FrmTelaVenda.Close;
    end;
    end;
end;


procedure TFrmTelaVenda.CriarRegVenda;
var
    DM  : TDM;
    Ct  : Controle;
    Cli : Cliente;
    Vd  : Venda;
begin
    try
        DM  := TDM.Create(NIL);
        Cli := Cliente.Create(0,'','','','','','','');
        Vd  := Venda.Create(0,00/00/0000,0,'');

        //Valores passados para criação do registro de venda..
        Cli.setCodCli(StrToInt(Edit1.Text));
        Vd.setcodVenda(StrToInt(Edit3.Text));
        Vd.setdataVenda(DateTimePicker1.DateTime);
        Vd.setStatusVenda(trim('A'));
        //Criação de um registro de venda aberta...
        Ct := Controle.Create(DM,Vd,Cli);
        Ct.CriarRegVenda;
    except
        MessageDlg('Erro na Criação do Registro de Venda.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmTelaVenda.GerarCodPagto;
var
    Ct   : Controle;
    DM   : TDM;
    res  : integer;
    soma : integer;
begin
    try
        DM   := TDM.Create(NIL);
        Ct   := Controle.Create(DM);
        res  := Ct.MaxCodPagto;
        soma := res + 1;
        FrmTelaVenda.Edit4.Text := trim(IntToStr(soma));
    except
    begin
        MessageDlg('Erro na Geração de Código de Pagamento.', mtError, [mbOk], 0);
        FrmTelaVenda.Close;
    end;
    end;
end;


procedure TFrmTelaVenda.BitBtn3Click(Sender: TObject);
var
    DM    : TDM;
    Ct    : Controle;
    Vd    : Venda;
    Pg    : Pagamento;
    valpg : real;
begin
    try
        DM := TDM.Create(NIL);
        //Atribuindo Valores aos Objetos para Confirmação de Venda..
        //Dados de Venda

        //Valor Pago pelo Item de Venda.
        DecimalSeparator := '.';
        valpg := StrToFloat(self.CurrencyEdit1.Text);
        Vd := Venda.Create(StrToInt(self.Edit3.Text),self.DateTimePicker1.Date,valpg,'F');
        //Dados de Pagamento
        Pg := Pagamento.Create(StrToInt(Trim(Edit4.Text)),0,'NP',00/00/0000,'');
        Ct := Controle.Create(DM,Vd,Pg);

        //Alterando Registro de Venda...
        Ct.ConfirmarVenda;

        //Criando registro de Pagamento...
        Ct.CriarRegPagamento;
        
        if MessageDlg('Deseja Imprimir Informações sobre a Venda Realizada?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
            self.ImprimirVenda;
        end
        else
        begin
            MessageDlg('Venda Realizada com Sucesso.', mtInformation, [mbOk], 0);
        end;

        FrmTelaVenda.DBGrid1.DataSource.Destroy;
        self.Edit1.Text := '';
        self.Edit2.Text := '';
        self.Edit3.Text := '';
        self.Edit4.Text := '';
        self.Edit5.Text := '';
        self.CurrencyEdit1.Text := '';
        self.PodeFechar := true;
        self.Close;
    except
        MessageDlg('Problema na Confirmação da Venda.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaVenda.BitBtn4Click(Sender: TObject);
begin
    if MessageDlg('Deseja sair do Sistema?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        self.CancelarVenda;
        self.PodeFechar := true;
        self.Close;
        FrmRealizarVenda.Close;
    end
    else
    begin
        self.PodeFechar := false;
    end;
end;


procedure TFrmTelaVenda.Button1Click(Sender: TObject);
begin
    FrmTelaVenda.DBGrid1.DataSource.Destroy;
end;

procedure TFrmTelaVenda.DBGrid1ColEnter(Sender: TObject);
begin
    try
        FrmTelaVenda.Edit5.Text := DBGrid1.DataSource.DataSet.FieldByName('codItemVend').AsString;
        FrmTelaVenda.Edit6.Text := DBGrid1.DataSource.DataSet.FieldByName('codProd').AsString;
        self.bitbtn1.enabled := true;
    except
         MessageDlg('Problema na Atribuição do Código do Item selecionado.', mtError, [mbOk], 0);
    end;
end;



procedure TFrmTelaVenda.BitBtn1Click(Sender: TObject);
var
    ItVend : ItemDeVenda;
    Vd     : Venda;
    DM     : TDM;
    Ct     : Controle;
    Prod   : Produto;
begin
    try
        if (Edit5.Text <> '') AND (Edit6.Text <> '') then
        begin
            DM := TDM.Create(NIL);
            ItVend := ItemDeVenda.Create(StrToInt(Edit5.Text),0,0,0);
            Vd := Venda.Create(StrToInt(Edit3.Text),00/00/0000,0,'');
            Prod := Produto.Create(StrToInt(Edit6.Text),'',0,'','','');
            Ct := Controle.Create(DM,Vd,ItVend,Prod);
            Ct.ExcluirUnicoItemDeVendaDaLista;
            self.CalcularVenda;
            Ct.ListarItensPorCodVenda;

            //Atualiza o DBGrid
            DM.DS1.DataSet := DM.ZQuery1;
            FrmTelaVenda.DBGrid1.DataSource := DM.DS1;

            if(CurrencyEdit1.Text = '') then
            begin
                FrmTelaVenda.BitBtn1.Enabled := false;
                FrmTelaVenda.BitBtn3.Enabled := false;
                FrmTelaVenda.DBGrid1.Enabled := false;
            end;
        end
        else
        begin
            MessageDlg('Nenhum Produto foi selecionado para Exclusão.', mtError, [mbOk], 0);
        end;
    except
        MessageDlg('Problema na Exclusão do Item de Venda.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmTelaVenda.ClienteVenda;
var
    Cli : Cliente;
    Vd  : Venda;
    DM  : TDM;
    Ct  : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Cli := Cliente.Create(0,'','','','','','','');
        Vd  := Venda.Create(0,00/00/0000,0,'');
        Vd.setcodVenda(StrToInt(Edit3.Text));
        Ct  := Controle.Create(DM,Vd,Cli);

        //Buscar Dados sobre Cliente Relacionado ao Venda
        Ct.ClienteVenda;
        //Atribui o Objeto DataSet ao QuickReport.
        FrmImprimirVenda.QuickRep1.DataSet := DM.ZQuery1;
        //Atribuindo os Dados sobre Cliente.
        FrmImprimirVenda.QRDBText1.DataSet := DM.ZQuery1;
        FrmImprimirVenda.QRDBText1.DataField := 'codCli';
        FrmImprimirVenda.QRDBText2.DataSet := DM.ZQuery1;
        FrmImprimirVenda.QRDBText2.DataField := 'nomeCli';
        FrmImprimirVenda.QRDBText3.DataSet := DM.ZQuery1;
        FrmImprimirVenda.QRDBText3.DataField := 'endCli';
        FrmImprimirVenda.QRDBText5.DataSet := DM.ZQuery1;
        FrmImprimirVenda.QRDBText5.DataField := 'bairroCli';
        FrmImprimirVenda.QRDBText12.DataSet := DM.ZQuery1;
        FrmImprimirVenda.QRDBText12.DataField := 'codVenda';
    except
        MessageDlg('Problema na Atribuição de Dados sobre Cliente.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmTelaVenda.ProdutosVenda;
var
    Cli : Cliente;
    Vd  : Venda;
    DM  : TDM;
    Ct  : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Cli := Cliente.Create(0,'','','','','','','');
        Vd  := Venda.Create(0,00/00/0000,0,'');
        Vd.setcodVenda(StrToInt(Edit3.Text));
        Ct  := Controle.Create(DM,Vd,Cli);

        //Buscar Dados sobre Cliente Relacionado ao Venda
        Ct.ProdutosVenda;
        //Atribuindo os Dados sobre Cliente.
        FrmImprimirVenda.QuickRep1.DataSet := DM.ZQuery1;
        FrmImprimirVenda.QRDBText6.DataSet := DM.ZQuery1;
        FrmImprimirVenda.QRDBText6.DataField := 'codProd';
        FrmImprimirVenda.QRDBText7.DataSet := DM.ZQuery1;
        FrmImprimirVenda.QRDBText7.DataField := 'nomeProd';
        FrmImprimirVenda.QRDBText8.DataSet := DM.ZQuery1;
        DecimalSeparator := ',';
        FrmImprimirVenda.QRDBText8.DataField := 'qtdpesoVend';
        FrmImprimirVenda.QRDBText9.DataSet := DM.ZQuery1;
        FrmImprimirVenda.QRDBText9.DataField := 'qtdunitVend';
        DecimalSeparator := ',';
        FrmImprimirVenda.QRDBText10.DataSet := DM.ZQuery1;
        FrmImprimirVenda.QRDBText10.DataField := 'valpag';
        FrmImprimirVenda.QRDBText10.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema na Atribuição de Dados sobre Iténs de Venda.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmTelaVenda.SomaValorPagoImpr;
var
    Cli : Cliente;
    Vd  : Venda;
    DM  : TDM;
    Ct  : Controle;
begin
    try
        DecimalSeparator := '.';
        DM := TDM.Create(NIL);
        Cli := Cliente.Create(0,'','','','','','','');
        Vd  := Venda.Create(0,00/00/0000,0,'');
        Vd.setcodVenda(StrToInt(Edit3.Text));
        Ct  := Controle.Create(DM,Vd,Cli);
        //Efetua somatório dos valores pagos por essa vvenda gerando o valor total.
        Ct.SomaValPagoItemDeVenda;
        FrmImprimirVenda.QRDBText11.DataSet := DM.ZQuery1;
        DecimalSeparator := ',';
        FrmImprimirVenda.QRDBText11.DataField := 'sum(valpag)';
        FrmImprimirVenda.QRDBText11.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema na Atribuição do Somatório dos Valores Pagos da Venda.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmTelaVenda.ImprimirVenda;
begin
    //Montagem da Impressão de Venda.
    self.ClienteVenda;
    self.ProdutosVenda;
    self.SomaValorPagoImpr;
    FrmImprimirVenda.QuickRep1.Preview;
end;

procedure TFrmTelaVenda.FormShow(Sender: TObject);
begin
    self.BitBtn1.Enabled := false;
    self.BitBtn3.Enabled := false;
    self.DateTimePicker1.DateTime := Date;
    self.Edit5.Text := '';
    self.Edit6.Text := '';
    self.DBGrid1.Enabled := false;
    self.PodeFechar := false;
end;

procedure TFrmTelaVenda.CalcularVenda;
var
    DM : TDM;
    Ct : Controle;
    Vd : Venda;
begin
    try
        DM := TDM.Create(NIL);
        Vd := Venda.Create(StrToInt(self.Edit3.Text),00/00/0000,0,'');
        Ct := Controle.Create(DM,Vd);
        Ct.SomaValPagoItemDeVenda;
        self.CurrencyEdit1.Text := DM.ZQuery1.FieldByName('sum(valpag)').AsString;
    except
        MessageDlg('Problema ao Calcular o Valor da Venda.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaVenda.MostrarItens;
var
    DM     : TDM;
    Vd     : Venda;
    Ct     : Controle;
begin
    try
        DM := TDM.Create(NIL);
        FrmTelaVenda.DBGrid1.Enabled := true;
        Vd := Venda.Create(0,00/00/0000,0,'');
        Ct := Controle.Create(DM,Vd);
        Vd.setcodVenda(StrToInt(self.Edit3.Text));
        FrmTelaVenda.DBGrid1.Enabled := true;
        DM.DS1.DataSet := DM.ZQuery1;
        FrmTelaVenda.DBGrid1.DataSource := DM.DS1;
        Ct.ListarItensPorCodVenda;
        DecimalSeparator := ',';
        FrmTelaVenda.DBGrid1.Columns[0].FieldName := 'codProd';
        FrmTelaVenda.DBGrid1.Columns[1].FieldName := 'nomeProd';
        FrmTelaVenda.DBGrid1.Columns[2].FieldName := 'qtdpesoVend';
        FrmTelaVenda.DBGrid1.Columns[3].FieldName := 'qtdunitVend';
        FrmTelaVenda.DBGrid1.Columns[4].FieldName := 'valpag';
    except
        MessageDlg('Problema na Listagem dos Iténs de Venda.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmTelaVenda.CancelarVenda;
var
    DM  : TDM;
    Ct  : Controle;
    Vd  : Venda;
begin
    try
        DM  := TDM.Create(NIL);
        Vd  := Venda.Create(0,00/00/0000,0,'');
        Vd.setcodVenda(StrToInt(self.Edit3.Text));
        Ct := Controle.Create(DM,VD);
        //Retorna o Valor do Estoque.
        Ct.AlterarEstqParaVendaCancelada;
        //Exclui os Itens da Venda
        Ct.ExcluirTodosItemDeVenda;
        //Exclui o Registro de Venda.
        Ct.ExcluirVenda;
        self.DBGrid1.DataSource := DM.DS1;
        self.DBGrid1.DataSource.Destroy;
    except
        MessageDlg('Erro no Cancelamento da Venda.', mtError, [mbOk], 0);
    end;
end;



procedure TFrmTelaVenda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

procedure TFrmTelaVenda.Edit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmTelaVenda.Edit2Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmTelaVenda.CurrencyEdit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

end.
