
unit MonolitoFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    MenuCadastros: TMenuItem;
    menuRelatorios: TMenuItem;
    menuAjuda: TMenuItem;
    menuUsuarios: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Financeiro1: TMenuItem;
    caixa1: TMenuItem;
    procedure menuUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure caixa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  MonolitoFinanceiro.View.Splash,
  MonolitoFinanceiro.View.Login,
  MonolitoFinanceiro.Model.Usuarios,
  MonolitoFinanceiro.View.Usuarios,
  MonolitoFinanceiro.View.RedefinirSenha,
  MonolitoFinanceiro.View.Caixa;

{$R *.dfm}

procedure TFrmPrincipal.caixa1Click(Sender: TObject);
begin
  formCaixa.ShowModal;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  // Exibe a tela de Splash
  formSplash := TformSplash.Create(nil);
  try
    formSplash.ShowModal;
  finally
    FreeAndNil(formSplash);
  end;

  // Exibe a tela de Login
  formLogin := TFormLogin.Create(nil);
  try
    formLogin.ShowModal;

    // Encerra o sistema caso o login não seja concluído
    if formLogin.ModalResult <> mrOk then
    begin
      Application.Terminate;
      Exit;
    end;
  finally
    FreeAndNil(formLogin);
  end;

  // Se a senha for temporária, exige a redefinição
  if DMusuarios.GetUsuarioLogado.SenhaTemporaria then
  begin
    formRedefinirSenha := TformRedefinirSenha.Create(nil);
    try
      formRedefinirSenha.Usuario := DMusuarios.GetUsuarioLogado;
      formRedefinirSenha.ShowModal;

      // Encerra o sistema caso a redefinição não seja concluída
      if formRedefinirSenha.ModalResult <> mrOk then
      begin
        Application.Terminate;
        Exit;
      end;
    finally
      FreeAndNil(formRedefinirSenha);
    end;
  end;

  // Exibe o nome do usuário logado na barra de status
  StatusBar1.Panels.Items[1].Text :='Usuário: ' + DMusuarios.GetUsuarioLogado.NomeUsuarioLogado;
end;

procedure TFrmPrincipal.menuUsuariosClick(Sender: TObject);
begin
  // Abre a tela de usuários
  formUsuarios.ShowModal;
end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
begin
  // Atualiza a data e a hora na barra de status
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(Now);
end;

end.

