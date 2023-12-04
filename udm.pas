unit udm;

interface

uses
  vcl.Forms, system.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL;

type
  Tdm = class(TDataModule)
    Database: TFDConnection;
    MySQLDriver: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses Inifiles;

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  FArquivo: TIniFile;
begin
  FArquivo := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'IniFiles\FDCon.INI');
  try
    try

      MySQLDriver.VendorLib := ExtractFilePath(Application.ExeName) + FArquivo.ReadString('BANCO','PATH_DLL','');

      Database.Params.Clear;
      Database.Params.Add('Database=' + FArquivo.ReadString('BANCO', 'DATABASE', ''));
      Database.Params.Add('User_Name=' + FArquivo.ReadString('BANCO', 'USERNAME', ''));
      Database.Params.Add('Server=' + FArquivo.ReadString('BANCO', 'SERVER', ''));
      Database.Params.Add('Port=' + FArquivo.ReadString('BANCO', 'PORT', ''));
      Database.Params.Add('Password=' + FArquivo.ReadString('BANCO', 'PASSWORD', ''));

      Database.DriverName := 'MySQL';
      Database.Connected := True;


    except
      on E: Exception do
      begin

        raise EXCEPTION.Create(E.Message);
      end;
    end;

  finally
    FArquivo.Free;
  end;

end;















end.
