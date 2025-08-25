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
    ExplicitWidth = 637
    ExplicitHeight = 480
    object editName: TEdit
      Left = 728
      Top = 44
      Width = 200
      Height = 23
      TabOrder = 0
      Text = 'Imi'#281
      OnEnter = editNameEnter
      OnExit = editNameExit
    end
    object editSurname: TEdit
      Left = 728
      Top = 73
      Width = 200
      Height = 23
      TabOrder = 1
      Text = 'Nazwisko'
      OnEnter = editSurnameEnter
      OnExit = editSurnameExit
    end
    object editPhone: TEdit
      Left = 728
      Top = 102
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
      Top = 131
      Width = 200
      Height = 23
      TabOrder = 3
      Text = 'Adres'
      OnEnter = EditAddressEnter
      OnExit = EditAddressExit
    end
    object editEmail: TEdit
      Left = 728
      Top = 160
      Width = 200
      Height = 23
      TabOrder = 4
      Text = 'E-Mail'
      OnEnter = editEmailEnter
      OnExit = editEmailExit
    end
    object btnAddPerson: TButton
      Left = 728
      Top = 189
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
      Top = 189
      Width = 200
      Height = 25
      Caption = 'Edytuj'
      TabOrder = 7
      Visible = False
      OnClick = btnEditPersonClick
    end
    object btnDelete: TButton
      Left = 728
      Top = 220
      Width = 200
      Height = 25
      Caption = 'Usu'#324
      TabOrder = 8
      Visible = False
      OnClick = btnDeleteClick
    end
    object btnGoAdd: TButton
      Left = 728
      Top = 13
      Width = 200
      Height = 25
      Caption = 'Przejd'#378' do dodawania'
      TabOrder = 9
      Visible = False
      OnClick = btnGoAddClick
    end
    object btnGoEdit: TButton
      Left = 728
      Top = 13
      Width = 200
      Height = 25
      Caption = 'Przejd'#378' do Edycji'
      TabOrder = 10
      OnClick = btnGoEditClick
    end
  end
end
