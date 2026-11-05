object DMcaixa: TDMcaixa
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object sqlCaixa: TFDQuery
    Connection = DMconexao.SQLConexao
    Left = 80
    Top = 56
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixa'
    Left = 328
    Top = 48
    object cdsCaixaid_caixa: TIntegerField
      FieldName = 'id_caixa'
    end
    object cdsCaixanumero_doc: TStringField
      FieldName = 'numero_doc'
    end
    object cdsCaixadescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object cdsCaixavalor: TFMTBCDField
      FieldName = 'valor'
      Size = 18
    end
    object cdsCaixatipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object cdsCaixadata_cadastro_caixa: TDateField
      FieldName = 'data_cadastro_caixa'
    end
  end
  object dspCaixa: TDataSetProvider
    DataSet = sqlCaixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 208
    Top = 48
  end
end
