object FAcercaDe: TFAcercaDe
  Left = 324
  Top = 166
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsToolWindow
  ClientHeight = 449
  ClientWidth = 370
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
  object logo: TImage
    Left = 45
    Top = 48
    Width = 273
    Height = 313
    Center = True
    Stretch = True
    Transparent = True
  end
  object Label2: TLabel
    Left = 24
    Top = 384
    Width = 321
    Height = 19
    Alignment = taCenter
    AutoSize = False
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 0
    Top = 440
    Width = 69
    Height = 8
    Caption = '© 2000 ASV Software'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = 'Small Fonts'
    Font.Style = []
    ParentFont = False
  end
end
