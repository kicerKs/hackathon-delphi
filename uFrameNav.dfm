object FrameNav: TFrameNav
  Left = 0
  Top = 0
  Width = 1249
  Height = 480
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Roboto'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object panelNav: TPanel
    Left = 0
    Top = 0
    Width = 1249
    Height = 49
    Align = alTop
    TabOrder = 0
    object btnMain: TSpeedButton
      Left = 350
      Top = 0
      Width = 150
      Height = 49
      GroupIndex = 1
      Down = True
      Caption = 'Po'#380'yczki'
      Transparent = False
      OnClick = btnMainClick
    end
    object btnCalendar: TSpeedButton
      Left = 650
      Top = 0
      Width = 150
      Height = 49
      GroupIndex = 1
      Caption = 'Kalendarz'
      OnClick = btnCalendarClick
    end
    object btnPeople: TSpeedButton
      Left = 800
      Top = 0
      Width = 150
      Height = 49
      GroupIndex = 1
      Caption = 'Osoby'
      OnClick = btnPeopleClick
    end
    object btnOption: TSpeedButton
      Left = 1100
      Top = 0
      Width = 150
      Height = 49
      GroupIndex = 1
      Caption = 'Opcje'
      OnClick = btnOptionClick
    end
    object btnItems: TSpeedButton
      Left = 950
      Top = 0
      Width = 150
      Height = 49
      GroupIndex = 1
      Caption = 'Przedmioty'
      OnClick = btnItemsClick
    end
    object btnAdd: TSpeedButton
      Left = 500
      Top = 0
      Width = 150
      Height = 49
      GroupIndex = 1
      Caption = 'Dodaj'
      OnClick = btnAddClick
    end
    object Label1: TLabel
      Left = 80
      Top = 0
      Width = 197
      Height = 45
      Caption = 'Po'#380'yczkomat'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
  end
end
