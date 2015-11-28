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
   FireDAC.Comp.Client,
   FireCRUD,
   uGlobal,
   uDM_Test,
   FMX.TabControl,
   FMX.Edit,
   FMX.ListView.Types,
   FMX.ListView,
   Data.Bind.Components,
   Data.Bind.DBScope,
   System.Rtti,
   System.Bindings.Outputs,
   FMX.Bind.Editors,
   Data.Bind.EngExt,
   FMX.Bind.DBEngExt;

type
   TfrmFireCRUD_Teste = class(TForm)
      tbcCRUD: TTabControl;
      tbiInsert: TTabItem;
      tbiUpdate: TTabItem;
      lblDS_LOGIN_Ins: TLabel;
      edtDS_LOGIN_Ins: TEdit;
      tlbCRUD: TToolBar;
      btnCRUD: TButton;
      tbiSelect: TTabItem;
      lblDS_SENHA_Ins: TLabel;
      edtDS_SENHA_Ins: TEdit;
      swtDS_SENHA_Ins: TSwitch;
      edtDS_LOGIN_Upd: TEdit;
      edtDS_SENHA_Upd: TEdit;
      swtDS_SENHA_Upd: TSwitch;
      lblDS_LOGIN_Upd: TLabel;
      lblDS_SENHA_Upd: TLabel;
      lblCRUD: TLabel;
      lstvCRUD: TListView;
      bsCRUD: TBindSourceDB;
      blCRUD: TBindingsList;
      lnkCRUD: TLinkListControlToField;
      procedure edtDS_LOGIN_InsTyping(Sender: TObject);
      procedure btnCRUDClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure swtDS_SENHA_InsClick(Sender: TObject);
      procedure edtDS_LOGIN_UpdTyping(Sender: TObject);
      procedure swtDS_SENHA_UpdClick(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   frmFireCRUD_Teste: TfrmFireCRUD_Teste;

implementation

{$R *.fmx}

procedure TfrmFireCRUD_Teste.btnCRUDClick(Sender: TObject);
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

      { todo: Configura os valores aos parametros }
      if (crudSQL.ParamCount >= 0) then
      begin
         crudSQL.Params[0].Value := edtDS_LOGIN_Ins.Text;
         crudSQL.Params[1].Value := edtDS_SENHA_Ins.Text;
         crudSQL.Params[2].Value := edtDS_LOGIN_Ins.Text + '@' + edtDS_SENHA_Ins.Text;

         try
            crudSQL.ExecSQL;
         except
            on E: Exception do
            begin
               ShowMessage(E.Message);
            end;
         end;

      end;

   finally
      if not(crudSQL.TypeCRUD = tcNone) then
         FreeAndNil(crudSQL);
   end;
end;

procedure TfrmFireCRUD_Teste.edtDS_LOGIN_InsTyping(Sender: TObject);
begin
   TEdit(Sender).Text := //
      AnsiLowerCase(TEdit(Sender).Text);
end;

procedure TfrmFireCRUD_Teste.edtDS_LOGIN_UpdTyping(Sender: TObject);
begin
   TEdit(Sender).Text := //
      AnsiLowerCase(TEdit(Sender).Text);
end;

procedure TfrmFireCRUD_Teste.FormCreate(Sender: TObject);
begin
   {$IFDEF DEBUG}
   tbcCRUD.TabPosition := TTabPosition.Top;
   {$ELSE}
   tbcCRUD.TabPosition := TTabPosition.None;
   tbcCRUD.ActiveTab := tbiSelect;
   {$ENDIF}
end;

procedure TfrmFireCRUD_Teste.swtDS_SENHA_InsClick(Sender: TObject);
begin
   edtDS_SENHA_Ins.Password := //
      not TSwitch(Sender).IsChecked;
end;

procedure TfrmFireCRUD_Teste.swtDS_SENHA_UpdClick(Sender: TObject);
begin
   edtDS_SENHA_Upd.Password := //
      not TSwitch(Sender).IsChecked;
end;

end.
