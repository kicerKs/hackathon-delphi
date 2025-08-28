unit uFramePeople;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Database, FireDAC.Stan.Param, System.UITypes;

type
  TFramePeople = class(TFrame)
    panelPeople: TPanel;
    editName: TEdit;
    editSurname: TEdit;
    editPhone: TEdit;
    editAddress: TEdit;
    editEmail: TEdit;
    btnAddPerson: TButton;
    DBGridPerson: TDBGrid;
    btnEditPerson: TButton;
    btnDelete: TButton;
    btnGoAdd: TButton;
    btnGoEdit: TButton;
    editSearch: TEdit;
    btnSearch: TButton;
    btnReset: TButton;

    procedure btnAddPersonClick(Sender: TObject);
    procedure editPhoneKeyPress(Sender: TObject; var Key: Char);
    procedure EditPhoneExit(Sender: TObject);
    procedure editPhoneEnter(Sender: TObject);
    procedure EditNameEnter(Sender: TObject);
    procedure EditNameExit(Sender: TObject);
    procedure EditSurnameEnter(Sender: TObject);
    procedure EditSurnameExit(Sender: TObject);
    procedure EditEmailEnter(Sender: TObject);
    procedure EditEmailExit(Sender: TObject);
    procedure EditAddressEnter(Sender: TObject);
    procedure EditAddressExit(Sender: TObject);
    procedure btnEditPersonClick(Sender: TObject);
    procedure DBGridPersonDblClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnGoEditClick(Sender: TObject);
    procedure btnGoAddClick(Sender: TObject);
    procedure editNameKeyPress(Sender: TObject; var Key: Char);
    procedure editSurnameKeyPress(Sender: TObject; var Key: Char);
    procedure btnSearchClick(Sender: TObject);
    procedure editSearchKeyPress(Sender: TObject; var Key: Char);
    procedure editSearchEnter(Sender: TObject);
    procedure editSearchExit(Sender: TObject);
    procedure btnResetClick(Sender: TObject);

  private
    isEditMode: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

//tak chujowo ¿e nie mo¿na przypisaæ na start wartoœci temu œcierwu
constructor TFramePeople.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  IsEditMode := False;
end;

//wypelnienie pól edycji (doubleclick)
procedure TFramePeople.DBGridPersonDblClick(Sender: TObject);
begin
  if not isEditMode then Exit;

  //zczytywanie danych do pol edycji
  if Assigned(DBGridPerson.DataSource) and
  (not DBGridPerson.DataSource.DataSet.IsEmpty) then
  begin
  EditName.Text := DBGridPerson.DataSource.DataSet.FieldByName('Imiê').AsString;
  EditSurname.Text := DBGridPerson.DataSource.DataSet.FieldByName('Nazwisko').AsString;
  EditPhone.Text := DBGridPerson.DataSource.DataSet.FieldByName('Nr. Telefonu').AsString;
  EditAddress.Text := DBGridPerson.DataSource.DataSet.FieldByName('Adres').AsString;
  EditEmail.Text := DBGridPerson.DataSource.DataSet.FieldByName('E-mail').AsString;
  //zczytywanie id
  btnEditPerson.Tag := DBGridPerson.DataSource.DataSet.FieldByName('ID').AsInteger;
  btnDelete.Tag := btnEditPerson.Tag;
  end;
end;
   //add
procedure TFramePeople.btnAddPersonClick(Sender: TObject);
  begin
  with Database.DataModule1 do
  begin
    // sprawdzamy czy istnieje taka osoba
    QCheckPerson.Close;
    QCheckPerson.SQL.Text :=
      'SELECT COUNT(*) AS Cnt FROM osoba ' +
      'WHERE imie = :imie AND nazwisko = :nazwisko ' +
      'AND telefon = :telefon AND email = :email';
    QCheckPerson.ParamByName('imie').AsString := editName.Text;
    QCheckPerson.ParamByName('nazwisko').AsString := editSurname.Text;
    QCheckPerson.ParamByName('telefon').AsString := editPhone.Text;
    QCheckPerson.ParamByName('email').AsString := editEmail.Text;
    QCheckPerson.Open;

    if QCheckPerson.FieldByName('Cnt').AsInteger > 0 then
    begin
      MessageDlg('Taka osoba ju¿ istnieje w bazie danych!', mtWarning, [mbOK], 0);
      Exit;
    end;

    // dodajemy osobê
    QAddPerson.ParamByName('imie').AsString := editName.Text;
    QAddPerson.ParamByName('nazwisko').AsString := editSurname.Text;
    QAddPerson.ParamByName('telefon').AsString := editPhone.Text;
    QAddPerson.ParamByName('adres').AsString := editAddress.Text;
    QAddPerson.ParamByName('email').AsString := editEmail.Text;
    QAddPerson.ExecSQL;

    DBGridPerson.DataSource.DataSet.Refresh;
  end;
  end;

  //delete
procedure TFramePeople.btnDeleteClick(Sender: TObject);
begin
     with Database.DataModule1 do
      begin
        if MessageDlg('Czy na pewno usun¹æ tê osobê?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          QDeletePerson.ParamByName('ID').AsInteger :=
            DBGridPerson.DataSource.DataSet.FieldByName('id').AsInteger;
          QDeletePerson.ExecSQL;
          DBGridPerson.DataSource.DataSet.Refresh;
        end;
      end;
end;
      //update
procedure TFramePeople.btnEditPersonClick(Sender: TObject);
  begin
    with Database.DataModule1 do
      begin
      // Walidacja unikalnoœci imienia + nazwiska
    QCheckPerson.Close;
    QCheckPerson.ParamByName('imie').AsString := editName.Text;
    QCheckPerson.ParamByName('nazwisko').AsString := editSurname.Text;
    QCheckPerson.ParamByName('id').AsInteger := DBGridPerson.DataSource.DataSet.FieldByName('ID').AsInteger;
    QCheckPerson.Open;

    if QCheckPerson.FieldByName('CNT').AsInteger > 0 then
    begin
      MessageDlg('Osoba o takim imieniu i nazwisku ju¿ istnieje!', mtError, [mbOK], 0);
      Exit;
    end;
    //aktualizacja danych
        QUpdatePerson.ParamByName('ID').AsInteger :=
          DBGridPerson.DataSource.DataSet.FieldByName('id').AsInteger;
        QUpdatePerson.ParamByName('Imie').AsString := editName.Text;
        QUpdatePerson.ParamByName('Nazwisko').AsString := editSurname.Text;
        QUpdatePerson.ParamByName('Telefon').AsString := editPhone.Text;
        QUpdatePerson.ParamByName('Adres').AsString := editAddress.Text;
        QUpdatePerson.ParamByName('Email').AsString := editEmail.Text;
        QUpdatePerson.ExecSQL;
        DBGridPerson.DataSource.DataSet.Refresh;
      end;
  end;

  //zmiana pola edycji/dodawania
    procedure TFramePeople.btnGoAddClick(Sender: TObject);
begin
  isEditMode := False;

  editName.Text := '';
  editSurname.Text := '';
  editPhone.Text := '';
  editAddress.Text := '';
  editEmail.Text := '';

  btnAddPerson.Visible := True;
  btnEditPerson.Visible := False;
  btnDelete.Visible := False;
  btnGoAdd.Visible := False;
  btnGoEdit.Visible := True;

end;

procedure TFramePeople.btnGoEditClick(Sender: TObject);
begin
  isEditMode := True;

  btnAddPerson.Visible := False;
  btnEditPerson.Visible := True;
  btnDelete.Visible := True;
  btnGoAdd.Visible := True;
  btnGoEdit.Visible := False;

end;

//wyszukanie rekordu w bazie
procedure TFramePeople.btnSearchClick(Sender: TObject);
begin
  with Database.DataModule1 do
  begin
    QSearchPerson.Close;
    QSearchPerson.ParamByName('search').AsString := '%' + editSearch.Text + '%';
    QSearchPerson.Open;
    DBGridPerson.DataSource.DataSet := QSearchPerson;
  end;
end;

procedure TFramePeople.editSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then // Enter
  begin
    Key := #0; // ¿eby nie piszcza³o
    btnSearchClick(Sender);
  end;
end;

//reset po wyszukaniu w bazie
procedure TFramePeople.btnResetClick(Sender: TObject);
begin
    DBGridPerson.DataSource.DataSet := Database.DataModule1.MTSelectAllOsoba;
    editSearch.Text := 'Wyszukaj';
end;

//walidacja
//telefon
  procedure TFramePeople.editPhoneKeyPress(Sender: TObject; var Key: Char);
    begin
      if not CharInSet(Key, ['0'..'9', #8]) then
        Key := #0;
    end;

procedure TFramePeople.EditPhoneExit(Sender: TObject);
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

    //imie
  procedure TFramePeople.editNameKeyPress(Sender: TObject; var Key: Char);
begin
    if not CharInSet(Key, ['A'..'Z', 'a'..'z', '¥'..'¯', '¹'..'¿', ' ', '-', #8]) then
    Key := #0;
end;

//nazwisko
  procedure TFramePeople.editSurnameKeyPress(Sender: TObject; var Key: Char);
begin
   if not CharInSet(Key, ['A'..'Z', 'a'..'z', '¥'..'¯', '¹'..'¿', ' ', '-', #8]) then
    Key := #0;
end;

procedure TFramePeople.editPhoneEnter(Sender: TObject);
    begin
      if EditPhone.Text = 'Telefon' then
        EditPhone.Clear;
    end;

  procedure TFramePeople.EditNameEnter(Sender: TObject);
    begin
      if EditName.Text = 'Imiê' then
        EditName.Clear;
    end;

  procedure TFramePeople.EditNameExit(Sender: TObject);
    begin
      if EditName.Text = '' then
        EditName.Text := 'Imiê';
    end;

  procedure TFramePeople.EditSurnameEnter(Sender: TObject);
    begin
      if EditSurname.Text = 'Nazwisko' then
        EditSurname.Clear;
    end;

  procedure TFramePeople.EditSurnameExit(Sender: TObject);
    begin
      if EditSurname.Text = '' then
        EditSurname.Text := 'Nazwisko';
    end;

procedure TFramePeople.EditEmailEnter(Sender: TObject);
    begin
      if EditEmail.Text = 'E-Mail' then
        EditEmail.Clear;
    end;

  procedure TFramePeople.EditEmailExit(Sender: TObject);
    begin
      if EditEmail.Text = '' then
        EditEmail.Text := 'E-Mail';
    end;

procedure TFramePeople.EditAddressEnter(Sender: TObject);
    begin
      if EditAddress.Text = 'Adres' then
        EditAddress.Clear;
    end;

  procedure TFramePeople.EditAddressExit(Sender: TObject);
    begin
      if EditAddress.Text = '' then
        EditAddress.Text := 'Adres';
    end;

  procedure TFramePeople.editSearchEnter(Sender: TObject);
    begin
       if editSearch.Text = 'Wyszukaj' then
        EditSearch.Clear;
    end;

procedure TFramePeople.editSearchExit(Sender: TObject);
    begin
       if editSearch.Text = '' then
        EditSearch.Text := 'Wyszukaj';
    end;
end.
