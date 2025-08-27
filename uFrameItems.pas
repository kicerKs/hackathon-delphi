unit uFrameItems;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Database, FireDAC.Stan.Param,
  Vcl.Imaging.pngimage, Vcl.ExtDlgs;

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

    procedure btnAddItemClick(Sender: TObject);
    procedure btnGoAddClick(Sender: TObject);
    procedure btnGoEditClick(Sender: TObject);
    procedure DBGridItemDblClick(Sender: TObject);
    procedure btnEditItemClick(Sender: TObject);
    procedure btnDelItemClick(Sender: TObject);
    procedure changeToEditMode();
    procedure btnOpenFileClick(Sender: TObject);
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

//add
procedure TFrameItems.btnAddItemClick(Sender: TObject);
var
  s: String;
begin
  Database.DataModule1.QAddItem.ParamByName('nazwa').AsString := editItemName.Text;
  Database.DataModule1.QAddItem.ParamByName('sciezka').AsString := editItemPath.Text;
  Database.DataModule1.QAddItem.ExecSQL;
  s := openPicDialog.FileName;
  CopyFile(PWideChar(s), PWideChar('pictures\'+editItemPath.Text), True);
  DBGridItem.DataSource.DataSet.Refresh;
end;

//wypelnienie formularza edycji
  procedure TFrameItems.DBGridItemDblClick(Sender: TObject);
begin
  // tutaj moja kontrowersyjna zmiana, w razie czego mo�esz revertn��, ale wydaje mi si� to sensowne
  if not IsEditMode then
     changeToEditMode();
  //begin
  if not DBGridItem.DataSource.DataSet.IsEmpty then
  begin
    CurrentItemID := DBGridItem.DataSource.DataSet.FieldByName('ID').AsInteger;
    editItemName.Text := DBGridItem.DataSource.DataSet.FieldByName('Nazwa').AsString;
    editItemPath.Text := DBGridItem.DataSource.DataSet.FieldByName('�cie�ka').AsString;
    // TODO: walidacja czy plik istnieje, daj placeholder <b��dny plik> je�li nie
    itemImage.Picture.LoadFromFile('pictures/'+DBGridItem.DataSource.DataSet.FieldByName('�cie�ka').AsString);
  end;
  //end;
end;

//edit
procedure TFrameItems.btnEditItemClick(Sender: TObject);
begin
  with Database.DataModule1 do
    begin
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
        if MessageDlg('Czy na pewno usun�� ten przedmiot?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          QDeleteItem.ParamByName('ID').AsInteger :=
            DBGridItem.DataSource.DataSet.FieldByName('id').AsInteger;
          QDeleteItem.ExecSQL;
          DBGridItem.DataSource.DataSet.Refresh;
        end;
      end;
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
end;
procedure TFrameItems.btnGoEditClick(Sender: TObject);
begin
    changeToEditMode();
end;
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
end;

end.
