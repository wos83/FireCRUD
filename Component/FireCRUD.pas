unit FireCRUD;

interface

uses
   System.SysUtils,
   System.Classes,
   Data.DB,
   FireDAC.Comp.DataSet,
   FireDAC.Comp.Client,
   uGlobal;

type
   { todo: Classe do CRUD }
   TFireCRUD = class(TFDQuery)
   private
      { todo: Vari�veis auxiliares da classe }
      FTypeCRUD: CRUD;
      FTable: string;
      FKey: integer;
      FSQL: string;
      { Private declarations }
   protected
      { Protected declarations }
   public
      constructor Create(AOwner: TComponent); override;
      procedure SetSQL;
      { Public declarations }
   published
      { todo: Propriedades do CRUD na IDE (Object Inspector) }
      property TypeCRUD: CRUD read FTypeCRUD write FTypeCRUD default tcNone;
      property TableCRUD: string read FTable write FTable;
      { Published declarations }
   end;

procedure Register;

implementation

function GetUTC: string;
begin
   Result := FormatDateTime('yyyymmddhhnnsszzz', Now);
end;

procedure Register;
begin
   RegisterComponents('Training', [TFireCRUD]);
end;

{ TFireCRUD }

constructor TFireCRUD.Create(AOwner: TComponent);
begin
   inherited;
   Self.Name := 'fireCRUD_' + GetUTC;
   Self.Close;
   Self.SQL.Text := EmptyStr;
end;

procedure TFireCRUD.SetSQL;
var
   SL: TStringList;
   i: integer;
begin
   FSQL := Format('SELECT * FROM %s ', [Self.TableCRUD]);
   Self.Open(FSQL);

   SL := TStringList.Create;

   try
      Self.GetFieldNames(SL);
      {$IFDEF DEBUG}
      SL.SaveToFile('GetFieldNames.txt');
      {$ENDIF}
   finally

   end;

   case FTypeCRUD of
      tcNone:
         begin
            FSQL := Format('SELECT * FROM %s ', [Self.TableCRUD]);
         end;
      tcInsert:
         begin
            FSQL := 'INSERT INTO ' + Self.TableCRUD + '(';

            { todo: Recupera os campos da tabela }
            for i := 1 to SL.Count - 1 do
            begin
               FSQL := FSQL + SL[i] + ', ';
            end;

            FSQL := Copy(FSQL, 1, Length(FSQL) - 2) + ') VALUES (';

            { todo: Monta os parametros da tabela }
            for i := 1 to SL.Count - 1 do
            begin
               FSQL := FSQL + ':' + SL[i] + ', ';
            end;

            FSQL := Copy(FSQL, 1, Length(FSQL) - 2) + ')';

            {$IFDEF DEBUG}
            SL.Text := FSQL;
            SL.SaveToFile('CRUD_Insert.sql');
            {$ENDIF}
         end;

      tcUpdate:
         begin
            //FSQL := Format('UPDATE %s SET ', [Self.TableCRUD]);

         end;

      tcDelete:
         begin
            Format('DELETE FROM %s ', [Self.TableCRUD]);
         end;
   end;

   { todo: Configura a instru��o SQL }
   Self.SQL.Text := FSQL;
end;

end.
