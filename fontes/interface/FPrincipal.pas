unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ImgList, ExtCtrls, FManterFuncionario,
  FManterUsuario, jpeg, FManterCliente, FEfetuarLogin, StdCtrls,
  FManterTelefone, FRealizarVenda, FRealizarCompra, FRealizarPagamento,
  FControlarVenda, FControlarCompra, FControlarPagto, FManterEstq, FManterForn, FControlarEstq,
  RXShell, FSobre;

type
  TFrmPrincipal = class(TForm)
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Ajuda1: TMenuItem;
    Sair: TMenuItem;
    Cliente: TMenuItem;
    Telefone: TMenuItem;
    Produto: TMenuItem;
    Fornecedor: TMenuItem;
    StatusBar1: TStatusBar;
    Image1: TImage;
    Movimento1: TMenuItem;
    Venda: TMenuItem;
    Venda4: TMenuItem;
    Compra: TMenuItem;
    Pagamento: TMenuItem;
    Funcionario: TMenuItem;
    Usurio1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Controle1: TMenuItem;
    ControlarVenda1: TMenuItem;
    ControlarPagamento1: TMenuItem;
    N1: TMenuItem;
    ControlarPedidodeCompra1: TMenuItem;
    Estoque1: TMenuItem;
    N2: TMenuItem;
    ControlarEstoque1: TMenuItem;
    RxTrayIcon1: TRxTrayIcon;
    Sobre1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Fechar1: TMenuItem;
    procedure ClienteClick(Sender: TObject);
    procedure FuncionarioClick(Sender: TObject);
    procedure TelefoneClick(Sender: TObject);
    procedure FornecedorClick(Sender: TObject);
    procedure ProdutoClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure VendaClick(Sender: TObject);
    procedure CompraClick(Sender: TObject);
    procedure PagamentoClick(Sender: TObject);
    procedure ControlarVenda1Click(Sender: TObject);
    procedure ControlarPedidodeCompra1Click(Sender: TObject);
    procedure ControlarPagamento1Click(Sender: TObject);
    procedure Estoque1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ControlarEstoque1Click(Sender: TObject);
    procedure RxTrayIcon1DblClick(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
    FrmPrincipal: TFrmPrincipal;
    H : THandle;

implementation

uses FManterProduto, FConsultarPreco;

{$R *.dfm}

procedure TFrmPrincipal.ClienteClick(Sender: TObject);
begin
     FrmManterCliente.ShowModal;
end;

procedure TFrmPrincipal.FuncionarioClick(Sender: TObject);
begin
    FrmManterFuncionario.ShowModal;
end;

procedure TFrmPrincipal.TelefoneClick(Sender: TObject);
begin
    FrmManterTelefone.ShowModal;
end;

procedure TFrmPrincipal.FornecedorClick(Sender: TObject);
begin
    FrmManterForn.ShowModal;
end;

procedure TFrmPrincipal.ProdutoClick(Sender: TObject);
begin
    FrmManterProduto.ShowModal;
end;

procedure TFrmPrincipal.ToolButton3Click(Sender: TObject);
begin
    FrmConsultarPreco.ShowModal;
end;

procedure TFrmPrincipal.ToolButton2Click(Sender: TObject);
begin
    FrmManterCliente.ShowModal;
end;

procedure TFrmPrincipal.Usurio1Click(Sender: TObject);
begin
    FrmManterUsuario.ShowModal;
end;

procedure TFrmPrincipal.ToolButton1Click(Sender: TObject);
begin
    FrmRealizarVenda.ShowModal;
end;

procedure TFrmPrincipal.SairClick(Sender: TObject);
begin
    FrmPrincipal.Close;
    FrmEfetuarLogin.Close;
end;

procedure TFrmPrincipal.VendaClick(Sender: TObject);
begin
    FrmRealizarVenda.ShowModal;  
end;

procedure TFrmPrincipal.CompraClick(Sender: TObject);
begin
    FrmRealizarCompra.ShowModal;
end;

procedure TFrmPrincipal.PagamentoClick(Sender: TObject);
begin
    FrmRealizarPagamento.ShowModal;
end;

procedure TFrmPrincipal.ControlarVenda1Click(Sender: TObject);
begin
    FrmControlarVenda.ShowModal;
end;

procedure TFrmPrincipal.ControlarPedidodeCompra1Click(Sender: TObject);
begin
    FrmControlarCompra.ShowModal;
end;

procedure TFrmPrincipal.ControlarPagamento1Click(Sender: TObject);
begin
    FrmControlarPagto.ShowModal;
end;

procedure TFrmPrincipal.Estoque1Click(Sender: TObject);
begin
    FrmManterEstq.ShowModal;
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if CanClose then
    begin
        if MessageDlg('Deseja sair do Sistema?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
            CanClose := true;
            FrmEfetuarLogin.PodeFechar := true;
            FrmEfetuarLogin.FecharConexao;
            FrmEfetuarLogin.Close;
        end
        else
        begin
            self.Hide;
            self.RxTrayIcon1.Show; 
        end;
   end;
end;

procedure TFrmPrincipal.ControlarEstoque1Click(Sender: TObject);
begin
    FrmControlarEstq.ShowModal;
end;

procedure TFrmPrincipal.RxTrayIcon1DblClick(Sender: TObject);
begin
   self.Show;
   self.RxTrayIcon1.Hide;
end;

procedure TFrmPrincipal.Fechar1Click(Sender: TObject);
begin
    self.Close;
end;

procedure TFrmPrincipal.Sobre1Click(Sender: TObject);
begin
    FrmSobre.ShowModal;
end;

end.



