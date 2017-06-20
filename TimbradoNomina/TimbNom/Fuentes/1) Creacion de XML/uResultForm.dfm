object ResultForm: TResultForm
  Left = 369
  Top = 153
  Width = 846
  Height = 413
  Caption = 'ResultForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Mensaje: TRichEdit
    Left = 0
    Top = 0
    Width = 838
    Height = 341
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object pnlOptions: TPanel
    Left = 0
    Top = 341
    Width = 838
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      838
      41)
    object btnClose: TButton
      Left = 747
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Salir'
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
end
