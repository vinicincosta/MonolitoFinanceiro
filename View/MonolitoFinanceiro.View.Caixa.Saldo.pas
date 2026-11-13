unit MonolitoFinanceiro.View.Caixa.Saldo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.DateUtils, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.WinXPanels, Vcl.ComCtrls, System.ImageList, Vcl.ImgList,
  MonolitoFinanceiro.Model.Entidades.CaixaResumo,
  MonolitoFinanceiro.Model.Caixa;

type
  TformCaixaSaldo = class(TForm)
    pnlPrincipal: TPanel;
    pnlPesquisar: TPanel;
    pnlContent: TPanel;
    lblDataInicial: TLabel;
    Button1: TButton;
    ImageList1: TImageList;
    dateInicio: TDateTimePicker;
    dateFim: TDateTimePicker;
    Label2: TLabel;
    StackPanel1: TStackPanel;
    Panel1: TPanel;
    lblSaldoFinaltext: TLabel;
    lblSaldoFinal: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblSaldoParcialtext: TLabel;
    lblSaldoParcial: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    lblTotalSaidastext: TLabel;
    lblTotalSaidas: TLabel;
    Panel7: TPanel;
    lblTotalEntradastext: TLabel;
    lblTotalEntradas: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    lblSaldoInicialtext: TLabel;
    lblSaldoInicial: TLabel;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    pnlTotalSaidas: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure pesquisar;
  public
    { Public declarations }
  end;

var
  formCaixaSaldo: TformCaixaSaldo;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Utilitarios;
{ TformCaixaSaldo }

procedure TformCaixaSaldo.Button1Click(Sender: TObject);
begin
  pesquisar;
end;

procedure TformCaixaSaldo.FormShow(Sender: TObject);
begin

  // pesquisar pelo os útlimos 7 dias como padrão
  dateinicio.Date := IncDay(Now, -7);
  pesquisar;
end;

procedure TformCaixaSaldo.pesquisar;
var
  ResumoCaixa: TModelResumoCaixa;
begin
  lblSaldoInicial.Caption := '';
  lblTotalEntradas.Caption := '';
  lblTotalSaidas.Caption := '';
  lblSaldoParcial.Caption := '';
  lblSaldoFinal.Caption := '';

  ResumoCaixa := DMcaixa.ResumoCaixa(dateInicio.Date, dateFim.Date);
  try
  lblSaldoInicial.Caption := TUtilitario.FormatoMoeda(ResumoCaixa.SaldoInicial);
  lblTotalEntradas.Caption := TUtilitario.FormatoMoeda(ResumoCaixa.TotalEntradas);
  lblTotalSaidas.Caption := TUtilitario.FormatoMoeda(ResumoCaixa.TotalSaidas);
  lblSaldoParcial.Caption := TUtilitario.FormatoMoeda(ResumoCaixa.SaldoParcial);
  lblSaldoFinal.Caption := TUtilitario.FormatoMoeda(ResumoCaixa.SaldoFinal);

  finally ResumoCaixa.Free; end;

  end;

  end.
