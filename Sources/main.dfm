object Form1: TForm1
  Left = 0
  Top = 0
  Anchors = []
  BorderStyle = bsNone
  ClientHeight = 50
  ClientWidth = 71
  Color = clBlack
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 0
    Top = 0
    Width = 73
    Height = 50
    AutoComplete = False
    BorderStyle = bsNone
    Color = clBlack
    ExtendedSelect = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemHeight = 18
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnMouseMove = ListBox1MouseMove
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 368
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 40
    Top = 40
    object SetTimecolor1: TMenuItem
      Caption = 'Set Text color'
      OnClick = SetTimecolor1Click
    end
    object SetBackground1: TMenuItem
      Caption = 'Set Background color'
      OnClick = SetBackground1Click
    end
    object Close1: TMenuItem
      Caption = 'Close'
      OnClick = Close1Click
    end
  end
  object ColorDialog1: TColorDialog
    Left = 16
    Top = 8
  end
end
