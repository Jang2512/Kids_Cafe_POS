object SeatNum: TSeatNum
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'SeatNum'
  ClientHeight = 544
  ClientWidth = 307
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    307
    544)
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 30
    Top = 11
    Width = 257
    Height = 81
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #51340#49437' '#48320#44221
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -67
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 41
    Top = 114
    Width = 88
    Height = 30
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #51340#49437' '#44060#49688
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtSeatCount: TEdit
    Left = 148
    Top = 117
    Width = 117
    Height = 24
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnKeyPress = edtSeatCountKeyPress
  end
  object save: TButton
    Left = 55
    Top = 416
    Width = 84
    Height = 59
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #51088#47532' '#46321#47197
    TabOrder = 1
    OnClick = saveClick
  end
  object reset: TButton
    Left = 171
    Top = 416
    Width = 84
    Height = 59
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #51088#47532' '#47532#49483
    TabOrder = 2
    OnClick = resetClick
  end
  object cls: TButton
    Left = 193
    Top = 495
    Width = 84
    Height = 35
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #45803#44592
    TabOrder = 3
    OnClick = clsClick
  end
  object btn1: TButton
    Tag = 1
    Left = 34
    Top = 166
    Width = 67
    Height = 46
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '1'
    TabOrder = 4
    OnClick = btnClick
  end
  object btn2: TButton
    Tag = 2
    Left = 126
    Top = 166
    Width = 67
    Height = 46
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '2'
    TabOrder = 5
    OnClick = btnClick
  end
  object btn3: TButton
    Tag = 3
    Left = 210
    Top = 166
    Width = 67
    Height = 46
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '3'
    TabOrder = 6
    OnClick = btnClick
  end
  object btn6: TButton
    Tag = 6
    Left = 210
    Top = 225
    Width = 67
    Height = 46
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '6'
    TabOrder = 7
    OnClick = btnClick
  end
  object btn5: TButton
    Tag = 5
    Left = 126
    Top = 225
    Width = 67
    Height = 46
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '5'
    TabOrder = 8
    OnClick = btnClick
  end
  object btn4: TButton
    Tag = 4
    Left = 34
    Top = 225
    Width = 67
    Height = 46
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '4'
    TabOrder = 9
    OnClick = btnClick
  end
  object btn7: TButton
    Tag = 7
    Left = 34
    Top = 289
    Width = 67
    Height = 46
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '7'
    TabOrder = 10
    OnClick = btnClick
  end
  object btn8: TButton
    Tag = 8
    Left = 126
    Top = 289
    Width = 67
    Height = 46
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '8'
    TabOrder = 11
    OnClick = btnClick
  end
  object btn9: TButton
    Tag = 9
    Left = 210
    Top = 289
    Width = 67
    Height = 46
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '9'
    TabOrder = 12
    OnClick = btnClick
  end
  object btn11: TButton
    Tag = 11
    Left = 210
    Top = 353
    Width = 67
    Height = 46
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '<-'
    TabOrder = 13
    OnClick = btnClick
  end
  object btn0: TButton
    Left = 126
    Top = 353
    Width = 67
    Height = 46
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '0'
    TabOrder = 14
    OnClick = btnClick
  end
  object btn10: TButton
    Tag = 10
    Left = 34
    Top = 353
    Width = 67
    Height = 46
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'C'
    TabOrder = 15
    OnClick = btnClick
  end
end
