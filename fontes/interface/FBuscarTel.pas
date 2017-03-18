unit FBuscarTel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, cTelefone, cCliente, cFuncionario,
  cFornecedor, cDataModule,cControle, ExtCtrls,FManterTelefone, cPessoaJuridica, cPessoaFisica;

type
  TFrmBuscarTel = class(TForm)
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox4: TGroupBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    Procedure AtribuirDadosTelefone;
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    PodeFechar : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarTel: TFrmBuscarTel;
  Tel  : Telefone;
  DM : TDM;

implementation

{$R *.dfm}

procedure TFrmBuscarTel.BitBtn1Click(Sender: TObject);
var
    Tel  : Telefone;
    Ct   : Controle;
    Func : Funcionario;
    Cli  : Cliente;
    PJ   : PessoaJuridica;
    PF   : PessoaFisica;
begin
      try
        if (Edit1.Text <> '') then
        begin
            DM := TDM.create (NIL);

            if (RadioButton1.Checked = true) then
            begin
               FrmManterTelefone.Label2.Caption := 'Nome:';
               FrmManterTelefone.Habilitar;
               Cli := Cliente.Create(0,'','','','','','','');
               Tel := Telefone.Create(0,'','');
               Cli.setNomeCli(Edit1.Text);
               Ct := Controle.Create(DM,Cli,Tel);
               Ct.BuscarTelCli;

               FrmManterTelefone.MaskEdit2.Enabled := true;
               FrmManterTelefone.MaskEdit3.Enabled := true;
             
               if(Tel.getCodTel > 0) then
               begin
                  FrmManterTelefone.Edit3.Text := 'CLIENTE';
                  FrmManterTelefone.Edit1.Text := IntToStr(Tel.getCodTel);
                  FrmManterTelefone.Edit2.Text := Cli.getnomeCli;
                  FrmManterTelefone.Edit4.Text := IntToStr(Cli.getCodCli);

                  if(Tel.getTelCont1 = '0') then
                  begin
                      FrmManterTelefone.MaskEdit2.Clear;
                  end
                  else
                  begin
                      FrmManterTelefone.MaskEdit2.Text := Tel.getTelCont1;
                  end;

                  if(Tel.getTelCont2 = '0') then
                  begin
                      FrmManterTelefone.MaskEdit3.Clear;
                  end
                  else
                  begin
                      FrmManterTelefone.MaskEdit3.Text := Tel.getTelCont2;
                  end;

                  FrmManterTelefone.HabilitarEdicao;
                  FrmManterTelefone.HabilitarNavg;
                  self.PodeFechar := true;
                  self.Close;
               end

               else if (Tel.getCodTel = 0) AND (Cli.getCodCli <> -1) then
               begin
                  FrmManterTelefone.Edit3.Text := 'CLIENTE';
                  FrmManterTelefone.Edit4.Text := IntToStr(Cli.getCodCli);
                  FrmManterTelefone.Edit1.Text := IntToStr(0);
                  FrmManterTelefone.Edit2.Text := Cli.getnomeCli;
                  FrmManterTelefone.MaskEdit2.Text := '';
                  FrmManterTelefone.MaskEdit3.Text := '';
                  FrmManterTelefone.BitBtn4.Enabled := false;
                  FrmManterTelefone.BitBtn3.Enabled := true;
                  FrmManterTelefone.BitBtn2.Enabled := false;
                  FrmManterTelefone.BitBtn1.Enabled := true;
                  FrmManterTelefone.Edit1.Text :=  IntToStr(Ct.MaxCodTel + 1);
                  FrmManterTelefone.MaskEdit2.Enabled := true;
                  FrmManterTelefone.MaskEdit3.Enabled := true;
                  Ct.BuscarCliente;
                  FrmManterTelefone.BitBtn5.Enabled := true;
                  FrmManterTelefone.BitBtn6.Enabled := true;
                  self.PodeFechar := true;
                  self.Close;
               end;

               if (Tel.getCodTel = 0) AND (Cli.getCodCli = -1) then
               begin
                  Showmessage('Nenhum Registro de Telefone ou Cliente foi encontrado.');
                  FrmManterTelefone.ClearBox;
               end;
            end



            else if (RadioButton2.Checked = true) then
            begin
                PJ := PessoaJuridica.Create(0,'','','','','','',0,0/00/0000,'','',self.Edit1.Text);
                PF := PessoaFisica.Create(0,'','','','','','',0,0/00/0000,'','',self.Edit1.Text);
                Tel := Telefone.Create(0,'','');
                Ct := Controle.Create(DM,PJ,PF,Tel);
                Ct.BuscarTelForn;

                if(Tel.getCodTel > 0) then
                begin
                    FrmManterTelefone.Habilitar;
                    if(PJ.gettipoForn = 'PJ') then
                    begin
                        FrmManterTelefone.Label2.Caption := 'R.Social:';
                        FrmManterTelefone.Edit2.Text := PJ.getrazaoSocial;
                    end
                    else if(PF.gettipoForn = 'PF') then
                    begin
                        FrmManterTelefone.Label2.Caption := 'Nome:';
                        FrmManterTelefone.Edit2.Text := PF.getnome;
                    end;

                    FrmManterTelefone.Edit3.Text := 'FORNECEDOR';
                    FrmManterTelefone.Edit1.Text := IntToStr(Tel.getCodTel);
                    FrmManterTelefone.Edit4.Text := IntToStr(PJ.getcodForn);

                    if(Tel.getTelCont1 = '0') then
                    begin
                        FrmManterTelefone.MaskEdit2.Clear;
                    end
                    else
                    begin
                        FrmManterTelefone.MaskEdit2.Text := Tel.getTelCont1;
                    end;

                    if(Tel.getTelCont2 = '0') then
                    begin
                        FrmManterTelefone.MaskEdit3.Clear;
                    end
                    else
                    begin
                        FrmManterTelefone.MaskEdit3.Text := Tel.getTelCont2;
                    end;
                    FrmManterTelefone.HabilitarEdicao;
                    FrmManterTelefone.HabilitarNavg;
                    self.PodeFechar := true;
                    self.Close;
                end

                else if (Tel.getCodTel = 0) AND (PF.getcodForn <> -1) then
                begin
                    FrmManterTelefone.Habilitar;
                    FrmManterTelefone.Edit3.Text := 'FORNECEDOR';
                    FrmManterTelefone.Edit4.Text := IntToStr(PJ.getcodForn);
                    FrmManterTelefone.Edit1.Text := IntToStr(0);

                    if(PJ.gettipoForn = 'PJ') then
                    begin
                        FrmManterTelefone.Label2.Caption := 'R.Social:';
                        FrmManterTelefone.Edit2.Text := PJ.getrazaoSocial;
                    end
                    else if(PF.gettipoForn = 'PF') then
                    begin
                        FrmManterTelefone.Label2.Caption := 'Nome:';
                        FrmManterTelefone.Edit2.Text := PF.getnome;
                    end;

                    FrmManterTelefone.MaskEdit2.Clear;
                    FrmManterTelefone.MaskEdit3.Clear;
                    FrmManterTelefone.BitBtn4.Enabled := false;
                    FrmManterTelefone.BitBtn3.Enabled := true;
                    FrmManterTelefone.BitBtn2.Enabled := false;
                    FrmManterTelefone.BitBtn1.Enabled := true;
                    FrmManterTelefone.Edit1.Text :=  IntToStr(Ct.MaxCodTel + 1);
                    //Ct.BuscarFornPorNomeRSocial;
                    FrmManterTelefone.DesabilitarNavg;
                    self.PodeFechar := true;
                    self.Close;
                end;
                if (Tel.getCodTel = 0) AND (PJ.getcodForn = -1) then
                begin
                  MessageDlg('Nenhum registro de Telefone ou Fornecedor foi encontrado.', mtInformation, [mbOk], 0);
                  FrmManterTelefone.ClearBox;
                end;
           end


           else if (RadioButton3.Checked = true) then
           begin
               FrmManterTelefone.Label2.Caption := 'Nome:';
               FrmManterTelefone.Habilitar;
               Func := Funcionario.Create;
               Tel := Telefone.Create(0,'','');
               Func.setnomeFunc(self.Edit1.Text);
               Ct := Controle.Create(DM,Func,Tel);
               Ct.BuscarTelFunc;

               if(Tel.getCodTel > 0) then
               begin
                   FrmManterTelefone.Edit3.Text := 'FUNCIONARIO';
                   FrmManterTelefone.Edit1.Text := IntToStr(Tel.getCodTel);
                   FrmManterTelefone.Edit4.Text := Func.getcpfFunc;
                   FrmManterTelefone.Edit2.Text := Func.getnomeFunc;
                   FrmManterTelefone.MaskEdit2.Text := Tel.getTelCont1;
                   FrmManterTelefone.MaskEdit3.Text := Tel.getTelCont2;
                   FrmManterTelefone.MaskEdit2.Enabled := true;
                   FrmManterTelefone.MaskEdit3.Enabled := true;
                   FrmManterTelefone.HabilitarEdicao;
                   FrmManterTelefone.HabilitarNavg;
                   self.PodeFechar := true;
                   self.Close;
               end

               else if (Tel.getCodTel = 0) AND (Func.getcpfFunc <> '-1') then
               begin
                   FrmManterTelefone.Edit3.Text := 'FUNCIONARIO';
                   FrmManterTelefone.Edit1.Text := IntToStr(0);
                   FrmManterTelefone.Edit4.Text := Func.getcpfFunc;
                   FrmManterTelefone.Edit2.Text := Func.getnomeFunc;
                   FrmManterTelefone.MaskEdit2.Enabled := true;
                   FrmManterTelefone.MaskEdit3.Enabled := true;
                   FrmManterTelefone.MaskEdit2.Text := '';
                   FrmManterTelefone.MaskEdit3.Text := '';
                   FrmManterTelefone.BitBtn4.Enabled := false;
                   FrmManterTelefone.BitBtn3.Enabled := true;
                   FrmManterTelefone.BitBtn2.Enabled := false;
                   FrmManterTelefone.BitBtn1.Enabled := true;
                   FrmManterTelefone.Edit1.Text :=  IntToStr(Ct.MaxCodTel + 1);
                   Ct.BuscarFuncNOME;
                   self.PodeFechar := true;
                   self.Close;
               end;

               if (Tel.getCodTel = 0) AND (Func.getcpfFunc = '-1') then
               begin
                  Showmessage('Nenhum Registro de Telefone ou Funcionário foi encontrado.');
                  FrmManterTelefone.ClearBox;
               end;
            end;
        end;
      Except
          MessageDlg('Problema na busca por telefone no sistema.', mtError, [mbOk], 0);
      end;
end;


Procedure TFrmBuscarTel.AtribuirDadosTelefone;
begin
    {
    FrmManterTelefone.Edit3.Text := IntToStr(Tel.getCodTel);
    FrmManterTelefone.MaskEdit2.Text := IntToStr(Tel.getNumTel);
    }
end;


procedure TFrmBuscarTel.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja cancelar a busca de Telefone?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        self.PodeFechar := true;
        self.Close;
    end;
end;

procedure TFrmBuscarTel.FormShow(Sender: TObject);
begin
    FrmBuscarTel.Edit1.Text := '';
    RadioButton1.Checked := true;
    self.PodeFechar := false;
end;

procedure TFrmBuscarTel.Edit1Change(Sender: TObject);
begin
    if(self.Edit1.Text <> '') then
       self.BitBtn1.Enabled := true
    else
       self.BitBtn1.Enabled := false;
end;



procedure TFrmBuscarTel.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := self.PodeFechar;
end;

end.
