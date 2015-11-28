object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 351
  Width = 442
  object FDConn: TFDConnection
    Params.Strings = (
      
        'Database=C:\Temp\CriacaoComponentes\FireCRUD\Component\_Test\Bin' +
        '\FireCRUD.sqlite'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FDConnBeforeConnect
    Left = 184
    Top = 8
  end
  object FireCRUD: TFireCRUD
    Connection = FDConn
    SQL.Strings = (
      'select * from tb_login')
    Left = 184
    Top = 64
    object FireCRUDID_LOGIN: TFDAutoIncField
      FieldName = 'ID_LOGIN'
      Origin = 'ID_LOGIN'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FireCRUDDS_LOGIN: TStringField
      FieldName = 'DS_LOGIN'
      Origin = 'DS_LOGIN'
    end
    object FireCRUDDS_PWD: TStringField
      FieldName = 'DS_PWD'
      Origin = 'DS_PWD'
      Size = 10
    end
    object FireCRUDDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      Origin = 'DS_EMAIL'
      Size = 254
    end
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 56
    Top = 8
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 56
    Top = 56
  end
  object FDStanStorageJSONLink: TFDStanStorageJSONLink
    Left = 56
    Top = 104
  end
  object FDStanStorageBinLink: TFDStanStorageBinLink
    Left = 56
    Top = 152
  end
  object FDStanStorageXMLLink: TFDStanStorageXMLLink
    Left = 56
    Top = 200
  end
end
