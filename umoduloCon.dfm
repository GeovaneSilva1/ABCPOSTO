object dmControl: TdmControl
  OldCreateOrder = False
  Height = 292
  Width = 345
  object postoabc: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      
        'Database=C:\Users\qualvisual18\Documents\Portfolio\Postoabc\banc' +
        'osqlite\postoabc.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 144
    Top = 8
  end
  object tbTanques: TFDTable
    Active = True
    IndexFieldNames = 'bdCodTanque'
    Connection = postoabc
    UpdateOptions.UpdateTableName = 'tTanques'
    TableName = 'tTanques'
    Left = 64
    Top = 94
    object tbTanquesbdCodTanque: TIntegerField
      FieldName = 'bdCodTanque'
      Origin = 'bdCodTanque'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbTanquesbdTipoCombustivel: TStringField
      FieldName = 'bdTipoCombustivel'
      Origin = 'bdTipoCombustivel'
      Size = 40
    end
    object tbTanquesbdQtdLitros: TBCDField
      FieldName = 'bdQtdLitros'
      Origin = 'bdQtdLitros'
      Precision = 15
      Size = 2
    end
  end
  object dsTanques: TDataSource
    DataSet = tbTanques
    Left = 64
    Top = 166
  end
  object tbBombas: TFDTable
    Active = True
    IndexFieldNames = 'bdCodBomba'
    Connection = postoabc
    UpdateOptions.UpdateTableName = 'tBombas'
    TableName = 'tBombas'
    Left = 144
    Top = 94
    object tbBombasbdCodBomba: TIntegerField
      FieldName = 'bdCodBomba'
      Origin = 'bdCodBomba'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbBombastTanques_bdCodTanque: TIntegerField
      FieldName = 'tTanques_bdCodTanque'
      Origin = 'tTanques_bdCodTanque'
      Required = True
    end
  end
  object dsBombas: TDataSource
    DataSet = tbBombas
    Left = 144
    Top = 166
  end
  object tbAbastecimentos: TFDTable
    Active = True
    IndexFieldNames = 'bdCodAbastecimento'
    Connection = postoabc
    UpdateOptions.UpdateTableName = 'tAbastecimentos'
    TableName = 'tAbastecimentos'
    Left = 229
    Top = 96
    object tbAbastecimentosbdCodAbastecimento: TIntegerField
      FieldName = 'bdCodAbastecimento'
      Origin = 'bdCodAbastecimento'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbAbastecimentosbdData: TDateField
      FieldName = 'bdData'
      Origin = 'bdData'
    end
    object tbAbastecimentostBombas_bdCodBomba: TIntegerField
      FieldName = 'tBombas_bdCodBomba'
      Origin = 'tBombas_bdCodBomba'
      Required = True
    end
    object tbAbastecimentosbdQtdLitros: TBCDField
      FieldName = 'bdQtdLitros'
      Origin = 'bdQtdLitros'
      Precision = 15
      Size = 2
    end
    object tbAbastecimentosbdValorAbastecido: TBCDField
      FieldName = 'bdValorAbastecido'
      Origin = 'bdValorAbastecido'
      Precision = 15
      Size = 2
    end
    object tbAbastecimentosbdImposto: TBCDField
      FieldName = 'bdImposto'
      Origin = 'bdImposto'
      Precision = 15
      Size = 2
    end
  end
  object dsAbastecimentos: TDataSource
    DataSet = tbAbastecimentos
    Left = 229
    Top = 168
  end
end
