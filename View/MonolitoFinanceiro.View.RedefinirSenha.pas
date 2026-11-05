unit MonolitoFinanceiro.View.RedefinirSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  MonolitoFinanceiro.Model.Entidades.Usuario;

type
  TformRedefinirSenha = class(TForm)
    pnlPrincipal: TPanel;
    pnlTop: TPanel;
    lbl: TLabel;
    lblUsuario: TLabel;
    Panel1: TPanel;
    pnlSenha: TPanel;
    editSenha: TEdit;
    pnlConfirmarSenha: TPanel;
    editConfirmarSenha: TEdit;
    lblConfirmarSenha: TLabel;
    lblSenha: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    btnCancelar: TButton;
    Panel3: TPanel;
    btnConfirmar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    FUsuario: TModelEntidadeUsuario;
    procedure SetUsuario(const Value: TModelEntidadeUsuario);
    { Private declarations }
  public
    { Public declarations }
    property Usuario: TModelEntidadeUsuario read FUsuario write SetUsuario;
  end;

var
  formRedefinirSenha: TformRedefinirSenha;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Model.Usuarios;

procedure TformRedefinirSenha.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TformRedefinirSenha.btnConfirmarClick(Sender: TObject);
begin
  editSenha.Text := Trim(editSenha.Text);
  editConfirmarSenha.Text := Trim(editConfirmarSenha.Text);

  if editSenha.Text = '' then
  begin
    editSenha.SetFocus;
    Application.MessageBox('informe sua nova senha', 'Atenção',
      mb_ok + MB_ICONWARNING);
    abort;

  end
  else if editConfirmarSenha.Text = '' then
  begin
    editConfirmarSenha.SetFocus;
    Application.MessageBox('Confirme sua nova senha', 'Atenção',
      mb_ok + MB_ICONWARNING);
    abort;

  end

  else if editSenha.Text <> editConfirmarSenha.Text then
  begin
    editConfirmarSenha.SetFocus;
    Application.MessageBox('Senha diferente da confirmação ', 'Atenção',
      mb_ok + MB_ICONWARNING);
    abort;

  end
  else
  begin
    Usuario.Senha := editSenha.Text;
    DMusuarios.RedefinirSenha(Usuario);
    Application.MessageBox('Senha alterada com sucesso ', 'Atenção',mb_ok + MB_ICONINFORMATION);
    ModalResult := mrOk;
  end;

end;

procedure TformRedefinirSenha.FormShow(Sender: TObject);
begin
  lblUsuario.Caption := FUsuario.NomeUsuarioLogado;
end;

procedure TformRedefinirSenha.SetUsuario(const Value: TModelEntidadeUsuario);
begin
  FUsuario := Value;
end;

end.
