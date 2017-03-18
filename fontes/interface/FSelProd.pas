unit FSelProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, cControle, cDataModule,
  cProduto, cEstoque;

type
  TFrmSelProd = class(TForm)
    GroupBox3: TGroupBox;
    Label2: TLabel;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListarCatg;
    procedure ListarProdPorCatg;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    PodeFechar : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelProd: TFrmSelProd;
  

implementation

{$R *.dfm}

uses
    FManterProduto;

procedure TFrmSelProd.BitBtn1Click(Sender: TObject);
var
    Prod : Produto;
    DM   : TDM;
    Ct   : Controle;
    Estq : Estoque;
begin
    try
        if (Combobox2.Text <> '') then
        begin
            DM   := TDM.Create(NIL);
            Prod := Produto.Create(0,'',0,'','','');
            Estq := Estoque.Create(0,0,0,0,0,0);
            Ct   := Controle.Create(DM,Prod,Estq);
            Prod.setnomeProd(Combobox2.Text);
            Ct.BuscarProdPorNome;
            DecimalSeparator := ',';
            FrmManterProduto.Edit2.ReadOnly := true;
            FrmManterProduto.Edit1.Text := IntToStr(Prod.getcodProd);
            FrmManterProduto.Edit2.Text := Prod.getnomeProd;
            FrmManterProduto.AtribuirNomeAntg;
            FrmManterProduto.ComboBox1.Clear;
            FrmManterProduto.Combobox1.Items.Add('Crustáceos');
            FrmManterProduto.Combobox1.Items.Add('Peixes');
            FrmManterProduto.Combobox1.Text := Prod.getcatProd;
            FrmManterProduto.Edit4.Text := Prod.gettipoMedProd;
            if (FrmManterProduto.Edit4.Text = 'PESO') then
            begin
                FrmManterProduto.RadioButton1.Checked := true;
                FrmManterProduto.RadioButton1.Enabled := true;
                FrmManterProduto.RadioButton2.Checked := false;
                FrmManterProduto.RadioButton2.Enabled := false;
            end
            else if (FrmManterProduto.Edit4.Text = 'UNIDADE') then
            begin
                FrmManterProduto.RadioButton1.Enabled := false;
                FrmManterProduto.RadioButton1.Checked := false;
                FrmManterProduto.RadioButton2.Checked := true;
                FrmManterProduto.RadioButton2.Enabled := true;
            end;

            FrmManterProduto.Edit5.Text := IntToStr(Estq.getqtdminEstq);
            FrmManterProduto.CurrencyEdit1.Text := FloatToStr(Prod.getprecoProd);
            FrmManterProduto.Memo1.Text := Prod.getdescProd;
            FrmManterProduto.Edit3.Text := IntToStr(Estq.getcodEstq);
            FrmManterProduto.BitBtn4.Enabled := true;
            FrmManterProduto.BitBtn3.Enabled := true;
            FrmManterProduto.BitBtn2.Enabled := true;
            FrmManterProduto.BitBtn1.Enabled := false;

            self.ComboBox1.Clear;
            self.ComboBox2.Clear;
            self.PodeFechar := true;
            self.Close;
        end
        else
            Showmessage('Selecione um produto.');
    except
        MessageDlg('Problema na confirmação de seleção de produto.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmSelProd.ComboBox1Change(Sender: TObject);
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

        Prod.setcatProd(ComboBox1.Text);
        Ct.ListarProd;

        While (NOT DM.ZQuery1.EOF) do
        begin
            Prod.setnomeProd(DM.ZQuery1.FieldByName('nomeProd').AsString);
            Combobox2.Items.Add(Prod.getnomeProd);
            DM.ZQuery1.Next;
        end;
    Except
        MessageDlg('Problema na Listagem de Produtos.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmSelProd.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja cancelar a busca por Produto?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        self.PodeFechar := true;
        self.Close;
    end;
end;

Procedure TFrmSelProd.ListarCatg;
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
            Combobox1.Items.Add(Prod.getcatProd);
            DM.ZQuery1.Next;
        end;
    Except
       MessageDlg('Problema na Listagem das categorias de produtos.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmSelProd.ListarProdPorCatg;
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
            Combobox1.Items.Add(Prod.getcatProd);
            DM.ZQuery1.Next;
        end;
    Except
       MessageDlg('Problema na Listagem das categorias de produtos.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmSelProd.FormShow(Sender: TObject);
begin
    Combobox1.Clear;
    Combobox2.Clear;
    FrmSelProd.ListarCatg;
    self.PodeFechar := false;
end;

procedure TFrmSelProd.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

procedure TFrmSelProd.FormCreate(Sender: TObject);
begin
    self.PodeFechar := false;
end;

end.
