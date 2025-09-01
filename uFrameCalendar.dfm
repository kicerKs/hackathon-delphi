object FrameCalendar: TFrameCalendar
  Left = 0
  Top = 0
  Width = 1264
  Height = 632
  TabOrder = 0
  object panelCalendar: TPanel
    Left = 0
    Top = 0
    Width = 1264
    Height = 632
    Align = alClient
    TabOrder = 0
    DesignSize = (
      1264
      632)
    object lblMonth: TLabel
      Left = 595
      Top = 17
      Width = 49
      Height = 15
      Anchors = []
      Caption = 'lblMonth'
    end
    object gridCalendar: TGridPanel
      Left = 8
      Top = 48
      Width = 1249
      Height = 576
      ColumnCollection = <
        item
          Value = 14.280000000000000000
        end
        item
          Value = 14.280000000000000000
        end
        item
          Value = 14.280000000000000000
        end
        item
          Value = 14.280000000000000000
        end
        item
          Value = 14.280000000000000000
        end
        item
          Value = 14.280000000000000000
        end
        item
          Value = 14.320000000000010000
        end>
      ControlCollection = <>
      RowCollection = <
        item
          Value = 16.660000000000000000
        end
        item
          Value = 16.660000000000000000
        end
        item
          Value = 16.660000000000000000
        end
        item
          Value = 16.660000000000000000
        end
        item
          Value = 16.660000000000000000
        end
        item
          Value = 16.700000000000010000
        end>
      TabOrder = 0
    end
    object btnPrevMonth: TButton
      Left = 510
      Top = 13
      Width = 75
      Height = 25
      Anchors = []
      Caption = 'Poprzedni'
      TabOrder = 1
      OnClick = btnPrevMonthClick
    end
    object btnNextMonth: TButton
      Left = 679
      Top = 13
      Width = 75
      Height = 25
      Anchors = []
      Caption = 'Nast'#281'pny'
      TabOrder = 2
      OnClick = btnNextMonthClick
    end
  end
end
