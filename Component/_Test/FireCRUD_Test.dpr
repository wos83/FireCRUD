program FireCRUD_Test;

uses
  System.StartUpCopy,
  FMX.Forms,
  uGlobal in '..\uGlobal.pas',
  uDM_Test in 'uDM_Test.pas' {DM: TDataModule},
  uFireCRUD_Test in 'uFireCRUD_Test.pas' {frmFireCRUD_Teste};

{$R *.res}

begin
   Application.Initialize;
   Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmFireCRUD_Teste, frmFireCRUD_Teste);
  Application.Run;

end.
