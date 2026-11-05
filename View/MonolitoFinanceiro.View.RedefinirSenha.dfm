object formRedefinirSenha: TformRedefinirSenha
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'FormRedefinirSenha'
  ClientHeight = 442
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 442
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 521
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 710
      Height = 152
      Align = alTop
      BevelOuter = bvNone
      Padding.Top = 10
      TabOrder = 0
      ExplicitLeft = 10
      ExplicitWidth = 758
      object lbl: TLabel
        Left = 0
        Top = 81
        Width = 710
        Height = 45
        Align = alTop
        Alignment = taCenter
        Caption = 'Informe sua nova senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBackground
        Font.Height = -33
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ExplicitWidth = 370
      end
      object lblUsuario: TLabel
        Left = 0
        Top = 10
        Width = 710
        Height = 71
        Align = alTop
        Alignment = taCenter
        Caption = 'Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -53
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ExplicitWidth = 192
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 353
      Width = 710
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 80
      Padding.Right = 80
      TabOrder = 1
      ExplicitLeft = 10
      ExplicitTop = 456
      ExplicitWidth = 700
      object Panel2: TPanel
        Left = 80
        Top = 0
        Width = 550
        Height = 65
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitTop = 6
        ExplicitWidth = 540
        ExplicitHeight = 85
        object Panel4: TPanel
          Left = 240
          Top = 0
          Width = 310
          Height = 65
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitLeft = 246
          ExplicitWidth = 300
          ExplicitHeight = 168
          object btnCancelar: TButton
            Left = 70
            Top = 0
            Width = 240
            Height = 65
            Align = alRight
            Caption = 'Cancelar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnCancelarClick
            ExplicitLeft = 0
            ExplicitTop = 6
            ExplicitWidth = 184
            ExplicitHeight = 125
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 240
          Height = 65
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitHeight = 125
          object btnConfirmar: TButton
            Left = 0
            Top = 0
            Width = 240
            Height = 65
            Align = alLeft
            Caption = 'Confirmar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnConfirmarClick
            ExplicitTop = 6
            ExplicitWidth = 238
            ExplicitHeight = 119
          end
        end
      end
    end
    object pnlSenha: TPanel
      Left = 0
      Top = 152
      Width = 710
      Height = 89
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 50
      Padding.Right = 50
      TabOrder = 2
      ExplicitLeft = 10
      ExplicitWidth = 758
      object lblSenha: TLabel
        Left = 50
        Top = 0
        Width = 610
        Height = 28
        Align = alTop
        Caption = 'Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 53
      end
      object editSenha: TEdit
        Left = 50
        Top = 28
        Width = 610
        Height = 23
        Align = alTop
        PasswordChar = '*'
        TabOrder = 0
        StyleName = 'Windows'
        ExplicitLeft = 58
        ExplicitTop = 84
        ExplicitWidth = 658
      end
    end
    object pnlConfirmarSenha: TPanel
      Left = 0
      Top = 241
      Width = 710
      Height = 112
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 50
      Padding.Right = 50
      TabOrder = 3
      ExplicitLeft = 10
      ExplicitWidth = 700
      object lblConfirmarSenha: TLabel
        Left = 50
        Top = 0
        Width = 610
        Height = 28
        Align = alTop
        Caption = 'Confirme sua nova senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitTop = 28
        ExplicitWidth = 217
      end
      object editConfirmarSenha: TEdit
        Left = 50
        Top = 28
        Width = 610
        Height = 23
        Align = alTop
        PasswordChar = '*'
        TabOrder = 0
        ExplicitWidth = 658
      end
    end
  end
end
