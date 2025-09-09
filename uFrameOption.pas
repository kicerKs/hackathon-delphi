unit uFrameOption;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Notification, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Database, FireDAC.Stan.Param, System.IniFiles, System.DateUtils;

type
  TFrameOption = class(TFrame)
    panelOption: TPanel;
    Label4: TLabel;
    switchNotif: TToggleSwitch;
    btnSave: TButton;
    procedure btnSaveClick(Sender: TObject);
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
  finally
    Ini.Free;
  end;
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
