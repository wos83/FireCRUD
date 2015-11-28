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
   FireDAC.Comp.UI;

type
   TDM = class(TDataModule)
      FDConn: TFDConnection;
      FireCRUD1: TFireCRUD;
      FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
      FDGUIxWaitCursor: TFDGUIxWaitCursor;
      FDStanStorageJSONLink: TFDStanStorageJSONLink;
      FDStanStorageBinLink: TFDStanStorageBinLink;
      FDStanStorageXMLLink: TFDStanStorageXMLLink;
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

end.
