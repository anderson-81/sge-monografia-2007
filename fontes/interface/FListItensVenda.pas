unit FListItensVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit, cVenda, cControle,
  cDataModule;

type
  TFrmListItensVenda = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    Procedure ListarItens;
    procedure FormActivate(Sender: TObject);
    procedure SomatorioDeItens;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListItensVenda: TFrmListItensVenda;

implementation

{$R *.dfm}

uses
    FTelaPagto;

procedure TFrmListItensVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmListItensVenda.DBGrid1.DataSource.Destroy;
    FrmTelaPagto.Enabled := true;
end;

procedure TFrmListItensVenda.BitBtn2Click(Sender: TObject);
begin
    FrmListItensVenda.Close;
end;

Procedure TFrmListItensVenda.ListarItens;
var
    DM : TDM;
    Ct : Controle;
    Vd : Venda;
begin
    try
        DM := TDM.Create(NIL);
        Vd := Venda.Create(0,00/00/0000,0,'');
        Ct := Controle.Create(DM,Vd);
        Vd.setcodVenda(StrToInt(FrmTelaPagto.Edit3.Text));
        DM.DS1.DataSet := DM.ZQuery1;
        FrmListItensVenda.DBGrid1.DataSource := DM.DS1;
        Ct.ListarItensPorCodVenda;
        FrmListItensVenda.DBGrid1.Columns[0].FieldName := 'codProd';
        FrmListItensVenda.DBGrid1.Columns[1].FieldName := 'nomeProd';
        FrmListItensVenda.DBGrid1.Columns[2].FieldName := 'qtdpesoVend';
        FrmListItensVenda.DBGrid1.Columns[3].FieldName := 'qtdunitVend';
        FrmListItensVenda.DBGrid1.Columns[4].FieldName := 'valpag';
    except
        MessageDlg('Problema na Listagem dos Iténs de Venda.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmListItensVenda.FormActivate(Sender: TObject);
begin
    self.ListarItens;
    self.SomatorioDeItens;
end;

procedure TFrmListItensVenda.SomatorioDeItens;
var
    DM : TDM;
    Ct : Controle;
    Vd : Venda;
begin
    try
        DM := TDM.Create(NIL);
        Vd := Venda.Create(0,00/00/0000,0,'');
        Ct := Controle.Create(DM,Vd);
        Vd.setcodVenda(StrToInt(FrmTelaPagto.Edit3.Text));
        Ct.SomaValPagoItemDeVenda;
        self.CurrencyEdit1.Text := FloatToStr(DM.ZQuery1.FieldByName('sum(valpag)').AsFloat);
    except
        MessageDlg('Problema na Exibição do Somatório Valores Pagos.', mtError, [mbOk], 0);
    end;
end;

end.
