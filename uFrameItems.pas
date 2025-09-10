unit uFrameItems;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Database, FireDAC.Stan.Param,
  Vcl.Imaging.pngimage, Vcl.ExtDlgs, System.UITypes;

type
  TFrameItems = class(TFrame)
    panelItems: TPanel;
    editItemName: TEdit;
    editItemPath: TEdit;
    btnAddItem: TButton;
    DBGridItem: TDBGrid;
    btnEditItem: TButton;
    btnDelItem: TButton;
    btnGoEdit: TButton;
    btnGoAdd: TButton;
    itemImage: TImage;
    btnOpenFile: TButton;
    openPicDialog: TOpenPictureDialog;
    editSearch: TEdit;
    btnSearch: TButton;
    btnReset: TButton;
    Label1: TLabel;

    procedure btnAddItemClick(Sender: TObject);
    procedure btnGoAddClick(Sender: TObject);
    procedure btnGoEditClick(Sender: TObject);
    procedure DBGridItemDblClick(Sender: TObject);
    procedure btnEditItemClick(Sender: TObject);
    procedure btnDelItemClick(Sender: TObject);
    procedure changeToEditMode();
    procedure btnOpenFileClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure editSearchEnter(Sender: TObject);
    procedure editSearchExit(Sender: TObject);
  private
    IsEditMode: Boolean;
    CurrentItemID: Integer;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}


constructor TFrameItems.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  IsEditMode := False;
  CurrentItemID := -1;
end;

// Add item
procedure TFrameItems.btnAddItemClick(Sender: TObject);
var
  s: String;
begin
  // Walidacja pustej nazwy
  if Trim(editItemName.Text) = '' then
  begin
    ShowMessage('Podaj nazwê przedmiotu!');
    Exit;
  end;

  // Sprawdzenie czy ju¿ istnieje taki przedmiot w bazie
  with Database.DataModule1 do
  begin
    QCheckItem.SQL.Text := 'SELECT COUNT(*) AS CNT FROM Przedmiot WHERE Nazwa = :nazwa';
    QCheckItem.ParamByName('nazwa').AsString := editItemName.Text;
    QCheckItem.Open;
    if QCheckItem.FieldByName('CNT').AsInteger > 0 then
    begin
      ShowMessage('Przedmiot o tej nazwie ju¿ istnieje!');
      QCheckItem.Close;
      Exit;
    end;
    QCheckItem.Close;
  end;
  // SQL
  Database.DataModule1.QAddItem.ParamByName('nazwa').AsString := editItemName.Text;
  Database.DataModule1.QAddItem.ParamByName('sciezka').AsString := editItemPath.Text;
  Database.DataModule1.QAddItem.ExecSQL;
  // Copy file to \pictures
  s := openPicDialog.FileName;
  CopyFile(PWideChar(s), PWideChar('pictures\'+editItemPath.Text), True);
  // Refresh
  DBGridItem.DataSource.DataSet.Refresh;
end;

//wypelnienie formularza edycji
procedure TFrameItems.DBGridItemDblClick(Sender: TObject);
begin
  // tutaj moja kontrowersyjna zmiana, w razie czego mo¿esz revertn¹æ, ale wydaje mi siê to sensowne
  if not IsEditMode then
     changeToEditMode();
  //begin
  if not DBGridItem.DataSource.DataSet.IsEmpty then
  begin
    CurrentItemID := DBGridItem.DataSource.DataSet.FieldByName('ID').AsInteger;
    editItemName.Text := DBGridItem.DataSource.DataSet.FieldByName('Nazwa').AsString;
    editItemPath.Text := DBGridItem.DataSource.DataSet.FieldByName('Œcie¿ka').AsString;
    // TODO: walidacja czy plik istnieje, daj placeholder <b³êdny plik> jeœli nie
    if System.SysUtils.FileExists('pictures/'+DBGridItem.DataSource.DataSet.FieldByName('Œcie¿ka').AsString) then
    begin
      Label1.Visible := False;
      itemImage.Picture.LoadFromFile('pictures/'+DBGridItem.DataSource.DataSet.FieldByName('Œcie¿ka').AsString);
      itemImage.Visible := True;
    end
    else
    begin
      itemImage.Visible := False;
      Label1.Visible := True;
    end;

  end;
  //end;
end;

procedure TFrameItems.editSearchEnter(Sender: TObject);
begin
  if editSearch.Text = 'Wyszukaj' then
  EditSearch.Clear;
end;

procedure TFrameItems.editSearchExit(Sender: TObject);
begin
  if editSearch.Text = '' then
  EditSearch.Text := 'Wyszukaj';
end;

//edit
procedure TFrameItems.btnEditItemClick(Sender: TObject);
begin
  with Database.DataModule1 do
    begin
     // Walidacja unikalnoœci nazwy
    QCheckItem.Close;
    QCheckItem.ParamByName('nazwa').AsString := editItemName.Text;
    //QCheckItem.ParamByName('id').AsInteger :=
    //  DBGridItem.DataSource.DataSet.FieldByName('ID').AsInteger;
    QCheckItem.Open;

    if QCheckItem.FieldByName('CNT').AsInteger > 0 then
    begin
      MessageDlg('Przedmiot o takiej nazwie ju¿ istnieje!', mtError, [mbOK], 0);
      Exit;
    end;
    //dodanie
      QUpdateItem.ParamByName('ID').AsInteger :=
          DBGridItem.DataSource.DataSet.FieldByName('id').AsInteger;
      QUpdateItem.ParamByName('Nazwa').AsString := editItemName.Text;
      QUpdateItem.ParamByName('sciezka').AsString := editItemPath.Text;
      QUpdateItem.ExecSQL;
      DBGridItem.DataSource.DataSet.Refresh;
    end;
end;

//del
procedure TFrameItems.btnDelItemClick(Sender: TObject);
begin
    with Database.DataModule1 do
      begin
        if MessageDlg('Czy na pewno usun¹æ ten przedmiot?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          QDeleteItem.ParamByName('ID').AsInteger :=
            DBGridItem.DataSource.DataSet.FieldByName('id').AsInteger;
          QDeleteItem.ExecSQL;
          DBGridItem.DataSource.DataSet.Refresh;
        end;
      end;
end;

//wyszukiwanie
procedure TFrameItems.btnSearchClick(Sender: TObject);
begin
  with Database.DataModule1 do
  begin
    QSearchItem.Close;
    QSearchItem.ParamByName('search').AsString := '%' + editSearch.Text + '%';
    QSearchItem.Open;
    if QSearchItem.RowsAffected = 0 then
      ShowMessage('Nie znaleziono rekordu w bazie')
    else
      DBGridItem.DataSource.DataSet := QSearchItem;

  end;
end;

//reset wyszukania
procedure TFrameItems.btnResetClick(Sender: TObject);
begin
     DBGridItem.DataSource.DataSet := Database.DataModule1.MTSelectAllPrzedmiot;
     editSearch.Text := 'Wyszukaj';
end;

//przyciski do przelaczania edycja/dodawanie
procedure TFrameItems.btnGoAddClick(Sender: TObject);
begin
     IsEditMode := False;
     btnEditItem.Visible := False;
     btnDelItem.Visible := False;
     btnGoAdd.Visible := False;
     btnGoEdit.Visible := True;
     btnAddItem.Visible := True;
     editItemName.Text := '';
     editItemPath.Text := '';
     itemImage.Picture := nil; // podobno nie robi memory leak :V
     itemImage.Visible := False;
     Label1.Visible := False;
end;

procedure TFrameItems.btnGoEditClick(Sender: TObject);
begin
    changeToEditMode();
end;

// Open file dialog for picture
procedure TFrameItems.btnOpenFileClick(Sender: TObject);
var
  s: String;
  ts: TArray<String>;
begin
  if openPicDialog.Execute then
  begin
    s := openPicDialog.FileName;
    ts := s.Split(['\']);
    s := ts[Length(ts)-1];
    editItemPath.Text := s;
  end;

end;

// Helper function for changing mode to edit
procedure TFrameItems.changeToEditMode();
begin
     IsEditMode := True;
     btnEditItem.Visible := True;
     btnDelItem.Visible := True;
     btnGoAdd.Visible := True;
     btnGoEdit.Visible := False;
     btnAddItem.Visible := False;
     editItemName.Text := '';
     editItemPath.Text := '';
     itemImage.Picture := nil; // podobno nie robi memory leak :V
     itemImage.Visible := False;
     Label1.Visible := False;
end;

end.
