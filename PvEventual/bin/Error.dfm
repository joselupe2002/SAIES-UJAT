object FError: TFError
  Left = 279
  Top = 195
  BorderStyle = bsDialog
  Caption = 'Error'
  ClientHeight = 160
  ClientWidth = 267
  Color = clMenu
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BMensaje: TButton
    Left = 8
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Mensaje'
    TabOrder = 1
    OnClick = BMensajeClick
  end
  object BError: TButton
    Left = 96
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Error'
    TabOrder = 2
    OnClick = BErrorClick
  end
  object BCerrar: TButton
    Left = 184
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Cerrar'
    TabOrder = 0
    OnClick = BCerrarClick
  end
  object MemoError: TMemo
    Left = 8
    Top = 8
    Width = 251
    Height = 113
    TabStop = False
    Color = clMenu
    Lines.Strings = (
      '')
    ReadOnly = True
    TabOrder = 3
  end
end
