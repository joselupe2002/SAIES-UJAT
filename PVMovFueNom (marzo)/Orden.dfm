inherited FOrden: TFOrden
  Left = 248
  Top = 145
  Width = 794
  Height = 517
  Caption = 'FOrden'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 440
    Width = 778
  end
  inherited PCaptura: TPanel
    Width = 778
    Height = 411
    object Label1: TLabel
      Left = 252
      Top = 11
      Width = 88
      Height = 14
      Caption = 'No. Movimiento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PageControl1: TPageControl
      Left = 8
      Top = 24
      Width = 761
      Height = 377
      ActivePage = TabSheet2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = 'Datos del Pago'
        ImageIndex = 1
        object TD: TLabel
          Left = 686
          Top = 80
          Width = 35
          Height = 22
          Alignment = taRightJustify
          Caption = '.......'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object TP: TLabel
          Left = 684
          Top = 48
          Width = 35
          Height = 22
          Alignment = taRightJustify
          Caption = '.......'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object NETO: TLabel
          Left = 684
          Top = 112
          Width = 35
          Height = 22
          Alignment = taRightJustify
          Caption = '.......'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4227072
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 584
          Top = 102
          Width = 144
          Height = 14
          Caption = '________________________'
        end
        object DBGrid3: TDBGrid
          Left = 8
          Top = 8
          Width = 545
          Height = 161
          Color = 15858133
          DataSource = DsPer
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
        end
        object DBGrid4: TDBGrid
          Left = 8
          Top = 184
          Width = 545
          Height = 153
          Color = 15133439
          DataSource = DsDed
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Polizas Creadas'
        object DETALLE: TLabel
          Left = 8
          Top = 120
          Width = 9
          Height = 14
          Caption = '...'
        end
        object DBGrid1: TDBGrid
          Left = 8
          Top = 8
          Width = 737
          Height = 105
          Color = 14614266
          DataSource = DsPol
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          OnCellClick = DBGrid1CellClick
        end
        object DBGrid2: TDBGrid
          Left = 8
          Top = 136
          Width = 737
          Height = 209
          Color = 16711145
          DataSource = DSDetPol
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Ordenes de Pago'
        ImageIndex = 2
        object Label3: TLabel
          Left = 8
          Top = 208
          Width = 9
          Height = 14
          Caption = '...'
        end
        object DBGrid5: TDBGrid
          Left = 8
          Top = 40
          Width = 737
          Height = 161
          Color = 14614266
          DataSource = DSOP
          PopupMenu = PopupMenu1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          OnCellClick = DBGrid5CellClick
        end
        object DBGrid6: TDBGrid
          Left = 8
          Top = 224
          Width = 737
          Height = 121
          Color = 16711145
          DataSource = DsDetOP
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
        end
        object Button1: TButton
          Left = 8
          Top = 8
          Width = 201
          Height = 25
          Caption = 'Cambiar Fecha de Orden de Pago'
          TabOrder = 2
          OnClick = Button1Click
        end
      end
    end
    object mov: TEdit
      Left = 344
      Top = 8
      Width = 57
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnChange = movChange
    end
    object fecha: TEdit
      Left = 408
      Top = 8
      Width = 97
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      OnChange = movChange
    end
  end
  inherited ToolBar1: TToolBar
    Width = 778
  end
  inherited QUpdate: TQuery
    Left = 136
  end
  inherited QVal: TQuery
    Left = 336
    Top = 65528
  end
  inherited ModDS: TDataSource
    Left = 168
  end
  object Qpol: TQuery
    DatabaseName = 'Sistema'
    Left = 528
  end
  object DsPol: TDataSource
    DataSet = Qpol
    Left = 504
    Top = 2
  end
  object DSDetPol: TDataSource
    DataSet = QdetPol
    Left = 560
    Top = 42
  end
  object QdetPol: TQuery
    DatabaseName = 'Sistema'
    Left = 592
    Top = 40
  end
  object QDed: TQuery
    DatabaseName = 'Sistema'
    Left = 472
    Top = 232
  end
  object DsDed: TDataSource
    DataSet = QDed
    Left = 432
    Top = 202
  end
  object QPer: TQuery
    DatabaseName = 'Sistema'
    Left = 304
    Top = 152
  end
  object DsPer: TDataSource
    DataSet = QPer
    Left = 272
    Top = 154
  end
  object Q: TQuery
    CachedUpdates = True
    OnUpdateRecord = QValUpdateRecord
    DatabaseName = 'Sistema'
    Left = 232
  end
  object DSOP: TDataSource
    DataSet = QOP
    Left = 72
    Top = 178
  end
  object QOP: TQuery
    DatabaseName = 'Sistema'
    Left = 120
    Top = 216
  end
  object DsDetOP: TDataSource
    DataSet = QDetOP
    Left = 120
    Top = 354
  end
  object QDetOP: TQuery
    DatabaseName = 'Sistema'
    Left = 152
    Top = 352
  end
  object PopupMenu1: TPopupMenu
    Left = 276
    Top = 78
    object Sumar1: TMenuItem
      Caption = 'Sumar'
      OnClick = Sumar1Click
    end
  end
end
