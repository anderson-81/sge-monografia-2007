unit FSelItemVendaRealizada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, rxToolEdit, rxCurrEdit, Buttons, cDataModule, cControle, cProduto,
  cEstoque, cItemDeVenda, cVenda, DB;

type
  TFrmSelItemVendaRealizada = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    GroupBox3: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label9: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn3: TBitBtn;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure ListarCatg;
    procedure ListarProdPorCatg;
    procedure ClearBox;
    procedure habilitar;
    procedure MaiorCodigo;
    procedure Edit6Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelItemVendaRealizada: TFrmSelItemVendaRealizada;

implementation

uses
    FTelaVendaRealizada;

{$R *.dfm}

procedure TFrmSelItemVendaRealizada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    self.ClearBox;
end;

Procedure TFrmSelItemVendaRealizada.ListarCatg;
var
    DM   : TDM;
    Prod : Produto;
    Ct   : Controle;
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

procedure TFrmSelItemVendaRealizada.ListarProdPorCatg;
var
    DM : TDM;
    Prod : Produto;
    Ct  : Controle;
Begin
    try
        DM   := TDM.create (NIL);
        Prod := Produto.Create(0,'',0,'','','');
        Ct   := Controle.Create(DM, Prod);

        Prod.setcatProd(self.Combobox1.Text);
        Ct.ListarProd;

        While (NOT DM.ZQuery1.EOF) do
        begin
            Prod.setnomeProd(DM.ZQuery1.FieldByName('nomeProd').AsString);
            self.Combobox2.Items.Add(Prod.getnomeProd);
            DM.ZQuery1.Next;
        end;
    Except
       MessageDlg('Problema na Listagem das categorias de produtos.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmSelItemVendaRealizada.ClearBox;
begin
    Combobox1.Clear;
    Combobox2.Clear;
    Combobox2.Enabled := false;
    Edit1.Clear;
    Edit1.Enabled := false;
    Edit2.Clear;
    Edit2.Enabled := false;
    CurrencyEdit1.Clear;
    CurrencyEdit1.Enabled := false;
    CurrencyEdit2.Clear;
    CurrencyEdit2.Enabled := false;
    self.Edit6.Text := '0';
    Edit6.Enabled := false;
    BitBtn1.Enabled := false;
    self.BitBtn1.Enabled := false;
end;

procedure TFrmSelItemVendaRealizada.habilitar;
begin
    self.Combobox2.Enabled := true;
    self.Edit1.Enabled := true;
    self.Edit2.Enabled := true;
    self.CurrencyEdit1.Enabled := true;
end;


procedure TFrmSelItemVendaRealizada.MaiorCodigo;
var
    DM     : TDM;
    Ct     : Controle;
begin
    try
        Edit3.Clear;
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        self.Edit3.Text := IntToStr(Ct.MaxCodigoItemDeVenda + 1);
    except
        MessageDlg('Problema na Geração do Código do Item de Venda.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmSelItemVendaRealizada.Edit6Change(Sender: TObject);
begin
    if(self.Edit2.Text = 'PESO') then
    begin
        try
            StrToFloat(self.Edit6.Text);
        except
            MessageDlg('Valor Inválido.', mtWarning, [mbOk], 0);
            self.Edit6.Text := '0';
        end;
    end;
end;

procedure TFrmSelItemVendaRealizada.FormShow(Sender: TObject);
begin
    self.BitBtn3.Enabled := false;
    self.ClearBox;
    self.MaiorCodigo;
    self.ListarCatg;
end;

procedure TFrmSelItemVendaRealizada.ComboBox1Change(Sender: TObject);
begin
    self.ComboBox2.Clear;
    self.ListarProdPorCatg;
    self.ComboBox2.Enabled := true;
end;

procedure TFrmSelItemVendaRealizada.ComboBox2Change(Sender: TObject);
var
    Prod : Produto;
    DM   : TDM;
    Ct   : Controle;
    Estq : Estoque;
    var_teste : real;
begin
    try
        if (Combobox2.Text <> '') then
        begin
            self.CurrencyEdit2.Text := '';
            self.Edit6.Text := '0';
            self.habilitar;
            DM   := TDM.Create(NIL);
            Prod := Produto.Create(0,'',0,'','','');
            Estq := Estoque.Create(0,0,0,0,0,0);
            Ct   := Controle.Create(DM,Prod,Estq);

            Prod.setnomeProd(Combobox2.Text);
            Ct.BuscarProdPorNome;

            self.Edit8.Text := IntToStr(Estq.getcodEstq);
            self.Edit2.Text := Prod.gettipoMedProd;
            if (self.Edit2.Text = 'PESO') then
            begin
                DecimalSeparator := ',';
                self.Edit1.Text := FloatToStr(Estq.getqtdPesoEstqAtual);
            end
            else if (self.Edit2.Text = 'UNIDADE') then
            begin
                self.Edit1.Text := IntToStr(Estq.getqtdunitEstqAtual);
            end;
            DecimalSeparator := ',';
            self.CurrencyEdit1.Text := FloatToStr(Prod.getprecoProd);
            self.Edit7.Text := IntToStr(Prod.getcodProd);

            var_teste := StrToFloat(self.Edit1.Text);
            
            if(var_teste > 0) then
            begin
                self.CurrencyEdit2.Enabled := true;
                self.Edit6.Enabled := true;
                self.BitBtn3.Enabled := true;
            end
            else if(var_teste = 0) then
            begin
                MessageDlg('Produto com Estoque Zero.', mtInformation, [mbOk], 0);
                self.CurrencyEdit2.Enabled := false;
                self.Edit6.Enabled := false;
                self.BitBtn3.Enabled := false;
                self.BitBtn1.Enabled := false;
            end;
        end;
    except
        MessageDlg('Problema na Exibição dos dados do Produto selecionado.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmSelItemVendaRealizada.BitBtn1Click(Sender: TObject);
var
    DM     : TDM;
    ItVend : ItemDeVenda;
    Ct     : Controle;
    Vd     : Venda;
    Prod   : Produto;
    calcp  : real;
    patual : real;
    pnovo  : real;
    calcu  : integer;
    uatual : integer;
    unovo  : integer;
    Estq   : Estoque;
begin
    try
        if(Edit6.Text <> '') then
        begin
            //Efetuando a Inclusão dos Iténs de Venda por PESO ou UNIDADE do produto.
            DM := TDM.Create(NIL);
            Prod := Produto.Create(StrToInt(self.Edit7.Text),Combobox2.Text,0,'','','');
            Vd := Venda.Create(StrToInt(Edit4.Text),00/00/0000,0,'');
            Estq := Estoque.Create(0,0,0,0,0,0);
            ItVend := ItemDeVenda.Create(StrToInt(self.Edit3.Text),0,0,StrToFloat(self.CurrencyEdit2.Text));
            Ct := Controle.Create(DM,Vd,ItVend,Prod,Estq);

            //Verifica se o Valor para quantidade é maior que ZERO.
            if(StrToFloat(self.Edit6.Text) > 0) AND (StrToFloat(self.Edit6.Text) <= StrToFloat(self.Edit1.Text))  then
            begin
                //Verifica se produto já está na lista de iténs.
                if(Ct.VerifarProdNaLista = 1) then
                begin
                    if(self.Edit2.Text = 'PESO') then
                    begin
                        patual := StrToFloat(self.Edit1.Text);
                        pnovo  := StrToFloat(self.Edit6.Text);
                        calcp  := patual - pnovo;
                        DecimalSeparator := '.';
                        //Atribuindo o código do registro de estoque relacionado a Produto.
                        Estq.setcodestq(StrToInt(self.Edit8.Text));
                        //O Peso Antes de Adicionar como Item.
                        Estq.setqtdPesoEstqAntg(patual);
                        //O Peso depois da Adicionar como Item.
                        Estq.setqtdPesoEstqAtual(calcp);
                        //O Peso do Item de Venda.
                        ItVend.setqtdPesoItemVend(pnovo);
                    end
                    else if(self.Edit2.Text = 'UNIDADE') then
                    begin
                        uatual := StrToInt(self.Edit1.Text);
                        unovo  := StrToInt(self.Edit6.Text);
                        calcu  := uatual - unovo;
                        DecimalSeparator := '.';
                        //Atribuindo o código do registro de estoque relacionado a Produto.
                        Estq.setcodestq(StrToInt(self.Edit8.Text));
                        //O Peso Antes de Adicionar como Item.
                        Estq.setqtdUnitEstqAntg(uatual);
                        //O Peso depois da Adicionar como Item.
                        Estq.setqtdUnitEstqAtual(calcu);
                        //O Peso do Item de Venda.
                        ItVend.setqtdUnitItemVend(unovo);
                    end;
                    Ct.AlterarEstqVenda;
                    Ct.IncluirItemDeVenda;
                    FrmTelaVendaRealizada.CalcularVenda;
                    FrmTelaVendaRealizada.MostrarItens;
                    FrmTelavendaRealizada.BitBtn3.Enabled := true;
                    self.ClearBox;
                    self.Close;
                end
                else
                begin
                    MessageDlg('Produto já adicionado à lista.', mtInformation, [mbOk], 0);
                    self.ClearBox;
                    self.ListarCatg;
                end
            end
            else
            begin
               MessageDlg('Valor Inválido para quantidade.', mtWarning, [mbOk], 0);
               self.ClearBox;
               self.ListarCatg;
            end
       end
       else
          MessageDlg('Nenhum valor foi informado para quantidade.', mtWarning, [mbOk], 0);
    except
        MessageDlg('Problema na Inclusão do Item à lista.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmSelItemVendaRealizada.BitBtn3Click(Sender: TObject);
var
    valorpago : real;
    preco : real;
    qtd   : real;
    peso : real;
    var_teste : real;
begin
    var_teste := StrToFloat(Edit6.Text);
    if (Edit6.Text <> '') AND (var_teste > 0)  then
    begin
        try
            qtd := StrToFloat(self.Edit6.Text);
            preco := StrToFloat(self.CurrencyEdit1.Text);
            valorpago := (preco * qtd);
            self.CurrencyEdit2.Text := FloatToStr(valorpago);
            self.BitBtn1.Enabled := true;
        except
            on E: EConvertError do
            begin
               MessageDlg('Valor Inválido para quantidade Venda.', mtError, [mbOk], 0);
               Edit6.Clear;
            end;
        end;
    end
    else
    begin
       MessageDlg('Valor Inválido para quantidade Venda.', mtError, [mbOk], 0);
       Edit6.Clear;
    end;
end;


end.
