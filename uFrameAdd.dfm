object FrameAdd: TFrameAdd
  Left = 0
  Top = 0
  Width = 1223
  Height = 615
  TabOrder = 0
  object panelAdd: TPanel
    Left = 0
    Top = 0
    Width = 1223
    Height = 615
    Align = alClient
    TabOrder = 0
    object label2: TLabel
      Left = 224
      Top = 228
      Width = 54
      Height = 15
      Caption = 'Przedmiot'
    end
    object label3: TLabel
      Left = 224
      Top = 257
      Width = 24
      Height = 15
      Caption = 'Ilo'#347#263
    end
    object label1: TLabel
      Left = 224
      Top = 204
      Width = 34
      Height = 15
      Caption = 'Osoba'
    end
    object label4: TLabel
      Left = 224
      Top = 286
      Width = 47
      Height = 15
      Caption = 'Pocz'#261'tek'
    end
    object label5: TLabel
      Left = 224
      Top = 312
      Width = 36
      Height = 15
      Caption = 'Koniec'
    end
    object btnAddLoan: TButton
      Left = 62
      Top = 394
      Width = 186
      Height = 25
      Caption = 'Dodaj'
      TabOrder = 0
      OnClick = clickButtonAdd
    end
    object loanExpDate: TDateTimePicker
      Left = 32
      Top = 312
      Width = 186
      Height = 23
      Date = 45884.000000000000000000
      Time = 0.768565601851150900
      TabOrder = 1
    end
    object radioItem: TRadioButton
      Left = 72
      Top = 120
      Width = 176
      Height = 15
      Caption = 'Po'#380'yczam przedmiot'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = RadioButtonClick
    end
    object radioMoney: TRadioButton
      Left = 72
      Top = 141
      Width = 161
      Height = 17
      Caption = 'Po'#380'yczam pieni'#261'dze'
      TabOrder = 3
      OnClick = RadioButtonClick
    end
    object editNumber: TEdit
      Left = 32
      Top = 254
      Width = 186
      Height = 23
      TabOrder = 4
    end
    object loanGivenDate: TDateTimePicker
      Left = 32
      Top = 283
      Width = 186
      Height = 23
      Date = 45884.000000000000000000
      Time = 0.768565601851150900
      TabOrder = 5
    end
    object DBGridPeople: TDBGrid
      Left = 312
      Top = 6
      Width = 900
      Height = 300
      DataSource = DataModule1.DSOsoba
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DBGridPeopleOnDblClick
    end
    object editPerson: TEdit
      Left = 32
      Top = 196
      Width = 186
      Height = 23
      ReadOnly = True
      TabOrder = 7
    end
    object editItem: TEdit
      Left = 32
      Top = 225
      Width = 186
      Height = 23
      TabOrder = 8
    end
    object DBGridItems: TDBGrid
      Left = 312
      Top = 312
      Width = 900
      Height = 300
      DataSource = DataModule1.DSPrzedmiot
      TabOrder = 9
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DBGridItemsOnDblClick
    end
  end
end
