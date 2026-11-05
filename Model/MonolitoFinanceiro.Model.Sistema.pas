unit MonolitoFinanceiro.Model.Sistema;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms;

type
  TDMsistema = class(TDataModule)
  private
    { Private declarations }
    const ARQUIVOCONFIGURACAO = 'MonolitoFinanceiro.cfg.txt';
    function GetConfiguracoes(Secao, Parametro, valorPadrao: String): String;
    procedure SetConfiguracao(Secao, Parametro, Valor: String);

  public
    { Public declarations }
    function DataUltimoAcesso: String; overload;
    procedure DataUltimoAcesso(aValue: TDateTime); overload;
    function UsuarioUltimoAcesso: String; overload;
    procedure UsuarioUltimoAcesso(aValue: String); overload;
  end;

var
  DMsistema: TDMsistema;

implementation

uses
  System.IniFiles;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataModule1 }

function TDMsistema.DataUltimoAcesso: String;
begin
   Result := GetConfiguracoes('ACESSO', 'Data', '');
end;

procedure TDMsistema.DataUltimoAcesso(aValue: TDateTime);
begin
    SetConfiguracao('ACESSO','Data', DateTimeToStr(aValue));
end;

function TDMsistema.GetConfiguracoes(Secao, Parametro,
  valorPadrao: String): String;
var
  LArquivoConfig: TInifile;
begin
      // ExtractFilePath vamos passar um nome do arquivo e ele vai recuperar o caminho dele
     LArquivoConfig := TIniFile.Create(ExtractFilePath(Application.ExeName) + ARQUIVOCONFIGURACAO);
     try
        Result := LArquivoConfig.ReadString(Secao, Parametro, valorPadrao)
     finally
        LArquivoConfig.Free;
     end;
end;

procedure TDMsistema.SetConfiguracao(Secao, Parametro, Valor: String);
var
  LArquivoConfig: TInifile;
begin
      // ExtractFilePath vamos passar um nome do arquivo e ele vai recuperar o caminho dele
     LArquivoConfig := TIniFile.Create(ExtractFilePath(Application.ExeName) + ARQUIVOCONFIGURACAO);
     try
        LArquivoConfig.WriteString(Secao, Parametro, valor)
     finally
        LArquivoConfig.Free;
     end;
end;

function TDMsistema.UsuarioUltimoAcesso: String;
begin
   Result := GetConfiguracoes('ACESSO', 'Usuario', '');
end;

procedure TDMsistema.UsuarioUltimoAcesso(aValue: String);
begin
  SetConfiguracao('ACESSO','Usuario', aValue);
end;

end.
