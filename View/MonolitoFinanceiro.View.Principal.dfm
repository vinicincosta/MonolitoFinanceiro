object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'MonolitoFinanceiro'
  ClientHeight = 600
  ClientWidth = 1058
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 551
    Width = 1058
    Height = 49
    Panels = <
      item
        Width = 300
      end
      item
        Width = 300
      end>
    ExplicitTop = 544
    ExplicitWidth = 1063
  end
  object MainMenu1: TMainMenu
    Left = 184
    Top = 48
    object MenuCadastros: TMenuItem
      Caption = 'Cadastros'
      object menuUsuarios: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = menuUsuariosClick
      end
    end
    object Financeiro1: TMenuItem
      Caption = 'Financeiro'
      object caixa1: TMenuItem
        Caption = 'Caixa'
        OnClick = caixa1Click
      end
    end
    object menuRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
    end
    object menuAjuda: TMenuItem
      Caption = 'Ajuda'
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 960
    Top = 312
  end
end
