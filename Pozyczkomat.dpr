
program Pozyczkomat;

uses
  Vcl.Forms,
  Pozyczki in 'Pozyczki.pas' {Form1},
  Database in 'Database.pas' {DataModule1: TDataModule},
  uFrameAdd in 'uFrameAdd.pas' {FrameAdd: TFrame},
  uFrameMain in 'uFrameMain.pas' {FrameMain: TFrame},
  uFrameCalendar in 'uFrameCalendar.pas' {FrameCalendar: TFrame},
  uFramePeople in 'uFramePeople.pas' {FramePeople: TFrame},
  uFrameOption in 'uFrameOption.pas' {FrameOption: TFrame},
  uFrameItems in 'uFrameItems.pas' {FrameItems: TFrame},
  uFrameNav in 'uFrameNav.pas' {FrameNav: TFrame},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Dark');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
