object dm: Tdm
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object Database: TFDConnection
    Params.Strings = (
      'Database=vendas'
      'User_Name=sysdba'
      'Password=masterkey'
      'Server=localhost'
      'DriverID=MySQL')
    Left = 128
    Top = 104
  end
  object MySQLDriver: TFDPhysMySQLDriverLink
    Left = 128
    Top = 176
  end
end
