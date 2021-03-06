unit CafePos_Seat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SeatFrame, Vcl.ExtCtrls;

type
  TSeatNum = class(TForm)
    edtSeatCount: TEdit;
    save: TButton;
    reset: TButton;
    cls: TButton;
    Label1: TLabel;
    Label2: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn6: TButton;
    btn5: TButton;
    btn4: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    btn11: TButton;
    btn0: TButton;
    btn10: TButton;
    procedure resetClick(Sender: TObject);
    procedure clsClick(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure edtSeatCountKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeatNum: TSeatNum;

implementation

{$R *.dfm}

uses CafePos_Main, CafePos_GuestNum;

procedure TSeatNum.btnClick(Sender: TObject);
var
  DelNum : string;
begin
  tag := (sender as Tbutton).Tag;
  if (tag>=0) and (tag<=9) then
  begin 
      if (edtSeatCount.Text = '0') and (Tag = 0) then
         begin
           edtSeatCount.Text := ''
         end
      else if(edtSeatCount.Text='0') then
         begin
           edtSeatCount.Clear;
         end;
    edtSeatCount.Text := edtSeatCount.Text + IntToStr(Tag);
  end;

  case tag of
    10 : edtSeatCount.Text := '0';

    11 : begin
           delNum:=edtSeatCount.Text;
           Delete(delNum,length(delNum),1);
           edtSeatCount.Text:=delNum;
           if edtSeatCount.Text = '' then
              edtSeatCount.Text := '0';
         end;
  end;
end;

procedure TSeatNum.clsClick(Sender: TObject);
begin
close;
end;

procedure TSeatNum.edtSeatCountKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9'] then
   else
   begin
     Key := #0;
   end;
end;

procedure TSeatNum.resetClick(Sender: TObject);
begin
  mainform.ClearSeatsFrame;
end;

procedure TSeatNum.saveClick(Sender: TObject);
begin
  mainform.tablecreat;
end;

end.
