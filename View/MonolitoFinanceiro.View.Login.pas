unit MonolitoFinanceiro.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TformLogin = class(TForm)
    pnlLeft: TPanel;
    Image1: TImage;
    pnlPrincipal: TPanel;
    pnlTop: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    pnlLogin: TPanel;
    lblSenha: TLabel;
    editLogin: TEdit;
    pnlSenha: TPanel;
    Label1: TLabel;
    editSenha: TEdit;
    btnEntrar: TButton;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  formLogin: TformLogin;

implementation



{$R *.dfm}

uses MonolitoFinanceiro.Model.Usuarios, MonolitoFinanceiro.Model.Sistema;

procedure TformLogin.btnEntrarClick(Sender: TObject);
begin
  if (editLogin.Text) = '' then
  begin
    editLogin.SetFocus;
    Application.MessageBox('informe seu usuário', 'Atenção', mb_ok + MB_ICONWARNING);
    abort;

  end;
  if (editSenha.Text) = '' then
  begin
    editSenha.SetFocus;
    Application.MessageBox('informe sua senha', 'Atenção', mb_ok + MB_ICONWARNING);
    abort;
  end;

  try
     // está chamando a função Efetual login do Model.Usuários passando os parametros para verificação
     // os campos de parametros tem que estar na sequência do preenchimento. Ex: primeiro o edit login
     // e depois o edit senha. Primeiro preenche o campo login depois a senha

    DMusuarios.EfetuarLogin(Trim(editLogin.Text), Trim(editSenha.Text));
    DMsistema.DataUltimoAcesso(now);
    Dmsistema.UsuarioUltimoAcesso(DMusuarios.GetUsuarioLogado.LoginUsuarioLogado);


    ModalResult := mrOk;
  except
    on Erro: Exception do
    begin
         Application.MessageBox(PwideChar(Erro.Message), 'Atenção', mb_ok + MB_ICONWARNING);
         editLogin.SetFocus;
    end;

  end;



end;

procedure TformLogin.FormShow(Sender: TObject);
begin
  editLogin.Text := DMsistema.UsuarioUltimoAcesso;

end;




end.
