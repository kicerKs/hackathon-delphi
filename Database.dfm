object DataModule1: TDataModule1
  Height = 839
  Width = 1350
  object PozyczkomatDatabaseConnection: TFDConnection
    Params.Strings = (
      'Database=pozyczkomat'
      'DriverID=MySQL510_Embedded')
    LoginPrompt = False
    Left = 96
    Top = 32
  end
  object CMDSelectAllPozyczkaPrzedmiot: TFDCommand
    Connection = PozyczkomatDatabaseConnection
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    CommandText.Strings = (
      
        'Select pozyczka_przedmiot.id as ID, Concat(imie, '#39' '#39', nazwisko) ' +
        'as Osoba, nazwa as Przedmiot, ilosc as '#39'Ilo'#347#263#39', data_udzielenia ' +
        'as Udzielono, termin_oddania as Termin, data_oddania as '#39'Data od' +
        'dania'#39', data_oddania>termin_oddania as Przeterminowane from osob' +
        'a, przedmiot, pozyczka_przedmiot where osoba.id = pozyczka_przed' +
        'miot.id_osoba and przedmiot.id = pozyczka_przedmiot.id_przedmiot')
    Left = 96
    Top = 136
  end
  object TASelectAllPozyczkaPrzedmiot: TFDTableAdapter
    UpdateTableName = 'osoba'
    DatSTableName = 'MTSelectAllPozyczkaPrzedmiot'
    SelectCommand = CMDSelectAllPozyczkaPrzedmiot
    Left = 272
    Top = 136
  end
  object MTSelectAllPozyczkaPrzedmiot: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = TASelectAllPozyczkaPrzedmiot
    Left = 440
    Top = 136
  end
  object DSPozyczkaPrzedmiot: TDataSource
    DataSet = MTSelectAllPozyczkaPrzedmiot
    Left = 592
    Top = 136
  end
  object CMDSelectAllOsoba: TFDCommand
    Connection = PozyczkomatDatabaseConnection
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    CommandText.Strings = (
      
        'Select id as ID, imie as Imi'#281', nazwisko as Nazwisko, telefon as ' +
        #39'Nr. telefonu'#39', email as '#39'E-mail'#39', adres as Adres from osoba')
    Left = 88
    Top = 344
  end
  object TASelectAllOsoba: TFDTableAdapter
    UpdateTableName = 'osoba'
    DatSTableName = 'MTSelectAllOsoba'
    SelectCommand = CMDSelectAllOsoba
    Left = 248
    Top = 344
  end
  object MTSelectAllOsoba: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = TASelectAllOsoba
    Left = 424
    Top = 344
  end
  object DSOsoba: TDataSource
    DataSet = MTSelectAllOsoba
    Left = 576
    Top = 344
  end
  object CMDSelectAllPrzedmiot: TFDCommand
    Connection = PozyczkomatDatabaseConnection
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    CommandText.Strings = (
      
        'Select id as ID, nazwa as Nazwa, sciezka as '#39#346'cie'#380'ka'#39' from przed' +
        'miot')
    Left = 88
    Top = 448
  end
  object TASelectAllPrzedmiot: TFDTableAdapter
    UpdateTableName = 'przedmiot'
    DatSTableName = 'MTSelectAllPrzedmiot'
    SelectCommand = CMDSelectAllPrzedmiot
    Left = 256
    Top = 448
  end
  object MTSelectAllPrzedmiot: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = TASelectAllPrzedmiot
    Left = 424
    Top = 448
  end
  object DSPrzedmiot: TDataSource
    DataSet = MTSelectAllPrzedmiot
    Left = 584
    Top = 448
  end
  object CMDSelectAllPozyczkaPieniadze: TFDCommand
    Connection = PozyczkomatDatabaseConnection
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    CommandText.Strings = (
      
        'Select pozyczka_pieniadze.id as ID, Concat(imie, '#39' '#39', nazwisko) ' +
        'as Osoba, ilosc as Kwota, data_udzielenia as Udzielono, termin_o' +
        'ddania as Termin, data_oddania as Oddano, data_oddania>termin_od' +
        'dania as Przeterminowane from osoba, pozyczka_pieniadze where os' +
        'oba.id = pozyczka_pieniadze.id_osoba')
    Left = 96
    Top = 248
  end
  object TASelectAllPozyczkaPieniadze: TFDTableAdapter
    UpdateTableName = 'osoba'
    DatSTableName = 'MTSelectAllPozyczkaPieniadze'
    SelectCommand = CMDSelectAllPozyczkaPieniadze
    Left = 280
    Top = 248
  end
  object MTSelectAllPozyczkaPieniadze: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = TASelectAllPozyczkaPieniadze
    Left = 456
    Top = 248
  end
  object DSPozyczkaPieniadze: TDataSource
    DataSet = MTSelectAllPozyczkaPieniadze
    Left = 608
    Top = 248
  end
  object QAddPerson: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      
        'Insert into osoba (imie, nazwisko, telefon, adres, email) values' +
        ' (:Imie, :Nazwisko, :Telefon, :Adres, :Email)')
    Left = 1040
    Top = 136
    ParamData = <
      item
        Name = 'IMIE'
        ParamType = ptInput
      end
      item
        Name = 'NAZWISKO'
        ParamType = ptInput
      end
      item
        Name = 'TELEFON'
        ParamType = ptInput
      end
      item
        Name = 'ADRES'
        ParamType = ptInput
      end
      item
        Name = 'EMAIL'
        ParamType = ptInput
      end>
  end
  object QAddItem: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      'Insert into przedmiot (nazwa, sciezka) values (:Nazwa, :Sciezka)')
    Left = 1144
    Top = 136
    ParamData = <
      item
        Name = 'NAZWA'
        ParamType = ptInput
      end
      item
        Name = 'SCIEZKA'
        ParamType = ptInput
      end>
  end
  object QUpdatePerson: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      'UPDATE osoba'
      'SET imie = :Imie,'
      '    nazwisko = :Nazwisko,'
      '    telefon = :Telefon,'
      '    adres = :Adres,'
      '    email = :Email'
      'WHERE id = :ID')
    Left = 1040
    Top = 200
    ParamData = <
      item
        Name = 'IMIE'
        ParamType = ptInput
      end
      item
        Name = 'NAZWISKO'
        ParamType = ptInput
      end
      item
        Name = 'TELEFON'
        ParamType = ptInput
      end
      item
        Name = 'ADRES'
        ParamType = ptInput
      end
      item
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object QDeletePerson: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      'DELETE FROM osoba'
      'WHERE id = :ID')
    Left = 1040
    Top = 264
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object QUpdateItem: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      'UPDATE przedmiot'
      'SET nazwa = :Nazwa,'
      '    sciezka = :Sciezka'
      'WHERE id = :ID;')
    Left = 1144
    Top = 200
    ParamData = <
      item
        Name = 'NAZWA'
        ParamType = ptInput
      end
      item
        Name = 'SCIEZKA'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object QDeleteItem: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      'DELETE FROM przedmiot'
      'WHERE id = :ID;')
    Left = 1144
    Top = 264
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object QAddPozyczkaPrzedmiot: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      
        'Insert into pozyczka_przedmiot(id_przedmiot, id_osoba, ilosc, da' +
        'ta_udzielenia, termin_oddania) VALUES(:IDP, :IDO, :Ilosc, :DataU' +
        ', :Termin)')
    Left = 1040
    Top = 336
    ParamData = <
      item
        Name = 'IDP'
        ParamType = ptInput
      end
      item
        Name = 'IDO'
        ParamType = ptInput
      end
      item
        Name = 'ILOSC'
        ParamType = ptInput
      end
      item
        Name = 'DATAU'
        ParamType = ptInput
      end
      item
        Name = 'TERMIN'
        ParamType = ptInput
      end>
  end
  object QAddPozyczkaPieniadze: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      
        'insert into pozyczka_pieniadze (id_osoba, ilosc, data_udzielenia' +
        ', termin_oddania) values (:IDO, :Ilosc, :DataU, :Termin)')
    Left = 1192
    Top = 336
    ParamData = <
      item
        Name = 'IDO'
        ParamType = ptInput
      end
      item
        Name = 'ILOSC'
        ParamType = ptInput
      end
      item
        Name = 'DATAU'
        ParamType = ptInput
      end
      item
        Name = 'TERMIN'
        ParamType = ptInput
      end>
  end
  object QEditPozyczkaPrzedmiot: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      'UPDATE pozyczka_przedmiot'
      'SET id_przedmiot = :IDP,'
      '    id_osoba = :IDO,'
      '    ilosc = :Ilosc,'
      '    data_udzielenia = :DataU,'
      '    termin_oddania = :Termin'
      'WHERE id = :ID;')
    Left = 1040
    Top = 400
    ParamData = <
      item
        Name = 'IDP'
        ParamType = ptInput
      end
      item
        Name = 'IDO'
        ParamType = ptInput
      end
      item
        Name = 'ILOSC'
        ParamType = ptInput
      end
      item
        Name = 'DATAU'
        ParamType = ptInput
      end
      item
        Name = 'TERMIN'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object QDelPozyczkaPrzedmiot: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      'DELETE FROM pozyczka_przedmiot'
      'WHERE id = :ID;')
    Left = 1040
    Top = 464
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object QEditPozyczkaPieniadze: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      'UPDATE pozyczka_pieniadze'
      'SET id_osoba = :IDO,'
      '    ilosc = :Ilosc,'
      '    data_udzielenia = :DataU,'
      '    termin_oddania = :Termin'
      'WHERE id = :ID;')
    Left = 1192
    Top = 400
    ParamData = <
      item
        Name = 'IDO'
        ParamType = ptInput
      end
      item
        Name = 'ILOSC'
        ParamType = ptInput
      end
      item
        Name = 'DATAU'
        ParamType = ptInput
      end
      item
        Name = 'TERMIN'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object QDelPozyczkaPieniadze: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      'DELETE FROM pozyczka_pieniadze'
      'WHERE id = :ID;')
    Left = 1192
    Top = 464
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object QReturnPozyczkaPrzedmiot: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      'UPDATE pozyczka_przedmiot'
      'SET data_oddania = :DataOddania'
      'WHERE id = :ID;')
    Left = 760
    Top = 136
    ParamData = <
      item
        Name = 'DATAODDANIA'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object QReturnPozyczkaPieniadze: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      'UPDATE pozyczka_pieniadze'
      'SET data_oddania = :DataOddania'
      'WHERE id = :ID;')
    Left = 760
    Top = 248
    ParamData = <
      item
        Name = 'DATAODDANIA'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object QCheckPerson: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      'SELECT COUNT(*) AS Cnt'
      'FROM osoba'
      'WHERE imie = :imie AND nazwisko = :nazwisko'
      '  AND telefon = :telefon AND email = :email;')
    Left = 1040
    Top = 536
    ParamData = <
      item
        Name = 'IMIE'
        ParamType = ptInput
      end
      item
        Name = 'NAZWISKO'
        ParamType = ptInput
      end
      item
        Name = 'TELEFON'
        ParamType = ptInput
      end
      item
        Name = 'EMAIL'
        ParamType = ptInput
      end>
  end
  object QCheckItem: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      'SELECT COUNT(*) AS CNT'
      'FROM przedmiot'
      'WHERE Nazwa = :nazwa;')
    Left = 1160
    Top = 536
    ParamData = <
      item
        Name = 'NAZWA'
        ParamType = ptInput
      end>
  end
  object QSearchPerson: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      
        'Select id as ID, imie as Imi'#281', nazwisko as Nazwisko, telefon as ' +
        #39'Nr. telefonu'#39', email as '#39'E-mail'#39', adres as Adres'
      'FROM osoba'
      'WHERE imie LIKE :search'
      '   OR nazwisko LIKE :search'
      '   OR CONCAT(imie, '#39' '#39', nazwisko) LIKE :search')
    Left = 1040
    Top = 600
    ParamData = <
      item
        Name = 'SEARCH'
        ParamType = ptInput
        Value = Null
      end>
  end
  object QSearchItem: TFDQuery
    Connection = PozyczkomatDatabaseConnection
    SQL.Strings = (
      'Select id as ID, nazwa as Nazwa, sciezka as '#39#346'cie'#380'ka'#39
      'FROM przedmiot'
      'WHERE nazwa LIKE :search;'
      '')
    Left = 1160
    Top = 600
    ParamData = <
      item
        Name = 'SEARCH'
        ParamType = ptInput
        Value = Null
      end>
  end
end
