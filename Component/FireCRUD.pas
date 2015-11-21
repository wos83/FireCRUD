unit FireCRUD;

interface

uses
   System.SysUtils,
   System.Classes,
   Data.DB,
   FireDAC.Comp.DataSet,
   FireDAC.Comp.Client;

type
   CRUD = (None, Insert, Update, Delete);

   TFireCRUD = class(TFDQuery)
   private
      FTypeCRUD: CRUD;
      FTable: string;
      FKey: integer;
      FSQL: string;
      { Private declarations }
   protected
      function Executed: Boolean;
      { Protected declarations }
   public
      constructor Create(AOwner: TComponent); override;
      { Public declarations }
   published
      property TypeCRUD: CRUD read FTypeCRUD write FTypeCRUD default None;
      property TableCRUD: string read FTable write FTable default EmptyStr;
      { Published declarations }
   end;

procedure Register;

implementation

procedure Register;
begin
   RegisterComponents('Training', [TFireCRUD]);
end;

{ TFireCRUD }

constructor TFireCRUD.Create(AOwner: TComponent);
begin
   inherited;
   Self.Close;
   Self.SQL.Text := EmptyStr;
end;

function TFireCRUD.Executed: Boolean;
var
   slFields: TStringList;
begin
   Self.Table.Name := Self.TableCRUD;

   Self.GetFieldNames(slFields);

   case FTypeCRUD of
      Insert:
         begin
            FSQL := '';
         end;

      Update:
         begin
            FSQL := '';
         end;

      Delete:
         begin
            FSQL := '';
         end;
   end;
end;

end.