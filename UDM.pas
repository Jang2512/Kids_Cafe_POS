unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.IBDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryMenu: TFDQuery;
    qryMenuSEQ: TIntegerField;
    qryMenuCATEGORY: TIntegerField;
    qryMenuNAME: TWideStringField;
    qryMenuPRICE: TSmallintField;
    qryMenuIMAGE: TBlobField;
    qryStock: TFDQuery;
    qryStockSEQ: TIntegerField;
    qryStockCATEGORY: TIntegerField;
    qryStockNAME: TWideStringField;
    qryStockQUANTITY: TIntegerField;
    qryStockPRICE: TIntegerField;
    qryStockACCOUNT: TWideStringField;
    qryStockIMAGE: TBlobField;
    qryOrders: TFDQuery;
    qryMenuList: TFDQuery;
    qryMenuListSEQ: TIntegerField;
    qryMenuListNAME: TWideStringField;
    qryMenuListPRICE: TIntegerField;
    qryMenuListCATEGORY: TWideStringField;
    qryMenuListCATEGORY_1: TIntegerField;
    qryMenuListIMAGE: TBlobField;
    qryOrder_Menu: TFDQuery;
    qryOrdersSEQ: TIntegerField;
    qryOrdersTABLES: TIntegerField;
    qryOrdersDATES: TDateField;
    qryOrdersTOTAL: TIntegerField;
    qryOrdersUSE: TWideStringField;
    FDQuery1: TFDQuery;
    qryOrder_MenuSEQ: TIntegerField;
    qryOrder_MenuORDERS_SEQ: TIntegerField;
    qryOrder_MenuMENU_SEQ: TIntegerField;
    qryOrder_MenuMENU_NAME: TWideStringField;
    qryOrder_MenuQUANTITY: TIntegerField;
    qryOrder_MenuPRICE: TIntegerField;
    qryOrder_MenuCASH: TIntegerField;
    qryOrder_MenuTIMES: TTimeField;
    qrySeat: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
