unit uFrameOption;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Notification, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Database, FireDAC.Stan.Param, System.IniFiles, System.DateUtils,
  Vcl.Styles, Vcl.Themes;

type
  TFrameOption = class(TFrame)
    panelOption: TPanel;
    Label4: TLabel;
    switchNotif: TToggleSwitch;
    btnSave: TButton;
    switchTheme: TToggleSwitch;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure switchThemeOnClick(Sender: TObject);
  private
    FIniFilePath: string;
    procedure SaveSettings;
    procedure LoadSettings;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

constructor TFrameOption.Create(AOwner: TComponent);
begin
  inherited;
  FIniFilePath := ExtractFilePath(ParamStr(0)) + 'settings.ini';
  LoadSettings;
end;

//zapis opcji do pliku ini
procedure TFrameOption.SaveSettings;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings.ini');
  try
    // zapisujemy tylko po klikniêciu przycisku
    Ini.WriteBool('Notifications', 'EnableLoanAlerts', switchNotif.State = tssOn);
    Ini.WriteBool('Theme', 'EnableDarkMode', switchTheme.State = tssOn);
  finally
    Ini.Free;
  end;
end;

procedure TFrameOption.switchThemeOnClick(Sender: TObject);
begin
  if switchTheme.state = tssOn then
    TStyleManager.TrySetStyle('Windows10 Dark')
  else
    TStyleManager.TrySetStyle('Windows10');
end;

//odczyt pliku ini
procedure TFrameOption.LoadSettings;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings.ini');
  try
    switchNotif.State := tssOff;
    if Ini.ReadBool('Notifications', 'EnableLoanAlerts', False) then
      switchNotif.State := tssOn;
    if Ini.ReadBool('Theme', 'EnableDarkMode', True) then
    begin
      TStyleManager.TrySetStyle('Windows10 Dark');
      switchTheme.State := tssOn;
    end
    else
    begin
      TStyleManager.TrySetStyle('Windows10');
      switchTheme.State := tssOff;
    end;

  finally
    Ini.Free;
  end;
end;

procedure TFrameOption.btnSaveClick(Sender: TObject);
begin
  SaveSettings;
  ShowMessage('Ustawienia zapisane.');
end;

end.
