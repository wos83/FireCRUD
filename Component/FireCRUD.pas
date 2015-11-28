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
      { todo: Variáveis auxiliares da classe }
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
   FSQL := Format('SELECT * FROM %s LIMIT 1', [Self.TableCRUD]);
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
            {$REGION 'tcInsert'}
            // FSQL := 'INSERT INTO ' + Self.TableCRUD + '(';
            FSQL := Format('INSERT INTO %s (', [Self.TableCRUD]);

            { todo: Recupera os campos da tabela }
            for i := 1 to SL.Count - 1 do
            begin
               // FSQL := FSQL + SL[i] + ', ';
               FSQL := FSQL + Format('%s, ', [SL[i]]);
            end;

            FSQL := Copy(FSQL, 1, Length(FSQL) - 2) + ') VALUES (';

            { todo: Monta os parametros da tabela }
            for i := 1 to SL.Count - 1 do
            begin
               // FSQL := FSQL + ':' + SL[i] + ', ';
               FSQL := FSQL + Format(':%s, ', [SL[i]]);
            end;

            FSQL := Copy(FSQL, 1, Length(FSQL) - 2) + ')';

            {$IFDEF DEBUG}
            SL.Text := FSQL;
            SL.SaveToFile('CRUD_Insert.sql');
            {$ENDIF}
            {$ENDREGION}
         end;

      tcUpdate:
         begin
            {$REGION 'tcUpdate'}
            FSQL := Format('UPDATE %s SET ', [Self.TableCRUD]);

            for i := 1 to SL.Count - 1 do
            begin
               // FSQL := FSQL + SL[i] + ' = :' + SL[i] + ', ';
               FSQL := FSQL + Format('%s = :%s, ', [SL[i]]);
            end;

            FSQL := Copy(FSQL, 1, Length(FSQL) - 2);
            // FSQL := FSQL + ' WHERE ' + SL[0] + ' = :' + SL[0];
            FSQL := FSQL + Format('WHERE %s = :%s, ', [SL[0]]);

            {$IFDEF DEBUG}
            SL.Text := FSQL;
            SL.SaveToFile('CRUD_Update.sql');
            {$ENDIF}
            {$ENDREGION}
         end;

      tcDelete:
         begin
            FSQL := Format('DELETE FROM %s ', [Self.TableCRUD]);
            // FSQL := FSQL + ' WHERE ' + SL[0] + ' = :' + SL[0];
            FSQL := FSQL + Format('WHERE %s = :%s, ', [SL[0]]);

            {$IFDEF DEBUG}
            SL.Text := FSQL;
            SL.SaveToFile('CRUD_Delete.sql');
            {$ENDIF}
         end;
   end;

   { todo: Configura a instrução SQL }
   Self.SQL.Text := FSQL;
end;

end.
