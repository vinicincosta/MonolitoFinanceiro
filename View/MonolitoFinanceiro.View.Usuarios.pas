
unit MonolitoFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.WinXPanels, Vcl.WinXCtrls,
  Vcl.Menus,
  BCrypt.Types, BCrypt, BCrypt.Intf, BCrypt.Core, BCrypt.Consts;

type
  TformUsuarios = class(TformCadastroPadrao)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    status: TToggleSwitch;
    editNome: TEdit;
    editLogin: TEdit;
    PopupMenu1: TPopupMenu;
    menuLimparSenha: TMenuItem;

    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure menuLimparSenhaClick(Sender: TObject);


  protected
    procedure Pesquisar; override;
  end;

var
  formUsuarios: TformUsuarios;
  IdUsuario: Integer;

implementation

{$R *.dfm}

uses
  MonolitoFinanceiro.Model.Usuarios,
  MonolitoFinanceiro.Utilitarios;

procedure TformUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;

  // Preenche os campos específicos do cadastro de usuários.
  editNome.Text :=
    DMusuarios.cdsUsuariosnome_usuario.AsString;

  editLogin.Text :=
    DMusuarios.cdsUsuarioslogin.AsString;

  status.State := tssOn;

  if DMusuarios.cdsUsuariosstatus.AsString = 'B' then
    status.State := tssOff;
end;

procedure TformUsuarios.btnCancelarClick(Sender: TObject);
begin
  inherited;

  // A classe pai cancela a operação e retorna à pesquisa.
end;

procedure TformUsuarios.btnIncluirClick(Sender: TObject);
begin
  inherited;

  // A classe pai limpa os campos e executa Insert.
end;

procedure TformUsuarios.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TformUsuarios.btnSalvarClick(Sender: TObject);
var
  LStatus: string;
  NovoRegistro: Boolean;
begin
  // Validação do nome.
  if Trim(editNome.Text) = '' then
  begin
    editNome.SetFocus;

    Application.MessageBox(
      'O campo NOME não pode ser vazio.',
      'Atenção',
      MB_OK + MB_ICONWARNING
    );

    Abort;
  end;

  // Validação do login.
  if Trim(editLogin.Text) = '' then
  begin
    editLogin.SetFocus;

    Application.MessageBox(
      'O campo LOGIN não pode ser vazio.',
      'Atenção',
      MB_OK + MB_ICONWARNING
    );

    Abort;
  end;

  // Identifica se é uma inclusão ou alteração.
  NovoRegistro := DMusuarios.cdsUsuarios.State = dsInsert;

  if NovoRegistro then
    IdUsuario := 0
  else
    IdUsuario :=
      DMusuarios.cdsUsuariosid_usuario.AsInteger;

  // Verifica se o login já está cadastrado.
  if DMusuarios.TemLoginCadastrado(
    Trim(editLogin.Text),
    IdUsuario
  ) then
  begin
    Application.MessageBox(
      'Login já se encontra cadastrado.',
      'Atenção',
      MB_OK + MB_ICONWARNING
    );

    Abort;
  end;

  // Define o status do usuário.
  LStatus := 'A';

  if status.State = tssOff then
    LStatus := 'B';

  // Configura os campos exclusivos da inclusão.
  if NovoRegistro then
  begin
    DMusuarios.cdsUsuariosdata_cadastro_usuario.AsDateTime := Now;

    DMusuarios.cdsUsuariossenha.AsString :=
      TBCrypt.GenerateHash(DMusuarios.TEMP_PASSWORD);

    DMusuarios.cdsUsuariossenha_temporaria.AsString := 's';
  end;

  // Preenche os dados do usuário.
  DMusuarios.cdsUsuariosnome_usuario.AsString :=
    Trim(editNome.Text);

  DMusuarios.cdsUsuarioslogin.AsString :=
    Trim(editLogin.Text);

  DMusuarios.cdsUsuariosstatus.AsString := LStatus;

  // Confirma as alterações no ClientDataSet.
  DMusuarios.cdsUsuarios.Post;

  // Envia os dados ao banco de dados.
  if DMusuarios.cdsUsuarios.ApplyUpdates(0) > 0 then
    raise Exception.Create(
      'Não foi possível gravar o usuário.'
    );

  // Atualiza a consulta e retorna à tela de pesquisa.
  Pesquisar;

  pnlPrincipal.ActiveCard := cardPesquisa;

  Application.MessageBox(
    'Registro salvo com sucesso.',
    'Atenção',
    MB_OK + MB_ICONINFORMATION
  );
end;



procedure TformUsuarios.menuLimparSenhaClick(Sender: TObject);
begin
  inherited;

  if not DataSource2.DataSet.IsEmpty then
  begin
    // Define a senha padrão para o usuário selecionado.
    DMusuarios.LimparSenha(
      DataSource2.DataSet.FieldByName('id_usuario').AsInteger
    );

    Application.MessageBox(
      PChar(
        Format(
          'Foi definida a senha do usuário "%s".',
          [
            DataSource2.DataSet.FieldByName(
              'nome_usuario'
            ).AsString
          ]
        )
      ),
      'Atenção',
      MB_OK + MB_ICONINFORMATION
    );
  end;
end;

procedure TformUsuarios.Pesquisar;
var
  FiltroPesquisa: string;

begin

  FiltroPesquisa := TUtilitario.LikeFind(editPesquisar.Text,DBGrid1);

  DMusuarios.cdsUsuarios.Close;

  DMusuarios.cdsUsuarios.CommandText := 'SELECT * FROM usuarios where 1 = 1 ' + FiltroPesquisa;

  DMusuarios.cdsUsuarios.Open;
end;

end.

