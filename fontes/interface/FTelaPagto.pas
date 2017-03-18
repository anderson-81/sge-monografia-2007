unit FTelaPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, rxToolEdit, rxCurrEdit, StdCtrls, Buttons, Grids, DBGrids,
  ComCtrls, FListItensVenda, cDataModule, cControle, FTaxaPagto,
  cPagamentoCartao, cPagamentoComCheque, cPagamento, cVenda;

type
  TFrmTelaPagto = class(TForm)
    Venda: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    GroupBox5: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    BitBtn2: TBitBtn;
    GroupBox6: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit8: TEdit;
    ComboBox2: TComboBox;
    GroupBox7: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure DateTimePicker1Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure CurrencyEdit2Enter(Sender: TObject);
  private
    PodeFechar : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaPagto: TFrmTelaPagto;
  DM : TDM;

implementation

{$R *.dfm}


uses
    FRealizarPagamento,
    FPrincipal;

procedure TFrmTelaPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmPrincipal.Enabled := true;
    FrmRealizarPagamento.Close;
end;

procedure TFrmTelaPagto.RadioButton3Click(Sender: TObject);
begin
    self.GroupBox6.Visible := false;
    self.GroupBox2.Visible := false;
end;

procedure TFrmTelaPagto.RadioButton4Click(Sender: TObject);
begin
    self.GroupBox6.Visible := true;
    self.GroupBox2.Visible := false;
    self.Edit5.Text := '0';
    self.Edit6.Text := '0';
    self.Edit7.Text := '0';
end;

procedure TFrmTelaPagto.BitBtn4Click(Sender: TObject);
begin
    if MessageDlg('Deseja cancelar a Realização do Pagamento?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        self.PodeFechar := true;
        self.Close;
    end;
end;

procedure TFrmTelaPagto.BitBtn2Click(Sender: TObject);
begin
    FrmListItensVenda.ShowModal;
end;

procedure TFrmTelaPagto.BitBtn3Click(Sender: TObject);
var
    DM       : TDM;
    Ct       : Controle;
    PgCart   : PagamentoCartao;
    PgCheq   : PagamentoComCheque;
    Pg       : Pagamento;
    tipopag  : string;
    valpagto : real;
begin
    if (RadioButton3.Checked = true) then
    begin
        try
            tipopag := 'DN';
            DM := TDM.Create(NIL);
            valpagto := StrToFloat(self.CurrencyEdit2.Text);
            DecimalSeparator := '.';
            Pg := Pagamento.Create(StrToInt(self.Edit4.Text),valpagto,'PG',NOW,tipoPag);
            Ct := Controle.Create(DM,Pg);
            Ct.AlterarRegPagto(DM);
            Ct.FecharVenda(StrToInt(self.Edit3.Text), DM);
            MessageDlg('Pagamento realizado com sucesso.', mtInformation, [mbOk], 0);
            self.PodeFechar := true;
            self.Close;
        except
            MessageDlg('Problema no Pagamento.', mtError, [mbOk], 0);
        end;
    end

    else if (RadioButton4.Checked = true) then
    begin
        try
            if (FrmTelaPagto.Edit5.Text <> '') AND (FrmTelaPagto.Edit6.Text <> '') AND (FrmTelaPagto.Edit7.Text <> '') AND (FrmTelaPagto.ComboBox1.text <> '') then
            begin
                tipopag := 'CH';
                DM := TDM.Create(NIL);
                valpagto := StrToFloat(self.CurrencyEdit2.Text);
                DecimalSeparator := '.';
                Pg := Pagamento.Create(StrToInt(self.Edit4.Text),valpagto,'PG',NOW,tipoPag);
                PgCheq := PagamentoComCheque.Create(0,0,'',00/00/0000,'',StrToInt(self.Edit5.Text),StrToInt(self.Edit6.Text),StrToInt(self.Edit7.Text),self.ComboBox1.Text);
                Ct := Controle.Create(DM,PgCheq,Pg);
                Ct.AlterarRegPagto(DM);
                Ct.IncluirCheque(DM);
                Ct.FecharVenda(StrToInt(self.Edit3.Text), DM);
                MessageDlg('Pagamento com Cheque realizado com sucesso.', mtInformation, [mbOk], 0);
                self.PodeFechar := true;
                self.Close;
            end
            else
            begin
                MessageDlg('Dados sobre Cheque Incompletos.', mtWarning, [mbOk], 0);
            end;
        except
            MessageDlg('Problema no Pagamento com Cheque.', mtError, [mbOk], 0);
        end;
    end

    else if (RadioButton5.Checked = true) then
    begin
        try
            if (self.Edit8.Text <> '') AND (self.Combobox2.Text <> '') then
            begin
                tipopag := 'CT';
                DM := TDM.Create(NIL);
                valpagto := StrToFloat(self.CurrencyEdit2.Text);
                DecimalSeparator := '.';
                Pg := Pagamento.Create(StrToInt(self.Edit4.Text),valpagto,'PG',NOW,tipoPag);
                PgCart := PagamentoCartao.Create(0,0,'',00/00/0000,'',StrToInt(self.Edit8.Text),self.DateTimePicker1.Date,self.ComboBox2.Text);
                Ct := Controle.Create(DM,PgCart,Pg);
                Ct.AlterarRegPagto(DM);
                Ct.IncluirCartao(DM);
                Ct.FecharVenda(StrToInt(self.Edit3.Text), DM);
                MessageDlg('Pagamento com Cartão realizado com sucesso.', mtInformation, [mbOk], 0);
                self.PodeFechar := true;
                self.Close;
            end
            else
               MessageDlg('Dados sobre Cartão de Crédito Incompletos.', mtWarning, [mbOk], 0);
        except
            MessageDlg('Problema no Pagamento com Cheque.', mtError, [mbOk], 0);
        end
    end;
end;

procedure TFrmTelaPagto.BitBtn1Click(Sender: TObject);
begin
    FrmTaxaPagto.CurrencyEdit1.Text := FrmTelaPagto.CurrencyEdit2.Text;
    FrmTaxaPagto.ShowModal;
end;

procedure TFrmTelaPagto.RadioButton5Click(Sender: TObject);
var
    DM : TDM;
    Ct : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Ct := Controle.Create(DM);
        self.Edit8.Text := IntToStr(Ct.MaxCodCartao + 1);
    except
        MessageDlg('Problema na geração do código de Cartão de Crédito', mtError, [mbOk], 0);
    end;
    self.GroupBox2.Visible := true;
    self.GroupBox6.Visible := false;
end;

procedure TFrmTelaPagto.DateTimePicker1Click(Sender: TObject);
begin
    if(self.DateTimePicker1.Date > DATE) then
       MessageDlg('Data Inválida para o Vencimento', mtError, [mbOk], 0);
end;

procedure TFrmTelaPagto.Edit5Change(Sender: TObject);
begin
    try
        StrToInt(self.Edit5.Text);
    except
        MessageDlg('Valor Inválido.', mtWarning, [mbOk], 0);
        self.Edit5.Text := '0';
    end;
end;

procedure TFrmTelaPagto.Edit6Change(Sender: TObject);
begin
    try
        StrToInt(self.Edit6.Text);
    except
        MessageDlg('Valor Inválido.', mtWarning, [mbOk], 0);
        self.Edit6.Text := '0';
    end;
end;

procedure TFrmTelaPagto.Edit7Change(Sender: TObject);
begin
    try
        StrToInt(self.Edit7.Text);
    except
        MessageDlg('Valor Inválido.', mtWarning, [mbOk], 0);
        self.Edit7.Text := '0';
    end;
end;

procedure TFrmTelaPagto.DateTimePicker1Change(Sender: TObject);
begin
    if(self.DateTimePicker1.Date < NOW) then
    begin
        MessageDlg('Data de Vencimento Inválida.', mtWarning, [mbOk], 0);
    end;
end;

procedure TFrmTelaPagto.FormShow(Sender: TObject);
begin
    self.PodeFechar := false;
    DecimalSeparator := ',';
end;

procedure TFrmTelaPagto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

procedure TFrmTelaPagto.Edit1Enter(Sender: TObject);
begin
    self.BitBtn3.SetFocus;
end;

procedure TFrmTelaPagto.Edit2Enter(Sender: TObject);
begin
    self.BitBtn3.SetFocus;
end;

procedure TFrmTelaPagto.CurrencyEdit2Enter(Sender: TObject);
begin
    self.BitBtn3.SetFocus;
end;

end.
