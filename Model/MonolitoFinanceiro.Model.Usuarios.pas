unit MonolitoFinanceiro.Model.Usuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MonolitoFinanceiro.Model.Entidades.Usuario,
  BCrypt;

type
  TDMusuarios = class(TDataModule)
    sqlUsuarios: TFDQuery;
    cdsUsuarios: TClientDataSet;
    dspUsuarios: TDataSetProvider;
    cdsUsuariosnome_usuario: TStringField;
    cdsUsuarioslogin: TStringField;
    cdsUsuariossenha: TStringField;
    cdsUsuariosstatus: TStringField;
    cdsUsuariosdata_cadastro_usuario: TDateField;
    cdsUsuariosid_usuario: TIntegerField;
    cdsUsuariossenha_temporaria: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FEntidadeUsuario: TModelEntidadeUsuario;

    { Private declarations }
  public

    // Troque ID : AsString para AsInteger
    function TemLoginCadastrado(login: String; ID_USUARIO: Integer): BOOLEAN;
    procedure EfetuarLogin(login: String; Senha: String);

    function GetUsuarioLogado: TModelEntidadeUsuario;

    // limpar senha
    procedure LimparSenha(ID_USUARIO: Integer);

    procedure RedefinirSenha(Usuario: TModelEntidadeUsuario);

  const
    TEMP_PASSWORD = '123456';
  end;

var
  DMusuarios: TDMusuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MonolitoFinanceiro.Model.Conexao;

{$R *.dfm}
{ TDMusuarios }

procedure TDMusuarios.DataModuleCreate(Sender: TObject);
begin
  FEntidadeUsuario := TModelEntidadeUsuario.Create;
end;

procedure TDMusuarios.DataModuleDestroy(Sender: TObject);
begin
  FEntidadeUsuario.Free;
end;

procedure TDMusuarios.EfetuarLogin(login, Senha: String);
begin
  var
    SQLConsulta: TFDQuery;
  begin
    SQLConsulta := TFDQuery.Create(nil);
    try
      SQLConsulta.Connection := DMconexao.SQLConexao;
      SQLConsulta.sql.Clear;
      SQLConsulta.sql.add('SELECT * FROM USUARIOS WHERE LOGIN = :LOGIN ');
      SQLConsulta.ParamByName('login').AsString := login;
      SQLConsulta.Open;

      if SQLConsulta.IsEmpty then
      begin
        raise Exception.Create('Usuário e/ou senha inválidos');
      end;

      // está comparando se o Hash da senha está de acordo com a senha
      // é necessário utilizar esse comando para validar se a senha é correta
      if not TBCrypt.CompareHash(Senha, SQLConsulta.FieldByName('Senha')
        .AsString) then
      begin
        raise Exception.Create('Usuário e/ou senha inválidos');
      end;

      // if para saber se o User está Ativo ou não
      if SQLConsulta.FieldByName('Status').AsString <> 'A' then
      begin
        raise Exception.Create
          ('Usuário Bloqueado, entre em contato com o administrador');
      end;
      FEntidadeUsuario.IdUsuarioLogado := SQLConsulta.FieldByName('id_usuario')
        .AsInteger;
      FEntidadeUsuario.LoginUsuarioLogado := SQLConsulta.FieldByName('login').AsString;
      FEntidadeUsuario.NomeUsuarioLogado := SQLConsulta.FieldByName('nome_usuario').AsString;
      FEntidadeUsuario.Senha := SQLConsulta.FieldByName('senha').AsString;
      FEntidadeUsuario.SenhaTemporaria := SQLConsulta.FieldByName('senha_temporaria').AsString = 'S';

    finally
      SQLConsulta.Close;
      SQLConsulta.Free
    end;
  end;
end;

function TDMusuarios.GetUsuarioLogado: TModelEntidadeUsuario;
begin
  Result := FEntidadeUsuario;
end;

procedure TDMusuarios.LimparSenha(ID_USUARIO: Integer);
var
  SQLQuery: TFDQuery;
begin
  SQLQuery := TFDQuery.Create(nil);
  try
    SQLQuery.Connection := DMconexao.SQLConexao;
    SQLQuery.sql.Clear;

    // Updte no banco para limpar a senha temporária
    SQLQuery.sql.add
      ('UPDATE USUARIOS SET SENHA_TEMPORARIA = :SENHA_TEMPORARIA, SENHA = :SENHA WHERE ID_USUARIO = :ID_USUARIO ');
    SQLQuery.ParamByName('SENHA_TEMPORARIA').AsString := 'S';
    SQLQuery.ParamByName('SENHA').AsString := TBCrypt.GenerateHash(TEMP_PASSWORD);
    SQLQuery.ParamByName('ID_USUARIO').AsInteger := ID_USUARIO;
    SQLQuery.ExecSQL;

  finally
    SQLQuery.Free;
  end;
end;

// Redefinir senha
procedure TDMusuarios.RedefinirSenha(Usuario: TModelEntidadeUsuario);
var
  SQLQuery: TFDQuery;
begin
  SQLQuery := TFDQuery.Create(nil);
  try
    SQLQuery.Connection := DMconexao.SQLConexao;
    SQLQuery.sql.Clear;

    // Updte no banco para limpar a senha temporária
    SQLQuery.sql.add
      ('UPDATE USUARIOS SET SENHA_TEMPORARIA = :SENHA_TEMPORARIA, SENHA = :SENHA WHERE ID_USUARIO = :ID_USUARIO ');
    SQLQuery.ParamByName('SENHA_TEMPORARIA').AsString := 'N';

    // redefinindo a senha de acordo com usuario
    SQLQuery.ParamByName('SENHA').AsString := TBCrypt.GenerateHash(Usuario.Senha);
    SQLQuery.ParamByName('ID_USUARIO').AsInteger := Usuario.IdUsuarioLogado;
    SQLQuery.ExecSQL;

  finally
    SQLQuery.Free;
  end;
end;

function TDMusuarios.TemLoginCadastrado(login: String;
  ID_USUARIO: Integer): BOOLEAN;
var
  SQLConsulta: TFDQuery;
begin
  Result := False;
  SQLConsulta := TFDQuery.Create(nil);

  try
    SQLConsulta.Connection := DMconexao.SQLConexao;
    SQLConsulta.sql.Clear;
    SQLConsulta.sql.add('SELECT ID_USUARIO FROM USUARIOS WHERE LOGIN = :LOGIN');
    SQLConsulta.ParamByName('login').AsString := login;
    SQLConsulta.Open;

    if not SQLConsulta.IsEmpty then

      // troquei AsString para AsInteger
      Result := SQLConsulta.FieldByName('ID_USUARIO').AsInteger <> ID_USUARIO;

  finally
    SQLConsulta.Close;
    SQLConsulta.Free
  end;

end;

end.
