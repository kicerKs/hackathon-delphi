object FrameNav: TFrameNav
  Left = 0
  Top = 0
  Width = 1249
  Height = 480
  TabOrder = 0
  object panelNav: TPanel
    Left = 0
    Top = 0
    Width = 1249
    Height = 49
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -624
    ExplicitWidth = 1264
    object btnMain: TSpeedButton
      Left = 0
      Top = 0
      Width = 200
      Height = 49
      GroupIndex = 1
      Down = True
      Caption = 'Po'#380'yczki'
      Transparent = False
      OnClick = btnMainClick
    end
    object btnCalendar: TSpeedButton
      Left = 400
      Top = 0
      Width = 200
      Height = 49
      GroupIndex = 1
      Caption = 'Kalendarz'
      OnClick = btnCalendarClick
    end
    object btnPeople: TSpeedButton
      Left = 600
      Top = 0
      Width = 200
      Height = 49
      GroupIndex = 1
      Caption = 'Osoby'
      OnClick = btnPeopleClick
    end
    object btnOption: TSpeedButton
      Left = 1000
      Top = 0
      Width = 200
      Height = 49
      GroupIndex = 1
      Caption = 'Opcje'
      OnClick = btnOptionClick
    end
    object btnItems: TSpeedButton
      Left = 800
      Top = 0
      Width = 200
      Height = 49
      GroupIndex = 1
      Caption = 'Przedmioty'
      OnClick = btnItemsClick
    end
    object btnAdd: TSpeedButton
      Left = 200
      Top = 0
      Width = 200
      Height = 49
      GroupIndex = 1
      Caption = 'Dodaj'
      OnClick = btnAddClick
    end
  end
end
