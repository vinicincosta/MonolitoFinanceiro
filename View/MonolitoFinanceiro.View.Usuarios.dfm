inherited formUsuarios: TformUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlPrincipal: TCardPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 835
    ExplicitHeight = 534
    inherited cardCadastro: TCard
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 1
      object Label2: TLabel [0]
        Left = 40
        Top = 48
        Width = 54
        Height = 25
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel [1]
        Left = 40
        Top = 92
        Width = 51
        Height = 25
        Caption = 'Login'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel [2]
        Left = 40
        Top = 168
        Width = 55
        Height = 25
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited Panel1: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
      object status: TToggleSwitch
        Left = 120
        Top = 170
        Width = 147
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 1
      end
      object editNome: TEdit
        Left = 120
        Top = 40
        Width = 441
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object editLogin: TEdit
        Left = 120
        Top = 89
        Width = 329
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    inherited cardPesquisa: TCard
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 833
      ExplicitHeight = 532
      inherited pnlPesquisa: TPanel
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 833
        ExplicitHeight = 532
        inherited pnlPesquisar: TPanel
          StyleElements = [seFont, seClient, seBorder]
          ExplicitWidth = 833
          inherited Label1: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited btnPesquisar: TButton
            ExplicitLeft = 717
          end
          inherited editPesquisar: TEdit
            Text = ''
            StyleElements = [seFont, seClient, seBorder]
          end
        end
        inherited pnlbotoes: TPanel
          StyleElements = [seFont, seClient, seBorder]
          ExplicitTop = 440
          ExplicitWidth = 833
          inherited btnFechar: TButton
            ExplicitLeft = 717
          end
          inherited btnExcluir: TButton
            ExplicitLeft = 231
            ExplicitTop = 1
          end
        end
        inherited pnlGrid: TPanel
          StyleElements = [seFont, seClient, seBorder]
          ExplicitWidth = 833
          ExplicitHeight = 340
          inherited DBGrid1: TDBGrid
            DataSource = DataSource2
            PopupMenu = PopupMenu1
            Columns = <
              item
                Expanded = False
                FieldName = 'nome_usuario'
                Title.Caption = 'Nome'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = [fsBold]
                Width = 393
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'login'
                Title.Caption = 'Login'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = [fsBold]
                Width = 322
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'status'
                Title.Caption = 'Status'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = [fsBold]
                Width = 107
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 737
    Top = 283
  end
  inherited DataSource2: TDataSource
    Left = 737
  end
  object PopupMenu1: TPopupMenu
    Left = 737
    Top = 229
    object menuLimparSenha: TMenuItem
      Caption = 'Limpar Senha'
      OnClick = menuLimparSenhaClick
    end
  end
end
