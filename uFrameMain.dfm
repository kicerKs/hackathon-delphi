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
    ExplicitWidth = 1338
    ExplicitHeight = 632
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
  end
end
