unit MonolitoFinanceiro.Model.Entidades.Usuario;

interface

type
  TModelEntidadeUsuario = class
  private
    FNomeUsuarioLogado: string;
    FLoginUsuarioLogado: string;
    FIdUsuarioLogado: integer;
    FSenha: STring;
    FSenhaTemporaria: Boolean;
    procedure SetSenha(const Value: STring);
    procedure SetSenhaTemporaria(const Value: Boolean);
  public
    property NomeUsuarioLogado: string read FNomeUsuarioLogado write FNomeUsuarioLogado;
    property LoginUsuarioLogado: string read FLoginUsuarioLogado write FLoginUsuarioLogado;
    property IdUsuarioLogado: Integer read FIdUsuarioLogado write FIdUsuarioLogado;
    property Senha: STring read FSenha write SetSenha;
    property SenhaTemporaria : Boolean read FSenhaTemporaria write SetSenhaTemporaria;
  end;

implementation

{ TModelEntidadeUsuario }

procedure TModelEntidadeUsuario.SetSenha(const Value: STring);
begin
  FSenha := Value;
end;

procedure TModelEntidadeUsuario.SetSenhaTemporaria(const Value: Boolean);
begin
  FSenhaTemporaria := Value;
end;

end.
