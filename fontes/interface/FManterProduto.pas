unit FManterProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls, ImgList, Buttons, cProduto, cControle,
  cDataModule, rxToolEdit, rxCurrEdit, Menus, FCategoria, cEstoque, FSelProd;

type
  TFrmManterProduto = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label6: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    ComboBox1: TComboBox;
    ImageList1: TImageList;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Editar1: TMenuItem;
    Categorias1: TMenuItem;
    Limpar1: TMenuItem;
    Sair1: TMenuItem;
    Label4: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    ListarProdutos1: TMenuItem;
    Limpar2: TMenuItem;
    Edit5: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ClearBox;
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Categorias1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Limpar2Click(Sender: TObject);
    procedure ListarProdutos1Click(Sender: TObject);
    Procedure AtribDadosProd;
    Procedure GerarCodProduto;
    Procedure GerarCodEstoque;
    procedure FormShow(Sender: TObject);
    procedure AtribuirNomeAntg;
    procedure Edit5Change(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManterProduto: TFrmManterProduto;
  //Variável Global Usadas para trabalhar com os botões de navegação.
  DM : TDM;
  pnome : string; //Para Guardar o nome antigo do produto para edição.


implementation

uses FPrincipal;

{$R *.dfm}

procedure TFrmManterProduto.BitBtn1Click(Sender: TObject);
var
    Prod : Produto;
    Ct   : Controle;
    Estq : Estoque;
    DM   : TDM;
    valor : real;
    peso  : real;
begin
    try
       if (Edit1.Text <> '') AND (Edit2.Text <> '') AND (CurrencyEdit1.Text <> '') AND (self.Edit5.Text <> '') AND (Combobox1.Text <> '') AND (Edit4.Text <> '') then
       begin
          DM := TDM.Create(NIL);
          if(RadioButton1.Checked = true) then
          begin
              Edit4.Text := 'PESO';
          end
          else if(RadioButton2.Checked = true) then
          begin
              Edit4.Text := 'UNIDADE';
          end;

          Prod := Produto.Create(StrToInt(self.Edit1.Text),self.Edit2.Text,0,self.Memo1.Text,self.Combobox1.Text, self.Edit4.Text);
          Estq := Estoque.Create(StrToInt(self.Edit1.Text),0,0,0,0,StrToInt(self.Edit5.Text));
          valor := StrToFloat(self.CurrencyEdit1.Text);
          DecimalSeparator := '.';
          Prod.setprecoProd(valor);
          Ct := Controle.Create(DM,Prod,Estq);

          if(Ct.VerifNomeExistenteProd = 1) then
          begin
              Ct.IncluirProd;
              MessageDlg('Inclusão efetuada com sucesso.', mtInformation	, [mbOk], 0);
              self.ClearBox;
              self.GerarCodProduto;
              self.GerarCodEstoque;
              DecimalSeparator := ',';
          end
          else
             MessageDlg('Não é permitido nome repetido para produtos no Sistema.', mtWarning	, [mbOk], 0);
       end
       else
       begin
           MessageDlg('Existem campos obrigatórios vazios para inclusão.', mtWarning	, [mbOk], 0);
       end;
    Except
        On EConvertError do
        begin
           MessageDlg('O Formulário possui valores inválidos.', mtWarning	, [mbOk], 0);
        end;
        else
           MessageDlg('Problema na inclusão do Produto.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterProduto.BitBtn2Click(Sender: TObject);
var
    Prod  : Produto;
    Ct    : Controle;
    DM    : TDM;
    Estq  : Estoque;
    valor : real;
begin
    try
       if (Edit1.Text <> '') AND (Edit2.Text <> '') AND (CurrencyEdit1.Text <> '') AND (self.Edit5.Text <> '') AND (Combobox1.Text <> '') AND (Edit4.Text <> '') then
       begin
           DM := TDM.Create(NIL);
           if(RadioButton1.Checked = true) then
           begin
               Edit4.Text := 'PESO';
           end
           else if(RadioButton2.Checked = true) then
           begin
               Edit4.Text := 'UNIDADE';
           end;

           Prod := Produto.Create(StrToInt(self.Edit1.Text),self.Edit2.Text,0,self.Memo1.Text,self.Combobox1.Text, self.Edit4.Text);
           Estq := Estoque.Create(StrToInt(self.Edit1.Text),0,0,0,0,StrToInt(self.Edit5.Text));
           valor := StrToFloat(self.CurrencyEdit1.Text);
           DecimalSeparator := '.';
           Prod.setprecoProd(valor);
           Ct := Controle.Create(DM,Prod,Estq);
           Ct.EditarProd;
           MessageDlg('Edição efetuada com sucesso.', mtInformation	, [mbOk], 0);
           DecimalSeparator := ',';
           self.BitBtn5.Enabled := false;
           self.BitBtn6.Enabled := false;
           self.BitBtn7.Enabled := false;
           self.BitBtn8.Enabled := false;
       end
       else
       begin
           MessageDlg('Existem campos obrigatórios vazios para edição.', mtWarning	, [mbOk], 0);
       end;
    Except
        On EConvertError do
        begin
           MessageDlg('O Formulário possui valores inválidos.', mtWarning	, [mbOk], 0);
        end;
        else
           MessageDlg('Problema na inclusão do Produto.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterProduto.BitBtn4Click(Sender: TObject);
var
    Prod : Produto;
    Ct   : Controle;
begin
    try
        Prod := Produto.Create(0,'',0,'','','');
        DM  := TDM.Create(NIL);
        Ct  := Controle.Create(DM,Prod);
        if Application.MessageBox('Deseja efetuar a exclusão?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
        begin
            Prod.setCodProd(StrToInt(Edit1.Text));
            if(Ct.VerifProdComItemVenda = 1) then
            begin
                if(Ct.VerifProdutoComItemPed = 1) then
                begin
                    Ct.ExcluirEstq;
                    Ct.ExcluirProd;
                end
                else
                begin
                    MessageDlg('Não foi possível excluir este Produto.', mtInformation, [mbOk], 0);
                    MessageDlg('Este Produto possui Registro de Item de Pedido Associado.', mtInformation, [mbOk], 0);
                end
            end
            else
            begin
                MessageDlg('Não foi possível excluir este Produto.', mtInformation, [mbOk], 0);
                MessageDlg('Este Produto possui Registro de Item de Venda Associado.', mtInformation, [mbOk], 0);
            end
        end;
    except
         MessageDlg('Problema na Exclusão.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterProduto.BitBtn3Click(Sender: TObject);
begin
    FrmSelProd.ShowModal;
end;

Procedure TFrmManterProduto.ClearBox;
begin
    self.Edit5.Text := '0';
    DecimalSeparator := ',';
    self.Edit1.Clear;
    self.Edit2.Clear;
    self.Edit3.Clear;
    self.CurrencyEdit1.Clear;
    self.Memo1.Clear;
    self.Combobox1.Clear;
    self.Combobox1.Items.Add('Crustáceos');
    self.Combobox1.Items.Add('Peixes');
    self.Memo1.Clear;
    self.RadioButton1.Checked := true;
    self.RadioButton2.Checked := false;
    self.RadioButton1.Enabled := true;
    self.RadioButton2.Enabled := true;
    self.Edit4.Text := 'PESO';
    self.BitBtn8.Enabled := false;
    self.BitBtn7.Enabled := false;
    self.BitBtn6.Enabled := false;
    self.BitBtn5.Enabled := false;
    self.BitBtn1.Enabled := true;
    self.BitBtn2.Enabled := false;
    self.BitBtn3.Enabled := true;
    self.BitBtn4.Enabled := false;
    self.Edit2.ReadOnly  := FALSE;
end;

procedure TFrmManterProduto.BitBtn8Click(Sender: TObject);
begin
    try
        DM.ZQuery1.First;
        self.AtribDadosProd;
        BitBtn8.Enabled := false;
        BitBtn7.Enabled := false;
        BitBtn6.Enabled := true;
        BitBtn5.Enabled := true;
    except
        MessageDlg('Problema na navegação por Produtos.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterProduto.BitBtn7Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Prior;
        self.AtribDadosProd;

        if (DM.ZQuery1.Bof) then
        begin
            BitBtn8.Enabled := false;
            BitBtn7.Enabled := false;
        end;

        BitBtn6.Enabled := true;
        BitBtn5.Enabled := true;
    except
        MessageDlg('Problema na navegação por Produtos.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterProduto.BitBtn6Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Next;
        self.AtribDadosProd;

        if (DM.ZQuery1.Eof) then
        begin
            BitBtn5.Enabled := false;
            BitBtn6.Enabled := false;
        end;

        BitBtn8.Enabled := true;
        BitBtn7.Enabled := true;
    except
        MessageDlg('Problema na navegação por Produtos.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterProduto.BitBtn5Click(Sender: TObject);
begin
    try
        DM.ZQuery1.Last;
        self.AtribDadosProd;
        BitBtn5.Enabled := false;
        BitBtn6.Enabled := false;
        BitBtn8.Enabled := true;
        BitBtn7.Enabled := true;
    except
        MessageDlg('Problema na navegação por Produtos.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmManterProduto.Sair1Click(Sender: TObject);
begin
    FrmManterProduto.Close;
end;

procedure TFrmManterProduto.Categorias1Click(Sender: TObject);
begin
    FrmCategoria.Show;
    FrmManterProduto.Enabled := false;
end;

procedure TFrmManterProduto.RadioButton1Click(Sender: TObject);
begin
    Edit4.Text := 'PESO';
    self.Edit5.Text := '0';
end;

procedure TFrmManterProduto.RadioButton2Click(Sender: TObject);
begin
     Edit4.Text := 'UNIDADE';
     self.Edit5.Text := '0';
end;

procedure TFrmManterProduto.Limpar2Click(Sender: TObject);
begin
    self.ClearBox;
    self.GerarCodProduto;
    self.GerarCodEstoque;
end;

procedure TFrmManterProduto.ListarProdutos1Click(Sender: TObject);
var
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.ListarTodosProd;
        self.AtribDadosProd;
        BitBtn8.Enabled := false;
        BitBtn7.Enabled := false;
        BitBtn6.Enabled := true;
        BitBtn5.Enabled := true;
    except
        MessageDlg('Problema na Listagem dos Valores.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmManterProduto.AtribDadosProd;
begin
    try
        FrmManterProduto.Edit1.Text := IntToStr(DM.ZQuery1.FieldByName('codProd').AsInteger);
        FrmManterProduto.Edit2.Text := DM.ZQuery1.FieldByName('nomeProd').AsString;
        FrmManterProduto.ComboBox1.Clear;
        FrmManterProduto.Combobox1.Items.Add('Crustáceos');
        FrmManterProduto.Combobox1.Items.Add('Peixes');
        FrmManterProduto.Combobox1.Text := DM.ZQuery1.FieldByName('catProd').AsString;

        FrmManterProduto.Edit4.Text := DM.ZQuery1.FieldByName('tipomedProd').AsString;
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

        self.Edit5.Text := IntToStr(DM.ZQuery1.FieldByName('qtdminEstq').AsInteger);
        FrmManterProduto.CurrencyEdit1.Text := FloatToStr(DM.ZQuery1.FieldByName('precoProd').AsFloat);
        FrmManterProduto.Memo1.Text := DM.ZQuery1.FieldByName('descProd').AsString;
        FrmManterProduto.Edit3.Text := IntToStr(DM.ZQuery1.FieldByName('codEstq').AsInteger);
        FrmManterProduto.BitBtn4.Enabled := true;
        FrmManterProduto.BitBtn3.Enabled := true;
        FrmManterProduto.BitBtn2.Enabled := true;
        FrmManterProduto.BitBtn1.Enabled := false;
    Except
        MessageDlg('Problema na Atribuição dos Valores.', mtError, [mbOk], 0);
    end;
end;

Procedure TFrmManterProduto.GerarCodProduto;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.RetMaxCodProd;
        self.Edit1.Text := IntToStr(DM.ZQuery1.FieldByName('MAX(codProd)').AsInteger + 1);
    except
        MessageDlg('Problema na Geração do código de Produto.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmManterProduto.GerarCodEstoque;
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        Ct.RetMaxCodEstq;
        self.Edit3.Text := IntToStr(DM.ZQuery1.FieldByName('MAX(codEstq)').AsInteger + 1);
    except
        MessageDlg('Problema na Geração do código de Estoque.', mtError, [mbOk], 0);
    end;
end;



procedure TFrmManterProduto.FormShow(Sender: TObject);
begin
    self.Edit2.SetFocus;
    self.Edit5.Text := '0';
    self.ClearBox;
    self.GerarCodProduto;
    self.GerarCodEstoque;
    DecimalSeparator := ',';
end;

procedure TFrmManterProduto.AtribuirNomeAntg;
begin
    pnome := FrmManterProduto.Edit2.Text;
end;

procedure TFrmManterProduto.Edit5Change(Sender: TObject);
begin
     try
        StrToInt(self.Edit5.Text);
     except
          begin
              MessageDlg('Quantidade Inválida.', mtWarning, [mbOk], 0);
              self.Edit5.Text := '0';
          end;
     end;
end;

procedure TFrmManterProduto.Edit1Enter(Sender: TObject);
begin
    self.Edit2.SetFocus;
end;

procedure TFrmManterProduto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if Application.MessageBox('Deseja terminar a manutenção de Produto?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes then
    begin
        canClose := true;
    end
    else
       canClose := false;
end;

end.
