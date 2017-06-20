object Form1: TForm1
  Left = 192
  Top = 117
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object et: TLabel
    Left = 376
    Top = 56
    Width = 9
    Height = 13
    Caption = 'et'
  end
  object tab: TPageControl
    Left = 0
    Top = 104
    Width = 721
    Height = 321
    ActivePage = Hoja1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MultiLine = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Style = tsFlatButtons
    TabHeight = 23
    TabOrder = 0
    TabWidth = 90
    OnDragDrop = tabDragDrop
    OnDragOver = tabDragOver
    object Hoja1: TTabSheet
      Caption = 'Pago: 12345678'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      object gr: TStringGrid
        Left = -8
        Top = -8
        Width = 609
        Height = 217
        Hint = 'Hola como estas'
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        TabOrder = 0
        OnMouseDown = grMouseDown
        OnMouseMove = grMouseMove
        RowHeights = (
          24
          24
          24
          24
          24)
      end
      object Button1: TButton
        Left = 544
        Top = 248
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 1
      end
    end
    object Hoja2: TTabSheet
      Caption = 'Pago: 12345678'
      ImageIndex = 1
      object StringGrid2: TStringGrid
        Left = 8
        Top = 24
        Width = 609
        Height = 217
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        TabOrder = 0
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Pago: 12345678'
      ImageIndex = 2
    end
  end
end
