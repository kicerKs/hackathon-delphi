object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 681
  ClientWidth = 1264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object panelNav: TPanel
    Left = 0
    Top = 0
    Width = 1264
    Height = 49
    Align = alTop
    TabOrder = 0
    object btnMain: TSpeedButton
      Left = 0
      Top = 0
      Width = 200
      Height = 49
      GroupIndex = 1
      Down = True
      Caption = 'Po'#380'yczki'
      Transparent = False
      OnClick = btnMainClick
    end
    object btnAdd: TSpeedButton
      Left = 200
      Top = 0
      Width = 200
      Height = 49
      GroupIndex = 1
      Caption = 'Dodaj'
      Flat = True
      OnClick = btnAddClick
    end
    object btnCalendar: TSpeedButton
      Left = 400
      Top = 0
      Width = 200
      Height = 49
      GroupIndex = 1
      Caption = 'Kalendarz'
      OnClick = btnCalendarClick
    end
    object btnPeople: TSpeedButton
      Left = 600
      Top = 0
      Width = 200
      Height = 49
      GroupIndex = 1
      Caption = 'Osoby'
      OnClick = btnPeopleClick
    end
    object btnOption: TSpeedButton
      Left = 1000
      Top = 0
      Width = 200
      Height = 49
      GroupIndex = 1
      Caption = 'Opcje'
      OnClick = btnOptionsClick
    end
    object btnItems: TSpeedButton
      Left = 800
      Top = 0
      Width = 200
      Height = 49
      GroupIndex = 1
      Caption = 'Przedmioty'
      OnClick = btnItemsClick
    end
  end
  object panelCalendar: TPanel
    Left = 0
    Top = 49
    Width = 1264
    Height = 632
    Align = alClient
    TabOrder = 2
    Visible = False
    object Label2: TLabel
      Left = 624
      Top = 320
      Width = 34
      Height = 15
      Caption = 'Label2'
    end
  end
  object panelOption: TPanel
    Left = 0
    Top = 49
    Width = 1264
    Height = 632
    Align = alClient
    TabOrder = 4
    Visible = False
    object Label4: TLabel
      Left = 48
      Top = 171
      Width = 64
      Height = 15
      Caption = 'Tryb ciemny'
    end
  end
  object panelAdd: TPanel
    Left = 0
    Top = 49
    Width = 1264
    Height = 632
    Align = alClient
    TabOrder = 3
    Visible = False
    object Label1: TLabel
      Left = 208
      Top = 84
      Width = 54
      Height = 15
      Caption = 'Przedmiot'
    end
    object Label6: TLabel
      Left = 208
      Top = 113
      Width = 24
      Height = 15
      Caption = 'Ilo'#347#263
    end
    object Label7: TLabel
      Left = 208
      Top = 55
      Width = 34
      Height = 15
      Caption = 'Osoba'
    end
    object btnAddLoan: TButton
      Left = 16
      Top = 168
      Width = 186
      Height = 25
      Caption = 'Dodaj'
      TabOrder = 0
    end
    object loanExpDate: TDateTimePicker
      Left = 16
      Top = 139
      Width = 186
      Height = 23
      Date = 45884.000000000000000000
      Time = 0.768565601851150900
      TabOrder = 1
    end
    object editWhatMoney: TEdit
      Left = 16
      Top = 81
      Width = 186
      Height = 23
      TabOrder = 2
    end
    object radioItem: TRadioButton
      Left = 16
      Top = 6
      Width = 113
      Height = 17
      Caption = 'radioItem'
      Checked = True
      TabOrder = 3
      TabStop = True
      OnClick = RadioButtonClick
    end
    object radioMoney: TRadioButton
      Left = 16
      Top = 29
      Width = 113
      Height = 17
      Caption = 'radioMoney'
      TabOrder = 4
      OnClick = RadioButtonClick
    end
    object editNumber: TEdit
      Left = 16
      Top = 110
      Width = 186
      Height = 23
      TabOrder = 5
    end
    object comboBoxPerson: TComboBox
      Left = 16
      Top = 52
      Width = 186
      Height = 23
      TabOrder = 6
    end
  end
  object panelMain: TPanel
    Left = 0
    Top = 49
    Width = 1264
    Height = 632
    Align = alClient
    TabOrder = 5
    object Label3: TLabel
      Left = 232
      Top = 408
      Width = 34
      Height = 15
      Caption = 'Label3'
    end
    object imgLoan: TImage
      Left = 656
      Top = 6
      Width = 387
      Height = 387
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 6
      Width = 1027
      Height = 387
      DataSource = DataModule1.DSPozyczkaPrzedmiot
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object panelPeople: TPanel
    Left = 0
    Top = 49
    Width = 1264
    Height = 632
    Align = alClient
    TabOrder = 1
    Visible = False
    object editName: TEdit
      Left = 728
      Top = 23
      Width = 200
      Height = 23
      TabOrder = 0
      Text = 'Imi'#281
      OnEnter = editNameEnter
      OnExit = editNameExit
    end
    object editSurname: TEdit
      Left = 728
      Top = 52
      Width = 200
      Height = 23
      TabOrder = 1
      Text = 'Nazwisko'
      OnEnter = editSurnameEnter
      OnExit = editSurnameExit
    end
    object editPhone: TEdit
      Left = 728
      Top = 81
      Width = 200
      Height = 23
      Hint = 'Telefon'
      TabOrder = 2
      Text = 'Telefon'
      OnEnter = editPhoneEnter
      OnExit = editPhoneExit
      OnKeyPress = editPhoneKeyPress
    end
    object editAddress: TEdit
      Left = 728
      Top = 110
      Width = 200
      Height = 23
      TabOrder = 3
      Text = 'Adres'
      OnEnter = editAddressEnter
      OnExit = editAddressExit
    end
    object editEmail: TEdit
      Left = 728
      Top = 139
      Width = 200
      Height = 23
      TabOrder = 4
      Text = 'E-Mail'
      OnEnter = editEmailEnter
      OnExit = editEmailExit
    end
    object btnAddPerson: TButton
      Left = 728
      Top = 168
      Width = 200
      Height = 25
      Caption = 'Dodaj'
      TabOrder = 5
    end
    object DBGrid2: TDBGrid
      Left = 16
      Top = 13
      Width = 689
      Height = 173
      DataSource = DataModule1.DSOsoba
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object panelItems: TPanel
    Left = 0
    Top = 49
    Width = 1264
    Height = 632
    Align = alClient
    TabOrder = 6
    Visible = False
    object Edit1: TEdit
      Left = 728
      Top = 23
      Width = 200
      Height = 23
      TabOrder = 0
      Text = 'Nazwa'
      OnEnter = editNameEnter
      OnExit = editNameExit
    end
    object Edit2: TEdit
      Left = 728
      Top = 52
      Width = 200
      Height = 23
      TabOrder = 1
      Text = #346'cie'#380'ka'
      OnEnter = editSurnameEnter
      OnExit = editSurnameExit
    end
    object Button1: TButton
      Left = 728
      Top = 168
      Width = 200
      Height = 25
      Caption = 'Dodaj'
      TabOrder = 2
    end
    object DBGrid3: TDBGrid
      Left = 16
      Top = 13
      Width = 689
      Height = 173
      DataSource = DataModule1.DSPrzedmiot
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
end
