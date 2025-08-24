object FramePeople: TFramePeople
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object panelPeople: TPanel
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
    object editName: TEdit
      Left = 728
      Top = 23
      Width = 200
      Height = 23
      TabOrder = 0
      Text = 'Imi'#281
      OnEnter = editNameEnter
      OnExit = editNameExit
    end
    object editSurname: TEdit
      Left = 728
      Top = 52
      Width = 200
      Height = 23
      TabOrder = 1
      Text = 'Nazwisko'
      OnEnter = editSurnameEnter
      OnExit = editSurnameExit
    end
    object editPhone: TEdit
      Left = 728
      Top = 81
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
      Top = 110
      Width = 200
      Height = 23
      TabOrder = 3
      Text = 'Adres'
      OnEnter = EditAddressEnter
      OnExit = EditAddressExit
    end
    object editEmail: TEdit
      Left = 728
      Top = 139
      Width = 200
      Height = 23
      TabOrder = 4
      Text = 'E-Mail'
      OnEnter = editEmailEnter
      OnExit = editEmailExit
    end
    object btnAddPerson: TButton
      Left = 728
      Top = 168
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
      Height = 173
      DataSource = DataModule1.DSOsoba
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
end
