unit FSelProdEstq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cProduto, cDataModule, cEstoque, cControle;

type
  TFrmSelProdEstq = class(TForm)
    Label3: TLabel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    GroupBox4: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    Procedure ListarCatg;
    procedure ListarProdPorCatg;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    PodeFechar : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelProdEstq: TFrmSelProdEstq;

implementation

uses FManterEstq;

{$R *.dfm}

procedure TFrmSelProdEstq.BitBtn1Click(Sender: TObject);
var
    Prod    : Produto;
    DM      : TDM;
    Ct      : Controle;
    Estq    : Estoque;
    valort  : real;
    peso    : real;
    preco   : real;
begin
    try
        if (Combobox2.Text <> '') then
        begin
            DM   := TDM.Create(NIL);
            Prod := Produto.Create(0,'',0,'','','');
            Estq := Estoque.Create(0,0,0,0,0,0);
            Ct   := Controle.Create(DM,Prod,Estq);
            Prod.setnomeProd(self.Combobox2.Text);
            Ct.BuscarProdPorNome;
            FrmManterEstq.Edit1.Text := IntToStr(Prod.getcodProd);
            FrmManterEstq.Edit2.Text := Prod.getnomeProd;
            FrmManterEstq.Edit3.Text := IntToStr(Estq.getqtdminEstq);
            FrmManterEstq.Edit4.Text := Prod.gettipoMedProd;
            preco := Prod.getprecoProd;
            DecimalSeparator := ',';
            FrmManterEstq.CurrencyEdit1.Text := FloatToStr(preco);
            FrmManterEstq.Edit7.Enabled := true;

            if (FrmManterEstq.Edit4.Text = 'PESO') then
            begin
                peso := Estq.getqtdPesoEstqAtual;
                DecimalSeparator := ',';
                FrmManterEstq.Edit5.Text := FloatToStr(peso);
            end
            else  if (FrmManterEstq.Edit4.Text = 'UNIDADE') then
            begin
                FrmManterEstq.Edit5.Text :=  IntToStr(Estq.getqtdunitEstqAtual);
            end;

            valort := (StrToFloat(FrmManterEstq.Edit5.Text) * StrToFloat(FrmManterEstq.CurrencyEdit1.Text));
            FrmManterEstq.CurrencyEdit2.Text := FloatToStr(valort);
            FrmManterEstq.Edit6.Text := IntToStr(Estq.getcodEstq);
            FrmManterEstq.BitBtn3.Enabled := true;
            FrmManterEstq.BitBtn2.Enabled := true;
            FrmManterEstq.BitBtn1.Enabled := true;
            self.ComboBox1.Clear;
            self.ComboBox2.Clear;
            FrmManterEstq.ZerarEstoquedoProduto1.Enabled := true;
            self.PodeFechar := true;
            self.Close;
        end
        else
           Showmessage('Selecione um Produto.');
    except
         MessageDlg('Problema na busca pelo Produtos.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmSelProdEstq.ComboBox1Change(Sender: TObject);
var
    Prod : Produto;
    Ct   : Controle;
    DM   : TDM;
begin
    try
        Combobox2.Items.Clear;
        DM   := TDM.create (NIL);
        Prod := Produto.Create(0,'',0,'','','');
        Ct   := Controle.Create(DM, Prod);

        Prod.setcatProd(self.ComboBox1.Text);
        Ct.ListarProd;

        While (NOT DM.ZQuery1.EOF) do
        begin
            Prod.setnomeProd(DM.ZQuery1.FieldByName('nomeProd').AsString);
            self.Combobox2.Items.Add(Prod.getnomeProd);
            DM.ZQuery1.Next;
        end;
    Except
        MessageDlg('Problema na Listagem de Produtos.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmSelProdEstq.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja cancelar a busca por Produto?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        self.PodeFechar := true;
        self.Close;
    end;
end;

Procedure TFrmSelProdEstq.ListarCatg;
var
    DM : TDM;
    Prod : Produto;
    Ct  : Controle;
Begin
    try
        DM   := TDM.create (NIL);
        Prod := Produto.Create(0,'',0,'','','');
        Ct   := Controle.Create(DM, Prod);

        Ct.ListarCat;

        While (NOT DM.ZQuery1.EOF) do
        begin
            Prod.setcatProd(DM.ZQuery1.FieldByName('catProd').AsString);
            self.Combobox1.Items.Add(Prod.getcatProd);
            DM.ZQuery1.Next;
        end;
    Except
       MessageDlg('Problema na Listagem das categorias de produtos.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmSelProdEstq.ListarProdPorCatg;
var
    DM : TDM;
    Prod : Produto;
    Ct  : Controle;
Begin
    try
        DM   := TDM.create (NIL);
        Prod := Produto.Create(0,'',0,'','','');
        Ct   := Controle.Create(DM, Prod);

        Prod.setcatProd(Combobox1.Text);
        Ct.ListarProd;

        While (NOT DM.ZQuery1.EOF) do
        begin
            Prod.setcatProd(DM.ZQuery1.FieldByName('nomeProd').AsString);
            self.Combobox1.Items.Add(Prod.getcatProd);
            DM.ZQuery1.Next;
        end;
    Except
       MessageDlg('Problema na Listagem das categorias de produtos.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmSelProdEstq.FormShow(Sender: TObject);
begin
    self.Combobox1.Clear;
    self.Combobox2.Clear;
    self.ListarCatg;
    self.PodeFechar := false;
end;

procedure TFrmSelProdEstq.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

end.
