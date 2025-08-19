unit Pozyczki;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils,
      System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
      Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls,
      Vcl.ComCtrls;

type

  TForm1 = class(TForm)
    panelNav: TPanel;
    btnMain: TSpeedButton;
    btnAdd: TSpeedButton;
    btnCalendar: TSpeedButton;
    btnPeople: TSpeedButton;
    btnOption: TSpeedButton;
    panelMain: TPanel;
    panelPeople: TPanel;
    panelCalendar: TPanel;
    panelAdd: TPanel;
    panelOption: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    listViewLoan: TListView;
    imgLoan: TImage;
    btnAddLoan: TButton;
    loanExpDate: TDateTimePicker;
    editWhatMoney: TEdit;
    radioItem: TRadioButton;
    radioMoney: TRadioButton;
    Label1: TLabel;
    editNumber: TEdit;
    Label6: TLabel;
    comboBoxPerson: TComboBox;
    Label7: TLabel;
    editName: TEdit;
    editSurname: TEdit;
    editPhone: TEdit;
    editAddress: TEdit;
    editEmail: TEdit;
    btnAddPerson: TButton;
    btnEditPerson: TButton;
    addAddress: TEdit;
    addEmail: TEdit;
    addName: TEdit;
    addPhone: TEdit;
    addSurname: TEdit;
    comboChoosePerson: TComboBox;

    procedure btnMainClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCalendarClick(Sender: TObject);
    procedure btnPeopleClick(Sender: TObject);
    procedure btnOptionClick(Sender: TObject);
    procedure showPanel(PanelToShow: TPanel);
    procedure formCreate(Sender: TObject);
    procedure radioButtonClick(Sender: TObject);
    procedure editPhoneKeyPress(Sender: TObject; var Key: Char);
    procedure editPhoneExit(Sender: TObject);
    procedure editPhoneEnter(Sender: TObject);
    procedure editNameExit(Sender: TObject);
    procedure editNameEnter(Sender: TObject);
    procedure editSurnameEnter(Sender: TObject);
    procedure editSurnameExit(Sender: TObject);
    procedure editEmailEnter(Sender: TObject);
    procedure editEmailExit(Sender: TObject);
    procedure editAddressEnter(Sender: TObject);
    procedure editAddressExit(Sender: TObject);

    private
    { Private declarations }

    public
    { Public declarations }

    end;

  var
    Form1: TForm1;

  implementation
  {$R *.dfm}


  //procedury(klasy te co wykonuje bez zwracania wartosci)
  //obs³uga zmian okienek
  procedure TForm1.ShowPanel(PanelToShow: TPanel);
    begin
      panelMain.Visible := False;
      panelAdd.Visible := False;
      panelCalendar.Visible := False;
      panelPeople.Visible := False;
      panelOption.Visible := False;
      PanelToShow.Visible := True;
    end;

  procedure TForm1.btnMainClick(Sender: TObject);
    begin
      ShowPanel(panelMain);
    end;

  procedure TForm1.btnAddClick(Sender: TObject);
    begin
      ShowPanel(panelAdd);
    end;

  procedure TForm1.btnCalendarClick(Sender: TObject);
    begin
      ShowPanel(panelCalendar);
    end;

  procedure TForm1.btnPeopleClick(Sender: TObject);
    begin
      ShowPanel(panelPeople);
    end;

  procedure TForm1.btnOptionClick(Sender: TObject);
      begin
        ShowPanel(panelOption);
      end;

  //procedury wybrania kasy/itemku i kosmetyka
  procedure TForm1.FormCreate(Sender: TObject);
    begin
      radioMoney.Checked := True;

      editWhatMoney.Visible := True;
      editNumber.Visible := False;

      comboChoosePerson.Style := csDropDownList;
    end;

procedure TForm1.RadioButtonClick(Sender: TObject);
    const
      shiftAmount = 29;
    begin
      if RadioMoney.Checked then
      begin
        editWhatMoney.Visible := True;
        editNumber.Visible := False;
        label6.Visible := False;
        btnAddLoan.Top := btnAddLoan.Top - shiftAmount;
        loanExpDate.Top := loanExpDate.Top - shiftAmount;
        Label1.Caption := 'Kwota';
      end
      else if RadioItem.Checked then
      begin
        editWhatMoney.Visible := True;
        editNumber.Visible := True;
        label6.Visible := True;
        btnAddLoan.Top := btnAddLoan.Top + shiftAmount;
        loanExpDate.Top := loanExpDate.Top + shiftAmount;
        Label1.Caption := 'Przedmiot';
      end;
    end;

  //procedury do dodawania osób (walidacja i kosmetyka usuwania tekstu)
  procedure TForm1.editPhoneKeyPress(Sender: TObject; var Key: Char);
    begin
      if not CharInSet(Key, ['0'..'9', #8]) then
        Key := #0;
    end;
  procedure TForm1.EditPhoneExit(Sender: TObject);
    var
      Phone: string;
    begin
      Phone := EditPhone.Text;
      if (EditPhone.Text = '') then
        EditPhone.Text := 'Telefon'
      else if (Length(Phone) < 7) or
         (Phone[1] <> '+') and not CharInSet(Phone[1], ['0'..'9']) then
        ShowMessage('Nieprawid³owy numer telefonu!');
    end;
  procedure TForm1.editPhoneEnter(Sender: TObject);
    begin
      if EditPhone.Text = 'Telefon' then
        EditPhone.Clear;
    end;

  procedure TForm1.EditNameEnter(Sender: TObject);
    begin
      if EditName.Text = 'Imiê' then
        EditName.Clear;
    end;

  procedure TForm1.EditNameExit(Sender: TObject);
    begin
      if EditName.Text = '' then
        EditName.Text := 'Imiê';
    end;

  procedure TForm1.EditSurnameEnter(Sender: TObject);
    begin
      if EditSurname.Text = 'Nazwisko' then
        EditSurname.Clear;
    end;

  procedure TForm1.EditSurnameExit(Sender: TObject);
    begin
      if EditSurname.Text = '' then
        EditSurname.Text := 'Nazwisko';
    end;

  procedure TForm1.EditEmailEnter(Sender: TObject);
    begin
      if EditEmail.Text = 'E-Mail' then
        EditEmail.Clear;
    end;

  procedure TForm1.EditEmailExit(Sender: TObject);
    begin
      if EditEmail.Text = '' then
        EditEmail.Text := 'E-Mail';
    end;

  procedure TForm1.EditAddressEnter(Sender: TObject);
    begin
      if EditAddress.Text = 'Adres' then
        EditAddress.Clear;
    end;

  procedure TForm1.EditAddressExit(Sender: TObject);
    begin
      if EditAddress.Text = '' then
        EditAddress.Text := 'Adres';
    end;
end.
