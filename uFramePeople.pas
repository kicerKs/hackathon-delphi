unit uFramePeople;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Database;

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

  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFramePeople.btnAddPersonClick(Sender: TObject);
  begin
     Database.DataModule1.QAddPerson.ParamByName('imie').AsString := editName.Text;
     Database.DataModule1.QAddPerson.ParamByName('nazwisko').AsString := editSurname.Text;
     Database.DataModule1.QAddPerson.ParamByName('telefon').AsString := editPhone.Text;
     Database.DataModule1.QAddPerson.ParamByName('adres').AsString := editAddress.Text;
     Database.DataModule1.QAddPerson.ParamByName('email').AsString := editEmail.Text;
     Database.DataModule1.QAddPerson.ExecSQL;
     DBGridPerson.DataSource.DataSet.Refresh;
  end;



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

end.
