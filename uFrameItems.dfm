object FrameItems: TFrameItems
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object panelItems: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -624
    ExplicitTop = -152
    ExplicitWidth = 1264
    ExplicitHeight = 632
    object editItemName: TEdit
      Left = 728
      Top = 23
      Width = 200
      Height = 23
      TabOrder = 0
      Text = 'Nazwa'
    end
    object editItemPath: TEdit
      Left = 728
      Top = 52
      Width = 200
      Height = 23
      TabOrder = 1
      Text = #346'cie'#380'ka'
    end
    object btnAddItem: TButton
      Left = 728
      Top = 168
      Width = 200
      Height = 25
      Caption = 'Dodaj'
      TabOrder = 2
      OnClick = btnAddItemClick
    end
    object DBGridItem: TDBGrid
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
