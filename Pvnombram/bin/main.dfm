object FMain: TFMain
  Left = 191
  Top = 120
  Width = 694
  Height = 480
  Caption = 'FMain'
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DSistema: TDatabase
    DatabaseName = 'Sistema'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=BEQ-LOCAL'
      'USER NAME=SHAKE'
      'PASSWORD=SHAKE'
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE='
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=512'
      'OBJECT MODE=TRUE')
    SessionName = 'Default'
    Left = 640
    Top = 16
  end
  object MMenu: TMainMenu
    Left = 608
    Top = 16
    object Sistema1: TMenuItem
      Caption = '&Sistema'
      object AbrirReporte1: TMenuItem
        Caption = '&Abrir Reporte'
        OnClick = AbrirReporte1Click
      end
      object RecargaModulo1: TMenuItem
        Caption = '&Recarga Modulo'
        OnClick = RecargaModulo1Click
      end
      object CerrarModuloActivo1: TMenuItem
        Caption = '&Cerrar Modulo Activo'
        ShortCut = 16474
        OnClick = CerrarModuloActivo1Click
      end
      object Salir1: TMenuItem
        Bitmap.Data = {
          8A050000424D8A05000000000000360400002800000011000000110000000100
          0800000000005401000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A60024240400848484008C8C040044444400545404002C2C2C00D4D4D400FCFC
          6C00CCCC040054543400747404006464640034340C00FCFCAC00A4A4A400FCFC
          2C00646404005C5C540044442400ECECEC00ECEC04009C9C040044440400B4B4
          B4004C4C140014141400949494008C8C14005454540054540C003C3C3C00FCFC
          DC00DCDC040084840400747474006C6C140044440C008C8C0C00545444003C3C
          3400E4E4E4007C7C0C00B4B4AC0064640C005C5C5C0044443400FCFCFC00FCFC
          040024240C008C8C8C00949404004C4C4C005C5C040034343400DCDCDC00FCFC
          7400D4D404006C6C24007C7C04006C6C6C00ACACAC00FCFC3C006C6C04006C6C
          4C004C4C2C00F4F4F400A4A414004C4C0400BCBCBC0024241C009C9C9C005C5C
          0C00E4E404007C7C7C004C4C0C00FCFC0C0033CC660033CC990033CCCC0033CC
          FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
          6600660099006600CC006600FF00663300006633330066336600663399006633
          CC006633FF00666600006666330066666600666699006666CC00669900006699
          330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
          CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
          000099339900990099009900CC009900000099333300990066009933CC009900
          FF00996600009966330099336600996699009966CC009933FF00999933009999
          6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
          CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
          000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
          9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
          FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
          3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
          9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
          6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
          CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
          0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
          9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
          A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
          DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF0D01FFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFF0D0101FFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FF0D010101FFFF000000FFFFFFFFFFFFFFFFFFFFFF0D010101FFFF000000FFFF
          FFFFFFFF0C0C0C0C0C0D010101FFFF000000FFFFFFFFFFFF0C0C0C0C0C0D0101
          01FFFF000000FFFFFFFFFFFF0C0C0C0C0C0D015801FFFF000000FFFFFFFFFF00
          0C0C0C0C0C0D015801FFFF000000FFFFFFFFFF0000000C0C0C0D010101FFFF00
          0000FFFF00000000000000000C0D010101FFFF000000FF0000FFFF0000000C0C
          0C0D010101FFFF000000FF00FFFFFF000C0C0C0C0C0D010101FFFF000000FFFF
          FFFFFFFF0C0C0C0C0C0D010101FFFF000000FFFFFFFFFFFF0C0C0C0C0C0C0D01
          01FFFF000000FFFFFFFFFFFF0C0C0C0C0C0C0C0D01FFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000}
        Caption = '&Salir'
        ImageIndex = 4
        ShortCut = 16465
        OnClick = Salir1Click
      end
    end
    object Ventana1: TMenuItem
      Caption = '&Ventanas'
      GroupIndex = 3
      object Apilar1: TMenuItem
        Caption = 'A&pilar'
        OnClick = Apilar1Click
      end
      object Cascada1: TMenuItem
        Caption = '&Cascada'
        OnClick = Cascada1Click
      end
      object Siguiente1: TMenuItem
        Caption = '&Siguiente'
        ShortCut = 16418
        OnClick = Siguiente1Click
      end
      object Anterior1: TMenuItem
        Caption = '&Anterior'
        ShortCut = 16417
        OnClick = Anterior1Click
      end
    end
    object Ayuda1: TMenuItem
      Caption = '&Ayuda'
      GroupIndex = 3
      object Navegacion1: TMenuItem
        Bitmap.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
          FDFDFD00FDFDFDFDFDFDFDFDFDFDFDFDFD00050000FDFDFDFDFDFDFDFDFDFD00
          05F8FD070000FDFDFDFDFDFDFD0005F8FDFDFD07070000FDFDFDFD0005F8FDFD
          FDF800F807070000FDFD0507FDFDFDF800050505F807070000FD0507FDF80005
          0505050505F80707000005F800050505FBFB05050505F8070700FDF805050505
          05050305050505F80700FDFDF80505050503FBFB03050505F800FDFDFDF80505
          05050505FBFB05050500FDFDFDFDF80505FBFB03FBFB05050505FDFDFDFDFDF8
          050503FB0305050500FDFDFDFDFDFDFDF8050505050500FDFDFDFDFDFDFDFDFD
          FDF8050500FDFDFDFDFDFDFDFDFDFDFDFDFD05FDFDFDFDFDFDFD}
        Caption = '&Navegacion'
        ImageIndex = 5
        OnClick = Navegacion1Click
      end
      object Modulo1: TMenuItem
        Caption = '&Modulo'
        ShortCut = 112
        OnClick = Modulo1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Version1: TMenuItem
        Caption = '&Acerca de'
        OnClick = Version1Click
      end
    end
  end
  object QModulo: TQuery
    DatabaseName = 'Sistema'
    Left = 608
    Top = 48
  end
  object DSModulo: TDataSource
    DataSet = QModulo
    Left = 640
    Top = 48
  end
  object QBins: TQuery
    DatabaseName = 'Sistema'
    SQL.Strings = (
      'Select '
      ' Bins_Nombre As Nombre,'
      ' Bins_Ext As Ext,'
      ' Bins_Version As Version'
      'From SBins')
    Left = 608
    Top = 80
  end
  object QBinBin: TQuery
    DatabaseName = 'Sistema'
    SQL.Strings = (
      'Select '
      ' Bins_Bin As Bin,'
      ' Bins_Cnt As Cnt'
      'From SBins'
      'Where Bins_Nombre= :Nombre')
    Left = 640
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'Nombre'
        ParamType = ptUnknown
        Value = 'LOGO'
      end>
    object QBinBinCNT: TMemoField
      FieldName = 'CNT'
      Origin = 'SBINS.BINS_CNT'
      BlobType = ftMemo
      Size = 2000
    end
    object QBinBinBIN: TBlobField
      FieldName = 'BIN'
      Origin = 'SBINS.BINS_BIN'
      BlobType = ftBlob
      Size = 1
    end
  end
  object QHlp: TQuery
    DatabaseName = 'Sistema'
    DataSource = DSModulo
    SQL.Strings = (
      'Select '
      ' HMOD_Bin'
      'From SHModulos'
      'Where HMOD_MODULO= :Modulo')
    Left = 608
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Modulo'
        ParamType = ptUnknown
      end>
    object QHlpHMOD_BIN: TBlobField
      FieldName = 'HMOD_BIN'
      Origin = 'SHMODULOS.HMOD_BIN'
      BlobType = ftBlob
      Size = 1
    end
  end
  object QDll: TQuery
    DatabaseName = 'Sistema'
    DataSource = DSModulo
    SQL.Strings = (
      'Select '
      ' BMOD_Bin'
      'From SBModulos'
      'Where BMOD_MODULO= :Modulo')
    Left = 640
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Modulo'
        ParamType = ptUnknown
      end>
    object QDllBMOD_BIN: TBlobField
      FieldName = 'BMOD_BIN'
      Origin = 'SBMODULOS.BMOD_BIN'
      BlobType = ftBlob
      Size = 1
    end
  end
  object QValCampo: TQuery
    DatabaseName = 'Sistema'
    DataSource = DSModulo
    SQL.Strings = (
      'Select'
      ' Derc_Campo As Campo,'
      ' Derc_Values As Valores'
      'From SDerCampos'
      'Where DERC_Modulo= :Modulo'
      ' And DERC_Usuario= :Usuario')
    Left = 608
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Modulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Usuario'
        ParamType = ptUnknown
      end>
  end
  object QDerCampo: TQuery
    DatabaseName = 'Sistema'
    DataSource = DSModulo
    SQL.Strings = (
      'Select'
      ' NDER_Campo As Campo'
      'From SNDerCampos'
      'Where NDER_Modulo= :Modulo'
      ' And NDER_Usuario= :Usuario')
    Left = 640
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Modulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Usuario'
        ParamType = ptUnknown
      end>
  end
  object Iconos: TImageList
    Left = 608
    Top = 192
  end
end