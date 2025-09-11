object FrameOption: TFrameOption
  Left = 0
  Top = 0
  Width = 1263
  Height = 634
  TabOrder = 0
  object panelOption: TPanel
    Left = 0
    Top = 0
    Width = 1263
    Height = 634
    Align = alClient
    TabOrder = 0
    object Label4: TLabel
      Left = 40
      Top = 115
      Width = 144
      Height = 15
      Caption = 'Powiadomienia systemowe'
    end
    object Label1: TLabel
      Left = 40
      Top = 51
      Width = 64
      Height = 15
      Caption = 'Tryb ciemny'
    end
    object Label2: TLabel
      Left = 536
      Top = 224
      Width = 582
      Height = 120
      Alignment = taCenter
      Caption = 
        'Aplikacja "Po'#380'yczkomat"'#13#10#13#10'Stworzona przez Oskara Chru'#347'ci'#324'skiego' +
        ' i Jakuba Stachurskiego'#13#10'na poczet konkursu Hackathon Delphi'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object switchNotif: TToggleSwitch
      Left = 40
      Top = 136
      Width = 73
      Height = 20
      TabOrder = 0
    end
    object btnSave: TButton
      Left = 40
      Top = 179
      Width = 75
      Height = 25
      Caption = 'Zapisz'
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object switchTheme: TToggleSwitch
      Left = 40
      Top = 72
      Width = 73
      Height = 20
      TabOrder = 2
      OnClick = switchThemeOnClick
    end
  end
end
