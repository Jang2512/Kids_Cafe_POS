program Project_KidsCafe;

uses
  Vcl.Forms,
  CafePos_Main in 'CafePos_Main.pas' {MainForm},
  CafePos_GuestNum in 'CafePos_GuestNum.pas' {GuestNum},
  CafePos_Table in 'CafePos_Table.pas' {Table},
  SeatFrame in 'SeatFrame.pas' {frSeat: TFrame},
  CafePos_Seat in 'CafePos_Seat.pas' {SeatNum},
  UDM in 'UDM.pas' {DM: TDataModule},
  CafePos_Stock in 'CafePos_Stock.pas' {Stock},
  CafePos_MenuMod in 'CafePos_MenuMod.pas' {MenuMod},
  CommonFunctions in 'CommonFunctions.pas' {$R *.res},
  Pos_Sale in 'Pos_Sale.pas' {Sale};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

