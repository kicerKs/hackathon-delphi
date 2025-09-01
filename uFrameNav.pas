unit uFrameNav;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, uFrameAdd, uFrameMain, uFrameCalendar;

type
  TFrameNav = class(TFrame)
    panelNav: TPanel;
    btnMain: TSpeedButton;
    btnCalendar: TSpeedButton;
    btnPeople: TSpeedButton;
    btnOption: TSpeedButton;
    btnItems: TSpeedButton;
    btnAdd: TSpeedButton;

    procedure btnMainClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCalendarClick(Sender: TObject);
    procedure btnPeopleClick(Sender: TObject);
    procedure btnItemsClick(Sender: TObject);
    procedure btnOptionClick(Sender: TObject);

  private
    FContentPanel: TPanel;
    FCurrentFrame: TFrame;
    FFrameMain, FFrameAdd, FFrameCalendar, FFramePeople, FFrameOption, FFrameItems: TFrame;
  public
    procedure Initialize(AContentPanel: TPanel;
                         FrameMain, FrameAdd, FrameCalendar, FramePeople, FrameOption, FrameItems: TFrame);
    procedure ShowFrame(AFrame: TFrame);
  end;

implementation

{$R *.dfm}

  procedure TFrameNav.Initialize(AContentPanel: TPanel;
                                 FrameMain, FrameAdd, FrameCalendar, FramePeople, FrameOption, FrameItems: TFrame);
  begin
    FContentPanel := AContentPanel;

    FFrameMain := FrameMain;
    FFrameAdd := FrameAdd;
    FFrameCalendar := FrameCalendar;
    FFramePeople := FramePeople;
    FFrameOption := FrameOption;
    FFrameItems := FrameItems;

    // Podpiêcie przycisków do metod
    btnMain.OnClick := btnMainClick;
    btnAdd.OnClick := btnAddClick;
    btnCalendar.OnClick := btnCalendarClick;
    btnPeople.OnClick := btnPeopleClick;
    btnOption.OnClick := btnOptionClick;
    btnItems.OnClick := btnItemsClick;
  end;

  procedure TFrameNav.ShowFrame(AFrame: TFrame);
  var
    i: Integer;
  begin
    if not Assigned(FContentPanel) then Exit;

    for i := 0 to FContentPanel.ControlCount - 1 do
      if FContentPanel.Controls[i] is TFrame then
        TFrame(FContentPanel.Controls[i]).Visible := False;

    FCurrentFrame := AFrame;
    if Assigned(FCurrentFrame) then
    begin
      FCurrentFrame.Visible := True;
      FCurrentFrame.BringToFront;
    end;
  end;

  procedure TFrameNav.btnMainClick(Sender: TObject);
  begin
    ShowFrame(FFrameMain);
    // Refresh database data
    TFrameMain(FFrameMain).refreshDB;
  end;

  procedure TFrameNav.btnAddClick(Sender: TObject);
  begin
    ShowFrame(FFrameAdd);
    // Refresh database data
    TFrameAdd(FFrameAdd).refreshDB;
  end;

  procedure TFrameNav.btnCalendarClick(Sender: TObject);
  begin
    ShowFrame(FFrameCalendar);
    TFrameCalendar(FFrameCalendar).LoadedCalendar;
  end;

  procedure TFrameNav.btnPeopleClick(Sender: TObject);
  begin
    ShowFrame(FFramePeople);
  end;

  procedure TFrameNav.btnOptionClick(Sender: TObject);
  begin
    ShowFrame(FFrameOption);
  end;

  procedure TFrameNav.btnItemsClick(Sender: TObject);
  begin
    ShowFrame(FFrameItems);
  end;
end.
