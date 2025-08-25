object FrameItems: TFrameItems
  Left = 0
  Top = 0
  Width = 1123
  Height = 480
  TabOrder = 0
  object panelItems: TPanel
    Left = 0
    Top = 0
    Width = 1123
    Height = 480
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 640
    object editItemName: TEdit
      Left = 728
      Top = 44
      Width = 200
      Height = 23
      TabOrder = 0
      Text = 'Nazwa'
    end
    object editItemPath: TEdit
      Left = 728
      Top = 73
      Width = 200
      Height = 23
      TabOrder = 1
      Text = #346'cie'#380'ka'
    end
    object btnAddItem: TButton
      Left = 728
      Top = 102
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
      OnDblClick = DBGridItemDblClick
    end
    object btnEditItem: TButton
      Left = 728
      Top = 102
      Width = 200
      Height = 25
      Caption = 'Edytuj'
      TabOrder = 4
      Visible = False
      OnClick = btnEditItemClick
    end
    object btnDelItem: TButton
      Left = 728
      Top = 133
      Width = 200
      Height = 25
      Caption = 'Usu'#324
      TabOrder = 5
      Visible = False
      OnClick = btnDelItemClick
    end
    object btnGoEdit: TButton
      Left = 728
      Top = 13
      Width = 200
      Height = 25
      Caption = 'Edycja'
      TabOrder = 6
      OnClick = btnGoEditClick
    end
    object btnGoAdd: TButton
      Left = 728
      Top = 13
      Width = 200
      Height = 25
      Caption = 'Dodawanie'
      TabOrder = 7
      Visible = False
      OnClick = btnGoAddClick
    end
  end
end
