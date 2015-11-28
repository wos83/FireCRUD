unit uFireCRUD_Test;

interface

uses
   System.SysUtils,
   System.Types,
   System.UITypes,
   System.Classes,
   System.Variants,
   FMX.Types,
   FMX.Controls,
   FMX.Forms,
   FMX.Graphics,
   FMX.Dialogs,
   FMX.Controls.Presentation,
   FMX.StdCtrls,
   FireCRUD,
   uGlobal,
   uDM_Test;

type
   TForm1 = class(TForm)
      Button1: TButton;
      procedure Button1Click(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
   crudSQL: TFireCRUD;
   iFields: integer;
begin
   crudSQL := TFireCRUD.Create(Self);

   try
      crudSQL.Connection := DM.FDConn;
      crudSQL.TableCRUD := 'TB_LOGIN';
      crudSQL.TypeCRUD := tcInsert;
      crudSQL.SetSQL;

      for iFields := 1 to crudSQL.FieldCount - 1 do
      begin
         crudSQL.Params.Add( //
            crudSQL.Fields[iFields].FieldName, //
            crudSQL.Fields[iFields].DataType //
            );
      end;

      if (crudSQL.ParamCount >= 0) then
      begin
         crudSQL.Params[0].Value := 'login';
         crudSQL.Params[1].Value := '1234';
         crudSQL.Params[2].Value := 'login@1234';
      end;

   finally

   end;

end;

end.
