object FrameMain: TFrameMain
  Left = 0
  Top = 0
  Width = 1263
  Height = 634
  TabOrder = 0
  object panelMain: TPanel
    Left = 0
    Top = 0
    Width = 1263
    Height = 634
    Align = alClient
    TabOrder = 0
    object imgLoan: TImage
      Left = 936
      Top = 272
      Width = 305
      Height = 305
    end
    object Label1: TLabel
      Left = 936
      Top = 42
      Width = 81
      Height = 15
      Caption = 'Pole na edycje?'
    end
    object Label2: TLabel
      Left = 936
      Top = 250
      Width = 68
      Height = 15
      Caption = 'tu sie konczy'
    end
    object DBGridPozyczkaPieniadze: TDBGrid
      Left = 32
      Top = 42
      Width = 881
      Height = 535
      DataSource = DataModule1.DSPozyczkaPieniadze
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Visible = False
      OnDrawColumnCell = DBGridPozyczkaPieniadzeDrawColumnCell
      OnDblClick = DBGridPozyczkaPieniadzeDblClick
      OnKeyDown = DBGridPozyczkaPieniadzeKeyDown
    end
    object toggleSwitch: TToggleSwitch
      Left = 32
      Top = 16
      Width = 116
      Height = 20
      Hint = 'abc'
      StateCaptions.CaptionOn = 'Pieni'#261'dze'
      StateCaptions.CaptionOff = 'Przedmioty'
      TabOrder = 2
      OnClick = toggleSwitchClick
    end
    object DBGridPozyczkaPrzedmiot: TDBGrid
      Left = 32
      Top = 42
      Width = 881
      Height = 535
      DataSource = DataModule1.DSPozyczkaPrzedmiot
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridPozyczkaPrzedmiotDrawColumnCell
      OnDblClick = DBGridPozyczkaPrzedmiotDblClick
      OnKeyDown = DBGridPozyczkaPrzedmiotKeyDown
    end
    object comboPersonEdit: TComboBox
      Left = 936
      Top = 73
      Width = 186
      Height = 23
      TabOrder = 3
      Visible = False
    end
    object comboItemEdit: TComboBox
      Left = 936
      Top = 102
      Width = 186
      Height = 23
      TabOrder = 4
      Visible = False
    end
    object editQuantity: TEdit
      Left = 936
      Top = 131
      Width = 186
      Height = 23
      TabOrder = 5
      Visible = False
    end
    object dateStart: TDateTimePicker
      Left = 936
      Top = 160
      Width = 186
      Height = 23
      Date = 45896.000000000000000000
      Time = 0.673268217593431500
      TabOrder = 6
      Visible = False
    end
    object dateEnd: TDateTimePicker
      Left = 936
      Top = 189
      Width = 186
      Height = 23
      Date = 45896.000000000000000000
      Time = 0.673412407406431200
      TabOrder = 7
      Visible = False
    end
    object btnEditLoan: TButton
      Left = 936
      Top = 218
      Width = 186
      Height = 25
      Caption = 'Zapisz'
      TabOrder = 8
      OnClick = btnEditLoanClick
    end
    object btnGoEdit: TButton
      Left = 936
      Top = 42
      Width = 186
      Height = 25
      Caption = 'Edytuj po'#380'yczk'#281
      TabOrder = 9
      OnClick = btnGoEditClick
    end
    object btnGoCheck: TButton
      Left = 936
      Top = 42
      Width = 186
      Height = 25
      Caption = 'Powr'#243't'
      TabOrder = 10
      Visible = False
      OnClick = btnGoCheckClick
    end
    object dateReturnTime: TDateTimePicker
      Left = 936
      Top = 102
      Width = 186
      Height = 23
      Date = 45896.000000000000000000
      Time = 0.736991342593682900
      TabOrder = 11
    end
    object btnReturn: TButton
      Left = 936
      Top = 71
      Width = 186
      Height = 25
      Caption = 'Oddane'
      TabOrder = 12
      OnClick = btnReturnClick
    end
  end
end
