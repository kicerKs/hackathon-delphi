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
    ExplicitWidth = 640
    ExplicitHeight = 480
    object Label4: TLabel
      Left = 40
      Top = 435
      Width = 144
      Height = 15
      Caption = 'Powiadomienia systemowe'
    end
    object switchNotif: TToggleSwitch
      Left = 40
      Top = 456
      Width = 73
      Height = 20
      TabOrder = 0
    end
    object btnSave: TButton
      Left = 1088
      Top = 451
      Width = 75
      Height = 25
      Caption = 'Zapisz'
      TabOrder = 1
      OnClick = btnSaveClick
    end
  end
end
