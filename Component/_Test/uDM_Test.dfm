object DM: TDM
  OldCreateOrder = False
  Height = 351
  Width = 442
  object FDConn: TFDConnection
    Params.Strings = (
      
        'Database=C:\Temp\CriacaoComponentes\FireCRUD\Database\FireCRUD.s' +
        'qlite'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 184
    Top = 8
  end
  object FireCRUD1: TFireCRUD
    Connection = FDConn
    Left = 184
    Top = 64
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
