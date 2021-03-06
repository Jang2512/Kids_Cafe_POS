object DM: TDM
  OldCreateOrder = False
  Height = 542
  Width = 760
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 72
    Top = 112
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\201807_Delphi\Kids\DB\KIDS_CAFE.IB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 72
    Top = 192
  end
  object qryMenu: TFDQuery
    Active = True
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.AutoIncFields = 'SEQ'
    SQL.Strings = (
      'SELECT * FROM MENU;')
    Left = 272
    Top = 72
    object qryMenuSEQ: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'SEQ'
      Origin = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryMenuCATEGORY: TIntegerField
      FieldName = 'CATEGORY'
      Origin = 'CATEGORY'
      Required = True
    end
    object qryMenuNAME: TWideStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 140
    end
    object qryMenuPRICE: TSmallintField
      FieldName = 'PRICE'
      Origin = 'PRICE'
      Required = True
    end
    object qryMenuIMAGE: TBlobField
      FieldName = 'IMAGE'
      Origin = 'IMAGE'
    end
  end
  object qryStock: TFDQuery
    Active = True
    Connection = FDConnection1
    UpdateOptions.AutoIncFields = 'SEQ'
    SQL.Strings = (
      'SELECT * FROM Stock;')
    Left = 272
    Top = 160
    object qryStockSEQ: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'SEQ'
      Origin = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryStockCATEGORY: TIntegerField
      FieldName = 'CATEGORY'
      Origin = 'CATEGORY'
      Required = True
    end
    object qryStockNAME: TWideStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 40
    end
    object qryStockQUANTITY: TIntegerField
      FieldName = 'QUANTITY'
      Origin = 'QUANTITY'
      Required = True
    end
    object qryStockPRICE: TIntegerField
      FieldName = 'PRICE'
      Origin = 'PRICE'
      Required = True
    end
    object qryStockACCOUNT: TWideStringField
      FieldName = 'ACCOUNT'
      Origin = 'ACCOUNT'
      Required = True
      Size = 60
    end
    object qryStockIMAGE: TBlobField
      FieldName = 'IMAGE'
      Origin = 'IMAGE'
    end
  end
  object qryOrders: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM ORDERS')
    Left = 272
    Top = 240
    object qryOrdersSEQ: TIntegerField
      FieldName = 'SEQ'
      Origin = 'SEQ'
    end
    object qryOrdersTABLES: TIntegerField
      FieldName = 'TABLES'
      Origin = 'TABLES'
    end
    object qryOrdersDATES: TDateField
      FieldName = 'DATES'
      Origin = 'DATES'
    end
    object qryOrdersTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
    end
    object qryOrdersUSE: TWideStringField
      FieldName = 'USE'
      Origin = 'USE'
      FixedChar = True
      Size = 4
    end
  end
  object qryMenuList: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '  M.SEQ, M.NAME, M.PRICE, M.IMAGE, C.CATEGORY, M.CATEGORY'
      'FROM '
      '  MENU M, CATEGORY C '
      'WHERE '
      '  M.CATEGORY = C.SEQ')
    Left = 360
    Top = 72
    object qryMenuListSEQ: TIntegerField
      FieldName = 'SEQ'
      Origin = 'SEQ'
      Required = True
    end
    object qryMenuListNAME: TWideStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 140
    end
    object qryMenuListPRICE: TIntegerField
      FieldName = 'PRICE'
      Origin = 'PRICE'
      Required = True
    end
    object qryMenuListCATEGORY: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CATEGORY'
      Origin = 'CATEGORY'
      ProviderFlags = []
      ReadOnly = True
      Size = 120
    end
    object qryMenuListCATEGORY_1: TIntegerField
      FieldName = 'CATEGORY_1'
      Origin = 'CATEGORY'
      Required = True
    end
    object qryMenuListIMAGE: TBlobField
      FieldName = 'IMAGE'
      Origin = 'IMAGE'
    end
  end
  object qryOrder_Menu: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM ORDER_MENU')
    Left = 368
    Top = 160
    object qryOrder_MenuSEQ: TIntegerField
      FieldName = 'SEQ'
      Origin = 'SEQ'
    end
    object qryOrder_MenuORDERS_SEQ: TIntegerField
      FieldName = 'ORDERS_SEQ'
      Origin = 'ORDERS_SEQ'
    end
    object qryOrder_MenuMENU_SEQ: TIntegerField
      FieldName = 'MENU_SEQ'
      Origin = 'MENU_SEQ'
    end
    object qryOrder_MenuMENU_NAME: TWideStringField
      FieldName = 'MENU_NAME'
      Origin = 'MENU_NAME'
      Size = 200
    end
    object qryOrder_MenuQUANTITY: TIntegerField
      FieldName = 'QUANTITY'
      Origin = 'QUANTITY'
    end
    object qryOrder_MenuPRICE: TIntegerField
      FieldName = 'PRICE'
      Origin = 'PRICE'
    end
    object qryOrder_MenuCASH: TIntegerField
      FieldName = 'CASH'
      Origin = 'CASH'
    end
    object qryOrder_MenuTIMES: TTimeField
      FieldName = 'TIMES'
      Origin = 'TIMES'
    end
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      
        '  O.SEQ, O.TABLES, O.USE, OM.MENU_NAME, OM.QUANTITY, OM.PRICE, O' +
        'M.CASH'
      'FROM '
      '  ORDERS O, ORDER_MENU OM'
      'WHERE'
      '  ORDERS.SEQ = ORDER_MENU.ORDERS_SEQ')
    Left = 368
    Top = 248
  end
  object qrySeat: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM SEAT')
    Left = 288
    Top = 344
  end
end
