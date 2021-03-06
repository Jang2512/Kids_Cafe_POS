unit CafePos_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.WinXPickers, SeatFrame;
type
  TSeatInfo = record
    X, Y: Integer;
  end;
type
  TMainForm = class(TForm)
    Bottom: TPanel;
    top: TPanel;
    Main: TPanel;
    Logo: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pnltime: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button6: TButton;
    Image1: TImage;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FSeatInfos: array of TSeatInfo;
    FSeatListFrame: array of TfrSeat;

    function CreateSeatFrame(TableNum: Integer; AName, ATitle: string; AX, AY: Integer): TfrSeat;
    procedure SeatFrameClick(Sender: TObject);
  public
    { Public declarations }
    procedure tablecreat;
    procedure ClearSeatsFrame;
    procedure AddMenus;
    procedure OrdersClick;
    procedure MemoClear;
  end;

var
  MainForm: TMainForm;
  Num, Qu : integer;

implementation

{$R *.dfm}

uses CafePos_Seat, CafePos_Table, CafePos_GuestNum, CafePos_Stock,
  CafePos_MenuMod, UDM, Pos_Sale;

const
  SEAT_WIDTH = 120;
  SEAT_HEIGHT = 150;
  SEAT_PADDING = 10;

procedure TMainForm.AddMenus;
var
  Seat: TfrSeat;
  total, I, Count : integer;
begin
  Seat := FSeatListFrame[TableCount]; //테이블 넘버 지정
  seat.Menu.Lines.Clear;
  dm.qryOrder_Menu.First;
  count := dm.qryOrder_Menu.RecordCount;
  for I := 0 to count - 1 do
    begin
      seat.Menu.Lines.Add(dm.qryOrder_MenuMENU_NAME.AsString + '          ' + dm.qryOrder_MenuQUANTITY.AsString + '개');
      dm.qryOrder_Menu.Next;
    end;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  stock := Tstock.Create(self);
  stock.ShowModal;
  stock.Free;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  Sale := TSale.Create(self);
  Sale.ShowModal;
  Sale.Free;
end;

procedure TMainForm.Button4Click(Sender: TObject);
begin
  MenuMod := TMenuMod.Create(self);
  MenuMod.ShowModal;
  MenuMod.Free;
end;

procedure TMainForm.Button6Click(Sender: TObject);
begin
  SeatNum := TSeatNum.Create(self);
  SeatNum.ShowModal;
  SeatNum.Free;
end;

procedure TMainForm.ClearSeatsFrame;
var
  Seat: TfrSeat;
begin
  for Seat in FSeatListFrame do
      Seat.Free;
      checkBox1.Checked := false;
      label3.Caption := '0';
end;

function TMainForm.CreateSeatFrame(TableNum: Integer; AName, ATitle: string; AX, AY: Integer): TfrSeat;
begin
  Result := TfrSeat.Create(self);
  Result.Name := AName;
  Result.Width := 280;
  Result.Height := 200;
  Result.Left := AX;
  Result.Top := AY;
  Result.Parent := Main;

  Result.TableNum := TableNum;
  Result.Title := ATitle;
  Result.OnClick := SeatFrameClick;

  Result.Visible := True;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  I : Integer;
  Seat : TfrSeat;
begin
  SetLength(FSeatInfos, 15);

  FSeatInfos[0].X := 20;
  FSeatInfos[0].Y := 10;
  FSeatInfos[1].X := 320;
  FSeatInfos[1].Y := 10;
  FSeatInfos[2].X := 620;
  FSeatInfos[2].Y := 10;
  FSeatInfos[3].X := 920;
  FSeatInfos[3].Y := 10;
  FSeatInfos[4].X := 1220;
  FSeatInfos[4].Y := 10;
  FSeatInfos[5].X := 20;
  FSeatInfos[5].Y := 220;
  FSeatInfos[6].X := 320;
  FSeatInfos[6].Y := 220;
  FSeatInfos[7].X := 620;
  FSeatInfos[7].Y := 220;
  FSeatInfos[8].X := 920;
  FSeatInfos[8].Y := 220;
  FSeatInfos[9].X := 1220;
  FSeatInfos[9].Y := 220;
  FSeatInfos[10].X := 20;
  FSeatInfos[10].Y := 440;
  FSeatInfos[11].X := 320;
  FSeatInfos[11].Y := 440;
  FSeatInfos[12].X := 620;
  FSeatInfos[12].Y := 440;
  FSeatInfos[13].X := 920;
  FSeatInfos[13].Y := 440;
  FSeatInfos[14].X := 1220;
  FSeatInfos[14].Y := 440;

  label3.Caption := IntToStr(dm.qrySeat.FieldByName('NUM').AsInteger);
  SetLength(FSeatListFrame, dm.qrySeat.FieldByName('NUM').AsInteger);
  for I := 0 to dm.qrySeat.FieldByName('NUM').AsInteger -1 do
    begin
      Seat := CreateSeatFrame(I+1, 'SeatFrame' + I.ToString, '좌석' +
                               (I+1).ToString, FSeatInfos[I].X, FSeatInfos[I].Y);
      FSeatListFrame[I] := Seat;
      dm.qryOrders.Insert;
      dm.qryOrdersTABLES.AsInteger := I+1;
      dm.qryOrdersUSE.AsString := 'Y';
      dm.qryOrders.Post;
    end;
  if dm.qrySeat.FieldByName('NUM').AsInteger > 0 then
     checkBox1.Checked := true;
end;

procedure TMainForm.Image1Click(Sender: TObject);
begin
  close;
end;

procedure TMainForm.MemoClear;
var
  Seat: TfrSeat;
begin
  Seat := FSeatListFrame[TableCount];
  seat.Menu.Lines.Clear;
  seat.Label3.Caption := '0';
end;

procedure TMainForm.OrdersClick;
var
  Seat: TfrSeat;
  total : integer;
begin
  total := 0;
  dm.qryOrder_Menu.First;
  while not dm.qryOrder_Menu.Eof do
     begin
       total := total + DM.qryOrder_Menu.FieldByName('CASH').AsInteger;
       dm.qryOrder_Menu.Next;
     end;
  Seat := FSeatListFrame[TableCount];
  seat.Label3.Caption := inttostr(total);
end;

procedure TMainForm.SeatFrameClick(Sender: TObject);
var
  Seat: TfrSeat;
begin
  Seat := TfrSeat(Sender);

  if(dm.qryOrder_MenuSEQ.AsInteger > 0) then
    begin
      table := Ttable.Create(self);
      table.TableNum := Seat.TableNum;
      table.ShowModal;
      table.Free;
    end
  else
    begin
      GuestNum := TGuestNum.create(self);
      GuestNum.ShowModal;
      GuestNum.Free;
    end;
end;

procedure TMainForm.tablecreat;
var
  I : Integer;
  Seat : TfrSeat;
begin
  if checkBox1.Checked = true then
    begin
       showmessage('좌석을 지우고 설정해 주십시오.');
       exit;
    end
  else if SeatNum.edtSeatCount.text = '' then
    begin
      showmessage('숫자를 입력하세요.');
      exit;
    end;

  dm.qrySeat.Edit;
  dm.qrySeat.FieldByName('NUM').AsInteger := StrToIntDef(SeatNum.edtSeatCount.Text, 15);
  DM.qrySeat.Post;
  DM.qrySeat.Refresh;
  if dm.qrySeat.FieldByName('NUM').AsInteger > 15 then
    begin
      ShowMessage('좌석의 개수는 15개를 넘길 수 없습니다.');
      dm.qrySeat.FieldByName('NUM').AsInteger := 15;
      SeatNum.edtSeatCount.Text := '15';
    end;

  SetLength(FSeatListFrame, dm.qrySeat.FieldByName('NUM').AsInteger);
  for I := 0 to dm.qrySeat.FieldByName('NUM').AsInteger - 1 do
    begin
      Seat := CreateSeatFrame(I+1, 'SeatFrame' + I.ToString, '좌석' +
                               (I+1).ToString, FSeatInfos[I].X, FSeatInfos[I].Y);
      FSeatListFrame[I] := Seat;
      checkBox1.Checked := true;
    end;
  label3.Caption := SeatNum.edtSeatCount.Text;
  SeatNum.close;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
Var
  DateTime : TDateTime;
begin
  DateTime := Time;
  pnltime.Caption := FormatDateTime('hh:nn:ss AM/PM',DateTime);
end;

end.
