object frSeat: TfrSeat
  Left = 0
  Top = 0
  Width = 510
  Height = 333
  TabOrder = 0
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 510
    Height = 41
    Align = alTop
    Color = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    OnClick = pnlHeaderClick
  end
  object pnlContent: TPanel
    Left = 0
    Top = 41
    Width = 510
    Height = 292
    Align = alClient
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      510
      292)
    object Label1: TLabel
      Left = 18
      Top = 5
      Width = 32
      Height = 24
      Caption = #47700#45684
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 124
      Top = 5
      Width = 61
      Height = 24
      Caption = #52509#44552#50529' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 191
      Top = 5
      Width = 13
      Height = 24
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Menu: TMemo
      Left = 8
      Top = 34
      Width = 494
      Height = 251
      Anchors = [akLeft, akTop, akRight, akBottom]
      ReadOnly = True
      TabOrder = 0
      OnClick = MenuClick
    end
  end
end
