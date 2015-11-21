program FireCRUD_Test;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFireCRUD_Test in 'uFireCRUD_Test.pas' {Form1},
  uDM_Test in 'uDM_Test.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
