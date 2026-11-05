object DMconexao: TDMconexao
  OnCreate = DataModuleCreate
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object SQLConexao: TFDConnection
    Params.Strings = (
      'Database=mydb'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 184
    Top = 96
  end
end
