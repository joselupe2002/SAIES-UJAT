object FModulo: TFModulo
  Left = 251
  Top = 136
  Width = 696
  Height = 480
  Caption = 'FModulo'
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 29
    ButtonHeight = 25
    ButtonWidth = 25
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = Iconos
    TabOrder = 1
    Transparent = True
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 0
      Width = 112
      Height = 25
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Inicio'
        'Anterior'
        'Siguiente'
        'Final')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object Separ1: TToolButton
      Left = 112
      Top = 0
      Width = 8
      Caption = 'Separ1'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object BDetalle: TToolButton
      Left = 120
      Top = 0
      Hint = 'Detalle'
      Caption = '&Detalle'
      ImageIndex = 0
      MenuItem = Detalle1
      ParentShowHint = False
      ShowHint = True
    end
    object BInserta: TToolButton
      Left = 145
      Top = 0
      Hint = 'Insertar'
      Caption = '&Insertar'
      ImageIndex = 1
      MenuItem = Insertar1
      ParentShowHint = False
      ShowHint = True
    end
    object BEdita: TToolButton
      Left = 170
      Top = 0
      Hint = 'Editar'
      Caption = '&Editar'
      ImageIndex = 2
      MenuItem = Editar1
      ParentShowHint = False
      ShowHint = True
    end
    object BBorra: TToolButton
      Left = 195
      Top = 0
      Hint = 'Borrar'
      Caption = '&Borrar'
      ImageIndex = 3
      MenuItem = Borrar1
      ParentShowHint = False
      ShowHint = True
    end
    object BReporte: TToolButton
      Left = 220
      Top = 0
      Hint = 'Reporte'
      Caption = '&Reporte'
      ImageIndex = 11
      MenuItem = Reporte1
      ParentShowHint = False
      ShowHint = True
    end
    object Separ2: TToolButton
      Left = 245
      Top = 0
      Width = 8
      Caption = 'Separ2'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object BSelect: TToolButton
      Left = 253
      Top = 0
      Hint = 'Seleccionar'
      Caption = '&Seleccionar'
      ImageIndex = 4
      MenuItem = Seleccionar1
      ParentShowHint = False
      ShowHint = True
    end
    object BOrdena: TToolButton
      Left = 278
      Top = 0
      Hint = 'Ordenar'
      Caption = '&Ordenar'
      ImageIndex = 5
      MenuItem = Ordenar1
      ParentShowHint = False
      ShowHint = True
    end
    object BImprime: TToolButton
      Left = 303
      Top = 0
      Hint = 'Imprimir'
      Caption = 'Im&primir'
      ImageIndex = 6
      MenuItem = Imprimir1
      ParentShowHint = False
      ShowHint = True
    end
    object Separ3: TToolButton
      Left = 328
      Top = 0
      Width = 9
      Caption = 'Separ3'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object BRefresca: TToolButton
      Left = 337
      Top = 0
      Hint = 'Refrescar'
      Caption = 'Refrescar'
      ImageIndex = 14
      MenuItem = Refrescar1
      ParentShowHint = False
      ShowHint = True
    end
    object BContar: TToolButton
      Left = 362
      Top = 0
      Hint = 'Contar'
      Caption = '&Contar'
      ImageIndex = 7
      MenuItem = Contar1
      ParentShowHint = False
      ShowHint = True
    end
    object Bsuma: TToolButton
      Left = 387
      Top = 0
      Hint = 'Sumar'
      Caption = 'Su&mar'
      DropdownMenu = CamposNum
      ImageIndex = 8
      MenuItem = Sumar1
      ParentShowHint = False
      ShowHint = True
      Style = tbsDropDown
    end
    object BExporta: TToolButton
      Left = 427
      Top = 0
      Hint = 'Exportar'
      Caption = 'E&xportar'
      ImageIndex = 9
      MenuItem = Exportar1
      ParentShowHint = False
      ShowHint = True
    end
    object BDescrip: TToolButton
      Left = 452
      Top = 0
      Hint = 'Descripcion'
      Caption = 'Desc&ripcion'
      ImageIndex = 10
      MenuItem = Descripcion1
      ParentShowHint = False
      ShowHint = True
    end
    object BAcepta: TToolButton
      Left = 477
      Top = 0
      Hint = 'Aceptar'
      Caption = '&Aceptar'
      ImageIndex = 12
      MenuItem = Aceptar1
      ParentShowHint = False
      ShowHint = True
    end
    object BCancela: TToolButton
      Left = 502
      Top = 0
      Hint = 'Cancelar'
      Caption = '&Cancelar'
      ImageIndex = 13
      MenuItem = Cancelar1
      ParentShowHint = False
      ShowHint = True
    end
  end
  object PageCon: TPageControl
    Left = 0
    Top = 29
    Width = 688
    Height = 401
    ActivePage = TabImp
    Align = alClient
    HotTrack = True
    Images = Iconos
    TabOrder = 0
    object TabGrid: TTabSheet
      Caption = 'Datos'
      ImageIndex = 15
      TabVisible = False
      OnEnter = TabGridEnter
      OnExit = TabGridExit
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 372
        Align = alClient
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnColEnter = DBGrid1ColEnter
        OnColExit = DBGrid1ColExit
        OnDblClick = DBGrid1DblClick
        OnEnter = DBGrid1Enter
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 372
        Width = 680
        Height = 19
        Panels = <>
        SimplePanel = True
      end
    end
    object TabSele: TTabSheet
      Caption = 'Seleccionar'
      ImageIndex = 4
      TabVisible = False
      OnEnter = TabSeleEnter
      OnExit = TabSeleExit
      object SGSele: TStringGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 391
        Align = alClient
        ColCount = 2
        DefaultColWidth = 128
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSizing, goColSizing, goEditing, goTabs]
        TabOrder = 0
        RowHeights = (
          24)
      end
    end
    object TabOrd: TTabSheet
      Caption = 'Ordenar'
      ImageIndex = 5
      TabVisible = False
      OnExit = TabOrdExit
      object Label1: TLabel
        Left = 72
        Top = 32
        Width = 45
        Height = 13
        Caption = 'Campos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 280
        Top = 32
        Width = 35
        Height = 13
        Caption = 'Orden'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object FuenteOrd: TListBox
        Left = 72
        Top = 48
        Width = 121
        Height = 200
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
      end
      object DestinoOrd: TListBox
        Left = 280
        Top = 48
        Width = 121
        Height = 200
        ItemHeight = 13
        TabOrder = 1
        OnDragDrop = DestinoOrdDragDrop
        OnDragOver = DestinoOrdDragOver
        OnEndDrag = DestinoOrdEndDrag
        OnMouseDown = DestinoOrdMouseDown
      end
      object BFteDno: TButton
        Left = 213
        Top = 104
        Width = 49
        Height = 25
        Hint = 'Agregar'
        Caption = '>'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BFteDnoClick
      end
      object BDnoFte: TButton
        Left = 213
        Top = 128
        Width = 49
        Height = 25
        Hint = 'Quitar'
        Caption = '<'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BDnoFteClick
      end
      object rgSentido: TRadioGroup
        Left = 440
        Top = 40
        Width = 121
        Height = 105
        Caption = 'Sentido : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Ascendente'
          'Descendente')
        ParentFont = False
        TabOrder = 4
      end
    end
    object TabImp: TTabSheet
      Caption = 'Imprimir'
      ImageIndex = 6
      TabVisible = False
      OnExit = TabImpExit
      object Label4: TLabel
        Left = 16
        Top = 16
        Width = 32
        Height = 13
        Caption = 'Titulo :'
      end
      object Label3: TLabel
        Left = 16
        Top = 56
        Width = 53
        Height = 13
        Caption = 'Campos :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 200
        Top = 56
        Width = 52
        Height = 13
        Caption = 'Imprimir :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 392
        Top = 56
        Width = 45
        Height = 13
        Caption = 'Cortes :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 216
        Top = 280
        Width = 103
        Height = 13
        Caption = '(Marca para Totalizar)'
      end
      object Label8: TLabel
        Left = 408
        Top = 280
        Width = 91
        Height = 13
        Caption = '(Marca para Cortar)'
      end
      object FuenteImp: TListBox
        Left = 8
        Top = 72
        Width = 121
        Height = 201
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
      end
      object Button2: TButton
        Left = 136
        Top = 112
        Width = 49
        Height = 25
        Hint = 'Agregar'
        Caption = '>'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BFteDnoClick
      end
      object Button3: TButton
        Left = 136
        Top = 136
        Width = 49
        Height = 25
        Hint = 'Quitar'
        Caption = '<'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BDnoFteClick
      end
      object ROrientacion: TRadioGroup
        Left = 560
        Top = 64
        Width = 97
        Height = 81
        Caption = 'Orientacion'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Vertical'
          'Horizontal')
        ParentFont = False
        TabOrder = 3
      end
      object Titulo: TEdit
        Left = 56
        Top = 16
        Width = 161
        Height = 21
        TabOrder = 4
      end
      object CorteImp: TCheckListBox
        Left = 392
        Top = 72
        Width = 121
        Height = 201
        OnClickCheck = CorteImpClickCheck
        ItemHeight = 13
        TabOrder = 5
      end
      object DestinoImp: TCheckListBox
        Left = 200
        Top = 72
        Width = 129
        Height = 201
        OnClickCheck = DestinoImpClickCheck
        ItemHeight = 13
        TabOrder = 6
        OnDragDrop = DestinoOrdDragDrop
        OnDragOver = DestinoOrdDragOver
        OnEndDrag = DestinoOrdEndDrag
        OnMouseDown = DestinoOrdMouseDown
      end
      object SCortes: TCheckBox
        Left = 280
        Top = 16
        Width = 81
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Solo Cortes :'
        TabOrder = 7
      end
      object SCuenta: TCheckBox
        Left = 440
        Top = 16
        Width = 65
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Contar :'
        TabOrder = 8
      end
    end
  end
  object MMenu: TMainMenu
    Images = Iconos
    Left = 144
    Top = 336
    object Registro1: TMenuItem
      Caption = '&Registro'
      GroupIndex = 1
      object Seleccionar1: TMenuItem
        Caption = '&Seleccionar'
        Hint = 'Seleccionar'
        ImageIndex = 4
        ShortCut = 119
        OnClick = Seleccionar1Click
      end
      object Imprimir1: TMenuItem
        Caption = 'Im&primir'
        Hint = 'Imprimir'
        ImageIndex = 6
        ShortCut = 120
        OnClick = Imprimir1Click
      end
      object Ordenar1: TMenuItem
        Caption = '&Ordenar'
        Hint = 'Ordenar'
        ImageIndex = 5
        ShortCut = 121
        OnClick = Ordenar1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Refrescar1: TMenuItem
        Caption = 'Refrescar'
        Hint = 'Refrescar'
        ImageIndex = 14
        ShortCut = 114
        OnClick = Refrescar1Click
      end
      object Exportar1: TMenuItem
        Caption = 'E&xportar'
        Hint = 'Exportar'
        ImageIndex = 9
        ShortCut = 117
        OnClick = Exportar1Click
      end
      object Descripcion1: TMenuItem
        Caption = 'Desc&ripcion'
        Hint = 'Descripcion'
        ImageIndex = 10
        ShortCut = 118
        OnClick = Descripcion1Click
      end
      object Contar1: TMenuItem
        Caption = '&Contar'
        Hint = 'Contar'
        ImageIndex = 7
        ShortCut = 122
        OnClick = Contar1Click
      end
      object Sumar1: TMenuItem
        Caption = 'Su&mar'
        Hint = 'Sumar'
        ImageIndex = 8
        ShortCut = 123
        OnClick = Sumar1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Detalle1: TMenuItem
        Caption = '&Detalle'
        Hint = 'Detalle'
        ImageIndex = 0
        ShortCut = 116
        OnClick = Detalle1Click
      end
      object Insertar1: TMenuItem
        Caption = '&Insertar'
        Hint = 'Insertar'
        ImageIndex = 1
        ShortCut = 16429
        OnClick = Detalle1Click
      end
      object Editar1: TMenuItem
        Caption = '&Editar'
        Hint = 'Editar'
        ImageIndex = 2
        ShortCut = 16453
        OnClick = Detalle1Click
      end
      object Borrar1: TMenuItem
        Caption = '&Borrar'
        Hint = 'Borrar'
        ImageIndex = 3
        ShortCut = 16430
        OnClick = Detalle1Click
      end
      object Reporte1: TMenuItem
        Caption = '&Reporte'
        Hint = 'Reporte'
        ImageIndex = 11
        ShortCut = 113
        OnClick = Detalle1Click
      end
    end
    object Procesos1: TMenuItem
      Caption = 'Pr&ocesos'
      Enabled = False
      GroupIndex = 1
    end
    object Accion1: TMenuItem
      Caption = '&Accion'
      GroupIndex = 1
      object Aceptar1: TMenuItem
        Caption = '&Aceptar'
        Hint = 'Aceptar'
        ImageIndex = 12
        ShortCut = 16397
        OnClick = Aceptar1Click
      end
      object Cancelar1: TMenuItem
        Caption = '&Cancelar'
        Hint = 'Cancelar'
        ImageIndex = 13
        ShortCut = 27
        OnClick = Cancelar1Click
      end
      object Agregar1: TMenuItem
        Caption = 'A&gregar'
        ShortCut = 16449
        OnClick = Agregar1Click
      end
      object Eliminar1: TMenuItem
        Caption = '&Eliminar'
        ShortCut = 16452
        OnClick = Eliminar1Click
      end
      object Limpiar1: TMenuItem
        Caption = '&Limpiar'
        ShortCut = 16460
        OnClick = Limpiar1Click
      end
    end
  end
  object Campos: TQuery
    DatabaseName = 'Sistema'
    SQL.Strings = (
      'SELECT'
      ' TABLE_NAME As Tabla,'
      ' COLUMN_NAME As Campo,'
      ' COMMENTS As Descrip,'
      
        ' SUBSTR( SUBSTR(COMMENTS, 1, INSTR(COMMENTS, CHR(10), 1,1)-1 ), ' +
        '1, 20) As Etiq,'
      ' SUBSTR(COMMENTS, INSTR(COMMENTS, CHR(10), 1,1)+1,'
      
        '   INSTR(COMMENTS, CHR(10),1,2) - INSTR(COMMENTS, CHR(10), 1,1) ' +
        '- 1) As Leye,'
      ' SUBSTR(COMMENTS, INSTR(COMMENTS, CHR(10), 1,2)+1, 2) As Orden'
      'FROM ALL_COL_COMMENTS'
      'WHERE TABLE_NAME= :Tabla'
      'ORDER BY orden'
      ' ')
    Left = 88
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'Tabla'
        ParamType = ptUnknown
        Value = 'USUARIOS'
      end>
  end
  object CamposNum: TPopupMenu
    Left = 176
    Top = 336
  end
  object Iconos: TImageList
    Left = 210
    Top = 330
  end
  object Query1: TQuery
    CachedUpdates = True
    OnUpdateRecord = Query1UpdateRecord
    DatabaseName = 'Sistema'
    Left = 9
    Top = 337
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 40
    Top = 336
  end
  object DExporta: TOpenDialog
    DefaultExt = 'Dbf'
    Filter = 'Archivos DBF|*.Dbf'
    Options = [ofHideReadOnly, ofPathMustExist]
    Title = 'Nombre del Archivo Destino'
    Left = 256
    Top = 336
  end
  object Copia: TTable
    TableType = ttFoxPro
    Left = 296
    Top = 336
  end
end
