object DM: TDM
  OldCreateOrder = False
  Left = 227
  Top = 132
  Height = 241
  Width = 157
  object ZCon1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    TransactIsolationLevel = tiReadCommitted
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'projetofinal'
    User = 'root'
    Protocol = 'mysql-4.1'
    Left = 24
    Top = 8
  end
  object ZQuery1: TZQuery
    Connection = ZCon1
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIO;')
    Params = <>
    Left = 24
    Top = 56
  end
  object DS1: TDataSource
    DataSet = ZQuery1
    Left = 24
    Top = 104
  end
end
