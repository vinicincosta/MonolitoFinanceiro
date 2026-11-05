unit MonolitoFinanceiro.Model.Caixa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
  public
    { Public declarations }
  end;

var
  DMcaixa: TDMcaixa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MonolitoFinanceiro.Model.Conexao,
  MonolitoFinanceiro.Model.Entidades.Usuario;

{$R *.dfm}

end.
