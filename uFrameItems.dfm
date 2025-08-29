object FrameItems: TFrameItems
  Left = 0
  Top = 0
  Width = 1299
  Height = 638
  TabOrder = 0
  object panelItems: TPanel
    Left = 0
    Top = 0
    Width = 1299
    Height = 638
    Align = alClient
    TabOrder = 0
    object itemImage: TImage
      Left = 728
      Top = 193
      Width = 200
      Height = 205
      Center = True
      Proportional = True
    end
    object editItemName: TEdit
      Left = 728
      Top = 73
      Width = 200
      Height = 23
      TabOrder = 0
      Text = 'Nazwa'
    end
    object editItemPath: TEdit
      Left = 728
      Top = 102
      Width = 200
      Height = 23
      TabOrder = 1
      Text = #346'cie'#380'ka'
    end
    object btnAddItem: TButton
      Left = 728
      Top = 131
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
      Top = 131
      Width = 200
      Height = 25
      Caption = 'Edytuj'
      TabOrder = 4
      Visible = False
      OnClick = btnEditItemClick
    end
    object btnDelItem: TButton
      Left = 728
      Top = 162
      Width = 200
      Height = 25
      Caption = 'Usu'#324
      TabOrder = 5
      Visible = False
      OnClick = btnDelItemClick
    end
    object btnGoEdit: TButton
      Left = 728
      Top = 42
      Width = 200
      Height = 25
      Caption = 'Edycja'
      TabOrder = 6
      OnClick = btnGoEditClick
    end
    object btnGoAdd: TButton
      Left = 728
      Top = 42
      Width = 200
      Height = 25
      Caption = 'Dodawanie'
      TabOrder = 7
      Visible = False
      OnClick = btnGoAddClick
    end
    object btnOpenFile: TButton
      Left = 934
      Top = 101
      Width = 75
      Height = 25
      Caption = 'Wybierz...'
      TabOrder = 8
      OnClick = btnOpenFileClick
    end
    object editSearch: TEdit
      Left = 728
      Top = 13
      Width = 200
      Height = 23
      TabOrder = 9
      Text = 'Wyszukaj'
      OnEnter = editSearchEnter
      OnExit = editSearchExit
    end
    object btnSearch: TButton
      Left = 934
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Szukaj'
      TabOrder = 10
      OnClick = btnSearchClick
    end
    object btnReset: TButton
      Left = 1015
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Resetuj widok'
      TabOrder = 11
      OnClick = btnResetClick
    end
  end
  object openPicDialog: TOpenPictureDialog
    Left = 1064
    Top = 424
  end
end
