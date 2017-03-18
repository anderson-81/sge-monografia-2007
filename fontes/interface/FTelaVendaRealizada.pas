unit FTelaVendaRealizada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Mask, rxToolEdit, rxCurrEdit, Buttons,
  FSelItem, ComCtrls, cControle, cDataModule, cCliente, cVenda, cPagamento, cProduto,
  cItemDeVenda, FImprimirVenda;

type
  TFrmTelaVendaRealizada = class(TForm)
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
    Edit5: TEdit;
    Edit6: TEdit;
    procedure BitBtn2Click(Sender: TObject);
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
    procedure CurrencyEdit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaVendaRealizada: TFrmTelaVendaRealizada;
  vatual : real;
  vtotal : real;

implementation

{$R *.dfm}

uses
     FControlarVenda, FSelItemVendaRealizada;

procedure TFrmTelaVendaRealizada.BitBtn2Click(Sender: TObject);
begin
    FrmSelItemVendaRealizada.Edit4.Text := FrmTelaVendaRealizada.Edit3.Text;
    FrmSelItemVendaRealizada.ShowModal;
end;

procedure TFrmTelaVendaRealizada.BitBtn3Click(Sender: TObject);
begin
    self.ImprimirVenda;
end;

procedure TFrmTelaVendaRealizada.BitBtn4Click(Sender: TObject);
var
    Ct : Controle;
    DM : TDM;
    VD : Venda;
begin
    try
        Vd := Venda.Create(StrToInt(self.Edit3.Text),00/00/0000,0,'');
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM,Vd);

        if MessageDlg('Deseja excluir esta Venda e os demais registros relacionado?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
            Ct.ExcluirTodosItemDeVenda;
            Ct.ExcluirRegPagamento;
            Ct.ExcluirVenda;
            MessageDlg('Venda excluída com sucesso.', mtInformation, [mbOk], 0);
            FrmControlarVenda.Visible := true;
        end
        else
            MessageDlg('Venda não excluída.', mtInformation, [mbOk], 0);
    except
        MessageDlg('Problema na Exclusão da Venda.', mtError, [mbOk], 0);
        self.Close;
    end;
end;

procedure TFrmTelaVendaRealizada.Button1Click(Sender: TObject);
begin
    FrmTelaVendaRealizada.DBGrid1.DataSource.Destroy;
end;

procedure TFrmTelaVendaRealizada.DBGrid1ColEnter(Sender: TObject);
begin
    try
        FrmTelaVendaRealizada.Edit5.Text := DBGrid1.DataSource.DataSet.FieldByName('codItemVend').AsString;
        FrmTelaVendaRealizada.Edit6.Text := DBGrid1.DataSource.DataSet.FieldByName('codProd').AsString;
        self.bitbtn1.enabled := true;
    except
         MessageDlg('Problema na Atribuição do Código do Item selecionado.', mtError, [mbOk], 0);
    end;
end;



procedure TFrmTelaVendaRealizada.BitBtn1Click(Sender: TObject);
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
            FrmTelaVendaRealizada.DBGrid1.DataSource := DM.DS1;

            if(CurrencyEdit1.Text = '') then
            begin
                FrmTelaVendaRealizada.BitBtn1.Enabled := false;
                FrmTelaVendaRealizada.BitBtn3.Enabled := false;
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

Procedure TFrmTelaVendaRealizada.ClienteVenda;
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

Procedure TFrmTelaVendaRealizada.ProdutosVenda;
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
        FrmImprimirVenda.QRDBText10.DataSet := DM.ZQuery1;
        DecimalSeparator := ',';
        FrmImprimirVenda.QRDBText10.DataField := 'valpag';
        FrmImprimirVenda.QRDBText10.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
        MessageDlg('Problema na Atribuição de Dados sobre Iténs de Venda.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmTelaVendaRealizada.SomaValorPagoImpr;
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


Procedure TFrmTelaVendaRealizada.ImprimirVenda;
begin
    //Montagem da Impressão de Venda.
    self.ClienteVenda;
    self.ProdutosVenda;
    self.SomaValorPagoImpr;
    FrmImprimirVenda.QuickRep1.Preview;
end;

procedure TFrmTelaVendaRealizada.FormShow(Sender: TObject);
begin
    {
    DecimalSeparator := ',';
    self.BitBtn1.Enabled := false;
    self.BitBtn3.Enabled := false;
    self.Edit5.Text := '';
    self.Edit6.Text := '';
    }
end;

procedure TFrmTelaVendaRealizada.CalcularVenda;
var
    DM : TDM;
    Ct : Controle;
    Vd : Venda;
    valor : real;
begin
    try
        DecimalSeparator := ',';
        DM := TDM.Create(NIL);
        Vd := Venda.Create(StrToInt(self.Edit3.Text),00/00/0000,0,'');
        Ct := Controle.Create(DM,Vd);
        Ct.SomaValPagoItemDeVenda;
        DecimalSeparator := ',';
        self.CurrencyEdit1.Text := DM.ZQuery1.FieldByName('sum(valpag)').AsString;
        valor := StrToFloat(self.CurrencyEdit1.Text);
        DecimalSeparator := '.';
        Vd.setvalTotVenda(valor);
        Ct.AlterarValorVenda;
        DecimalSeparator := ',';
    except
        On EConvertError do
        begin
            MessageDlg('Calculo de Venda não Efetuado.', mtInformation, [mbOk], 0);
            MessageDlg('Esta Venda não possui nenhum Item.', mtInformation, [mbOk], 0);
            valor := 0;
            DecimalSeparator := '.';
            Vd.setvalTotVenda(valor);
            Ct.AlterarValorVenda;
        end;
        else
           MessageDlg('Problema ao Calcular o Valor da Venda.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaVendaRealizada.MostrarItens;
var
    DM     : TDM;
    Vd     : Venda;
    Ct     : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Vd := Venda.Create(StrToInt(self.Edit3.Text),00/00/0000,0,'');
        Ct := Controle.Create(DM,Vd);
        DM.DS1.DataSet := DM.ZQuery1;
        FrmTelaVendaRealizada.DBGrid1.DataSource := DM.DS1;
        Ct.ListarItensPorCodVenda;
        DecimalSeparator := ',';
        FrmTelaVendaRealizada.DBGrid1.Columns[0].FieldName := 'codProd';
        FrmTelaVendaRealizada.DBGrid1.Columns[1].FieldName := 'nomeProd';
        FrmTelaVendaRealizada.DBGrid1.Columns[2].FieldName := 'qtdpesoVend';
        FrmTelaVendaRealizada.DBGrid1.Columns[3].FieldName := 'qtdunitVend';
        FrmTelaVendaRealizada.DBGrid1.Columns[4].FieldName := 'valpag';
    except
        MessageDlg('Problema na Listagem dos Iténs de Venda.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmTelaVendaRealizada.CancelarVenda;
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


procedure TFrmTelaVendaRealizada.CurrencyEdit1Change(Sender: TObject);
begin
    DecimalSeparator := ',';
end;

procedure TFrmTelaVendaRealizada.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
    Ct : Controle;
    DM : TDM;
    VD : Venda;
begin
    Vd := Venda.Create(StrToInt(self.Edit3.Text),00/00/0000,0,'');
    DM := TDM.Create(NIL);
    Ct := Controle.Create(DM,Vd);

    if (Ct.VerificarPossuiProdNaLista = 1) then
    begin
        MessageDlg('Esta Venda não possui nenhum Produto como Item de Venda.', mtInformation, [mbOk], 0);
        if MessageDlg('Deseja excluir esta Venda e os demais registros relacionado?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
            Ct.ExcluirRegPagamento;
            Ct.ExcluirVenda;
            MessageDlg('Venda excluída com sucesso.', mtInformation, [mbOk], 0);
            CanClose := true;
            FrmControlarVenda.Visible := true;
        end
        else
        begin
            MessageDlg('Venda não excluída.', mtInformation, [mbOk], 0);
            CanClose := false;
        end;
    end
    else
       CanClose := true;
       FrmControlarVenda.Visible := true;
end;



procedure TFrmTelaVendaRealizada.Edit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmTelaVendaRealizada.Edit2Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmTelaVendaRealizada.CurrencyEdit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

end.


