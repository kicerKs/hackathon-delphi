unit uFrameItems;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Database;

type
  TFrameItems = class(TFrame)
    panelItems: TPanel;
    editItemName: TEdit;
    editItemPath: TEdit;
    btnAddItem: TButton;
    DBGridItem: TDBGrid;

    procedure btnAddItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


  procedure TFrameItems.btnAddItemClick(Sender: TObject);
    begin
      Database.DataModule1.QAddItem.ParamByName('nazwa').AsString := editItemName.Text;
      Database.DataModule1.QAddItem.ParamByName('sciezka').AsString := editItemPath.Text;
      Database.DataModule1.QAddItem.ExecSQL;
      DBGridItem.DataSource.DataSet.Refresh;
    end;

end.
