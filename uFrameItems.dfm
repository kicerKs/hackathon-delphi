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
      Left = 752
      Top = 193
      Width = 465
      Height = 424
      Center = True
      Proportional = True
    end
    object Label1: TLabel
      Left = 912
      Top = 384
      Width = 149
      Height = 15
      Caption = 'Brak obrazu do wy'#347'wietlenia'
      Visible = False
    end
    object editItemName: TEdit
      Left = 896
      Top = 56
      Width = 200
      Height = 23
      TabOrder = 0
      Text = 'Nazwa'
      OnEnter = editItemNameEnter
    end
    object editItemPath: TEdit
      Left = 896
      Top = 85
      Width = 200
      Height = 23
      TabOrder = 1
      Text = #346'cie'#380'ka'
      OnEnter = editItemPathEnter
    end
    object btnAddItem: TButton
      Left = 896
      Top = 114
      Width = 200
      Height = 25
      Caption = 'Dodaj'
      TabOrder = 2
      OnClick = btnAddItemClick
    end
    object DBGridItem: TDBGrid
      Left = 16
      Top = 42
      Width = 689
      Height = 575
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
      Left = 896
      Top = 114
      Width = 200
      Height = 25
      Caption = 'Edytuj'
      TabOrder = 4
      Visible = False
      OnClick = btnEditItemClick
    end
    object btnDelItem: TButton
      Left = 896
      Top = 145
      Width = 200
      Height = 25
      Caption = 'Usu'#324
      TabOrder = 5
      Visible = False
      OnClick = btnDelItemClick
    end
    object btnGoEdit: TButton
      Left = 896
      Top = 11
      Width = 200
      Height = 25
      Caption = 'Przejd'#378' do Edycji'
      TabOrder = 6
      OnClick = btnGoEditClick
    end
    object btnGoAdd: TButton
      Left = 896
      Top = 11
      Width = 200
      Height = 25
      Caption = 'Przejd'#378' do Dodawania'
      TabOrder = 7
      Visible = False
      OnClick = btnGoAddClick
    end
    object btnOpenFile: TButton
      Left = 1102
      Top = 85
      Width = 75
      Height = 25
      Caption = 'Wybierz...'
      TabOrder = 8
      OnClick = btnOpenFileClick
    end
    object editSearch: TEdit
      Left = 16
      Top = 13
      Width = 401
      Height = 23
      TabOrder = 9
      Text = 'Wyszukaj'
      OnEnter = editSearchEnter
      OnExit = editSearchExit
    end
    object btnSearch: TButton
      Left = 423
      Top = 11
      Width = 138
      Height = 25
      Caption = 'Szukaj'
      TabOrder = 10
      OnClick = btnSearchClick
    end
    object btnReset: TButton
      Left = 576
      Top = 11
      Width = 129
      Height = 25
      Caption = 'Reset widoku'
      TabOrder = 11
      OnClick = btnResetClick
    end
  end
  object openPicDialog: TOpenPictureDialog
    Left = 1240
    Top = 584
  end
end
