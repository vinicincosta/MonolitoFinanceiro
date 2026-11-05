object DMusuarios: TDMusuarios
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object sqlUsuarios: TFDQuery
    Connection = DMconexao.SQLConexao
    Left = 80
    Top = 48
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 328
    Top = 48
    object cdsUsuariosnome_usuario: TStringField
      FieldName = 'nome_usuario'
    end
    object cdsUsuarioslogin: TStringField
      FieldName = 'login'
    end
    object cdsUsuariossenha: TStringField
      FieldName = 'senha'
      Size = 60
    end
    object cdsUsuariosstatus: TStringField
      FieldName = 'status'
      Size = 1
    end
    object cdsUsuariosdata_cadastro_usuario: TDateField
      FieldName = 'data_cadastro_usuario'
    end
    object cdsUsuariosid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object cdsUsuariossenha_temporaria: TStringField
      FieldName = 'senha_temporaria'
      Size = 1
    end
  end
  object dspUsuarios: TDataSetProvider
    DataSet = sqlUsuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 208
    Top = 48
  end
end
