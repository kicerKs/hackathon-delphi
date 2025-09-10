unit uFrameMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ComCtrls, Database, FireDAC.Stan.Param, System.UITypes, uFrameOption,
  System.Notification, System.IniFiles;

type
  TFrameMain = class(TFrame)
    panelMain: TPanel;
    imgLoan: TImage;
    DBGridPozyczkaPrzedmiot: TDBGrid;
    DBGridPozyczkaPieniadze: TDBGrid;
    toggleSwitch: TToggleSwitch;
    Label1: TLabel;
    Label2: TLabel;
    comboPersonEdit: TComboBox;
    comboItemEdit: TComboBox;
    editQuantity: TEdit;
    dateStart: TDateTimePicker;
    dateEnd: TDateTimePicker;
    btnEditLoan: TButton;
    btnGoEdit: TButton;
    btnGoCheck: TButton;
    dateReturnTime: TDateTimePicker;
    btnReturn: TButton;
    NotificationCenter: TNotificationCenter;

    procedure DBGridPozyczkaPieniadzeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridPozyczkaPrzedmiotDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure toggleSwitchClick(Sender: TObject);
    procedure refreshDB();
    procedure DBGridPozyczkaPrzedmiotDblClick(Sender: TObject);
    procedure DBGridPozyczkaPieniadzeDblClick(Sender: TObject);
    procedure btnEditLoanClick(Sender: TObject);
    procedure DBGridPozyczkaPieniadzeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridPozyczkaPrzedmiotKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGoEditClick(Sender: TObject);
    procedure btnGoCheckClick(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
  private
    FIniFilePath: string;
  public
    constructor Create(AOwner: TComponent); override;
    procedure CheckLoanNotifications;
  end;

implementation

{$R *.dfm}

constructor TFrameMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  //data dzisiejsza (domyœlnie)
  dateStart.Date := Date;
  dateEnd.Date := Date;
  dateReturnTime.Date := Date;

  //ini
  FIniFilePath := ExtractFilePath(Application.ExeName) + 'settings.ini';
end;

//przycisk do prze³¹czania widoku tych siatek
procedure TFrameMain.toggleSwitchClick(Sender: TObject);
const shiftAmount = 29;
begin
   if toggleSwitch.State = tssOn then
     begin
        DBGridPozyczkaPieniadze.Visible := True;
        DBGridPozyczkaPrzedmiot.Visible := False;
        comboItemEdit.Visible := False;
        editQuantity.Top := editQuantity.Top - shiftAmount;
        dateEnd.Top := dateEnd.Top - shiftAmount;
        dateStart.Top := dateStart.Top - shiftAmount;
        btnEditLoan.Top := btnEditLoan.Top - shiftAmount;
      end
   else
      begin
        DBGridPozyczkaPieniadze.Visible := False;
        DBGridPozyczkaPrzedmiot.Visible := True;
        comboItemEdit.Visible := True;
        editQuantity.Top := editQuantity.Top + shiftAmount;
        dateEnd.Top := dateEnd.Top + shiftAmount;
        dateStart.Top := dateStart.Top + shiftAmount;
        btnEditLoan.Top := btnEditLoan.Top + shiftAmount;
      end;
end;

//nie moje
procedure TFrameMain.DBGridPozyczkaPieniadzeDrawColumnCell(Sender: TObject;
const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (DBGridPozyczkaPieniadze.DataSource.DataSet.FieldByName('Data Oddania').AsString = '') then
  begin
    if (DBGridPozyczkaPieniadze.DataSource.DataSet.FieldByName('Termin').AsDateTime > Date) then
      DBGridPozyczkaPieniadze.Canvas.Font.Color := clBlack
    else
      DBGridPozyczkaPieniadze.Canvas.Font.Color := clRed;
  end
  else
  begin
    if (DBGridPozyczkaPieniadze.DataSource.DataSet.FieldByName('Termin').AsDateTime < DBGridPozyczkaPieniadze.DataSource.DataSet.FieldByName('Data oddania').AsDateTime) then
      DBGridPozyczkaPieniadze.Canvas.Font.Color := clRed
    else
      DBGridPozyczkaPieniadze.Canvas.Font.Color := clGreen;
  end;
  DBGridPozyczkaPieniadze.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//wypelnienie pola edycji itemow
procedure TFrameMain.DBGridPozyczkaPrzedmiotDblClick(Sender: TObject);
begin
   with DBGridPozyczkaPrzedmiot.DataSource.DataSet do
  begin
    if IsEmpty then Exit;

    comboPersonEdit.ItemIndex :=
      comboPersonEdit.Items.IndexOfName(FieldByName('Osoba').AsString);

    comboItemEdit.ItemIndex :=
      comboItemEdit.Items.IndexOfName(FieldByName('Przedmiot').AsString);

    editQuantity.Text := FieldByName('Iloœæ').AsString;

    dateStart.Date := FieldByName('Udzielono').AsDateTime;
    dateEnd.Date   := FieldByName('Termin').AsDateTime;


    Database.DataModule1.QItempathById.ParamByName('Nazwa').AsString := FieldByName('Przedmiot').AsString;
    Database.DataModule1.QItempathById.Open;
    if Database.DataModule1.QItempathById.RecordCount > 0 then
    begin

      if System.SysUtils.FileExists(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'pictures\'+Database.DataModule1.QItempathById.FieldByName('sciezka').AsString) then
        begin
          Label2.Visible := False;
          imgLoan.Picture.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'pictures\'+Database.DataModule1.QItempathById.FieldByName('sciezka').AsString);
          imgLoan.Visible := True;
        end
      else
        begin
          imgLoan.Visible := False;
          Label2.Visible := True;
        end;
    end;
    Database.DataModule1.QItempathById.Close;
  end;
end;

//wypelnianie pol edycji hajsu
procedure TFrameMain.DBGridPozyczkaPieniadzeDblClick(Sender: TObject);
begin
       with DBGridPozyczkaPieniadze.DataSource.DataSet do
  begin
    if IsEmpty then Exit;

    comboPersonEdit.ItemIndex :=
      comboPersonEdit.Items.IndexOfName(FieldByName('Osoba').AsString);

    comboItemEdit.ItemIndex := -1;

    editQuantity.Text := FieldByName('Kwota').AsString;
    dateStart.Date := FieldByName('Udzielono').AsDateTime;
    dateEnd.Date   := FieldByName('Termin').AsDateTime;

  end;
end;

//przejscie edycja/pozyczka
procedure TFrameMain.btnGoCheckClick(Sender: TObject);
begin
      btnEditLoan.Visible := False;
     comboPersonEdit.Visible := False;
     comboItemEdit.Visible := False;
     editQuantity.Visible := False;
     dateStart.Visible := False;
     dateEnd.Visible := False;
     btnGoCheck.Visible := False;
     btnGoEdit.Visible := True;
     btnReturn.Visible := True;
     dateReturnTime.Visible := True;
end;

procedure TFrameMain.btnGoEditClick(Sender: TObject);
begin
     btnEditLoan.Visible := True;
     comboPersonEdit.Visible := True;
     comboItemEdit.Visible := True;
     editQuantity.Visible := True;
     dateStart.Visible := True;
     dateEnd.Visible := True;
     btnGoCheck.Visible := True;
     btnGoEdit.Visible := False;
     btnReturn.Visible := False;
     dateReturnTime.Visible := False;
     refreshDB();
end;

//zaznaczenie pozyczki jako oddanej
procedure TFrameMain.btnReturnClick(Sender: TObject);
var
  currentID: Integer;
  loanDate: TDateTime;
begin
  if toggleSwitch.State = tssOff then
  begin
    //itemy
    with DBGridPozyczkaPrzedmiot.DataSource.DataSet do
    begin
      if IsEmpty then Exit;
      currentID := FieldByName('ID').AsInteger;
      loanDate := FieldByName('Udzielono').AsDateTime;

      //walidacja ustawienia daty oddania
      if dateReturnTime.Date < loanDate then
      begin
        ShowMessage('Data zwrotu nie mo¿e byæ wczeœniejsza ni¿ data wypo¿yczenia!');
        Exit;
      end;
      //oznaczenie jako oddanej
      if MessageDlg('Czy na pewno chcesz oznaczyæ tê po¿yczkê jako oddan¹?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        with Database.DataModule1.QReturnPozyczkaPrzedmiot do
        begin
          ParamByName('ID').AsInteger := currentID;
          ParamByName('DataOddania').AsDateTime := dateReturnTime.Date;
          ExecSQL;
        end;
        refreshDB();
      end;
    end;
  end
  else
  begin
    //kasa
    with DBGridPozyczkaPieniadze.DataSource.DataSet do
    begin
      if IsEmpty then Exit;
      currentID := FieldByName('ID').AsInteger;
      loanDate := FieldByName('Udzielono').AsDateTime;
      //to samo co wyzej
      if dateReturnTime.Date < loanDate then
      begin
        ShowMessage('Data zwrotu nie mo¿e byæ wczeœniejsza ni¿ data wypo¿yczenia!');
        Exit;
      end;

      if MessageDlg('Czy na pewno chcesz oznaczyæ tê po¿yczkê jako oddan¹?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        with Database.DataModule1.QReturnPozyczkaPieniadze do
        begin
          ParamByName('ID').AsInteger := currentID;
          ParamByName('DataOddania').AsDateTime := dateReturnTime.Date;
          ExecSQL;
        end;
        refreshDB();
      end;
    end;
  end;
end;

procedure TFrameMain.DBGridPozyczkaPrzedmiotDrawColumnCell(Sender: TObject;
const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  //if Column.Title.Caption.Contains('Przeterminowane') then
  //  if Column.Field.Text.Contains('1') then DBGridPozyczkaPrzedmiot.Canvas.Font.Color := clRed
  //else DBGridPozyczkaPrzedmiot.Canvas.Font.Color := clGreen;

  // Przez te dwie linijki kursor zmienia siê na klepsydrê, nie wiem czemu ale tak jest xD
  // Powinno byæ git
  if Column.Title.Caption.Contains('Osoba') and (Column.Width <> 150) then Column.Width := 150;
  if Column.Title.Caption.Contains('Przedmiot') and (Column.Width <> 150) then Column.Width := 150;
  //DBGridPozyczkaPrzedmiot.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if (DBGridPozyczkaPrzedmiot.DataSource.DataSet.FieldByName('Data Oddania').AsString = '') then
  begin
    if (DBGridPozyczkaPrzedmiot.DataSource.DataSet.FieldByName('Termin').AsDateTime > Date) then
      DBGridPozyczkaPrzedmiot.Canvas.Font.Color := clBlack
    else
      DBGridPozyczkaPrzedmiot.Canvas.Font.Color := clRed;
  end
  else
  begin
    if (DBGridPozyczkaPrzedmiot.DataSource.DataSet.FieldByName('Termin').AsDateTime < DBGridPozyczkaPrzedmiot.DataSource.DataSet.FieldByName('Data oddania').AsDateTime) then
      DBGridPozyczkaPrzedmiot.Canvas.Font.Color := clRed
    else
      DBGridPozyczkaPrzedmiot.Canvas.Font.Color := clGreen;
  end;
  DBGridPozyczkaPrzedmiot.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  // Przesuwam do refreshDB, powinno dzia³aæ git


end;

//usuwanie pozyczek przyciskiem del
//przedmioty
procedure TFrameMain.DBGridPozyczkaPrzedmiotKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  currentID: Integer;
begin
  if Key = VK_DELETE then
    begin
      with DBGridPozyczkaPrzedmiot.DataSource.DataSet do
      begin
        if IsEmpty then Exit;
        currentID := FieldByName('ID').AsInteger;

        if MessageDlg('Czy na pewno chcesz usun¹æ tê po¿yczkê?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          with Database.DataModule1.QDelPozyczkaPrzedmiot do
          begin
            ParamByName('ID').AsInteger := currentID;
            ExecSQL;
          end;
          refreshDB();
        end;
      end;
    end;
end;
//kasa
procedure TFrameMain.DBGridPozyczkaPieniadzeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
  currentID: Integer;
begin
if Key = VK_DELETE then
  begin
    with DBGridPozyczkaPieniadze.DataSource.DataSet do
    begin
      if IsEmpty then Exit;
      currentID := FieldByName('ID').AsInteger;

      if MessageDlg('Czy na pewno chcesz usun¹æ tê po¿yczkê?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        with Database.DataModule1.QDelPozyczkaPieniadze do
        begin
          ParamByName('ID').AsInteger := currentID;
          ExecSQL;
        end;
        refreshDB();
      end;
    end;
  end;
end;

//to nw
procedure TFrameMain.refreshDB();
begin
  DBGridPozyczkaPieniadze.DataSource.DataSet.Refresh;
  DBGridPozyczkaPrzedmiot.DataSource.DataSet.Refresh;

  //dobra dzia³a wype³nianie comboboxów, chuj zostaw tak, nie wiem w jakim innym momencie wjebaæ
  //wczytywanie do comboboxow XD
    //wype³nianie combobox osób
  comboPersonEdit.Clear;
  Database.DataModule1.DSOsoba.DataSet.First;
  while not Database.DataModule1.DSOsoba.DataSet.Eof do
  begin
    comboPersonEdit.Items.AddPair(
      Database.DataModule1.DSOsoba.DataSet.FieldByName('Imiê').AsString + ' ' +
      Database.DataModule1.DSOsoba.DataSet.FieldByName('Nazwisko').AsString,
      Database.DataModule1.DSOsoba.DataSet.FieldByName('ID').AsString
    );
    Database.DataModule1.DSOsoba.DataSet.Next;
  end;
  Database.DataModule1.DSOsoba.DataSet.First;

  //wype³nianie combobox przedmiotow
  comboItemEdit.Clear;
  Database.DataModule1.DSPrzedmiot.DataSet.First;
  while not Database.DataModule1.DSPrzedmiot.DataSet.Eof do
  begin
    comboItemEdit.Items.AddPair(
      Database.DataModule1.DSPrzedmiot.DataSet.FieldByName('Nazwa').AsString,
      Database.DataModule1.DSPrzedmiot.DataSet.FieldByName('ID').AsString
    );
    Database.DataModule1.DSPrzedmiot.DataSet.Next;
  end;
  Database.DataModule1.DSPrzedmiot.DataSet.First;

  //ustawienie domyslnego wyboru
  if comboPersonEdit.Items.Count > 0 then
    comboPersonEdit.ItemIndex := 0;
  if comboItemEdit.Items.Count > 0 then
    comboItemEdit.ItemIndex := 0;
end;

//przycisk edycji
procedure TFrameMain.btnEditLoanClick(Sender: TObject);
var
  currentID: Integer;
begin
  if dateEnd.Date < dateStart.Date then
  begin
    ShowMessage('Termin zwrotu nie mo¿e byæ wczeœniejszy ni¿ data udzielenia!');
    Exit;
  end;

  if toggleSwitch.State = tssOff then
  begin
    // Po¿yczka przedmiotowa
    with DBGridPozyczkaPrzedmiot.DataSource.DataSet do
    begin
      if IsEmpty then Exit;
      currentID := FieldByName('ID').AsInteger;

      with Database.DataModule1.QEditPozyczkaPrzedmiot do
      begin
        ParamByName('ID').AsInteger := currentID;
        ParamByName('IDO').AsString := comboPersonEdit.Items.ValueFromIndex[comboPersonEdit.ItemIndex];
        ParamByName('IDP').AsString := comboItemEdit.Items.ValueFromIndex[comboItemEdit.ItemIndex];
        ParamByName('Ilosc').AsString := editQuantity.Text;
        ParamByName('DataU').AsString := FormatDateTime('yyyy-mm-dd hh:mm:ss', dateStart.Date);
        ParamByName('Termin').AsString := FormatDateTime('yyyy-mm-dd hh:mm:ss', dateEnd.Date);
        ExecSQL;
      end;
    end;
  end
  else
  begin
    // Po¿yczka pieniê¿na
    with DBGridPozyczkaPieniadze.DataSource.DataSet do
    begin
      if IsEmpty then Exit;
      currentID := FieldByName('ID').AsInteger;

      with Database.DataModule1.QEditPozyczkaPieniadze do
      begin
        ParamByName('ID').AsInteger := currentID;
        ParamByName('IDO').AsString := comboPersonEdit.Items.ValueFromIndex[comboPersonEdit.ItemIndex];
        ParamByName('Ilosc').AsString := editQuantity.Text;
        ParamByName('DataU').AsString := FormatDateTime('yyyy-mm-dd hh:mm:ss', dateStart.Date);
        ParamByName('Termin').AsString := FormatDateTime('yyyy-mm-dd hh:mm:ss', dateEnd.Date);
        ExecSQL;
      end;
    end;
  end;

  // Odœwie¿enie danych w gridzie
  refreshDB();
end;

//do powiadomien
procedure TFrameMain.CheckLoanNotifications;
var
  Ini: TIniFile;
  LastAlertDateStr: string;
  LastAlertDate: TDate;
  ds: TDataSet;
  MsgText: string;
  DaysLeft: Integer;
  Notification: TNotification;
begin
  if not FileExists(FIniFilePath) then Exit;

  Ini := TIniFile.Create(FIniFilePath);
  try
    // jeœli powiadomienia wy³¹czone, wychodzimy
    if not Ini.ReadBool('Notifications', 'EnableLoanAlerts', False) then Exit;

    // sprawdzamy czy alert by³ ju¿ dzisiaj
    LastAlertDateStr := Ini.ReadString('Notifications', 'LastAlertDate', '');
    if LastAlertDateStr <> '' then
    begin
      LastAlertDate := StrToDateDef(LastAlertDateStr, 0);
      if LastAlertDate = Date then
        Exit; // ju¿ dzisiaj wyœwietlone
    end;

    while (not DataModule1.PozyczkomatDatabaseConnection.Connected) do
      begin
        Application.ProcessMessages;  // ¿eby UI ¿y³o
        Sleep(50);                    // ma³a przerwa
      end;

    // --- POWIADOMIENIA DLA PO¯YCZEK PRZEDMIOTOWYCH ---
    ds := Database.DataModule1.QSelectItemDate;
    ds.Open;
    ds.First;
    while not ds.Eof do
    begin
      if ds.FieldByName('Data oddania').AsString = '' then
      begin
        DaysLeft := Trunc(ds.FieldByName('Termin').AsDateTime - Date);
        if (DaysLeft >= 0) and (DaysLeft <= 2) then
        begin
          MsgText := Format('%s - %s (pozosta³o %d dni)', [
            ds.FieldByName('Osoba').AsString,
            ds.FieldByName('Przedmiot').AsString,
            DaysLeft
          ]);

          // utworzenie powiadomienia
          Notification := NotificationCenter.CreateNotification;
          Notification.Name := 'LoanItemAlert';
          Notification.Title := 'Po¿yczka przedmiotowa';
          Notification.AlertBody := MsgText;
          Notification.FireDate := Now;
          NotificationCenter.PresentNotification(Notification);
        end;
      end;
      ds.Next;
    end;
    ds.Close;

    // --- POWIADOMIENIA DLA PO¯YCZEK PIENIÊ¯NYCH ---
    ds := Database.DataModule1.QSelectMoneyDate;
    ds.Open;
    ds.First;
    while not ds.Eof do
    begin
      if ds.FieldByName('Data oddania').AsString = '' then
      begin
        DaysLeft := Trunc(ds.FieldByName('Termin').AsDateTime - Date);
        if (DaysLeft >= 0) and (DaysLeft <= 2) then
        begin
          MsgText := Format('%s - %s z³ (pozosta³o %d dni)', [
            ds.FieldByName('Osoba').AsString,
            ds.FieldByName('Kwota').AsString,
            DaysLeft
          ]);

          // utworzenie powiadomienia
          Notification := NotificationCenter.CreateNotification;
          Notification.Name := 'LoanMoneyAlert';
          Notification.Title := 'Po¿yczka pieniê¿na';
          Notification.AlertBody := MsgText;
          Notification.FireDate := Now;
          NotificationCenter.PresentNotification(Notification);
        end;
      end;
      ds.Next;
    end;
    ds.Close;

    // zapisanie daty ostatniego wyœwietlenia
    Ini.WriteString('Notifications', 'LastAlertDate', DateToStr(Date));

  finally
    Ini.Free;
  end;
end;

end.
