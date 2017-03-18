unit FConsultarPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons, cControle, cDataModule, cProduto,
  rxToolEdit, rxCurrEdit, cEstoque;

type
  TFrmConsultarPreco = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label14: TLabel;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    ComboBox2: TComboBox;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    Label3: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ClearBox;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit2Enter(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
  private
    PodeFechar : Boolean;  
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarPreco: TFrmConsultarPreco;

implementation

uses FPrincipal;

{$R *.dfm}

procedure TFrmConsultarPreco.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja cancelar a consulta de preço?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
        FrmConsultarPreco.Close;
end;

procedure TFrmConsultarPreco.ComboBox1Change(Sender: TObject);
var
    Prod : Produto;
    Ct   : Controle;
    DM   : TDM;
begin
    try
        Combobox2.Clear;
        Combobox2.Text := '';
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
         MessageDlg('Problema na listagem dos produtos.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmConsultarPreco.ComboBox2Change(Sender: TObject);
var
    Prod : Produto;
    Ct   : Controle;
    DM   : TDM;
    Estq : estoque;
begin
    try
        DM   := TDM.create (NIL);
        Prod := Produto.Create(0,'',0,'','','');
        Estq := Estoque.Create(0,0,0,0,0,0);
        Ct   := Controle.Create(DM,Prod,Estq);
        Prod.setnomeProd(Combobox2.Text);
        Ct.BuscarProdPorNome;

        if(Prod.gettipoMedProd = 'PESO')then
           Edit2.Text := (Prod.gettipoMedProd + '(KG)')
        else
           Edit2.Text := Prod.gettipoMedProd;

        DecimalSeparator := ',';
        CurrencyEdit1.Text := FloatToStr(Prod.getprecoProd);
    except
        MessageDlg('Problema na busca pelo produto.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmConsultarPreco.BitBtn1Click(Sender: TObject);
begin
    self.PodeFechar := true;
    self.Close;
end;

procedure TFrmConsultarPreco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FrmPrincipal.Enabled := true;
end;

procedure TFrmConsultarPreco.FormShow(Sender: TObject);
var
    Prod  : Produto;
    Ct    : Controle;
    DM    : TDM;

begin
    try
        DM   := TDM.create (NIL);
        Prod := Produto.Create(0,'',0,'','','');
        Ct   := Controle.Create(DM, Prod);

        self.ClearBox;
        Ct.ListarCat;

        While (NOT DM.ZQuery1.EOF) do
        begin
            Prod.setcatProd(DM.ZQuery1.FieldByName('catProd').AsString);
            Combobox1.Items.Add(Prod.getcatProd);
            DM.ZQuery1.Next;
        end;
    
    except
        MessageDlg('Problema na listagem das categorias.', mtError, [mbOk], 0); 
    end;
end;

procedure TFrmConsultarPreco.ClearBox;
begin
    Combobox1.Clear;
    Combobox2.Clear;
    CurrencyEdit1.Clear;
    Edit2.Clear;
end;


procedure TFrmConsultarPreco.FormCreate(Sender: TObject);
begin
    self.PodeFechar := false;
end;

procedure TFrmConsultarPreco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := PodeFechar;
end;

procedure TFrmConsultarPreco.Edit2Enter(Sender: TObject);
begin
    self.BitBtn1.SetFocus;
end;

procedure TFrmConsultarPreco.CurrencyEdit1Enter(Sender: TObject);
begin
    self.BitBtn1.SetFocus;
end;

end.
