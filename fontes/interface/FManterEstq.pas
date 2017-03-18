unit FManterEstq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Buttons, Mask, rxToolEdit, rxCurrEdit, FSelProdEstq,
  cDataModule, cControle, cEstoque, cProduto;

type
  TFrmManterEstq = class(TForm)
    Label14: TLabel;
    GroupBox2: TGroupBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    N1: TMenuItem;
    ListarTodosProdSemEstqs: TMenuItem;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ListarProdutosProdComEstqs: TMenuItem;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label10: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label8: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    ZerarEstoquedoProduto1: TMenuItem;
    Edit7: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure AtribuirValores;
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ListarTodosProdSemEstqsClick(Sender: TObject);
    procedure ListarProdutosProdComEstqsClick(Sender: TObject);
    procedure ZerarEstoquedoProduto1Click(Sender: TObject);
    procedure ClearBox;
    procedure edit7Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure CurrencyEdit2Enter(Sender: TObject);
    procedure Edit6Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManterEstq: TFrmManterEstq;
  DM : TDM;

implementation

uses FPrincipal;

{$R *.dfm}

procedure TFrmManterEstq.BitBtn3Click(Sender: TObject);
begin
    FrmSelProdEstq.ShowModal;
end;

procedure TFrmManterEstq.BitBtn2Click(Sender: TObject);
var
    Prod     : Produto;
    DM       : TDM;
    Ct       : Controle;
    Estq     : Estoque;
    somaflt  : real;
    valorf1  : real;
    valorf2  : real;
    somaint  : integer;
    valori1  : integer;
    valori2  : integer;
    valort   : real;
    peso     : real;
    teste    : real;
    ValEstq  : real;
    prec     : real;
    qtd_estq : real;

begin
    try
        if (self.edit7.Text <> '') AND (Edit6.Text <> '') then
        begin
            teste := StrToFloat(self.Edit7.Text);
            if(teste > 0) then
            begin
                DM   := TDM.Create(NIL);
                Prod := Produto.Create(0,'',0,'','','');
                Estq := Estoque.Create(StrToInt(self.Edit6.Text),0,0,0,0,StrToInt(Edit3.Text));

                if(Edit4.Text = 'PESO') then
                begin
                    //Calcula a inclusão do produto.
                    valorf1 := StrToFloat(Edit7.Text);
                    valorf2 := StrToFloat(Edit5.Text);
                    somaflt := valorf1 + valorf2;
                    Estq.setqtdPesoEstqAtual(somaflt);
                    self.Edit5.Text := FloatToStr(somaflt);

                    //Calcula o Valor Total da quantidade em estoque do produto.
                    prec := StrToFloat(self.CurrencyEdit1.Text);
                    qtd_estq := StrToFloat(self.Edit5.Text);
                    ValEstq := prec * qtd_estq;
                    self.CurrencyEdit2.Text := FloatToStr(ValEstq);
                end
                else
                begin
                    //Calcula a inclusão do produto.
                    valori1 := StrToInt(edit7.Text);
                    valori2 := StrToInt(Edit5.Text);
                    somaint := valori1 + valori2;
                    Estq.setqtdPesoEstqAtual(somaint);
                    self.Edit5.Text := FloatToStr(somaint);

                    //Calcula o Valor Total da quantidade em estoque do produto.
                    prec := StrToFloat(self.CurrencyEdit1.Text);
                    qtd_estq := StrToFloat(self.Edit5.Text);
                    ValEstq := prec * qtd_estq;
                    self.CurrencyEdit2.Text := FloatToStr(ValEstq);
               end;

               Ct := Controle.Create(DM,Prod,Estq);
               Ct.EditarEstq;
               MessageDlg('Edição de estoque efetuada com sucesso.', mtInformation	, [mbOk], 0);
               DecimalSeparator := ',';
               self.Edit7.Text := '0';
               self.BitBtn5.Enabled := false;
               self.BitBtn6.Enabled := false;
               self.BitBtn7.Enabled := false;
               self.BitBtn8.Enabled := false;
            end
            else
               MessageDlg('Valor não permitido.', mtWarning, [mbOk], 0);
         end
         else
            MessageDlg('O Campo quantidade está vazio.', mtWarning, [mbOk], 0);
    except
        On EConvertError do
        begin
             MessageDlg('Valor Inválido para Estoque.', mtError, [mbOk], 0);
             DecimalSeparator := ',';  
        end;
    end;
end;

Procedure TFrmManterEstq.AtribuirValores;
var
    valort : real;
    peso   : real;
    preco  : real;
begin
    try
        self.Edit1.Text := DM.ZQuery1.FieldByName('codProd').AsString;
        self.Edit2.Text := DM.ZQuery1.FieldByName('nomeProd').AsString;
        self.Edit3.Text := DM.ZQuery1.FieldByName('qtdminestq').AsString;
        self.Edit4.Text := DM.ZQuery1.FieldByName('tipomedprod').AsString;
        preco := DM.ZQuery1.FieldByName('precoprod').AsFloat;
        DecimalSeparator := ',';
        self.CurrencyEdit1.Text := FloatToStr(preco);

        if (self.Edit4.Text = 'PESO') then
        begin
            self.Edit5.Text  := DM.ZQuery1.FieldByName('qtdpesoestq').AsString;
        end
        else  if (self.Edit4.Text = 'UNIDADE') then
        begin
            peso := DM.ZQuery1.FieldByName('qtdunitestq').AsFloat;
            DecimalSeparator := ',';
            self.Edit5.Text := FloatToStr(peso);
        end;

        //valort := (StrToFloat(self.Edit5.Text) * StrToFloat(self.CurrencyEdit1.Text));
        //self.CurrencyEdit2.Text :=  FloatToStr(valort);
        self.Edit6.Text := IntToStr(DM.ZQuery1.FieldByName('codestq').AsInteger);
    except
         MessageDlg('Problema na Atribuição dos Valores.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmManterEstq.BitBtn8Click(Sender: TObject);
begin
    try
        DM.ZQuery1.First;
        self.AtribuirValores;
        self.BitBtn8.Enabled := false;
        self.BitBtn7.Enabled := false;
        self.BitBtn6.Enabled := true;
        self.BitBtn5.Enabled := true;
    except
        MessageDlg('Problema na navegação por Estoque de Produtos.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterEstq.BitBtn7Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Prior;
        self.AtribuirValores;

        if (DM.ZQuery1.Bof) then
        begin
            self.BitBtn8.Enabled := false;
            self.BitBtn7.Enabled := false;
        end;

        self.BitBtn6.Enabled := true;
        self.BitBtn5.Enabled := true;
    except
        MessageDlg('Problema na navegação por Estoque de Produtos.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterEstq.BitBtn6Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Next;
        self.AtribuirValores;

        if (DM.ZQuery1.Eof) then
        begin
            self.BitBtn5.Enabled := false;
            self.BitBtn6.Enabled := false;
        end;

        self.BitBtn8.Enabled := true;
        self.BitBtn7.Enabled := true;
    except
        MessageDlg('Problema na navegação por Estoque de Produtos.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterEstq.BitBtn5Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Last;
        self.AtribuirValores;

        self.BitBtn5.Enabled := false;
        self.BitBtn6.Enabled := false;

        self.BitBtn8.Enabled := true;
        self.BitBtn7.Enabled := true;
    except
        MessageDlg('Problema na navegação por Estoque de Produtos.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterEstq.ListarTodosProdSemEstqsClick(Sender: TObject);
var
    Ct  : Controle;
    res : integer;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        res := Ct.ListarProdSemEstq;

        if (res = 1) then
        begin
            self.AtribuirValores;
            self.BitBtn3.Enabled := true;
            self.BitBtn2.Enabled := true;
            self.BitBtn5.Enabled := true;
            self.BitBtn6.Enabled := true;
        end
        else
        begin
            MessageDlg('Não há produto sem valor em Estoque zero.', mtInformation, [mbOk], 0);
        end;
    except
        MessageDlg('Problema na Listagem dos produtos sem Estoque.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterEstq.ListarProdutosProdComEstqsClick(Sender: TObject);
var
    res : integer;
    Ct  : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        res := Ct.ListarProdComEstq;

        if (res = 1) then
        begin
            self.AtribuirValores;
            self.BitBtn3.Enabled := true;
            self.BitBtn2.Enabled := true;
            self.BitBtn5.Enabled := true;
            self.BitBtn6.Enabled := true;
        end
        else
        begin
            MessageDlg('Não há produto com valor em Estoque zero.', mtInformation, [mbOk], 0);
        end;
    except
        MessageDlg('Problema na Listagem dos produtos com Estoque.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterEstq.ZerarEstoquedoProduto1Click(Sender: TObject);
var
    DM   : TDM;
    Ct   : Controle;
    Estq : Estoque;
begin
    try
        self.BitBtn5.Enabled := false;
        self.BitBtn6.Enabled := false;
        self.BitBtn7.Enabled := false;
        self.BitBtn8.Enabled := false;
        self.BitBtn3.Enabled := true;
        DM := TDM.Create(NIL);
        Estq := Estoque.Create(0,0,0,0,0,0);
        Estq.setcodestq(StrToInt(self.Edit6.Text));
        Ct := Controle.Create(DM,Estq);
        Ct.EditarEstq;
        MessageDlg('Estoque zerado com sucesso.', mtInformation, [mbOk], 0);
        self.Edit5.Text := '0';
        self.CurrencyEdit2.Text := '0';
    except
        MessageDlg('Problema ao Zerar Estoque.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterEstq.ClearBox;
begin
    self.Edit1.Clear;
    self.Edit2.Clear;
    self.Edit3.Clear;
    self.Edit4.Clear;
    self.CurrencyEdit1.Clear;
    self.Edit5.Text := '0';
    self.CurrencyEdit2.Clear;
    self.Edit6.Clear;
    self.BitBtn1.Enabled := false;
    self.BitBtn2.Enabled := false;
    self.BitBtn3.Enabled := true;
    self.Edit7.Enabled := false;
    self.ZerarEstoquedoProduto1.Enabled := false;
end;

procedure TFrmManterEstq.edit7Change(Sender: TObject);
begin
    DecimalSeparator := ',';
    if(self.Edit4.Text = 'UNIDADE') then
    begin
        try
            StrToInt(self.edit7.Text);
        except
            MessageDlg('Valor Inválido para quantidade.', mtWarning, [mbOk], 0);
            self.edit7.Text := '0';
        end
    end

    else if(self.Edit4.Text = 'PESO') then
    begin
        try
            StrToFloat(self.edit7.Text)
        except
            MessageDlg('Valor Inválido para quantidade.', mtWarning, [mbOk], 0);
            self.edit7.Text := '0';
        end
    end
end;

procedure TFrmManterEstq.FormShow(Sender: TObject);
begin
    self.edit7.Text := '0';
    self.ClearBox;
    DecimalSeparator := ',';
    self.ZerarEstoquedoProduto1.Enabled := false;
end;

procedure TFrmManterEstq.Limpar1Click(Sender: TObject);
begin
    self.ClearBox;
end;

procedure TFrmManterEstq.BitBtn1Click(Sender: TObject);
var
    Prod     : Produto;
    DM       : TDM;
    Ct       : Controle;
    Estq     : Estoque;
    valorf1  : real;
    valorf2  : real;
    subint   : integer;
    valori1  : integer;
    valori2  : integer;
    valort   : real;
    peso     : real;
    teste    : real;
    ValEstq  : real;
    prec     : real;
    qtd_estq : real;
    subflt   : real;
begin
    try
        if (self.edit7.Text <> '') AND (Edit6.Text <> '') then
        begin
            teste := StrToFloat(self.Edit7.Text);
            if(teste > 0) AND (teste <= StrToFloat(self.Edit5.Text))then
            begin
                DM   := TDM.Create(NIL);
                Prod := Produto.Create(0,'',0,'','','');
                Estq := Estoque.Create(StrToInt(self.Edit6.Text),0,0,0,0,StrToInt(Edit3.Text));

                if(Edit4.Text = 'PESO') then
                begin
                    //Calcula a inclusão do produto.
                    valorf1 := StrToFloat(Edit5.Text);
                    valorf2 := StrToFloat(Edit7.Text);
                    subflt := valorf1 - valorf2;
                    Estq.setqtdPesoEstqAtual(subflt);
                    self.Edit5.Text := FloatToStr(subflt);

                    //Calcula o Valor Total da quantidade em estoque do produto.
                    prec := StrToFloat(self.CurrencyEdit1.Text);
                    qtd_estq := StrToFloat(self.Edit5.Text);
                    ValEstq := prec * qtd_estq;
                    self.CurrencyEdit2.Text := FloatToStr(ValEstq);
                end
                else
                begin
                    //Calcula a inclusão do produto.
                    valori1 := StrToInt(Edit5.Text);
                    valori2 := StrToInt(Edit7.Text);
                    subint  := valori1 + valori2;
                    Estq.setqtdPesoEstqAtual(subint);
                    self.Edit5.Text := FloatToStr(subint);

                    //Calcula o Valor Total da quantidade em estoque do produto.
                    prec := StrToFloat(self.CurrencyEdit1.Text);
                    qtd_estq := StrToFloat(self.Edit5.Text);
                    ValEstq := prec * qtd_estq;
                    self.CurrencyEdit2.Text := FloatToStr(ValEstq);
               end;

               Ct := Controle.Create(DM,Prod,Estq);
               Ct.EditarEstq;
               MessageDlg('Edição de estoque efetuada com sucesso.', mtInformation	, [mbOk], 0);
               DecimalSeparator := ',';
               self.Edit7.Text := '0';
               self.BitBtn5.Enabled := false;
               self.BitBtn6.Enabled := false;
               self.BitBtn7.Enabled := false;
               self.BitBtn8.Enabled := false;
            end
            else
               MessageDlg('Valor não permitido.', mtWarning, [mbOk], 0);
         end
         else
            MessageDlg('O Campo quantidade está vazio.', mtWarning, [mbOk], 0);
    except
        On EConvertError do
        begin
             MessageDlg('Valor inválido para Estoque.', mtError, [mbOk], 0);
             DecimalSeparator := ',';  
        end;
    end;
end;


procedure TFrmManterEstq.Edit1Enter(Sender: TObject);
begin
    if(self.Edit7.Enabled = true) then
       self.Edit7.SetFocus
    else
       self.BitBtn3.SetFocus;
end;

procedure TFrmManterEstq.Edit2Enter(Sender: TObject);
begin
    if(self.Edit7.Enabled = true) then
       self.Edit7.SetFocus
    else
       self.BitBtn3.SetFocus;
end;

procedure TFrmManterEstq.Edit3Enter(Sender: TObject);
begin
    if(self.Edit7.Enabled = true) then
       self.Edit7.SetFocus
    else
       self.BitBtn3.SetFocus;
end;

procedure TFrmManterEstq.Edit4Enter(Sender: TObject);
begin
    if(self.Edit7.Enabled = true) then
       self.Edit7.SetFocus
    else
       self.BitBtn3.SetFocus;
end;

procedure TFrmManterEstq.Edit5Enter(Sender: TObject);
begin
    if(self.Edit7.Enabled = true) then
       self.Edit7.SetFocus
    else
       self.BitBtn3.SetFocus;
end;

procedure TFrmManterEstq.CurrencyEdit1Enter(Sender: TObject);
begin
    if(self.Edit7.Enabled = true) then
       self.Edit7.SetFocus
    else
       self.BitBtn3.SetFocus;
end;

procedure TFrmManterEstq.CurrencyEdit2Enter(Sender: TObject);
begin
    if(self.Edit7.Enabled = true) then
       self.Edit7.SetFocus
    else
       self.BitBtn3.SetFocus;
end;

procedure TFrmManterEstq.Edit6Enter(Sender: TObject);
begin
    if(self.Edit7.Enabled = true) then
       self.Edit7.SetFocus
    else
       self.BitBtn3.SetFocus;
end;

procedure TFrmManterEstq.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if Application.MessageBox('Deseja terminar a manutenção de Estoque?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
       canClose := true
    else
       canClose := false;
end;

end.



