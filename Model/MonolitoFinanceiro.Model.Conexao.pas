unit MonolitoFinanceiro.Model.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDMconexao = class(TDataModule)
    SQLConexao: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);

  private
   const ARQUIVOCONFIGURACAO = 'MonolitoFinanceiro.cfg.txt';
  public
    procedure CarregarConfiguracoes;
    procedure Conectar;
    procedure Desconectar;
  end;

var
  DMconexao: TDMconexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDM }

procedure TDMconexao.CarregarConfiguracoes;
var
  ParametroNome: String;
  ParametroValor: String;
  Contador: Integer;
  ListaParametro: TStringList;
begin
  SQLConexao.Params.Clear;
  if not FileExists(ARQUIVOCONFIGURACAO) then
    raise Exception.Create('Arquivo de configuração não encontrado');
  ListaParametro := TStringList.Create;
  try
    ListaParametro.LoadFromFile(ARQUIVOCONFIGURACAO);
    for Contador := 0 to Pred(ListaParametro.Count) do
    begin
      if ListaParametro[Contador].IndexOf('=') > 0 then
      begin
        // Split retorna um Array
        // Trim é para retirar um espaço
        ParametroNome := ListaParametro[Contador].Split(['='])[0].Trim;
        ParametroValor:= ListaParametro[Contador].Split(['='])[1].Trim;
        SQLConexao.Params.ADD(ParametroNome + '=' + ParametroValor);
      end;
    end;

  finally
    ListaParametro.Free;
  end;

end;

procedure TDMconexao.Conectar;
begin
    SQLConexao.Connected := True;
end;

procedure TDMconexao.DataModuleCreate(Sender: TObject);
begin
  CarregarConfiguracoes;
  Conectar;
end;

procedure TDMconexao.Desconectar;
begin
    SQLConexao.Connected := False;
end;

end.
