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
        'as Osoba, nazwa as Przedmiot, data_udzielenia as Udzielono, term' +
        'in_oddania as Termin, data_oddania as Oddano from osoba, przedmi' +
        'ot, pozyczka_przedmiot where osoba.id = pozyczka_przedmiot.id_os' +
        'oba and przedmiot.id = pozyczka_przedmiot.id_przedmiot')
    Left = 96
    Top = 136
  end
  object TASelectAllPozyczkaPrzedmiot: TFDTableAdapter
    DatSTableName = 'FDMemTable1'
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
    Left = 96
    Top = 232
  end
  object TASelectAllOsoba: TFDTableAdapter
    DatSTableName = 'MTSelectAllOsoba'
    SelectCommand = CMDSelectAllOsoba
    Left = 272
    Top = 240
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
    Left = 440
    Top = 248
  end
  object DSOsoba: TDataSource
    DataSet = MTSelectAllOsoba
    Left = 592
    Top = 256
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
    Left = 96
    Top = 328
  end
  object TASelectAllPrzedmiot: TFDTableAdapter
    DatSTableName = 'MTSelectAllPrzedmiot'
    SelectCommand = CMDSelectAllPrzedmiot
    Left = 264
    Top = 336
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
    Left = 432
    Top = 336
  end
  object DSPrzedmiot: TDataSource
    DataSet = MTSelectAllPrzedmiot
    Left = 592
    Top = 336
  end
end
