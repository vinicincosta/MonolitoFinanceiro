object formCaixaSaldo: TformCaixaSaldo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Caixa saldo'
  ClientHeight = 522
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 838
    Height = 522
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 96
    ExplicitTop = 72
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 836
      Height = 112
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pnlPesquisar'
      TabOrder = 0
      ExplicitTop = -5
    end
    object Panel2: TPanel
      Left = 1
      Top = 113
      Width = 836
      Height = 408
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlContent'
      TabOrder = 1
      ExplicitLeft = 232
      ExplicitTop = 344
      ExplicitWidth = 185
      ExplicitHeight = 41
    end
  end
end
