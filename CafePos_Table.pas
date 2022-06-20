unit CafePos_Table;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Data.DB, Vcl.Grids, Vcl.DBGrids, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Themes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,UDM, CafePos_Main, SeatFrame;

type
  TLocateOption = (loCaseInsensitive, loPartialKey);
  TLocateOptions = set of TLocateOption;
  TTable = class(TForm)
    bottom: TPanel;
    main: TPanel;
    top: TPanel;
    Logo: TImage;
    Label1: TLabel;
    lblTableNum: TLabel;
    pnltime: TPanel;
    Label2: TLabel;
    Panel1: TPanel;
    total: TLabel;
    cash: TButton;
    order: TButton;
    orderlist: TPanel;
    menulist: TPanel;
    DBGrid1: TDBGrid;
    Image1: TImage;
    PnlMenu: TPanel;
    DataSource1: TDataSource;
    Panel3: TPanel;
    ListView1: TListView;
    MenuImgList: TImageList;
    btncalcel: TButton;
    Timer1: TTimer;
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btncalcelClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure orderClick(Sender: TObject);
    procedure cashClick(Sender: TObject);

  private
    { Private declarations }
    FSeatListFrame: array of TfrSeat;
    FWICImage:TWICImage;
    FTableNum: Integer;
    procedure SetTableNum(const Value: Integer);
  public
    { Public declarations }
    procedure MenuEdit;
    procedure TotalCash;
    property TableNum: Integer read FTableNum write SetTableNum;
  end;

var
  Table: TTable;
  myListItem: TListItem;
  TableCount : integer;

implementation

{$R *.dfm}



procedure TTable.btncalcelClick(Sender: TObject);
var
  title,msg : String;
begin
  title := dm.qryOrder_Menu.FieldByName('SEQ').AsString;
  msg := format('[%s번] 메뉴를 취소하시겠습니까?',[title]);
  if messagedlg(msg,mtinformation,[mbyes,mbno],0) = mrNo then
     exit;
    dm.qryOrder_MENU.Delete;
    TotalCash;
end;

procedure TTable.cashClick(Sender: TObject);
var
  Mytotal : integer;
begin
  //MainForm.Label2.Caption :=
//  Mytotal := 0;
//
//  dm.qryOrder_Menu.First;
//  while not dm.qryOrder_Menu.Eof do
//     begin
//       Mytotal := Mytotal + DM.qryOrder_Menu.FieldByName('CASH').AsInteger;
//       dm.qryOrder_Menu.Next;
//     end;
  MainForm.MemoClear;
//  if dm.qryOrders.Locate('TABLES',FTableNum,[]) then
//      begin
//        dm.qryOrders.edit;
//        dm.qryOrders.FieldByName('DATES').AsDateTime := now;
//        dm.qryOrders.FieldByName('TOTAL').AsInteger := Mytotal;
//        dm.qryOrders.FieldByName('USE').AsString := 'N';
//      end;
//  dm.qryOrders.post;
  close;
end;

procedure TTable.FormCreate(Sender: TObject);
var
  index, i : integer;
  bmp: TBitmap;
  Group : string;
  Stream: TMemoryStream;
  Field : TField;
begin
  TableCount := 0;
  i := 0;
  FWICImage := TWICImage.create;
  Stream := TMemoryStream.Create;
  ListView1.GroupView := True;

  dm.qryMenuList.Close;
  dm.qryMenuList.SQL.Text := 'SELECT M.SEQ, M.NAME, M.PRICE, C.CATEGORY, M.CATEGORY, M.IMAGE FROM MENU M, CATEGORY C WHERE M.CATEGORY = C.SEQ';
  dm.qryMenuList.Open;
  while not dm.qryMenuList.Eof do
  begin
    //아이템 생성
    myListItem:= ListView1.Items.Add;
    myListItem.StateIndex := dm.qryMenuList.FieldByName('SEQ').AsInteger;
    myListItem.Caption:= dm.qryMenuList.FieldByName('Name').AsString;

    //그룹지정
    if ListView1.Groups.items[i].Header <> dm.qryMenuList.FieldByName('Category').AsString then
      begin
        Group := dm.qryMenuList.FieldByName('Category').AsString;
        ListView1.Groups.add.Header := Group;
        inc(i);
      end;
    index := dm.qryMenuList.FieldByName('Category_1').AsInteger;
    myListItem.GroupID := index;

    //이미지 출력
    Field := dm.qryMenuList.FieldByName('image');
    Stream.Clear;
    (Field as TBlobField).SaveToStream(Stream);
    FWICImage.LoadFromStream(Stream);
    bmp := TBitmap.Create;
    bmp.Width := 80;
    bmp.Height := 80;
    bmp.Canvas.StretchDraw(Rect(0, 0, 80, 80), FWICImage);
    myListItem.ImageIndex := MenuImgList.Add(bmp,nil);
    bmp.Free;
    dm.qryMenuList.Next;
  end;
  TotalCash;
end;

procedure TTable.FormDestroy(Sender: TObject);
begin
  FWICImage.Free;
end;


procedure TTable.Image1Click(Sender: TObject);
begin
  close;
end;

procedure TTable.ListView1Click(Sender: TObject);
begin
if assigned(listview1.Selected) then
   MenuEdit;
end;

procedure TTable.MenuEdit;
var
  OName : String;
  cash, x, OPrice, i, count : integer;
  Item: TListItem;
  DateTime : TDateTime;
begin
  DateTime := Time;
  Item := ListView1.Selected;
  x := Item.StateIndex;
  count := DM.qryMenu.RecordCount;
  dm.qryMenu.First;
  for I := 0 to count - 1 do
  begin
    if dm.qryMenu.FieldByName('seq').AsInteger = x then
      begin
        OPrice := DM.qryMenu.FieldByName('PRICE').AsInteger;
        OName := DM.qryMenu.FieldByName('NAME').AsString;
        break;
      end;
    dm.qryMenu.Next;
  end;
  if dm.qryOrder_Menu.Locate('MENU_SEQ',x,[]) then
    begin
      DM.qryOrder_Menu.Edit;
      DM.qryOrder_Menu.FieldByName('QUANTITY').AsInteger := DM.qryOrder_Menu.FieldByName('QUANTITY').AsInteger + 1;
      cash := DM.qryOrder_Menu.FieldByName('QUANTITY').AsInteger * DM.qryOrder_Menu.FieldByName('PRICE').AsInteger;
      DM.qryOrder_Menu.FieldByName('CASH').AsInteger := cash;
      DM.qryOrder_Menu.Post;
      DM.qryOrder_Menu.Refresh;
    end
  else
    begin
      if (x = 13) or (x=14) then
         oname := Oname + '('+FormatDateTime('hh:nn AM/PM',DateTime)+')';
      DM.qryOrder_Menu.insert;
      DM.qryOrder_Menu.FieldByName('SEQ').AsInteger := DM.qryOrder_Menu.RecordCount + 1;
      DM.qryOrder_Menu.FieldByName('ORDERS_SEQ').AsInteger := FTableNum;
      DM.qryOrder_Menu.FieldByName('MENU_SEQ').AsInteger := DM.qryMenu.FieldByName('SEQ').AsInteger;
      DM.qryOrder_Menu.FieldByName('MENU_NAME').AsString := OName;
      DM.qryOrder_Menu.FieldByName('QUANTITY').AsInteger := 1;
      DM.qryOrder_Menu.FieldByName('PRICE').AsInteger := OPrice;
      cash := DM.qryOrder_Menu.FieldByName('QUANTITY').AsInteger * DM.qryOrder_Menu.FieldByName('PRICE').AsInteger;
      DM.qryOrder_Menu.FieldByName('CASH').AsInteger := cash;
      DM.qryOrder_Menu.Post;
      DM.qryOrder_Menu.Refresh;
    end;
      TotalCash;
end;

procedure TTable.orderClick(Sender: TObject);
var
  Seat: TfrSeat;
  total, I, Count : integer;
begin
  mainform.AddMenus;
  mainform.OrdersClick;
  close;
end;

procedure TTable.SetTableNum(const Value: Integer);
begin
  FTableNum := Value;
  lblTableNum.Caption := FTableNum.ToString + ' 번';
  TableCount := StrToInt(FTableNum.ToString) - 1;
end;

procedure TTable.Timer1Timer(Sender: TObject);
Var
  DateTime : TDateTime;
begin
  DateTime := Time;
  pnltime.Caption := FormatDateTime('hh:nn:ss AM/PM',DateTime);
end;

procedure TTable.TotalCash;
var
  Mytotal : integer;
begin
  Mytotal := 0;
  dm.qryOrder_Menu.First;
  while not dm.qryOrder_Menu.Eof do
     begin
       Mytotal := Mytotal + DM.qryOrder_Menu.FieldByName('CASH').AsInteger;
       dm.qryOrder_Menu.Next;
     end;
  total.Caption := inttostr(Mytotal);
end;

end.
