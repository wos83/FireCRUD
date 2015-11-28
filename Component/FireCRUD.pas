unit FireCRUD;

interface

uses
   System.SysUtils,
   System.Classes,
   Data.DB,
   FireDAC.Comp.DataSet,
   FireDAC.Comp.Client;

type
   { todo: Tipos de CRUD }
   CRUD = (tcNone, tcInsert, tcUpdate, tcDelete);

   { todo: Classe do CRUD }
   TFireCRUD = class(TFDQuery)
   private
      { todo: Variáveis auxiliares da classe }
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
      { todo: Propriedades do CRUD na IDE (Object Inspector) }
      property TypeCRUD: CRUD read FTypeCRUD write FTypeCRUD default tcNone;
      property TableCRUD: string read FTable write FTable;
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
   strGetFieldNames: string;
begin
   Self.Table.Name := Self.TableCRUD;

   Self.GetFieldNames(slFields);
   strGetFieldNames := slFields.Text;
   slFields.SaveToFile('GetFieldNames.txt');

   case FTypeCRUD of
      tcNone:
         begin
            FSQL := '';
         end;
      tcInsert:
         begin
            FSQL := '';
         end;

      tcUpdate:
         begin
            FSQL := '';
         end;

      tcDelete:
         begin
            FSQL := '';
         end;
   end;
end;

end.
