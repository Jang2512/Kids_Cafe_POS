unit Menu_Snack;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TPosSnack = class(TForm)
    Panel1: TPanel;
    ListView1: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PosSnack: TPosSnack;

implementation

{$R *.dfm}

end.
