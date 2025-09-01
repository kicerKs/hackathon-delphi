unit uFrameCalendar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, DateUtils, Database, FireDAC.Stan.Param,
  System.Generics.Collections;

type
  TFrameCalendar = class(TFrame)
    panelCalendar: TPanel;
    gridCalendar: TGridPanel;
    lblMonth: TLabel;
    btnPrevMonth: TButton;
    btnNextMonth: TButton;
    procedure btnNextMonthClick(Sender: TObject);
    procedure btnPrevMonthClick(Sender: TObject);
  private
    FYear, FMonth: Word;
    procedure DrawCalendar(AYear, AMonth: Word);
    procedure PanelDayClick(Sender: TObject);
    procedure ShowLoanInfo(Sender: TObject);
  public
    procedure LoadedCalendar;
    procedure FillLoans;
  end;

implementation

{$R *.dfm}

type
  TLoanRecord = record
    Caption: string;
    IsMoney: Boolean;
    IsOverdue: Boolean;
    FullDetails: string;
    Day: Integer;
  end;

type
  TLoanInfo = class
    Caption: string;
    IsMoney: Boolean;
    IsOverdue: Boolean;
    FullDetails: string;
  end;

type
  TSingleLoanInfo = class
    Caption: string;
    FullDetails: string;
    IsMoney: Boolean;
    IsOverdue: Boolean;
  end;

  const
  MAX_PANELS_PER_DAY = 4;
  MAX_CHARS_PER_LINE = 25;

var
  PanelLoans: TDictionary<TPanel, TObjectList<TLoanInfo>>;

procedure TFrameCalendar.LoadedCalendar;
var
  r, c: Integer;
  DayPanel: TPanel;
  DayLabel: TLabel;
  LoansContainer: TPanel;
  Day: Word;
begin
  DecodeDate(Date, FYear, FMonth, Day);

  if Assigned(PanelLoans) then
    begin
      // zwolnij poprzednie listy
      for var L in PanelLoans.Values do
        L.Free;
      PanelLoans.Clear;
    end;
    PanelLoans := TDictionary<TPanel, TObjectList<TLoanInfo>>.Create;

  //usuwanie kontrolek
  while gridCalendar.ControlCount > 0 do
    gridCalendar.Controls[0].Free;

  //nowe panele i w nich labele
  for r := 0 to gridCalendar.RowCollection.Count - 1 do
    for c := 0 to gridCalendar.ColumnCollection.Count - 1 do
    begin
      DayPanel := TPanel.Create(Self);
      DayPanel.Parent := gridCalendar;
      DayPanel.BevelOuter := bvNone;
      DayPanel.ParentBackground := False;
      DayPanel.Align := alClient;
      DayPanel.Color := clWhite;
      DayPanel.OnClick := PanelDayClick;

      gridCalendar.ControlCollection.AddControl(DayPanel, c, r);

      // label = numer dnia
      DayLabel := TLabel.Create(DayPanel);
      DayLabel.Parent := DayPanel;
      DayLabel.Left := 2;
      DayLabel.Top := 2;
      DayLabel.Caption := '';
      DayLabel.Font.Style := [fsBold];
    end;

  DrawCalendar(FYear, FMonth);
  FillLoans;
end;

//przyciski do zmiany miesi¹ca
procedure TFrameCalendar.btnNextMonthClick(Sender: TObject);
begin
     Inc(FMonth);
  if FMonth > 12 then
  begin
    FMonth := 1;
    Inc(FYear);
  end;

  for var i := 0 to gridCalendar.ControlCount - 1 do
  begin
    var DayPanel := TPanel(gridCalendar.Controls[i]);
    for var j := DayPanel.ControlCount - 1 downto 1 do
      DayPanel.Controls[j].Free;
  end;

  DrawCalendar(FYear, FMonth);
  FillLoans;
end;

procedure TFrameCalendar.btnPrevMonthClick(Sender: TObject);
begin
    Dec(FMonth);
  if FMonth < 1 then
  begin
    FMonth := 12;
    Dec(FYear);
  end;

  for var i := 0 to gridCalendar.ControlCount - 1 do
  begin
    var DayPanel := TPanel(gridCalendar.Controls[i]);
    for var j := DayPanel.ControlCount - 1 downto 1 do
      DayPanel.Controls[j].Free;
  end;

  DrawCalendar(FYear, FMonth);
  FillLoans;
end;

//rysowanie kalendarza
procedure TFrameCalendar.DrawCalendar(AYear, AMonth: Word);
var
  FirstDay: TDateTime;
  DaysInMonth, DaysInPrevMonth: Integer;
  StartCol, i, DayNum: Integer;
  DayPanel: TPanel;
  DayLabel: TLabel;
  PrevMonth, PrevYear, NextMonth, NextYear: Word;
begin
  FYear := AYear;
  FMonth := AMonth;

  FirstDay := EncodeDate(AYear, AMonth, 1);
  DaysInMonth := DaysInAMonth(AYear, AMonth);

  // poprzedni miesi¹c
  if AMonth = 1 then
  begin
    PrevMonth := 12;
    PrevYear := AYear - 1;
  end
  else
  begin
    PrevMonth := AMonth - 1;
    PrevYear := AYear;
  end;
  DaysInPrevMonth := DaysInAMonth(PrevYear, PrevMonth);

  // nastêpny miesi¹c
  if AMonth = 12 then
  begin
    NextMonth := 1;
    NextYear := AYear + 1;
  end
  else
  begin
    NextMonth := AMonth + 1;
    NextYear := AYear;
  end;

  // startowa kolumna (0 = poniedzia³ek)
  StartCol := DayOfWeek(FirstDay) - 2;
  if StartCol < 0 then
    StartCol := 6;

  DayNum := 1;

  for i := 0 to 41 do
  begin
    DayPanel := TPanel(gridCalendar.Controls[i]);
    DayLabel := TLabel(DayPanel.Controls[0]);

    if i < StartCol then
    begin
      // dni poprzedniego miesi¹ca
      DayLabel.Caption := IntToStr(DaysInPrevMonth - (StartCol - 1 - i));
      DayLabel.Font.Style := [];
      DayPanel.Color := clBtnFace;
      DayLabel.Font.Color := clGray;
    end
    else if DayNum <= DaysInMonth then
    begin
      // dni aktualnego miesi¹ca
      DayLabel.Caption := IntToStr(DayNum);
      DayLabel.Font.Style := [fsBold];
      DayPanel.Color := clSkyBlue;
      DayLabel.Font.Color := clBlack;
      Inc(DayNum);
    end
    else
    begin
      // dni nastêpnego miesi¹ca
      DayLabel.Caption := IntToStr(DayNum - DaysInMonth);
      DayLabel.Font.Style := [];
      DayPanel.Color := clBtnFace;
      DayLabel.Font.Color := clGray;
      Inc(DayNum);
    end;
  end;

  // wyœrodkowanie labela miesi¹ca
  lblMonth.AutoSize := True;
  lblMonth.Caption := FormatDateTime('mmmm yyyy', EncodeDate(AYear, AMonth, 1));
  lblMonth.Left := (panelCalendar.ClientWidth - lblMonth.Width) div 2;
end;

//wype³nianie komórek paskami
procedure TFrameCalendar.FillLoans;
var
  Loans: TArray<TLoanRecord>;
  Loan: TLoanRecord;
  DayPanel, LoanPanel: TPanel;
  DayLabel, LoanLabel: TLabel;
  CountPanels: Integer;
  i, j: Integer;
begin
  SetLength(Loans, 0);

  //pobranie po¿yczek przedmiotowych
  with DataModule1.QLoanItems do
  begin
    Close;
    ParamByName('M').AsInteger := FMonth;
    ParamByName('Y').AsInteger := FYear;
    Open;
    while not Eof do
    begin
      Loan.Caption := FieldByName('Caption').AsString;
      Loan.IsMoney := False;
      Loan.IsOverdue := FieldByName('DateReturn').AsDateTime > FieldByName('termin_oddania').AsDateTime;
      Loan.FullDetails := FieldByName('FullDetails').AsString;
      Loan.Day := DayOf(FieldByName('termin_oddania').AsDateTime);
      Loans := Loans + [Loan];
      Next;
    end;
  end;

  //pobranie po¿yczek pieniê¿nych
  with DataModule1.QLoanMoney do
  begin
    Close;
    ParamByName('M').AsInteger := FMonth;
    ParamByName('Y').AsInteger := FYear;
    Open;
    while not Eof do
    begin
      Loan.Caption := FieldByName('Caption').AsString;
      Loan.IsMoney := True;
      Loan.IsOverdue := FieldByName('DateReturn').AsDateTime > FieldByName('termin_oddania').AsDateTime;
      Loan.FullDetails := FieldByName('FullDetails').AsString;
      Loan.Day := DayOf(FieldByName('termin_oddania').AsDateTime);
      Loans := Loans + [Loan];
      Next;
    end;
  end;

  // wstawianie pasków do paneli
  for i := Low(Loans) to High(Loans) do
  begin
    // znajdŸ panel dnia
    for j := 0 to 41 do
    begin
      DayPanel := TPanel(gridCalendar.Controls[j]);
      DayLabel := TLabel(DayPanel.Controls[0]);
      if StrToIntDef(DayLabel.Caption,0) = Loans[i].Day then
      begin
        if not PanelLoans.ContainsKey(DayPanel) then
          PanelLoans.Add(DayPanel, TObjectList<TLoanInfo>.Create);

        var LoanList := PanelLoans[DayPanel];

        //zmienne do pojedycznego wyœwietlania
        var LoanObj := TLoanInfo.Create;
        LoanObj.Caption := Loans[i].Caption;
        LoanObj.IsMoney := Loans[i].IsMoney;
        LoanObj.IsOverdue := Loans[i].IsOverdue;
        LoanObj.FullDetails := Loans[i].FullDetails;
        LoanList.Add(LoanObj);

        CountPanels := DayPanel.ControlCount - 1; // label numer dnia
        if CountPanels < MAX_PANELS_PER_DAY then
        begin
        //magia z przypisaniem wszystkich w³aœciwosci
          LoanPanel := TPanel.Create(DayPanel);
          LoanPanel.Parent := DayPanel;
          LoanPanel.Align := alNone;
          LoanPanel.Top := 20 + CountPanels * 16;
          LoanPanel.Left := 2;
          LoanPanel.Height := 16;
          LoanPanel.BevelOuter := bvNone;
          if Loans[i].IsMoney then
            LoanPanel.Color := clYellow
          else
            LoanPanel.Color := clAqua;

          LoanLabel := TLabel.Create(LoanPanel);
          LoanLabel.Parent := LoanPanel;
          LoanLabel.Align := alClient;
          LoanLabel.Alignment := taLeftJustify;
          LoanLabel.Layout := tlCenter;
          LoanLabel.Font.Size := 8;
          LoanLabel.Font.Style := [fsBold];
          if Loans[i].IsOverdue then
            LoanLabel.Font.Color := clRed
          else
            LoanLabel.Font.Color := clBlack;

          var SingleLoanObj: TSingleLoanInfo;
          SingleLoanObj := TSingleLoanInfo.Create;
          SingleLoanObj.Caption := Loans[i].Caption;
          SingleLoanObj.FullDetails := Loans[i].FullDetails;
          SingleLoanObj.IsMoney := Loans[i].IsMoney;
          SingleLoanObj.IsOverdue := Loans[i].IsOverdue;

          LoanLabel.Tag := NativeInt(SingleLoanObj);
          LoanLabel.OnClick := ShowLoanInfo;

          if Length(Loans[i].Caption) > MAX_CHARS_PER_LINE then
            LoanLabel.Caption := Copy(Loans[i].Caption,1,MAX_CHARS_PER_LINE)+'...'
          else
            LoanLabel.Caption := Loans[i].Caption;


        end;
        Break;
      end;
    end;
  end;
end;

//klikanie na dany dzieñ (szczegó³y)
procedure TFrameCalendar.PanelDayClick(Sender: TObject);
var
  DayPanel: TPanel;
  LoanList: TObjectList<TLoanInfo>;
  Loan: TLoanInfo;
  Msg: string;
begin
  DayPanel := Sender as TPanel;
  if not PanelLoans.TryGetValue(DayPanel, LoanList) or (LoanList.Count = 0) then
  begin
    ShowMessage('Brak po¿yczek w tym dniu');
    Exit;
  end;

  Msg := '';
  for Loan in LoanList do
  begin
    Msg := Msg + Format('Tytu³: %s'#13#10 +
                        'Pieniê¿na: %s, Przeterminowana: %s'#13#10 +
                        'Pe³ne info: %s'#13#10#13#10,
                        [Loan.Caption,
                         BoolToStr(Loan.IsMoney, True),
                         BoolToStr(Loan.IsOverdue, True),
                         Loan.FullDetails]);
  end;

  ShowMessage(Msg);
end;

//klikanie na poszczególn¹ po¿yczkê
procedure TFrameCalendar.ShowLoanInfo(Sender: TObject);
var
  Lbl: TLabel;
  LoanData: TSingleLoanInfo;
begin
  Lbl := Sender as TLabel;
  LoanData := TSingleLoanInfo(Lbl.Tag);
  if Assigned(LoanData) then
    ShowMessage('Tytu³: ' + LoanData.Caption + #13#10 +
                'Pieniê¿na: ' + BoolToStr(LoanData.IsMoney, True) + #13#10 +
                'Przeterminowana: ' + BoolToStr(LoanData.IsOverdue, True) + #13#10 +
                'Pe³ne info: ' + LoanData.FullDetails);
end;

end.
