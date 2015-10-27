object dmDatos: TdmDatos
  OldCreateOrder = False
  Left = 310
  Top = 368
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
      'Delete From PHCATEMPL'
      'Where CATE_Empl= :VEMP_PERSONA'
      '')
    Left = 70
    Top = 7
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VEMP_PERSONA'
        ParamType = ptUnknown
      end>
  end
  object qICateg: TQuery
    DatabaseName = 'Sistema'
    DataSource = dsCateg
    SQL.Strings = (
      'INSERT INTO PHCATEMPL  '
      ' (CATE_Empl, CATE_Psto, CATE_Categ)'
      'VALUES  '
      ' (:persona, :Psto, :Categ)')
    Left = 70
    Top = 55
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'persona'
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
      '      from PHpagos a, PVemplHas b, PHCPUESTOS c'
      '      where b.VEMP_persona = a.PAGo_Empl'
      '      and a.pago_empl = :VEMP_persona'
      '      And CPUE_Psto= Pago_Psto'
      '      And CPUE_Categ= pago_categ'
      '      GROUP BY A.PAGO_PSTO), PHpuestos, PHcpuestos'
      'Where Psto = Pues_Psto'
      'And Cpue_Psto = Psto'
      'And Cpue_Categ = Categ')
    Left = 248
    Top = 7
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VEMP_persona'
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
    Left = 246
    Top = 55
  end
  object qPsto: TQuery
    DatabaseName = 'Sistema'
    SQL.Strings = (
      'SELECT '
      ' PUES_Psto As Psto,'
      ' PUES_Descrip As PDescrip'
      'FROM PHPUESTOS'
      ''
      ''
      '')
    Left = 190
    Top = 7
  end
  object qCDescrip: TQuery
    DatabaseName = 'sistema'
    DataSource = dsCateg
    SQL.Strings = (
      'Select'
      ' CPUE_Descrip As Descrip'
      'From PHCPUESTOS'
      'WHERE CPUE_Psto= :Psto'
      '   And CPUE_Categ= :Categ'
      ''
      '')
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
      'Where PERS_Persona= :VEMP_PERSONA'
      '')
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
        Name = 'VEMP_PERSONA'
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
    DatabaseName = 'sISTEMA'
    DataSource = ModDs
    SQL.Strings = (
      'select DISTINCT'
      '       A.PAGO_PSTO AS PSTO2, '
      '       C.PUES_DESCRIP AS PDESCRIP2,'
      '       A.PAGO_CATEG AS CATEG2,'
      '       D.CPUE_DESCRIP AS DESCRIP2,'
      '       A.PAGO_URES as CVURES2,'
      '      E.URES_DESCRIP AS URES2,'
      '      F.VCPU_Sueldo    AS SUELDO'
      
        'from pHpagos a, PVemplHas b, PHPUESTOS C, PHCPUESTOS D, FURES E,' +
        ' PVHCPUESTOS F'
      'where b.VEMP_PERSONA = a.PAGo_Empl'
      
        'and a.PAGo_Nomina = (select max(pago_nomina) from pHpagos where ' +
        'pago_empl = b.VEMP_persona)'
      'and a.pago_empl = :Vemp_persona'
      'AND C.PUES_PSTO = A.PAGO_PSTO'
      'AND D.CPUE_PSTO = A.PAGO_PSTO'
      'AND D.CPUE_CATEG = A.PAGO_CATEG'
      'AND E.URES_URES = A.PAGO_URES'
      'AND F.VCPU_Psto=A.PAGO_PSTO'
      'AND F.VCPU_TPsto=A.PAGO_TPSTO'
      'AND F.VCPU_Categ= A.PAGO_CATEG'
      ''
      ' ')
    Left = 128
    Top = 7
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Vemp_persona'
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
    object qCateg2SUELDO: TFloatField
      FieldName = 'SUELDO'
      currency = True
    end
  end
  object qlSubfdo: TQuery
    DatabaseName = 'sistema'
    DataSource = ModDs
    SQL.Strings = (
      'SELECT D.PLAZ_SFDO AS SUBFONDO'
      'FROM PHPAGOS A, PHNOMBRAM B ,PHPLAZAS C,PHPLAZPROG D'
      'WHERE'
      
        'a.PAGo_Nomina = (select max(pago_nomina) from pHpagos where pago' +
        '_empl =  :Vemp_persona)'
      'and a.pago_empl = :Vemp_persona'
      'AND A.PAGO_NOMB=B.NOMB_NOMB'
      '--AND C.PLAZ_NOMB=B.NOMB_NOMB'
      'AND C.PLAZ_PLAZA=B.NOMB_PLAZA'
      'AND C.PLAZ_PLAZA= D.PLAZ_PLAZA'
      '')
    Left = 24
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Vemp_persona'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vemp_persona'
        ParamType = ptUnknown
      end>
  end
end
