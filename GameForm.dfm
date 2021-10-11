object PyatnashkiMain: TPyatnashkiMain
  Left = 0
  Top = 0
  Caption = #1055#1103#1090#1085#1072#1096#1082#1080
  ClientHeight = 353
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    321
    353)
  PixelsPerInch = 96
  TextHeight = 13
  object lblTime: TLabel
    Left = 89
    Top = 328
    Width = 224
    Height = 13
    Alignment = taRightJustify
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
  end
  object pnlGameArea: TGridPanel
    Left = 8
    Top = 8
    Width = 305
    Height = 306
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    ColumnCollection = <
      item
        Value = 25.102386385218910000
      end
      item
        Value = 25.474749150012440000
      end
      item
        Value = 24.529932134746100000
      end
      item
        Value = 24.892932330022550000
      end>
    ControlCollection = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    RowCollection = <
      item
        Value = 25.008004191285620000
      end
      item
        Value = 24.775154990249440000
      end
      item
        Value = 24.917775125884100000
      end
      item
        Value = 25.299065692580840000
      end>
    TabOrder = 0
    ExplicitWidth = 406
    ExplicitHeight = 369
  end
  object btnNewGame: TButton
    Left = 8
    Top = 320
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1053#1086#1074#1072#1103' '#1080#1075#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnNewGameClick
    ExplicitTop = 383
  end
  object tmrTime: TTimer
    OnTimer = tmrTimeTimer
    Left = 24
    Top = 24
  end
end
