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
    Connected = True
    Left = 128
    Top = 104
  end
  object MySQLDriver: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Users\Administrator\Desktop\Teste WK\libmysql.dll'
    Left = 128
    Top = 176
  end
end
