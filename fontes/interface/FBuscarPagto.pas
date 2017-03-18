unit FBuscarPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus, Buttons, FTelaPagtoEfetuado, CCliente,
  cDataModule, cControle, cPagamento, cVenda;

type
  TFrmBuscarPagto = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Editar1: TMenuItem;
    Limpar1: TMenuItem;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    DateTimePicker2: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure MostrarListaPagtos;
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
  private
     { Private declarations }
  public
      PodeFechar : Boolean;
     { Public declarations }
  end;

var
  FrmBuscarPagto: TFrmBuscarPagto;

implementation

{$R *.dfm}

procedure TFrmBuscarPagto.BitBtn1Click(Sender: TObject);
begin
    self.MostrarListaPagtos;
end;


procedure TFrmBuscarPagto.MostrarListaPagtos;
var
    Cli : Cliente;
    DM  : TDM;
    Ct  : Controle;
    Pg  : Pagamento;
    Vd  : Venda;
begin
    try
        DM := TDM.Create(NIL);
        Cli := Cliente.Create(StrToInt(self.Edit1.Text),'','','','','','','');
        Pg := Pagamento.Create(0,0,'',00/00/0000,'');
        Vd := Venda.Create(0,00/00/0000,0,'');
        Ct := Controle.Create(DM,Vd,Cli,Pg);
        Ct.BuscarPagtoRealizadoPorCodCli(self.DateTimePicker1.Date,self.DateTimePicker2.Date);

        if(Cli.getCodCli <> -1) then
        begin
            FrmTelaPagtoEfetuado.Edit1.Text := IntToStr(Cli.getCodCli);
            FrmTelaPagtoEfetuado.Edit2.Text := Cli.getnomeCli;
            DM.DS1.DataSet := DM.ZQuery1;
            FrmTelaPagtoEfetuado.DBGrid1.DataSource := DM.DS1;
            FrmTelaPagtoEfetuado.DBGrid1.Columns[0].FieldName := 'codPag';
            FrmTelaPagtoEfetuado.DBGrid1.Columns[1].FieldName := 'valorPagto';
            FrmTelaPagtoEfetuado.DBGrid1.Columns[2].FieldName := 'dataPag';
            FrmTelaPagtoEfetuado.DBGrid1.Columns[3].FieldName := 'codVenda';
            FrmTelaPagtoEfetuado.DBGrid1.Columns[4].FieldName := 'valTotVenda';
            FrmTelaPagtoEfetuado.DBGrid1.Columns[5].FieldName := 'dataVenda';
            self.Visible := false;
            FrmTelaPagtoEfetuado.ShowModal;
        end
        else
        begin
            MessageDlg('Nenhum Pagamento foi encontrado mediante o critério de busca.', mtInformation, [mbOk], 0);
            self.Edit1.Text := '0';
            self.DateTimePicker2.Date := Date;
        end;
    except
        MessageDlg('Problema na listagem dos pagamentos.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmBuscarPagto.Edit1Change(Sender: TObject);
begin
    try
        StrToInt(self.Edit1.Text);
    except
        MessageDlg('Valor Inválido para código.', mtWarning, [mbOk], 0);
        self.Edit1.Text := '0';
    end;
end;

procedure TFrmBuscarPagto.FormShow(Sender: TObject);
begin
    self.PodeFechar := false;
    self.Edit1.Text := '0';
end;

procedure TFrmBuscarPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    self.Edit1.Text := '0';
end;

procedure TFrmBuscarPagto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

procedure TFrmBuscarPagto.BitBtn2Click(Sender: TObject);
begin
    self.PodeFechar := true;
    self.Close;
end;

end.
