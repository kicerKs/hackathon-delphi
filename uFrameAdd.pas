unit uFrameAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Database, DateUtils, FireDAC.Stan.Param, System.UITypes;

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
    comboBoxPerson: TComboBox;
    comboBoxItem: TComboBox;
    loanGivenDate: TDateTimePicker;
    label4: TLabel;
    label5: TLabel;

    procedure RadioButtonClick(Sender: TObject);
    procedure clickButtonAdd(Sender: TObject);
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
       QAddPozyczkaPrzedmiot.ParamByName('IDO').AsString := comboBoxPerson.Items[comboBoxPerson.ItemIndex].Split(comboBoxPerson.Items.NameValueSeparator)[1];
       QAddPozyczkaPrzedmiot.ParamByName('IDP').AsString := comboBoxItem.Items[comboBoxItem.ItemIndex].Split(comboBoxItem.Items.NameValueSeparator)[1];
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
       QAddPozyczkaPieniadze.ParamByName('IDO').AsString := comboBoxPerson.Items[comboBoxPerson.ItemIndex].Split(comboBoxPerson.Items.NameValueSeparator)[1];
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

procedure TFrameAdd.RadioButtonClick(Sender: TObject);
    const
      shiftAmount = 29;
    begin
      if RadioMoney.Checked then
      begin
        comboBoxItem.Visible := False;
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
        comboBoxItem.Visible := True;
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
  // Get all people from database
  comboBoxPerson.Clear;
  Database.DataModule1.DSOsoba.DataSet.First;
  while not Database.DataModule1.DSOsoba.DataSet.Eof do
  begin
     comboBoxPerson.Items.AddPair(Database.DataModule1.DSOsoba.DataSet.FieldByName('Imiê').AsString+' '+Database.DataModule1.DSOsoba.DataSet.FieldByName('Nazwisko').AsString, Database.DataModule1.DSOsoba.DataSet.FieldByName('ID').AsString);
     Database.DataModule1.DSOsoba.DataSet.Next;
  end;
  Database.DataModule1.DSOsoba.DataSet.First;
  // Get all items from database
  comboBoxItem.Clear;
  Database.DataModule1.DSPrzedmiot.DataSet.First;
  while not Database.DataModule1.DSPrzedmiot.DataSet.Eof do
  begin
    comboBoxItem.Items.AddPair(Database.DataModule1.DSPrzedmiot.DataSet.FieldByName('Nazwa').AsString, Database.DataModule1.DSPrzedmiot.DataSet.FieldByName('ID').AsString);
    Database.DataModule1.DSPrzedmiot.DataSet.Next;
  end;
  Database.DataModule1.DSPrzedmiot.DataSet.First;

  // Set selected item to first element of combobox
  comboBoxPerson.ItemIndex := 0;
  comboBoxItem.ItemIndex := 0;
end;
end.
