object dmDatos: TdmDatos
  OldCreateOrder = False
  Left = 423
  Top = 288
  Height = 480
  Width = 696
  object ModDS: TDataSource
    Left = 24
    Top = 8
  end
  object qPlaza: TQuery
    DatabaseName = 'Sistema'
    DataSource = ModDS
    SQL.Strings = (
      'Select'
      ' PLAZ_SFdo   As SFdo,'
      ' PLAZ_URes   As URes,'
      ' PLAZ_Psto   As Psto,'
      ' PLAZ_Horas  As Horas,'
      ' CPUE_Categ As Categ,'
      ' CPUE_Descrip As Descrip,'
      ' PUES_Profe As Profe,'
      ' PLAZ_Docen As Docen,'
      ' PLAZ_Ini   As PIni,'
      ' PLAZ_Fin  As PFin,'
      ' SPUE_Sueldo As Sueldo'
      'FROM PPLAZAS, PPUESTOS, PCPUESTOS, PSPUESTOS'
      'Where PLAZ_PLAZA= :VNOM_Plaza'
      ' And PUES_Psto= PLAZ_Psto'
      ' And CPUE_Psto= PUES_Psto'
      ' And CPUE_Categ='
      '('
      ' SELECT DECODE(Count(*), 0, PUES_Categ_Defa, MAX(CATE_Categ))'
      ' From PCATEMPL'
      ' Where CATE_Empl= :VNOM_Empl'
      '   And CATE_Psto= PLAZ_Psto'
      ')'
      ' And SPUE_Spue= CPUE_SPue')
    Left = 24
    Top = 85
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VNOM_Plaza'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VNOM_Empl'
        ParamType = ptUnknown
      end>
  end
  object dsPlaza: TDataSource
    DataSet = qPlaza
    Left = 86
    Top = 87
  end
  object qDescCateg: TQuery
    DatabaseName = 'Sistema'
    DataSource = ModDS
    SQL.Strings = (
      'SELECT'
      ' CPUE_Categ As Categoria,'
      ' CPUE_Descrip As Descripcion,'
      ' SPUE_Sueldo * NVL(:VNOM_Horas,1) As Sueldo'
      'From PCPUESTOS, PSPUESTOS'
      'Where CPUE_Psto= :VNOM_Psto'
      ' and CPUE_Categ= :VNOM_Categ'
      ' and SPUE_SPue= CPUE_SPue'
      ' ')
    Left = 88
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VNOM_Horas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VNOM_Psto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VNOM_Categ'
        ParamType = ptUnknown
      end>
  end
  object qReem: TQuery
    DatabaseName = 'Sistema'
    DataSource = ModDS
    SQL.Strings = (
      'Select'
      ' VNOM_Plaza As Plaza,'
      ' VNOM_Empl As Empl,'
      ' VNOM_Nombre As Nombre,'
      ' VNOM_Ini As Ini,'
      ' VNOM_Fin As Fin'
      'FROM PVNOMBRAM'
      'Where VNOM_Nomb= :VNOM_Reem')
    Left = 24
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VNOM_Reem'
        ParamType = ptUnknown
      end>
  end
  object dsReem: TDataSource
    DataSet = qReem
    Left = 88
    Top = 144
  end
end
