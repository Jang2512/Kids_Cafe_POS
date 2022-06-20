unit CafePos_Stock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TStock = class(TForm)
    top: TPanel;
    data: TPanel;
    main: TPanel;
    Image1: TImage;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    NameCheckBox: TCheckBox;
    CategoryCheckBox: TCheckBox;
    Logo: TImage;
    btnAdd: TButton;
    btnSave: TButton;
    btncancel: TButton;
    btnDel: TButton;
    editSearch: TEdit;
    Label6: TLabel;
    StockDataSource: TDataSource;
    ImgMenu: TImage;
    ImgLoad: TOpenDialog;
    ImageReset: TButton;
    imageSave: TButton;
    Label2: TLabel;
    Label4: TLabel;
    edtName: TDBEdit;
    Label5: TLabel;
    edtPrice: TDBEdit;
    edtCategory: TDBEdit;
    edtQuantity: TDBEdit;
    Label7: TLabel;
    edtAccount: TDBEdit;
    Label8: TLabel;
    SeqCheckBox: TCheckBox;
    procedure Image1Click(Sender: TObject);
    procedure imageSaveClick(Sender: TObject);
    procedure ImageResetClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure editSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CategoryCheckBoxClick(Sender: TObject);
    procedure SeqCheckBoxClick(Sender: TObject);
    procedure NameCheckBoxClick(Sender: TObject);
    procedure StockDataSourceStateChange(Sender: TObject);
    procedure StockDataSourceDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Stock: TStock;

implementation

{$R *.dfm}

uses UDM, CommonFunctions;

procedure TStock.btnAddClick(Sender: TObject);
begin
  dm.qryStock.Append;
  edtCategory.SetFocus;
end;

procedure TStock.btncancelClick(Sender: TObject);
begin
  dm.qryStock.Cancel;
end;

procedure TStock.btnDelClick(Sender: TObject);
var
  title,msg : String;
begin
  title := dm.qryStock.FieldByName('seq').AsString;
  msg := format('[%s번] 재고를 삭제하시겠습니까?',[title]);
  if messagedlg(msg,mtinformation,[mbyes,mbno],0) = mrNo then
     exit;
  dm.qryStock.Delete;
end;

procedure TStock.btnSaveClick(Sender: TObject);
begin
  dm.qryStock.Post;
  dm.qryStock.Refresh;
end;

procedure TStock.CategoryCheckBoxClick(Sender: TObject);
begin
if CategoryCheckBox.Checked = true then
   NameCheckBox.Checked := false;
   SeqCheckBox.Checked := false;
   editSearch.Text := '';
   dm.qryStock.Filter := '';
end;

procedure TStock.editSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Filter: string;
begin
  Filter := '';

  if editSearch.Text <> '' then
  begin
    if SeqCheckBox.Checked then
       Filter := Format('Seq like ''%%%s%%''', [editSearch.Text]);
    if NameCheckBox.Checked then
      Filter := Format('NAME like ''%%%s%%''', [editSearch.Text]);
    if CategoryCheckBox.Checked then
      Filter := Filter + Format('CATEGORY like ''%%%s%%''', [editSearch.Text]);
  end;

  dm.qryStock.Filter := Filter;
  dm.qryStock.Filtered := (Filter <> '');
end;

procedure TStock.Image1Click(Sender: TObject);
begin
  close;
end;

procedure TStock.ImageResetClick(Sender: TObject);
var
f : Tfield;
begin
  imgMenu.Picture.Assign(nil);
  f := dm.qryStock.FieldByName('image');
  if dm.qryStock.State <> dsedit then
     dm.qryStock.Edit;
  f.Assign(nil);
end;

procedure TStock.imageSaveClick(Sender: TObject);
var
  field : Tfield;
begin
  if ImgLoad.Execute then
    begin
     LoadImageFromfile(imgMenu, ImgLoad.FileName);
     field := DM.qryStock.FieldByName('IMAGE');
     SaveImageToBlobfield(imgMenu, Field as TBlobField);
    end;
end;

procedure TStock.NameCheckBoxClick(Sender: TObject);
begin
if NameCheckBox.Checked = true then
   SeqCheckBox.Checked := false;
   CategoryCheckBox.Checked := false;
   editSearch.Text := '';
end;

procedure TStock.SeqCheckBoxClick(Sender: TObject);
begin
if SeqCheckBox.Checked = true then
   NameCheckBox.Checked := false;
   CategoryCheckBox.Checked := false;
   editSearch.Text := '';
end;

procedure TStock.StockDataSourceDataChange(Sender: TObject; Field: TField);
var
ImgField : TField;
begin
  if Dm.qryStock.State = dsEdit then
     Exit;

  ImgField := Dm.qryStock.FieldByName('IMAGE');
  if ImgField is TBlobField then
     LoadImageFromBlobField(imgMenu, ImgField as TBlobField);
end;

procedure TStock.StockDataSourceStateChange(Sender: TObject);
var
DS : Tdatasetstate;
begin
  DS := dm.qryStock.State;
  btnadd.Enabled := (DS = dsBrowse);
  btnsave.Enabled := (DS <> dsBrowse);
  btncancel.Enabled := (DS <> dsBrowse);
  btnDel.Enabled := (DS = dsBrowse) and (dm.qryStock.RecordCount > 0);
end;

end.
