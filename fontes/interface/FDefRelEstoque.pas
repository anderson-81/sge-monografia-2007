unit FDefRelEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Buttons, Mask, cDataModule, cControle, FRelEstqComp,
  FRelEstqAbaixoDoMin, FRelEstqPorcAcimaDoMin;

type
  TFrmDefRelEstoque = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit1: TEdit;
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RelatorioCompleto;
    procedure SomatorioEstoque;
    Procedure QtdProdEstq;
    Procedure RelatorioEstoqueZero;
    Procedure QuantidadeEstqZero;
    Procedure ProdutoEstoqueZero;
    Procedure RelatorioEstoqueAbaixoDoMin;
    Procedure ProdutoEstoqueAbaixoDoMin;
    Procedure QuantidadeEstqAbaixoDoMin;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ProdutoEstoquePorcAcimaDoMin;
    procedure QuantidadeEstqPorcAcimaDoMin;
    Procedure RelatorioEstoquePorcAcimaDoMin;
    procedure Edit1Change(Sender: TObject);
  private
    PodeFechar : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDefRelEstoque: TFrmDefRelEstoque;

implementation

uses
    FControlarEstq, FRelEstqZero;

{$R *.dfm}

Procedure TFrmDefRelEstoque.QtdProdEstq;
var
    Ct : Controle;
    DM : TDM;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.SomaQtdProdEstq;
        FrmRelEstqComp.QRDBText7.DataSet := DM.ZQuery1;
        FrmRelEstqComp.QRDBText7.DataField := 'count(codProd)';
    except
         MessageDlg('Problema no calculo dos produtos em Estoque.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmDefRelEstoque.RadioButton2Click(Sender: TObject);
begin
    self.Edit1.Enabled := false;
    self.Label3.Enabled := false;
    self.CheckBox1.Enabled := true;
end;

procedure TFrmDefRelEstoque.RadioButton1Click(Sender: TObject);
begin
    self.Edit1.Enabled := true;
    self.Label3.Enabled := true;
    self.RadioButton1.ShowHint := true;
    self.RadioButton1.Hint := 'Informe um valor para Calcular a Porcentagem do Estoque.';
    self.CheckBox1.Checked := false;
    self.CheckBox1.Enabled := false;
end;

procedure TFrmDefRelEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmControlarEstq.Close;
end;

procedure TFrmDefRelEstoque.BitBtn1Click(Sender: TObject);
begin
    if(self.RadioButton2.Checked = true) then
    begin
        self.RelatorioCompleto;
        self.SomatorioEstoque;
        self.QtdProdEstq;
    end
    else if(self.RadioButton3.Checked = true) then
    begin
        self.RelatorioEstoqueZero;
    end
    else if(self.RadioButton4.Checked = true) then
    begin
        self.RelatorioEstoqueAbaixoDoMin;
    end
    else if(self.RadioButton1.Checked = true) then
    begin
        self.RelatorioEstoquePorcAcimaDoMin;
    end;
end;

procedure TFrmDefRelEstoque.RadioButton3Click(Sender: TObject);
begin
    self.Edit1.Enabled := false;
    self.Label3.Enabled := false;
    self.CheckBox1.Checked := false;
    self.CheckBox1.Enabled := false;
end;

procedure TFrmDefRelEstoque.RelatorioCompleto;
var
    Ct : Controle;
    DM : TDM;
begin
    try
        self.QtdProdEstq;
        self.SomatorioEstoque;
        DM := TDM.Create(NIL);

        //Lista Todos os Estoques dos Produtos
        Ct := Controle.Create(DM);
        Ct.ListarTodosEstq;

        //Atribui o Objeto DATASET ao QuickReport.
        FrmRelEstqComp.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição dos Dados referentes aos Estoques

        if(self.CheckBox1.Checked = true) then
        begin
            FrmRelEstqComp.QRDBText1.DataSet := DM.ZQuery1;
            FrmRelEstqComp.QRDBText1.DataField := 'codProd';

            FrmRelEstqComp.QRDBText2.DataSet := DM.ZQuery1;
            FrmRelEstqComp.QRDBText2.DataField := 'nomeProd';

            FrmRelEstqComp.QRDBText3.DataSet := DM.ZQuery1;
            FrmRelEstqComp.QRDBText3.DataField := 'catProd';

            FrmRelEstqComp.QRDBText4.DataSet := DM.ZQuery1;
            FrmRelEstqComp.QRDBText4.DataField := 'qtdPesoEstqAtual';

            FrmRelEstqComp.QRDBText5.DataSet := DM.ZQuery1;
            FrmRelEstqComp.QRDBText5.DataField := 'qtdUnitEstqAtual';

            FrmRelEstqComp.QRDBText6.DataSet := DM.ZQuery1;
            DecimalSeparator := ',';
            FrmRelEstqComp.QRDBText6.DataField := '(QtdUnitEstqAtual * precoProd)';
            FrmRelEstqComp.QRDBText6.Mask := 'R$ ,0.00;-R$ ,0.00';

            FrmRelEstqComp.QRDBText9.DataSet := DM.ZQuery1;
            DecimalSeparator := ',';
            FrmRelEstqComp.QRDBText9.DataField := 'precoProd';
            FrmRelEstqComp.QRDBText9.Mask := 'R$ ,0.00;-R$ ,0.00';
        end;
        FrmRelEstqComp.QuickRep1.Preview;
    except
        MessageDlg('Problema na Geração do Reletório Completo sobre Estoque.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmDefRelEstoque.SomatorioEstoque;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.SomatorioPrecoQtdEstoque;
        DecimalSeparator := ',';
        FrmRelEstqComp.QuickRep1.DataSet := DM.ZQuery1;
        FrmRelEstqComp.QRDBText8.DataSet := DM.ZQuery1;
        FrmRelEstqComp.QRDBText8.DataField := 'SUM(precoProd * qtdUnitEstqAtual + precoProd * qtdPesoEstqAtual)';
        FrmRelEstqComp.QRDBText8.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
         MessageDlg('Problema no somatório dos produtos em Estoque.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmDefRelEstoque.RelatorioEstoqueZero;
begin
    self.ProdutoEstoqueZero;
    self.QuantidadeEstqZero;
    FrmRelEstqZero.QuickRep1.Preview;
end;

Procedure TFrmDefRelEstoque.ProdutoEstoqueZero;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.ListarTodosProdEstqZero;
        //Atribuição do DataSet ao Relatório
        FrmRelEstqZero.QuickRep1.DataSet := DM.ZQuery1;
        //Atribuição dos dados dos produtos.
        FrmRelEstqZero.QRDBText1.DataSet := DM.ZQuery1;
        FrmRelEstqZero.QRDBText1.DataField := 'codProd';
        FrmRelEstqZero.QRDBText2.DataSet := DM.ZQuery1;
        FrmRelEstqZero.QRDBText2.DataField := 'nomeProd';
        FrmRelEstqZero.QRDBText3.DataSet := DM.ZQuery1;
        FrmRelEstqZero.QRDBText3.DataField := 'catProd';
        FrmRelEstqZero.QRDBText5.DataSet := DM.ZQuery1;
        FrmRelEstqZero.QRDBText5.DataField := 'tipoMedProd';
        FrmRelEstqZero.QRDBText6.DataSet := DM.ZQuery1;
        DecimalSeparator := ',';
        FrmRelEstqZero.QRDBText6.DataField := 'precoProd';
        FrmRelEstqZero.QRDBText6.Mask := 'R$ ,0.00;-R$ ,0.00';
    except
         MessageDlg('Problema na atribuição dos dados dos produtos com Estoque zero.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmDefRelEstoque.QuantidadeEstqZero;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.QtdProdEstqZero;
        FrmRelEstqZero.QRDBText7.DataSet := DM.ZQuery1;
        FrmRelEstqZero.QRDBText7.DataField := 'count(codProd)';
    except
        MessageDlg('Problema no calculo dos produtos com Estoque zero.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmDefRelEstoque.ProdutoEstoqueAbaixoDoMin;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.ListarTodosProdEstqAbaixoDoMin;

        //Atribuição do DataSet ao Relatório
        FrmRelEstqAbaixoDoMin.QuickRep1.DataSet := DM.ZQuery1;
        //Atribuição dos dados dos produtos.
        FrmRelEstqAbaixoDoMin.QRDBText1.DataSet := DM.ZQuery1;
        FrmRelEstqAbaixoDoMin.QRDBText1.DataField := 'codProd';
        FrmRelEstqAbaixoDoMin.QRDBText2.DataSet := DM.ZQuery1;
        FrmRelEstqAbaixoDoMin.QRDBText2.DataField := 'nomeProd';
        FrmRelEstqAbaixoDoMin.QRDBText3.DataSet := DM.ZQuery1;
        FrmRelEstqAbaixoDoMin.QRDBText3.DataField := 'catProd';
        FrmRelEstqAbaixoDoMin.QRDBText5.DataSet := DM.ZQuery1;
        DecimalSeparator := ',';
        FrmRelEstqAbaixoDoMin.QRDBText5.DataField := 'qtdPesoEstqAtual';
        FrmRelEstqAbaixoDoMin.QRDBText6.DataSet := DM.ZQuery1;
        DecimalSeparator := ',';
        FrmRelEstqAbaixoDoMin.QRDBText6.DataField := 'precoProd';
        FrmRelEstqAbaixoDoMin.QRDBText6.Mask := 'R$ ,0.00;-R$ ,0.00';
        FrmRelEstqAbaixoDoMin.QRDBText4.DataSet := DM.ZQuery1;
        FrmRelEstqAbaixoDoMin.QRDBText4.DataField := 'qtdUnitEstqAtual';
        FrmRelEstqAbaixoDoMin.QRDBText8.DataSet := DM.ZQuery1;
        FrmRelEstqAbaixoDoMin.QRDBText8.DataField := 'qtdMinEstq';
    except
         MessageDlg('Problema na atribuição dos dados dos produtos com Estoque abaixo do mínimo.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmDefRelEstoque.QuantidadeEstqAbaixoDoMin;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.QtdProdEstqAbaixoDoMin;
        FrmRelEstqAbaixoDoMin.QRDBText7.DataSet := DM.ZQuery1;
        FrmRelEstqAbaixoDoMin.QRDBText7.DataField := 'COUNT(*)';
    except
        MessageDlg('Problema no calculo dos produtos com Estoque abaixo do mínimo.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmDefRelEstoque.RelatorioEstoqueAbaixoDoMin;
begin
    self.ProdutoEstoqueAbaixoDoMin;
    self.QuantidadeEstqAbaixoDoMin;
    FrmRelEstqAbaixoDoMin.QuickRep1.Preview;
end;

procedure TFrmDefRelEstoque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

procedure TFrmDefRelEstoque.FormShow(Sender: TObject);
begin
    self.PodeFechar := false;
    self.Edit1.Text := '0';
end;

procedure TFrmDefRelEstoque.BitBtn2Click(Sender: TObject);
begin
     if MessageDlg('Deseja cancelar a definição de Relatório sobre Estoque?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
         self.PodeFechar := true;
         self.Close;
     end;
end;


Procedure TFrmDefRelEstoque.ProdutoEstoquePorcAcimaDoMin;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.ListarProdPorPorcAcimaDoEstq(StrToFloat(self.Edit1.Text));

        //Atribuição do DataSet ao Relatório
        FrmRelEstqPorcAcimaDoMin.QuickRep1.DataSet := DM.ZQuery1;

        //Atribuição dos dados dos produtos.
        FrmRelEstqPorcAcimaDoMin.QRDBText1.DataSet := DM.ZQuery1;
        FrmRelEstqPorcAcimaDoMin.QRDBText1.DataField := 'codProd';
        FrmRelEstqPorcAcimaDoMin.QRDBText2.DataSet := DM.ZQuery1;
        FrmRelEstqPorcAcimaDoMin.QRDBText2.DataField := 'nomeProd';
        FrmRelEstqPorcAcimaDoMin.QRDBText3.DataSet := DM.ZQuery1;
        FrmRelEstqPorcAcimaDoMin.QRDBText3.DataField := 'catProd';
        FrmRelEstqPorcAcimaDoMin.QRDBText5.DataSet := DM.ZQuery1;
        DecimalSeparator := ',';
        FrmRelEstqPorcAcimaDoMin.QRDBText5.DataField := 'qtdPesoEstqAtual';
        FrmRelEstqPorcAcimaDoMin.QRDBText6.DataSet := DM.ZQuery1;
        DecimalSeparator := ',';
        FrmRelEstqPorcAcimaDoMin.QRDBText6.DataField := 'precoProd';
        FrmRelEstqPorcAcimaDoMin.QRDBText6.Mask := 'R$ ,0.00;-R$ ,0.00';
        FrmRelEstqPorcAcimaDoMin.QRDBText4.DataSet := DM.ZQuery1;
        FrmRelEstqPorcAcimaDoMin.QRDBText4.DataField := 'qtdUnitEstqAtual';
        FrmRelEstqPorcAcimaDoMin.QRDBText8.DataSet := DM.ZQuery1;
        FrmRelEstqPorcAcimaDoMin.QRDBText8.DataField := 'qtdMinEstq';
    except
         MessageDlg('Problema na atribuição dos dados do produtos com porcentagem acima do Estoque.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmDefRelEstoque.QuantidadeEstqPorcAcimaDoMin;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);

        //Ct.QtdProdEstqAbaixoDoMin;

        FrmRelEstqPorcAcimaDoMin.QRDBText7.DataSet := DM.ZQuery1;
        FrmRelEstqPorcAcimaDoMin.QRDBText7.DataField := 'COUNT(*)';
    except
        MessageDlg('Problema no calculo dos produtos com Estoque abaixo do mínimo.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmDefRelEstoque.RelatorioEstoquePorcAcimaDoMin;
begin
    self.ProdutoEstoquePorcAcimaDoMin;
    FrmRelEstqPorcAcimaDoMin.QRLabel20.Caption := (self.Edit1.Text + '%');
    //self.QuantidadeEstqPorcAcimaDoMin;
    FrmRelEstqPorcAcimaDoMin.QuickRep1.Preview;
end;

procedure TFrmDefRelEstoque.Edit1Change(Sender: TObject);
begin
    try
        StrToFloat(self.Edit1.Text);
    except
        MessageDlg('Valor Inválido.', mtWarning, [mbOk], 0);
        self.Edit1.Text := '0';
    end;
end;

end.
