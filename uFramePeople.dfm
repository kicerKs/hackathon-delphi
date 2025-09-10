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
      Left = 728
      Top = 75
      Width = 200
      Height = 23
      TabOrder = 0
      Text = 'Imi'#281
      OnEnter = editNameEnter
      OnKeyPress = editNameKeyPress
    end
    object editSurname: TEdit
      Left = 728
      Top = 104
      Width = 200
      Height = 23
      TabOrder = 1
      Text = 'Nazwisko'
      OnEnter = editSurnameEnter
      OnKeyPress = editSurnameKeyPress
    end
    object editPhone: TEdit
      Left = 728
      Top = 133
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
      Left = 728
      Top = 162
      Width = 200
      Height = 23
      TabOrder = 3
      Text = 'Adres'
      OnEnter = EditAddressEnter
    end
    object editEmail: TEdit
      Left = 728
      Top = 191
      Width = 200
      Height = 23
      TabOrder = 4
      Text = 'E-Mail'
      OnEnter = editEmailEnter
    end
    object btnAddPerson: TButton
      Left = 728
      Top = 220
      Width = 200
      Height = 25
      Caption = 'Dodaj'
      TabOrder = 5
      OnClick = btnAddPersonClick
    end
    object DBGridPerson: TDBGrid
      Left = 16
      Top = 13
      Width = 689
      Height = 300
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
      Left = 728
      Top = 220
      Width = 200
      Height = 25
      Caption = 'Edytuj'
      TabOrder = 7
      Visible = False
      OnClick = btnEditPersonClick
    end
    object btnDelete: TButton
      Left = 728
      Top = 251
      Width = 200
      Height = 25
      Caption = 'Usu'#324
      TabOrder = 8
      Visible = False
      OnClick = btnDeleteClick
    end
    object btnGoAdd: TButton
      Left = 728
      Top = 44
      Width = 200
      Height = 25
      Caption = 'Przejd'#378' do Dodawania'
      TabOrder = 9
      Visible = False
      OnClick = btnGoAddClick
    end
    object btnGoEdit: TButton
      Left = 728
      Top = 44
      Width = 200
      Height = 25
      Caption = 'Przejd'#378' do Edycji'
      TabOrder = 10
      OnClick = btnGoEditClick
    end
    object editSearch: TEdit
      Left = 728
      Top = 13
      Width = 200
      Height = 23
      TabOrder = 11
      Text = 'Wyszukaj'
      OnEnter = editSearchEnter
      OnExit = editSearchExit
      OnKeyPress = editSearchKeyPress
    end
    object btnSearch: TButton
      Left = 934
      Top = 12
      Width = 90
      Height = 25
      Caption = 'Szukaj'
      TabOrder = 12
      OnClick = btnSearchClick
    end
    object btnReset: TButton
      Left = 1030
      Top = 12
      Width = 90
      Height = 25
      Caption = 'Reset widoku'
      TabOrder = 13
      OnClick = btnResetClick
    end
  end
end
