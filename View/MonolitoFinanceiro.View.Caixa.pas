unit MonolitoFinanceiro.View.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.Menus;

type
  TformCaixa = class(TformCadastroPadrao)
    Label2: TLabel;
    Label3: TLabel;
    editNumeroDocumento: TEdit;
    editDescricao: TEdit;
    editValor: TEdit;
    Label5: TLabel;
    RadioGroup1: TRadioGroup;
    cbTipo: TComboBox;
    Label4: TLabel;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar; override;
  end;

var
  formCaixa: TformCaixa;
  IdCaixa: Integer;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Model.Caixa, MonolitoFinanceiro.Utilitarios;

{ TformCadastroPadrao1 }

procedure TformCaixa.btnAlterarClick(Sender: TObject);
begin
  inherited;
  // Parametrizando os campos para realizar a alteração
  editNumeroDocumento.Text := DMcaixa.cdscaixanumero_doc.AsString;

  editDescricao.Text := DMcaixa.cdsCaixadescricao.AsString;

  editValor.Text := FormatFloat('0.00', DMcaixa.cdsCaixavalor.AsFloat);

  if DMcaixa.cdsCaixatipo.AsString = 'R' then
  begin
    RadioGroup1.ItemIndex := 0;
  end
  else
  begin
    RadioGroup1.ItemIndex := 1;
  end;
end;

procedure TformCaixa.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TformCaixa.btnSalvarClick(Sender: TObject);
var
  LTipo: String;
  NovoRegistro: Boolean;
  LValor: Currency;
begin
  // Identifica se é uma inclusão ou alteração.
  // Processo da inclusção de um novo ID
  NovoRegistro := DMcaixa.cdsCaixa.State = dsInsert;

  if NovoRegistro then
    IdCaixa := 0
  else
    IdCaixa := DMcaixa.cdsCaixaid_caixa.AsInteger;

  // Validação do núemero.
  if Trim(editNumeroDocumento.Text) = '' then
  begin
    editNumeroDocumento.SetFocus;

    Application.MessageBox('O campo NÚMERO DOC não pode ser vazio.', 'Atenção',
      MB_OK + MB_ICONWARNING);

    Abort;
  end;

  // Validação descrição.
  if Trim(editDescricao.Text) = '' then
  begin
    editDescricao.SetFocus;

    Application.MessageBox('O campo DESCRIÇÃO não pode ser vazio.', 'Atenção',
      MB_OK + MB_ICONWARNING);

    Abort;
  end;

  // Validação valor.
  if Trim(editValor.Text) = '' then
  begin
    editValor.SetFocus;

    Application.MessageBox('O campo Valor não pode ser vazio.', 'Atenção',
      MB_OK + MB_ICONWARNING);

    Abort;
  end;

  // Validação valor: número válido, maior que zero, no máximo 2 casas.
  if (not TryStrToCurr(Trim(editValor.Text), LValor)) or (LValor <= 0) or
    (Round(LValor * 100) <> LValor * 100) then
  begin
    editValor.SetFocus;

    Application.MessageBox
      ('Informe um VALOR válido, maior que zero, com no máximo 2 casas (ex.: 10,50).',
      'Atenção', MB_OK + MB_ICONWARNING);

    Abort;
  end;

  // Validação TIPO
  if (RadioGroup1.ItemIndex = -1) then
  begin
    Application.MessageBox('Selecione o TIPO de lançamento.', 'Atenção',
      MB_OK + MB_ICONWARNING);

    Abort;
  end;

  LTipo := 'R';
  if (RadioGroup1.ItemIndex = 1) then
  begin
    LTipo := 'D';
  end;

  if (DataSource2.State in [dsInsert]) then
  begin
    DMcaixa.cdsCaixadata_cadastro_caixa.AsDateTime := Now;
  end;

  // Receber dados do Caixa
  DMcaixa.cdscaixanumero_doc.AsString := Trim(editNumeroDocumento.Text);
  DMcaixa.cdsCaixadescricao.AsString := Trim(editDescricao.Text);
  DMcaixa.cdsCaixavalor.AsFloat := LValor;
  DMcaixa.cdsCaixatipo.AsString := LTipo;

  inherited;

end;

procedure TformCaixa.Pesquisar;
var
  FiltroPesquisa: string;
   FiltroTipo  : String;
begin
  case cbTipo.ItemIndex of
    1 : FiltroTipo := ' AND TIPO = ''R''';
    2 : FiltroTipo := ' AND TIPO = ''D''';
  end;

  FiltroPesquisa := TUtilitario.LikeFind(editPesquisar.Text, DBGrid1);

  DMcaixa.cdsCaixa.Close;

  DMcaixa.cdsCaixa.CommandText := 'SELECT * FROM caixa where 1 = 1' +
    FiltroPesquisa + FiltroTipo;

  DMcaixa.cdsCaixa.Open;
end;

end.
