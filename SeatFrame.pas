unit SeatFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrSeat = class(TFrame)
    pnlHeader: TPanel;
    pnlContent: TPanel;
    Label1: TLabel;
    Menu: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    procedure MenuClick(Sender: TObject);
    procedure pnlHeaderClick(Sender: TObject);
  private
    FMenus: TStrings;
    FTitle: string;
    FTableNum: Integer;
    procedure SetMenus(const Value: TStrings);
    procedure SetTitle(const Value: string);
    procedure DoClick;
    { Private declarations }
  public
    { Public declarations }
    property TableNum: Integer read FTableNum write FTableNum;
    property Title: string read FTitle write SetTitle;
    property Menus: TStrings read FMenus write SetMenus;
  end;

implementation

{$R *.dfm}

{ TFrame1 }

procedure TfrSeat.DoClick;
begin
  if Assigned(OnClick) then
    OnClick(Self);
end;

procedure TfrSeat.MenuClick(Sender: TObject);
begin
  DoClick;
end;

procedure TfrSeat.pnlHeaderClick(Sender: TObject);
begin
  DoClick;
end;

procedure TfrSeat.SetMenus(const Value: TStrings);
begin
  FMenus := Value;
  Menu.Lines.Assign(Value);
end;

procedure TfrSeat.SetTitle(const Value: string);
begin
  FTitle := Value;
  pnlHeader.Caption := Value;
  pnlHeader.Font.Size := 20;
  pnlHeader.Font.Color := $000000;
end;

end.
