object Form1: TForm1
  Left = 3
  Top = 101
  Width = 1000
  Height = 780
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 24
    Top = 8
    Width = 816
    Height = 1056
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = Recibos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Values = (
      100
      2794
      100
      2159
      100
      100
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 153
      Width = 740
      Height = 104
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        275.166666666667
        1957.91666666667)
      Master = QuickRep1
      PrintBefore = False
      PrintIfEmpty = True
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        87.3125
        1957.91666666667)
      BandType = rbTitle
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 71
      Width = 740
      Height = 82
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        216.958333333333
        1957.91666666667)
      BandType = rbDetail
      object QRDBText4: TQRDBText
        Left = 8
        Top = 56
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          148.166666666667
          97.8958333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Recibos
        DataField = 'URES'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 144
        Top = 40
        Width = 27
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          381
          105.833333333333
          71.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Recibos
        DataField = 'RFC'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 144
        Top = 24
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          381
          63.5
          153.458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Recibos
        DataField = 'NOMBRE'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 344
        Top = 8
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          910.166666666667
          21.1666666666667
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Recibos
        DataField = 'FECHA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 144
        Top = 56
        Width = 48
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          381
          148.166666666667
          127)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Recibos
        DataField = 'NUMSS'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 528
        Top = 24
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1397
          63.5
          95.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Recibos
        DataField = 'PSTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText7: TQRDBText
        Left = 600
        Top = 24
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1587.5
          63.5
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Recibos
        DataField = 'DPSTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText8: TQRDBText
        Left = 528
        Top = 40
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1397
          105.833333333333
          137.583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Recibos
        DataField = 'DTPSTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 528
        Top = 56
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1397
          148.166666666667
          171.979166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Recibos
        DataField = 'SUELDOM'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText10: TQRDBText
        Left = 696
        Top = 56
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1841.5
          148.166666666667
          97.8958333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Recibos
        DataField = 'EMPL'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object Recibos: TQuery
    DatabaseName = 'saies'
    SQL.Strings = (
      'Select'
      '       nomi_nomina as Nomina,'
      '       nomi_Descrip as NDescrip,'
      '       pers_persona as Empl,'
      '       pers_rfc as Rfc,'
      '       atre_numss as Numss,'
      
        '       substr(pers_apepat || '#39' '#39' || pers_apemat || '#39' '#39' || pers_N' +
        'ombre , 1, 50) as Nombre,'
      '       pago_templ as Templ,'
      '       DECODE(Pago_TPsto,'#39'BE'#39','#39'25001'#39', Pago_Ures) as Ures,'
      '       Pago_Nomb as Nomb,'
      '--       Pago_TPlaza as Tplaza,'
      
        '       Decode(Pago_TPlaza,'#39'B'#39', Decode(DECODE(NOMB_Nomb_Reem, Nul' +
        'l, '#39'T'#39', '#39'R'#39'),'#39'T'#39','#39#39','#39'INTERINO'#39'),'#39'INTERINO'#39' ) as Tplaza,'
      '       Pago_TPsto as TPsto,'
      '       DECODE(Pago_TPsto, '#39'D'#39', '
      
        '                               Decode(Pago_TPlaza,'#39'I'#39', '#39'DOCENTE ' +
        'INTERINO'#39',Tpue_Descrip),'
      
        '                                                                ' +
        '                        Tpue_Descrip) as DTPsto,'
      '       Pago_Psto as Psto,'
      '       Pues_Descrip as DPsto,'
      '       decode(Pago_Tpsto, '#39'BE'#39','#39#39', Pago_Categ) as Categ,'
      '       decode(Pago_Tpsto, '#39'BE'#39','#39#39', Cpue_Descrip) as DCateg,'
      '       Pago_Pago as Pago,'
      
        '       (Decode(Pues_Suel_Alt,'#39'S'#39', DECODE(Pago_Tpsto,'#39'JD'#39', Plaz_S' +
        'ldo + (52.13 * 2), '#39'PD'#39', Plaz_Sldo + (52.13 * 2),'
      
        '                                                    '#39'JA'#39', Plaz_S' +
        'ldo + (28.12 * 2), '#39'PA'#39' ,Plaz_Sldo + (28.12 * 2),'
      
        '                                                    '#39'JC'#39', Plaz_S' +
        'ldo + (28.12 * 2), '#39'PC'#39', Plaz_Sldo + (28.12 * 2),'
      '                                                    Plaz_Sldo),'
      
        '              Decode(Pago_Tpsto, '#39'D'#39', Plaz_Horas * Spue_Sueldo, ' +
        #39'BE'#39', Plaz_Horas * Spue_Sueldo, Spue_Sueldo)) + Nomb_SSueldo) as' +
        ' SueldoM,'
      
        '--       Decode(Pago_Tpsto, '#39'D'#39', Plaz_Horas * Spue_Sueldo, Spue_' +
        'Sueldo)) as SueldoM,'
      '--       Plaz_sldo as SueldoM,'
      '       Acpa_Dias as Dias,'
      '       Acpa_FDias as Faltas,'
      '       Acpa_Percs as Perceps,'
      '       Acpa_Dedus as Deduccs,'
      '       (Acpa_Percs - Acpa_Dedus) as Neto,'
      '       Nomi_FecIni as Inicio,'
      '       Nomi_FecFin as Fin,'
      
        '       SUBSTR(Nomi_FecIni,1,2) || '#39' AL '#39' || TO_CHAR(Nomi_FecFin,' +
        #39'DD'#39')'
      
        '        || '#39' DE '#39' || trim(TO_CHAR(Nomi_FecFin, '#39'MONTH'#39')) || '#39' DE' +
        'L '#39' || TO_CHAR(Nomi_FecFin,'#39'YYYY'#39') as Fecha'
      
        'From FPERSONAS, PPAGOS, PACPAGOS, PNOMINAS, PATREMPL, PTPLAZAS, ' +
        'PTPUESTOS, PPUESTOS, PCPUESTOS,'
      '     PSPUESTOS, PPLAZAS, PNOMBRAM'
      'Where PERS_Persona= PAGO_Empl'
      '  And NOMI_Nomina= PAGO_Nomina'
      '  And ACPA_Pago= PAGO_Pago '
      '  And Atre_Empl = Pers_Persona'
      '  And Tpla_tplaza = Pago_Tplaza'
      '  And TPue_Tpsto = Pago_TPsto'
      '  And Pues_Psto = Pago_Psto'
      '  And CPue_Psto = Pago_Psto'
      '  And Cpue_Categ = Pago_Categ'
      '  And Cpue_Spue = Spue_Spue'
      '  And Nomb_Nomb = Pago_Nomb'
      '  And Plaz_Plaza = Nomb_Plaza'
      '  and nomi_nomina = '#39'2602'#39
      '  and pago_TPSTO IN ('#39'D'#39')'
      '')
    Left = 774
    Top = 47
  end
end
