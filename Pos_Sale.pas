unit Pos_Sale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TSale = class(TForm)
    top: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Logo: TImage;
    Panel1: TPanel;
    DBChart1: TDBChart;
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Sale: TSale;

implementation

{$R *.dfm}

procedure TSale.Image1Click(Sender: TObject);
begin
  close;
end;

end.
