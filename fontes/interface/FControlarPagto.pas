unit FControlarPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ComCtrls, Mask, rxToolEdit, rxCurrEdit,
  FListItensDeVendaPagto, FBuscarPagto, cVenda, cPagamento, cControle, cDataModule,
  cPagamentoCartao, cPagamentoComCheque, FEfetuarLoginCancelarPagto;

type
  TFrmControlarPagto = class(TForm)
    Label3: TLabel;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox3: TGroupBox;
    CurrencyEdit1: TCurrencyEdit;
    Label9: TLabel;
    Label4: TLabel;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label12: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    GroupBox5: TGroupBox;
    GroupBox7: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    MaskEdit7: TMaskEdit;
    Label13: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    procedure IniciarControle;
    procedure Limpar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    Procedure MostrarItensDeVenda;
    Procedure SomarValorTotal;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure CurrencyEdit3Enter(Sender: TObject);
    procedure MaskEdit7Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControlarPagto: TFrmControlarPagto;

implementation

{$R *.dfm}



procedure TFrmControlarPagto.IniciarControle;
begin
    self.CurrencyEdit1.Enabled := false;
    self.CurrencyEdit3.Enabled := false;
    self.BitBtn1.Enabled := false;
    self.BitBtn3.Enabled := false;
    self.Edit1.Clear;
    self.Edit2.Clear;
    self.Edit5.Clear;
    self.MaskEdit1.Clear;
    self.MaskEdit1.Clear;
    self.GroupBox5.Visible := true;
    self.GroupBox6.Visible := false;
    self.GroupBox7.Visible := false;
    self.CurrencyEdit1.Clear;
    self.CurrencyEdit3.Clear;
end;

procedure TFrmControlarPagto.Limpar1Click(Sender: TObject);
begin
    self.IniciarControle;
end;

procedure TFrmControlarPagto.FormShow(Sender: TObject);
begin
    self.IniciarControle;
end;

procedure TFrmControlarPagto.BitBtn2Click(Sender: TObject);
begin
    FrmBuscarPagto.ShowModal;
end;

Procedure TFrmControlarPagto.MostrarItensDeVenda;
var
    Pg  : Pagamento;
    DM  : TDM;
    Ct  : Controle;
begin
    try
        DM := TDM.Create(NIL);
        Pg := Pagamento.Create(0,0,'',00/00/0000,'');
        Ct := Controle.Create(DM,Pg);
        Pg.setcodPag(StrToInt(self.Edit8.Text));
        Ct.ListarItensDeVendaPorCodPagto;
        DM.DS1.DataSet := DM.ZQuery1;
        FrmListItensDeVendaPagto.DBGrid1.DataSource := DM.DS1;
        DecimalSeparator := ',';
        FrmListItensDeVendaPagto.DBGrid1.Columns[0].FieldName := 'codProd';
        FrmListItensDeVendaPagto.DBGrid1.Columns[1].FieldName := 'nomeProd';
        FrmListItensDeVendaPagto.DBGrid1.Columns[2].FieldName := 'qtdPesoVend';
        FrmListItensDeVendaPagto.DBGrid1.Columns[3].FieldName := 'qtdUnitVend';
        FrmListItensDeVendaPagto.DBGrid1.Columns[4].FieldName := 'valTotVenda';
    except
         MessageDlg('Problema na Listagem dos Iténs de Venda.', mtError, [mbOk], 0);
    end;
end;


Procedure TFrmControlarPagto.SomarValorTotal;
var
    DM : TDM;
    Ct : Controle;
    Pg : Pagamento;
begin
    try
        DM := TDM.Create(NIL);
        Pg := Pagamento.Create(StrToInt(self.Edit8.Text),0,'',00/00/0000,'');
        Ct := Controle.Create(DM,Pg);
        Ct.SomaValPagoItemDeVendaPorCodPag;
        FrmListItensDeVendaPagto.CurrencyEdit1.Text := DM.ZQuery1.FieldByName('SUM(valpag)').AsString;
    except
        MessageDlg('Problema no Cálculo do Valor Total dos Iténs de Venda.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmControlarPagto.BitBtn3Click(Sender: TObject);
begin
    FrmListItensDeVendaPagto.ShowModal;
    self.MostrarItensDeVenda;
    self.SomarValorTotal;
end;

procedure TFrmControlarPagto.BitBtn1Click(Sender: TObject);
begin
    FrmEfetuarLoginCancelarPagto.Edit2.Text := self.Edit8.Text;    //Código de Pagamento;
    FrmEfetuarLoginCancelarPagto.Edit3.Text := self.Edit9.Text;    //Código de Venda;
    FrmEfetuarLoginCancelarPagto.CurrencyEdit1.Text := self.CurrencyEdit1.Text;  //Passa o Valor da Venda;
    FrmEfetuarLoginCancelarPagto.ShowModal;
end;

procedure TFrmControlarPagto.Edit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmControlarPagto.Edit2Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmControlarPagto.Edit5Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmControlarPagto.CurrencyEdit1Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmControlarPagto.CurrencyEdit3Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

procedure TFrmControlarPagto.MaskEdit7Enter(Sender: TObject);
begin
    self.BitBtn2.SetFocus;
end;

end.
