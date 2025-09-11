object FramePeople: TFramePeople
  Left = 0
  Top = 0
  Width = 1389
  Height = 744
  TabOrder = 0
  object panelPeople: TPanel
    Left = 0
    Top = 0
    Width = 1389
    Height = 744
    Align = alClient
    TabOrder = 0
    object editName: TEdit
      Left = 1040
      Top = 234
      Width = 200
      Height = 23
      TabOrder = 0
      Text = 'Imi'#281
      OnEnter = editNameEnter
      OnKeyPress = editNameKeyPress
    end
    object editSurname: TEdit
      Left = 1040
      Top = 263
      Width = 200
      Height = 23
      TabOrder = 1
      Text = 'Nazwisko'
      OnEnter = editSurnameEnter
      OnKeyPress = editSurnameKeyPress
    end
    object editPhone: TEdit
      Left = 1040
      Top = 292
      Width = 200
      Height = 23
      Hint = 'Telefon'
      TabOrder = 2
      Text = 'Telefon'
      OnEnter = editPhoneEnter
      OnExit = editPhoneExit
      OnKeyPress = editPhoneKeyPress
    end
    object editAddress: TEdit
      Left = 1040
      Top = 321
      Width = 200
      Height = 23
      TabOrder = 3
      Text = 'Adres'
      OnEnter = EditAddressEnter
    end
    object editEmail: TEdit
      Left = 1040
      Top = 350
      Width = 200
      Height = 23
      TabOrder = 4
      Text = 'E-Mail'
      OnEnter = editEmailEnter
    end
    object btnAddPerson: TButton
      Left = 1040
      Top = 379
      Width = 200
      Height = 25
      Caption = 'Dodaj'
      TabOrder = 5
      OnClick = btnAddPersonClick
    end
    object DBGridPerson: TDBGrid
      Left = 16
      Top = 44
      Width = 1009
      Height = 565
      DataSource = DataModule1.DSOsoba
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DBGridPersonDblClick
    end
    object btnEditPerson: TButton
      Left = 1040
      Top = 379
      Width = 200
      Height = 25
      Caption = 'Edytuj'
      TabOrder = 7
      Visible = False
      OnClick = btnEditPersonClick
    end
    object btnDelete: TButton
      Left = 1040
      Top = 410
      Width = 200
      Height = 25
      Caption = 'Usu'#324
      TabOrder = 8
      Visible = False
      OnClick = btnDeleteClick
    end
    object btnGoAdd: TButton
      Left = 1040
      Top = 203
      Width = 200
      Height = 25
      Caption = 'Przejd'#378' do Dodawania'
      TabOrder = 9
      Visible = False
      OnClick = btnGoAddClick
    end
    object btnGoEdit: TButton
      Left = 1040
      Top = 204
      Width = 200
      Height = 25
      Caption = 'Przejd'#378' do Edycji'
      TabOrder = 10
      OnClick = btnGoEditClick
    end
    object editSearch: TEdit
      Left = 16
      Top = 175
      Width = 450
      Height = 23
      TabOrder = 11
      Text = 'Wyszukaj'
      OnEnter = editSearchEnter
      OnExit = editSearchExit
      OnKeyPress = editSearchKeyPress
    end
    object btnSearch: TButton
      Left = 472
      Top = 13
      Width = 112
      Height = 25
      Caption = 'Szukaj'
      TabOrder = 12
      OnClick = btnSearchClick
    end
    object btnReset: TButton
      Left = 590
      Top = 13
      Width = 115
      Height = 25
      Caption = 'Reset widoku'
      TabOrder = 13
      OnClick = btnResetClick
    end
  end
end
