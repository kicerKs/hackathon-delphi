unit uFrameAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Database, DateUtils, FireDAC.Stan.Param, System.UITypes,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrameAdd = class(TFrame)
    panelAdd: TPanel;
    label2: TLabel;
    label3: TLabel;
    label1: TLabel;
    btnAddLoan: TButton;
    loanExpDate: TDateTimePicker;
    radioItem: TRadioButton;
    radioMoney: TRadioButton;
    editNumber: TEdit;
    loanGivenDate: TDateTimePicker;
    label4: TLabel;
    label5: TLabel;
    DBGridPeople: TDBGrid;
    editPerson: TEdit;
    editItem: TEdit;
    DBGridItems: TDBGrid;

    procedure RadioButtonClick(Sender: TObject);
    procedure clickButtonAdd(Sender: TObject);
    procedure DBGridPeopleOnDblClick(Sender: TObject);
    procedure DBGridItemsOnDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    procedure refreshDB();
  end;

implementation

{$R *.dfm}

// Adding loans
procedure TFrameAdd.clickButtonAdd(Sender: TObject);
begin
  if loanExpDate.Date < loanGivenDate.Date then
  begin
    MessageDlg('Data terminu nie mo¿e byæ wczeœniejsza ni¿ data udzielenia po¿yczki!',
      mtError, [mbOK], 0);
    Exit;
  end;

  // pozyczka_przedmiot
  if RadioItem.Checked then
  begin
     with Database.DataModule1 do
      begin
       QAddPozyczkaPrzedmiot.ParamByName('IDO').AsString := editPerson.Text;
       QAddPozyczkaPrzedmiot.ParamByName('IDP').AsString := editItem.Text;
       QAddPozyczkaPrzedmiot.ParamByName('Ilosc').AsString := editNumber.Text;
       QAddPozyczkaPrzedmiot.ParamByName('DataU').AsString := FormatDateTime('yyyy-mm-dd hh:mm:ss', loanGivenDate.Date);
       QAddPozyczkaPrzedmiot.ParamByName('Termin').AsString := FormatDateTime('yyyy-mm-dd hh:mm:ss', loanExpDate.Date);
       QAddPozyczkaPrzedmiot.ExecSQL;
      end;
  end
  // pozyczka_pieniadze
  else if RadioMoney.Checked then
  begin
    with Database.DataModule1 do
      begin
       QAddPozyczkaPieniadze.ParamByName('IDO').AsString := editPerson.Text;
       QAddPozyczkaPieniadze.ParamByName('Ilosc').AsString := editNumber.Text;
       QAddPozyczkaPieniadze.ParamByName('DataU').AsString := FormatDateTime('yyyy-mm-dd hh:mm:ss', loanGivenDate.Date);
       QAddPozyczkaPieniadze.ParamByName('Termin').AsString := FormatDateTime('yyyy-mm-dd hh:mm:ss', loanExpDate.Date);
       QAddPozyczkaPieniadze.ExecSQL;
      end;
  end;


end;

constructor TFrameAdd.Create(AOwner: TComponent);
    begin
      inherited Create(AOwner);
      radioMoney.Checked := True;
      editNumber.Visible := True;

      loanGivenDate.Date := Date;
      loanExpDate.Date := Date;
    end;

procedure TFrameAdd.DBGridItemsOnDblClick(Sender: TObject);
begin
if radioItem.Checked then
  with DBGridItems.DataSource.DataSet do
    editItem.Text := FieldByName('id').AsString;
end;

procedure TFrameAdd.DBGridPeopleOnDblClick(Sender: TObject);
begin
  with DBGridPeople.DataSource.DataSet do
    editPerson.Text := FieldByName('id').AsString;
end;

procedure TFrameAdd.RadioButtonClick(Sender: TObject);
    const
      shiftAmount = 29;
    begin
      editItem.Text := '';
      if RadioMoney.Checked then
      begin
        editNumber.Visible := True;
        btnAddLoan.Top := btnAddLoan.Top - shiftAmount;
        loanExpDate.Top := loanExpDate.Top - shiftAmount;
        loanGivenDate.Top := loanGivenDate.Top - shiftAmount;
        editNumber.Top := editNumber.Top - shiftAmount;
        Label2.Caption := 'Kwota';
        Label3.Caption := 'Data udzielenia';
        Label4.Caption := 'Termin';
        Label5.Visible := False;
      end
      else if RadioItem.Checked then
      begin
        editNumber.Visible := True;
        btnAddLoan.Top := btnAddLoan.Top + shiftAmount;
        loanExpDate.Top := loanExpDate.Top + shiftAmount;
        loanGivenDate.Top := loanGivenDate.Top + shiftAmount;
        editNumber.Top := editNumber.Top + shiftAmount;
        Label2.Caption := 'Przedmiot';
        Label3.Caption := 'Iloœæ';
        Label4.Caption := 'Data udzielenia';
        Label5.Visible := True;
      end;
    end;

// Pull data from database. Called when changing frame.
procedure TFrameAdd.refreshDB();
begin
  DBGridPeople.Refresh;
  DBGridItems.Refresh;
end;
end.
