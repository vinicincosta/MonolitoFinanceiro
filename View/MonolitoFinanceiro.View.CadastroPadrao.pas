
unit MonolitoFinanceiro.View.CadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Datasnap.DBClient,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.WinXPanels, Vcl.WinXCtrls, Vcl.Menus;

type
  TformCadastroPadrao = class(TForm)
    ImageList1: TImageList;
    pnlPrincipal: TCardPanel;
    cardCadastro: TCard;
    cardPesquisa: TCard;
    pnlPesquisa: TPanel;
    pnlPesquisar: TPanel;
    Label1: TLabel;
    btnPesquisar: TButton;
    pnlbotoes: TPanel;
    btnFechar: TButton;
    btnIncluir: TButton;
    btnImprimir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    pnlGrid: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    DataSource2: TDataSource;
    editPesquisar: TEdit;

    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

  private
    procedure HabilitarBotoes;
    procedure LimparCampos;

  protected
    procedure Pesquisar; virtual;

  public
  end;

var
  formCadastroPadrao: TformCadastroPadrao;

implementation

{$R *.dfm}

procedure TformCadastroPadrao.btnAlterarClick(Sender: TObject);
begin
  if (DataSource2.DataSet = nil) or
     DataSource2.DataSet.IsEmpty then
    Exit;

  TClientDataSet(DataSource2.DataSet).Edit;

  pnlPrincipal.ActiveCard := cardCadastro;
end;

procedure TformCadastroPadrao.btnCancelarClick(Sender: TObject);
begin
  if (DataSource2.DataSet <> nil) and
     (DataSource2.DataSet.State in [dsInsert, dsEdit, dsInsert]) then
    DataSource2.DataSet.Cancel;

  pnlPrincipal.ActiveCard := cardPesquisa;

  Pesquisar;
end;

procedure TformCadastroPadrao.btnExcluirClick(Sender: TObject);
begin
  if (DataSource2.DataSet = nil) or
     DataSource2.DataSet.IsEmpty then
    Exit;

  if Application.MessageBox(
    'Deseja realmente excluir o registro?',
    'Confirmação',
    MB_YESNO + MB_ICONQUESTION
  ) <> IDYES then
    Exit;

  try
    TClientDataSet(DataSource2.DataSet).Delete;

    if TClientDataSet(DataSource2.DataSet).ApplyUpdates(0) > 0 then
      raise Exception.Create('Não foi possível excluir o registro.');

    Application.MessageBox(
      'Registro excluído com sucesso.',
      'Atenção',
      MB_OK + MB_ICONINFORMATION
    );

    Pesquisar;

  except
    on E: Exception do
      Application.MessageBox(
        PChar('Erro ao excluir o registro: ' + E.Message),
        'Atenção',
        MB_OK + MB_ICONERROR
      );
  end;
end;

procedure TformCadastroPadrao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformCadastroPadrao.btnIncluirClick(Sender: TObject);
begin
  LimparCampos;

  pnlPrincipal.ActiveCard := cardCadastro;

  TClientDataSet(DataSource2.DataSet).Insert;
end;

procedure TformCadastroPadrao.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TformCadastroPadrao.btnSalvarClick(Sender: TObject);
var
  Mensagem: string;
  CDS: TClientDataSet;
begin
  CDS := TClientDataSet(DataSource2.DataSet);

  if CDS.State in [dsInsert, dsEdit] then
    CDS.Post;

  if CDS.ApplyUpdates(0) > 0 then
    raise Exception.Create('Não foi possível gravar o registro.');

  if CDS.ChangeCount = 0 then
    Mensagem := 'Registro salvo com sucesso.'
  else
    Mensagem := 'Registro salvo. Verifique as alterações pendentes.';

  Application.MessageBox(
    PChar(Mensagem),
    'Atenção',
    MB_OK + MB_ICONINFORMATION
  );

  Pesquisar;

  pnlPrincipal.ActiveCard := cardPesquisa;
end;

procedure TformCadastroPadrao.FormShow(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := cardPesquisa;

  Pesquisar;

  HabilitarBotoes;
end;

procedure TformCadastroPadrao.HabilitarBotoes;
begin
  if (DataSource2.DataSet = nil) then
    Exit;

  btnExcluir.Enabled := not DataSource2.DataSet.IsEmpty;
  btnAlterar.Enabled := not DataSource2.DataSet.IsEmpty;
end;

procedure TformCadastroPadrao.LimparCampos;
var
  Contador: Integer;
begin
  for Contador := 0 to Pred(ComponentCount) do
  begin
    if Components[Contador] is TCustomEdit then
    begin
       TCustomEdit(Components[Contador]).Clear
    end

    // Limpando o campo do TToggleSwitch do Form Usuários, do campo Tipo;
    else if Components[Contador] is TToggleSwitch then
    begin
       TToggleSwitch(Components[Contador]).State := tssOn
    end

    // Limpando o campo do Radio group do Form Caixa, do campo Tipo;
    else if Components[Contador] is TRadioGroup then
    begin
       TRadioGroup(Components[Contador]).ItemIndex := -1;
    end



  end;
end;

procedure TformCadastroPadrao.Pesquisar;
begin
  // Método virtual.
  // Cada formulário filho implementa sua própria pesquisa.
end;

end.

