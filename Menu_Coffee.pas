unit Menu_Coffee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TPosCoffee = class(TForm)
    Panel1: TPanel;
    ListView1: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PosCoffee: TPosCoffee;

implementation

{$R *.dfm}

end.
