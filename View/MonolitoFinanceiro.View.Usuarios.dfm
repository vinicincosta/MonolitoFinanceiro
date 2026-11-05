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
      ExplicitWidth = 833
      ExplicitHeight = 532
      object Label2: TLabel [0]
        Left = 40
        Top = 48
        Width = 47
        Height = 21
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel [1]
        Left = 40
        Top = 82
        Width = 43
        Height = 21
        Caption = 'Login'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel [2]
        Left = 40
        Top = 136
        Width = 47
        Height = 21
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited Panel1: TPanel
        StyleElements = [seFont, seClient, seBorder]
        ExplicitTop = 440
        ExplicitWidth = 833
        inherited btnCancelar: TButton
          ExplicitLeft = 717
        end
        inherited btnSalvar: TButton
          Caption = 'dfdfd'
          ExplicitLeft = 602
        end
      end
      object status: TToggleSwitch
        Left = 120
        Top = 137
        Width = 130
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 1
      end
      object editNome: TEdit
        Left = 120
        Top = 50
        Width = 265
        Height = 23
        TabOrder = 2
      end
      object editLogin: TEdit
        Left = 120
        Top = 79
        Width = 201
        Height = 23
        TabOrder = 3
      end
    end
    inherited cardPesquisa: TCard
      StyleElements = [seFont, seClient, seBorder]
      inherited pnlPesquisa: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited pnlPesquisar: TPanel
          StyleElements = [seFont, seClient, seBorder]
          inherited Label1: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited editPesquisar: TEdit
            Text = ''
            StyleElements = [seFont, seClient, seBorder]
          end
        end
        inherited pnlbotoes: TPanel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited pnlGrid: TPanel
          StyleElements = [seFont, seClient, seBorder]
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
