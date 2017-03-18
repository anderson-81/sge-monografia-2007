unit FTelaPagtoEfetuado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Menus, StdCtrls, Buttons, cCliente, cDataModule, cControle, cPagamento,
  cVenda, cPagamentoCartao, cPagamentoComCheque;

type
  TFrmTelaPagtoEfetuado = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
  private
    PodeFechar : Boolean;  
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaPagtoEfetuado: TFrmTelaPagtoEfetuado;

implementation

{$R *.dfm}

uses
    FBuscarPagto, FControlarPagto;

procedure TFrmTelaPagtoEfetuado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmBuscarPagto.PodeFechar := true;
    FrmBuscarPagto.Close;
end;

procedure TFrmTelaPagtoEfetuado.BitBtn1Click(Sender: TObject);
var
    Cli    : Cliente;
    DM     : TDM;
    Ct     : Controle;
    Vd     : Venda;
    PgCheq : PagamentoComCheque;
    PgCart : PagamentoCartao;
    Pg     : Pagamento;
begin
    try
        if(self.Edit3.Text <> '') AND (self.Edit4.Text <> '')then
        begin
            //Inicialização dos Objetos
            DM := TDM.Create(NIL);
            Pg := Pagamento.Create(StrToInt(self.Edit3.Text),0,'',00/00/0000,'');
            Cli := Cliente.Create(StrToInt(self.Edit1.Text),'','','','','','','');
            PgCheq := PagamentoComCheque.Create(0,0,'',00/00/0000,'',0,0,0,'');
            PgCart := PagamentoCartao.Create(0,0,'',00/00/0000,'',0,00/00/0000,'');
            Vd := Venda.Create(0,00/00/0000,0,'');
            Ct := Controle.Create(DM,Cli,Pg,PgCheq,PgCart,Vd);

            //Buscando dados sobre Rregistro de Pagamento.
            Ct.BuscarDadosPagtoPorCodPag;

            //Habilitando Componentes
            FrmControlarPagto.CurrencyEdit1.Enabled := true;
            FrmControlarPagto.CurrencyEdit3.Enabled := true;
            FrmControlarPagto.BitBtn3.Visible := true;
            FrmControlarPagto.BitBtn1.Visible := true;
            
            //Atribuindo Dados sobre Cliente
            FrmControlarPagto.Edit1.Text := IntToStr(Cli.getCodCli);
            FrmControlarPagto.Edit2.Text := Cli.getnomeCli;

            //Atribuindo Dados sobre Venda
            FrmControlarPagto.DateTimePicker1.DateTime := Vd.getdataVenda;
            DecimalSeparator := ',';
            FrmControlarPagto.CurrencyEdit1.Text := FloatToStr(Vd.getValTotVenda);
            DecimalSeparator := ',';

            //Atribuindo Dados sobre Pagamento
            FrmControlarPagto.CurrencyEdit3.Text := FloatToStr(Pg.getvalpag);
            FrmControlarPagto.DateTimePicker2.DateTime := Pg.getdataPag;
            FrmControlarPagto.Edit5.Text := Pg.getTipoPag;
            FrmControlarPagto.Edit8.Text := IntToStr(Pg.getcodPag);
            FrmControlarPagto.Edit9.Text := FrmTelaPagtoEfetuado.Edit4.Text;

            //Atribuindo Dados sobre as Formas de Pagamento
            if(Pg.getTipoPag = 'CH') then
            begin
                Ct.BuscarDadosPagtoCheque;
                FrmControlarPagto.GroupBox6.Visible := true;
                FrmControlarPagto.GroupBox7.Visible := false;
                FrmControlarPagto.GroupBox5.Visible := false;
                FrmControlarPagto.MaskEdit1.Text := IntToStr(PgCheq.getnumCheq);
                FrmControlarPagto.MaskEdit2.Text := IntToStr(PgCheq.getcontaCheq);
                FrmControlarPagto.MaskEdit3.Text := IntToStr(PgCheq.getagenciaCheq);
                FrmControlarPagto.Edit6.Text := PgCheq.getbancoCheq;
            end
            else if(Pg.getTipoPag = 'CT') then
            begin
                Ct.BuscarDadosPagtoCartao;
                FrmControlarPagto.GroupBox6.Visible := false;
                FrmControlarPagto.GroupBox7.Visible := true;
                FrmControlarPagto.GroupBox5.Visible := false;
            end
            else
            begin
                FrmControlarPagto.GroupBox6.Visible := false;
                FrmControlarPagto.GroupBox7.Visible := false;
                FrmControlarPagto.GroupBox5.Visible := true;
            end;
            FrmControlarPagto.BitBtn1.Enabled := true;
            self.PodeFechar := true;
            self.Close;
        end
        else
        begin
            MessageDlg('Nenhum Pagamento foi Selecionado.', mtWarning, [mbOk], 0);
        end;
    except
        MessageDlg('Problema na Atribuição dos dados do Pagamento selecionado', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaPagtoEfetuado.DBGrid1ColEnter(Sender: TObject);
begin
    try
        self.BitBtn1.Enabled := true;
        FrmTelaPagtoEfetuado.Edit3.Text := DBGrid1.DataSource.DataSet.FieldByName('codPag').AsString;
        FrmTelaPagtoEfetuado.Edit4.Text := DBGrid1.DataSource.DataSet.FieldByName('codVenda').AsString;
    except
         MessageDlg('Problema na Seleção de Pagamento.', mtError, [mbOk], 0);
    end;
end;

procedure TFrmTelaPagtoEfetuado.FormShow(Sender: TObject);
begin
    DecimalSeparator := ',';
    self.PodeFechar := false;
end;

procedure TFrmTelaPagtoEfetuado.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

procedure TFrmTelaPagtoEfetuado.BitBtn2Click(Sender: TObject);
begin
    self.PodeFechar := true;
    self.Close;
end;

end.
