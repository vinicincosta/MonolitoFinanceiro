inherited formCaixa: TformCaixa
  Caption = 'Caixa'
  ClientHeight = 564
  ClientWidth = 902
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 918
  ExplicitHeight = 603
  TextHeight = 15
  inherited pnlPrincipal: TCardPanel
    Width = 902
    Height = 564
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 900
    ExplicitHeight = 556
    inherited cardCadastro: TCard
      Width = 900
      Height = 562
      Font.Style = [fsBold]
      ParentFont = False
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 900
      ExplicitHeight = 562
      object Label2: TLabel [0]
        Left = 40
        Top = 50
        Width = 159
        Height = 25
        Caption = 'N'#250'm. Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel [1]
        Left = 40
        Top = 81
        Width = 85
        Height = 25
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel [2]
        Left = 40
        Top = 116
        Width = 47
        Height = 25
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited Panel1: TPanel
        Top = 470
        Width = 900
        StyleElements = [seFont, seClient, seBorder]
        ExplicitTop = 470
        ExplicitWidth = 900
        inherited btnCancelar: TButton
          Left = 784
          ExplicitLeft = 784
        end
        inherited btnSalvar: TButton
          Left = 669
          ExplicitLeft = 669
        end
      end
      object editNumeroDocumento: TEdit
        Left = 216
        Top = 50
        Width = 385
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object editDescricao: TEdit
        Left = 216
        Top = 84
        Width = 385
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object RadioGroup1: TRadioGroup
        Left = 24
        Top = 177
        Width = 577
        Height = 72
        Caption = 'Tipo'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Items.Strings = (
          'Receita'
          'Despesa')
        ParentFont = False
        TabOrder = 3
      end
      object editValor: TEdit
        Left = 217
        Top = 119
        Width = 385
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
    inherited cardPesquisa: TCard
      Width = 900
      Height = 562
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 898
      ExplicitHeight = 554
      inherited pnlPesquisa: TPanel
        Width = 900
        Height = 562
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 898
        ExplicitHeight = 554
        inherited pnlPesquisar: TPanel
          Width = 900
          StyleElements = [seFont, seClient, seBorder]
          ExplicitWidth = 898
          inherited Label1: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          object Label4: TLabel [1]
            Left = 432
            Top = 19
            Width = 30
            Height = 21
            Caption = 'Tipo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          inherited btnPesquisar: TButton
            Left = 784
            ExplicitLeft = 782
          end
          inherited editPesquisar: TEdit
            Text = ''
            StyleElements = [seFont, seClient, seBorder]
          end
          object cbTipo: TComboBox
            Left = 432
            Top = 46
            Width = 225
            Height = 23
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 2
            Text = 'TODOS'
            Items.Strings = (
              'TODOS'
              'RECEITAS'
              'DESPESAS')
          end
        end
        inherited pnlbotoes: TPanel
          Top = 470
          Width = 900
          StyleElements = [seFont, seClient, seBorder]
          ExplicitTop = 462
          ExplicitWidth = 898
          inherited btnFechar: TButton
            Left = 784
            ExplicitLeft = 782
          end
        end
        inherited pnlGrid: TPanel
          Width = 900
          Height = 370
          StyleElements = [seFont, seClient, seBorder]
          ExplicitWidth = 898
          ExplicitHeight = 362
          inherited DBGrid1: TDBGrid
            Width = 898
            Height = 368
            DataSource = DataSource2
            Columns = <
              item
                Expanded = False
                FieldName = 'numero_doc'
                Title.Caption = 'N'#250'mero Doc.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = []
                Width = 124
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descricao'
                Title.Caption = 'Descri'#231#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = []
                Width = 333
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Title.Caption = 'Valor'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = []
                Width = 121
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tipo'
                Title.Caption = 'Tipo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = []
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'data_cadastro_caixa'
                Title.Caption = 'Data Cadastro'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -15
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = []
                Width = 164
                Visible = True
              end>
          end
        end
      end
    end
  end
end
