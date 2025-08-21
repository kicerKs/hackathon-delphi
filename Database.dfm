object DataModule1: TDataModule1
  Height = 839
  Width = 1350
  object PozyczkomatDatabaseConnection: TFDConnection
    Params.Strings = (
      'Database=pozyczkomat'
      'DriverID=MySQL510_Embedded')
    Connected = True
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
    Top = 320
  end
  object TASelectAllOsoba: TFDTableAdapter
    DatSTableName = 'MTSelectAllOsoba'
    SelectCommand = CMDSelectAllOsoba
    Left = 248
    Top = 328
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
    Top = 336
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
    Left = 592
    Top = 256
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
    Left = 1040
    Top = 208
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
end
