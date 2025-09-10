object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Po'#380'yczkomat'
  ClientHeight = 681
  ClientWidth = 1249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object panelNav: TPanel
    Left = 0
    Top = 0
    Width = 1249
    Height = 49
    Align = alTop
    TabOrder = 0
  end
  object panelContent: TPanel
    Left = 0
    Top = 49
    Width = 1249
    Height = 632
    Align = alClient
    TabOrder = 1
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 616
    Top = 344
  end
end
