unit uDM_Test;

interface

uses
   System.SysUtils,
   System.Classes,
   FireDAC.Stan.Intf,
   FireDAC.Stan.Option,
   FireDAC.Stan.Param,
   FireDAC.Stan.Error,
   FireDAC.DatS,
   FireDAC.Phys.Intf,
   FireDAC.DApt.Intf,
   FireDAC.Stan.Async,
   FireDAC.DApt,
   FireDAC.UI.Intf,
   FireDAC.Stan.Def,
   FireDAC.Stan.Pool,
   FireDAC.Phys,
   FireDAC.Phys.SQLite,
   FireDAC.Phys.SQLiteDef,
   FireDAC.Stan.ExprFuncs,
   Data.DB,
   FireDAC.Comp.Client,
   FireDAC.Comp.DataSet,
   FireCRUD,
   FireDAC.FMXUI.Wait,
   FireDAC.Stan.StorageXML,
   FireDAC.Stan.StorageBin,
   FireDAC.Stan.StorageJSON,
   FireDAC.Comp.UI,
   System.IOUtils;

type
   TDM = class(TDataModule)
      FDConn: TFDConnection;
      FireCRUD: TFireCRUD;
      FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
      FDGUIxWaitCursor: TFDGUIxWaitCursor;
      FDStanStorageJSONLink: TFDStanStorageJSONLink;
      FDStanStorageBinLink: TFDStanStorageBinLink;
      FDStanStorageXMLLink: TFDStanStorageXMLLink;
    FireCRUDID_LOGIN: TFDAutoIncField;
    FireCRUDDS_LOGIN: TStringField;
    FireCRUDDS_PWD: TStringField;
    FireCRUDDS_EMAIL: TStringField;
      procedure DataModuleCreate(Sender: TObject);
      procedure FDConnBeforeConnect(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   DM: TDM;

implementation

{ %CLASSGROUP 'FMX.Controls.TControl' }

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
   {$IFDEF DEBUG}
   FireCRUD.Close;
   FireCRUD.SQL.Text := 'SELECT * FROM TB_LOGIN';
   FireCRUD.Open;
   FireCRUD.SaveToFile('TB_LOGIN.json', sfJSON);
   {$ENDIF}
end;

procedure TDM.FDConnBeforeConnect(Sender: TObject);
var
   strConn: string;
begin
   { todo: Caminho da base quando for Windows }
   {$IFDEF MSWINDOWS}
   strConn := //
      System.IOUtils.TPath.Combine( //
      ExtractFilePath(ParamStr(0)), 'FireCRUD.sqlite');
   {$ENDIF}
   //
   { todo: Caminho da base quando for Mobile }
   {$IFDEF ANDROID OR IOS}
   strConn := //
      System.IOUtils.TPath.Combine( //
      System.IOUtils.TPath.GetDocumentsPath, 'FireCRUD.sqlite');
   {$ENDIF}
   //
   { todo: Configura o caminho da base SQLite }
   FDConn.Params.Values['Database'] := strConn;
end;

end.
