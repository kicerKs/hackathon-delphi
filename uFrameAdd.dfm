object FrameAdd: TFrameAdd
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object panelAdd: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    TabOrder = 0
    object label2: TLabel
      Left = 208
      Top = 84
      Width = 54
      Height = 15
      Caption = 'Przedmiot'
    end
    object label3: TLabel
      Left = 208
      Top = 113
      Width = 24
      Height = 15
      Caption = 'Ilo'#347#263
    end
    object label1: TLabel
      Left = 208
      Top = 55
      Width = 34
      Height = 15
      Caption = 'Osoba'
    end
    object label4: TLabel
      Left = 208
      Top = 142
      Width = 24
      Height = 15
      Caption = 'Ilo'#347#263
    end
    object label5: TLabel
      Left = 208
      Top = 171
      Width = 36
      Height = 15
      Caption = 'Termin'
    end
    object btnAddLoan: TButton
      Left = 16
      Top = 197
      Width = 186
      Height = 25
      Caption = 'Dodaj'
      TabOrder = 0
      OnClick = clickButtonAdd
    end
    object loanExpDate: TDateTimePicker
      Left = 16
      Top = 168
      Width = 186
      Height = 23
      Date = 45884.000000000000000000
      Time = 0.768565601851150900
      TabOrder = 1
    end
    object radioItem: TRadioButton
      Left = 16
      Top = 6
      Width = 113
      Height = 17
      Caption = 'radioItem'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = RadioButtonClick
    end
    object radioMoney: TRadioButton
      Left = 16
      Top = 29
      Width = 113
      Height = 17
      Caption = 'radioMoney'
      TabOrder = 3
      OnClick = RadioButtonClick
    end
    object editNumber: TEdit
      Left = 16
      Top = 110
      Width = 186
      Height = 23
      TabOrder = 4
    end
    object comboBoxPerson: TComboBox
      Left = 16
      Top = 52
      Width = 186
      Height = 23
      TabOrder = 5
    end
    object comboBoxItem: TComboBox
      Left = 16
      Top = 81
      Width = 186
      Height = 23
      TabOrder = 6
    end
    object loanGivenDate: TDateTimePicker
      Left = 16
      Top = 139
      Width = 186
      Height = 23
      Date = 45884.000000000000000000
      Time = 0.768565601851150900
      TabOrder = 7
    end
  end
end
