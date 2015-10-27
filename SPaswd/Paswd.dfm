object FSPaswd: TFSPaswd
  Left = 233
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Cambiar Pasword'
  ClientHeight = 180
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MMenu
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 56
    Width = 105
    Height = 13
    Caption = 'Contraseña Vieja :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 4
    Top = 88
    Width = 114
    Height = 13
    Caption = 'Contraseña Nueva :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 36
    Top = 120
    Width = 82
    Height = 13
    Caption = 'Confirmacion :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PViejo: TEdit
    Left = 128
    Top = 56
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    OnExit = PViejoExit
  end
  object PNuevo: TEdit
    Left = 128
    Top = 88
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object PConfirma: TEdit
    Left = 128
    Top = 120
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 277
    Height = 29
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    TabOrder = 3
    object BAcepta: TToolButton
      Left = 0
      Top = 0
      Caption = '&Aceptar'
      ImageIndex = 0
      MenuItem = Aceptar1
      ParentShowHint = False
      ShowHint = True
    end
    object BCancela: TToolButton
      Left = 23
      Top = 0
      Caption = '&Cancelar'
      ImageIndex = 1
      MenuItem = Cancelar1
      ParentShowHint = False
      ShowHint = True
    end
  end
  object Query1: TQuery
    DatabaseName = 'Sistema'
    Left = 192
    Top = 8
  end
  object MMenu: TMainMenu
    AutoMerge = True
    Left = 152
    Top = 8
    object Accion1: TMenuItem
      Caption = '&Accion'
      GroupIndex = 1
      object Aceptar1: TMenuItem
        Caption = '&Aceptar'
        ImageIndex = 12
        ShortCut = 16397
        OnClick = Aceptar1Click
      end
      object Cancelar1: TMenuItem
        Caption = '&Cancelar'
        ImageIndex = 13
        ShortCut = 27
        OnClick = Cancelar1Click
      end
    end
  end
end
