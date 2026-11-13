unit MonolitoFinanceiro.Model.Caixa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MonolitoFinanceiro.View.Usuarios,
  MonolitoFinanceiro.Model.Entidades.CaixaResumo;

type
  TDMcaixa = class(TDataModule)
    sqlCaixa: TFDQuery;
    cdsCaixa: TClientDataSet;
    dspCaixa: TDataSetProvider;
    cdsCaixaid_caixa: TIntegerField;
    cdsCaixanumero_doc: TStringField;
    cdsCaixadescricao: TStringField;
    cdsCaixavalor: TFMTBCDField;
    cdsCaixatipo: TStringField;
    cdsCaixadata_cadastro_caixa: TDateField;
  private
    { Private declarations }
    function GetSaldoAnteriorCaixa(Data: TDate): Currency;
    function GetTotalEntradas(DataInicial, DataFinal: TDate): Currency;
    function GetTotalSaidasCaixa(DataInicial, DataFinal: TDate): Currency;
  public
    { Public declarations }
    function ResumoCaixa(DataInicial: TDate; DataFinal: TDate)
      : TModelResumoCaixa;

  end;

var
  DMcaixa: TDMcaixa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MonolitoFinanceiro.Model.Conexao,
  MonolitoFinanceiro.Model.Entidades.Usuario;

{$R *.dfm}
{ TDMcaixa }

function TDMcaixa.GetSaldoAnteriorCaixa(Data: TDate): Currency;
var
  SQLConsulta: TFDQuery;
  TotalEntradas: Currency;
  TotalSaidas: Currency;
begin
  Result := 0;
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := DMconexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add
      ('Select IFNULL(SUM(valor), 0 ) AS valor FROM caixa WHERE tipo = ''R'' ');
    SQLConsulta.SQL.Add('AND data_cadastro_caixa < :DATA ');
    SQLConsulta.ParamByName('DATA').AsDate := Data;
    SQLConsulta.Open;
    TotalEntradas := SQLConsulta.FieldByName('valor').AsCurrency;

    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add
      ('Select IFNULL(SUM(valor), 0 ) AS valor FROM caixa WHERE tipo = ''D'' ');
    SQLConsulta.SQL.Add('AND data_cadastro_caixa < :DATA ');
    SQLConsulta.ParamByName('DATA').AsDate := Data;
    SQLConsulta.Open;
    TotalSaidas := SQLConsulta.FieldByName('valor').AsCurrency;
  finally
    SQLConsulta.Free;

  end;
  Result := TotalEntradas - TotalSaidas;
end;

function TDMcaixa.GetTotalEntradas(DataInicial, DataFinal: TDate): Currency;
var
  SQLConsulta: TFDQuery;
begin
  Result := 0;

  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := DMconexao.SQLConexao;

    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add
      ('SELECT IFNULL(SUM(valor), 0) AS valor FROM caixa WHERE tipo = ''R'' ');
    SQLConsulta.SQL.Add
      ('AND data_cadastro_caixa BETWEEN :DATAINICIAL AND :DATAFINAL');

    SQLConsulta.ParamByName('DATAINICIAL').AsDate := DataInicial;
    SQLConsulta.ParamByName('DATAFINAL').AsDate := DataFinal;

    SQLConsulta.Open;

    Result := SQLConsulta.FieldByName('valor').AsCurrency;

  finally
    SQLConsulta.Free;
  end;
end;

function TDMcaixa.GetTotalSaidasCaixa(DataInicial, DataFinal: TDate): Currency;
var
  SQLConsulta: TFDQuery;
begin
  Result := 0;

  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := DMconexao.SQLConexao;

    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add(
      'SELECT IFNULL(SUM(valor), 0) AS valor FROM caixa WHERE tipo = ''D'' '
    );
    SQLConsulta.SQL.Add(
      'AND data_cadastro_caixa BETWEEN :DATAINICIAL AND :DATAFINAL'
    );

    SQLConsulta.ParamByName('DATAINICIAL').AsDate := DataInicial;
    SQLConsulta.ParamByName('DATAFINAL').AsDate := DataFinal;

    SQLConsulta.Open;

    Result := SQLConsulta.FieldByName('valor').AsCurrency;

  finally
    SQLConsulta.Free;
  end;
end;

function TDMcaixa.ResumoCaixa(DataInicial: TDate; DataFinal: TDate)
  : TModelResumoCaixa;
begin
  if DataInicial > DataFinal then

    // exibir mensagem de erro parando a aplicação
    raise Exception.Create('Período Inválido');

  Result := TModelResumoCaixa.Create;

  try
    Result.SaldoInicial := GetSaldoAnteriorCaixa(DataInicial);
    Result.TotalEntradas := GetTotalEntradas(DataInicial, DataFinal);
    Result.TotalSaidas := GetTotalSaidasCaixa(DataInicial, DataFinal);

  except
    Result.Free;
    raise;
  end;

end;

end.
