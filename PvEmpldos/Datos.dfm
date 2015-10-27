object dmDatos: TdmDatos
  OldCreateOrder = False
  Left = 869
  Top = 495
  Height = 480
  Width = 696
  object ModDs: TDataSource
    Left = 8
    Top = 8
  end
  object qDCateg: TQuery
    DatabaseName = 'Sistema'
    DataSource = ModDs
    SQL.Strings = (
      'Delete From PCATEMPL'
      'Where CATE_Empl= :VEMP_Empl'
      '')
    Left = 70
    Top = 7
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VEMP_Empl'
        ParamType = ptUnknown
      end>
  end
  object qICateg: TQuery
    DatabaseName = 'Sistema'
    DataSource = dsCateg
    SQL.Strings = (
      'INSERT INTO PCATEMPL  '
      ' (CATE_Empl, CATE_Psto, CATE_Categ)'
      'VALUES  '
      ' (:Empl, :Psto, :Categ)')
    Left = 70
    Top = 55
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Empl'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Psto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Categ'
        ParamType = ptUnknown
      end>
  end
  object qCateg: TQuery
    CachedUpdates = True
    OnUpdateRecord = qCategUpdateRecord
    DatabaseName = 'Sistema'
    DataSource = ModDs
    SQL.Strings = (
      'Select Categ,'
      ' '#9'Psto,'
      #9'Cpue_Descrip as Descrip'
      'from (Select'
      '       A.PAGO_PSTO as Psto,'
      '       MAX(A.PAGO_CATEG) as Categ'
      '      from ppagos a, pvempldos b, PCPUESTOS c'
      '      where b.VEMP_EMPL = a.PAGo_Empl'
      '      and a.pago_empl = :VEMP_Empl'
      '      And CPUE_Psto= Pago_Psto'
      '      And CPUE_Categ= pago_categ'
      '      GROUP BY A.PAGO_PSTO'
      #9#9#9
      #9#9#9'union'
      #9#9#9
      #9#9#9'Select '
      '       A.PAGO_PSTO as Psto,'
      '       MAX(A.PAGO_CATEG) as Categ'
      '      from pnpagos a, pvempldos b, PCPUESTOS c'
      '      where b.VEMP_EMPL = a.PAGo_Empl'
      '      and a.pago_empl = :VEMP_Empl'
      '      And CPUE_Psto= Pago_Psto'
      '      And CPUE_Categ= pago_categ'
      '      GROUP BY A.PAGO_PSTO'#9#9#9
      #9#9#9
      #9#9#9'), Ppuestos, Pcpuestos'
      'Where Psto = Pues_Psto'
      'And Cpue_Psto = Psto'
      'And Cpue_Categ = Categ')
    Left = 248
    Top = 7
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VEMP_Empl'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VEMP_Empl'
        ParamType = ptUnknown
      end>
    object qCategCATEG: TStringField
      FieldName = 'CATEG'
      Origin = 'PCATEMPL.CATE_CATEG'
      OnChange = qCategCATEGChange
      Size = 10
    end
    object qCategPSTO: TStringField
      FieldName = 'PSTO'
      Origin = 'PCATEMPL.CATE_PSTO'
      OnChange = qCategPSTOChange
      Size = 10
    end
    object qCategLPsto: TStringField
      FieldKind = fkLookup
      FieldName = 'LPsto'
      LookupDataSet = qPsto
      LookupKeyFields = 'PSTO'
      LookupResultField = 'PDESCRIP'
      KeyFields = 'PSTO'
      Size = 35
      Lookup = True
    end
    object qCategDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'PCPUESTOS.CPUE_DESCRIP'
      Size = 35
    end
  end
  object dsCateg: TDataSource
    DataSet = qCateg
    Left = 254
    Top = 55
  end
  object qPsto: TQuery
    DatabaseName = 'Sistema'
    SQL.Strings = (
      'SELECT '
      ' PUES_Psto As Psto,'
      ' PUES_Descrip As PDescrip'
      'FROM PPUESTOS')
    Left = 190
    Top = 7
  end
  object qCDescrip: TQuery
    DatabaseName = 'Sistema'
    DataSource = dsCateg
    SQL.Strings = (
      'Select'
      ' CPUE_Descrip As Descrip'
      'From PCPUESTOS'
      'WHERE CPUE_Psto= :Psto'
      '   And CPUE_Categ= :Categ')
    Left = 182
    Top = 55
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Psto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Categ'
        ParamType = ptUnknown
      end>
  end
  object qIFoto: TQuery
    DatabaseName = 'Sistema'
    DataSource = ModDs
    SQL.Strings = (
      'UPDATE FPERSONAS Set'
      ' PERS_Foto= :Foto'
      'Where PERS_Persona= :VEMP_Empl'
      'And User = '#39'GABRIEL'#39)
    Left = 8
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Foto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VEMP_Empl'
        ParamType = ptUnknown
      end>
  end
  object dsCateg2: TDataSource
    DataSet = qCateg2
    Left = 126
    Top = 55
  end
  object qCateg2: TQuery
    CachedUpdates = True
    OnUpdateRecord = qCategUpdateRecord
    DatabaseName = 'SISTEMA'
    DataSource = ModDs
    SQL.Strings = (
      'select DISTINCT'
      '       A.PAGO_PSTO AS PSTO2, '
      '       C.PUES_DESCRIP AS PDESCRIP2,'
      '       A.PAGO_CATEG AS CATEG2,'
      '       D.CPUE_DESCRIP AS DESCRIP2,'
      '   A.PAGO_URES as CVURES2,'
      '   E.URES_DESCRIP AS URES2'
      'from ppagos a, pvempldos b, PPUESTOS C, PCPUESTOS D, FURES E'
      'where b.VEMP_EMPL = a.PAGo_Empl'
      
        'and a.PAGo_Nomina = (select max(pago_nomina) from ppagos where p' +
        'ago_empl = b.VEMP_EMPL)'
      'and a.pago_empl = :Vemp_Empl'
      'AND C.PUES_PSTO = A.PAGO_PSTO'
      'AND D.CPUE_PSTO = A.PAGO_PSTO'
      'AND D.CPUE_CATEG = A.PAGO_CATEG'
      'AND E.URES_URES = A.PAGO_URES'
      ''
      'UNION'
      ''
      'select DISTINCT'
      '       A.PAGO_PSTO AS PSTO2, '
      '       C.PUES_DESCRIP AS PDESCRIP2,'
      '       A.PAGO_CATEG AS CATEG2,'
      '       D.CPUE_DESCRIP AS DESCRIP2,'
      '   A.PAGO_URES as CVURES2,'
      '   E.URES_DESCRIP AS URES2'
      'from pNpagos a, pvempldos b, PPUESTOS C, PCPUESTOS D, FURES E'
      'where b.VEMP_EMPL = a.PAGo_Empl'
      
        'and a.PAGo_Nomina = (select max(pago_nomina) from pNpagos where ' +
        'pago_empl = b.VEMP_EMPL)'
      'and a.pago_empl = :Vemp_Empl'
      'AND C.PUES_PSTO = A.PAGO_PSTO'
      'AND D.CPUE_PSTO = A.PAGO_PSTO'
      'AND D.CPUE_CATEG = A.PAGO_CATEG'
      'AND E.URES_URES = A.PAGO_URES')
    Left = 128
    Top = 7
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Vemp_Empl'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vemp_Empl'
        ParamType = ptUnknown
      end>
    object qCateg2PSTO2: TStringField
      FieldName = 'PSTO2'
      Size = 10
    end
    object qCateg2PDESCRIP2: TStringField
      FieldName = 'PDESCRIP2'
      Size = 35
    end
    object qCateg2CATEG2: TStringField
      FieldName = 'CATEG2'
      Size = 10
    end
    object qCateg2DESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Size = 35
    end
    object qCateg2CVURES2: TStringField
      FieldName = 'CVURES2'
      Size = 8
    end
    object qCateg2URES2: TStringField
      FieldName = 'URES2'
      Size = 35
    end
  end
end
