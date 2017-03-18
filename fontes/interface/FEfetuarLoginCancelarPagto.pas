unit FEfetuarLoginCancelarPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, cControle, cPagamento, cDataModule,
  cUsuario, cFuncionario, cVenda, ComCtrls, rxToolEdit, rxCurrEdit;

type
  TFrmEfetuarLoginCancelarPagto = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    GroupBox2: TGroupBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure ClearBox;
  private
    PodeFechar : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEfetuarLoginCancelarPagto: TFrmEfetuarLoginCancelarPagto;

implementation

{$R *.dfm}

uses
    FControlarPagto;

procedure TFrmEfetuarLoginCancelarPagto.BitBtn1Click(Sender: TObject);
var
    Pg    : Pagamento;
    Ct    : Controle;
    DM    : TDM;
    Usu   : Usuario;
    res   : Integer;
    cargo : String;
    Func  : Funcionario;
    Vd    : Venda;
    valor : real;
begin
    try
          valor := StrToFloat(self.CurrencyEdit1.Text);
          DecimalSeparator := '.';
          DM   := TDM.Create(NIL);
          Usu  := Usuario.Create(0,self.Edit1.Text,self.MaskEdit1.Text,self.ComboBox1.Text,'');
          Func := Funcionario.Create;
          Vd   := Venda.Create(StrToInt(self.Edit3.Text),NOW,valor,'A');
          Pg   := Pagamento.Create(StrToInt(self.Edit2.Text),0,'NP',NOW,'');
          Ct   := Controle.Create(DM,Pg,Func,Usu,Vd);

          //Efetuando Login.
          res := Ct.EfetuarLogin;
          if (res = 1) then
          begin
              if (Usu.getStatusUsu <> 'Inativo') then
              begin
                  cargo := Usu.getnivelUsu;
                  if(cargo = 'Gerente') then
                  begin
                      Ct.AlterarRegVenda(DM);
                      Ct.AlterarRegPagto(DM);
                      if(FrmControlarPagto.Edit5.Text = 'CH') then
                      begin
                          Ct.ExcluirCheque;
                      end
                      else if(FrmControlarPagto.Edit5.Text = 'CT') then
                      begin
                          Ct.ExcluirCartao;
                      end;
                      MessageDlg('Pagamento Cancelado com sucesso.', mtInformation, [mbOk], 0);
                      FrmControlarPagto.IniciarControle;
                      self.PodeFechar := true;
                      FrmControlarPagto.Visible := true;
                      FrmControlarPagto.IniciarControle;
                      self.Close;
                  end
                  else
                  begin
                      MessageDlg('O Cancelamento do Pagamento só pode ser feito por Gerente.', mtInformation, [mbOk], 0);
                  end;
              end
              else
              begin
                  MessageDlg('Usuário Inativo.', mtInformation, [mbOk], 0);
              end;
          end
          else
             MessageDlg('Login e Senha Inválidos.', mtInformation, [mbOk], 0);
    Except
        MessageDlg('Problema com o Cancelamento do Pagamento.', mtError, [mbOk], 0);
    end;
end;


procedure TFrmEfetuarLoginCancelarPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmControlarPagto.Visible := true;
end;

procedure TFrmEfetuarLoginCancelarPagto.FormShow(Sender: TObject);
begin
    self.PodeFechar := false;
    self.ComboBox1.Text := 'Gerente';
    self.ComboBox1.Enabled := false;
end;

procedure TFrmEfetuarLoginCancelarPagto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

procedure TFrmEfetuarLoginCancelarPagto.BitBtn2Click(Sender: TObject);
begin
    self.PodeFechar := true;
    self.Close;
end;

procedure TFrmEfetuarLoginCancelarPagto.ClearBox;
begin
    self.Edit1.Clear;
    self.MaskEdit1.Clear;
    self.Edit2.Clear;
    self.Edit3.Clear;
end;

end.
