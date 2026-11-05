unit MonolitoFInanceiro.View.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls;

type
  TformSplash = class(TForm)
    pnlPrincipal: TPanel;
    lblAplicacao: TLabel;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Panel1: TPanel;
    lblStatus: TLabel;
    Image1: TImage;
    imgDll: TImage;
    imgBandoDeDados: TImage;
    imgIniciando: TImage;
    imgConfiguracoes: TImage;
    procedure Timer1Timer(Sender: TObject);
  private
    procedure atualizarStatus (Mensagem : String; Imagem : TImage);

  public
    { Public declarations }
  end;

var
  formSplash: TformSplash;

implementation

{$R *.dfm}

procedure TformSplash.atualizarStatus(Mensagem: String; Imagem: TImage);
begin
  lblStatus.Caption := Mensagem;
  Imagem.Visible := True;
end;

procedure TformSplash.Timer1Timer(Sender: TObject);
begin
  if ProgressBar1.Position <= 100 then
  begin
      ProgressBar1.StepIt;
      case ProgressBar1.Position of
          10 : atualizarStatus('Caregando dependência....', imgDll);
          25 : atualizarStatus( 'Conectando ao Banco de dados....', imgBandoDeDados);
          45 : atualizarStatus('Caregando informações....', imgConfiguracoes);
          75 : atualizarStatus( 'Iniciando o sistema....', imgIniciando);
      end;
  end;
  if ProgressBar1.Position = 100 then
    begin
      close;
    end;


end;

end.
