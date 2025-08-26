unit uFrameMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls;

type
  TFrameMain = class(TFrame)
    panelMain: TPanel;
    imgLoan: TImage;
    DBGridPozyczkaPrzedmiot: TDBGrid;
    DBGridPozyczkaPieniadze: TDBGrid;
    toggleSwitch: TToggleSwitch;
    Label1: TLabel;
    Label2: TLabel;

    procedure DBGridPozyczkaPieniadzeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridPozyczkaPrzedmiotDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure toggleSwitchClick(Sender: TObject);
    procedure refreshDB();
  private
    { Private declarations }
  public
  end;

implementation

{$R *.dfm}

  //przycisk do prze³¹czania widoku tych siatek
  procedure TFrameMain.toggleSwitchClick(Sender: TObject);
    begin
      if toggleSwitch.State = tssOn then
        begin
          DBGridPozyczkaPieniadze.Visible := True;
          DBGridPozyczkaPrzedmiot.Visible := False;
        end
      else
        begin
          DBGridPozyczkaPieniadze.Visible := False;
          DBGridPozyczkaPrzedmiot.Visible := True;
        end;
    end;

  //to twoje krecik (zrób coœ ¿eby ³adnie siê kolumny wyœwietla³y)
  procedure TFrameMain.DBGridPozyczkaPieniadzeDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    begin
      if Column.Title.Caption.Contains('Przeterminowane') then
        if Column.Field.Text.Contains('1') then DBGridPozyczkaPrzedmiot.Canvas.Font.Color := clRed
      else DBGridPozyczkaPieniadze.Canvas.Font.Color := clGreen;
      DBGridPozyczkaPieniadze.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  //to te¿
  procedure TFrameMain.DBGridPozyczkaPrzedmiotDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    begin
      if Column.Title.Caption.Contains('Przeterminowane') then
        if Column.Field.Text.Contains('1') then DBGridPozyczkaPrzedmiot.Canvas.Font.Color := clRed
      else DBGridPozyczkaPrzedmiot.Canvas.Font.Color := clGreen;
      DBGridPozyczkaPrzedmiot.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  procedure TFrameMain.refreshDB();
  begin
    DBGridPozyczkaPieniadze.DataSource.DataSet.Refresh;
    DBGridPozyczkaPrzedmiot.DataSource.DataSet.Refresh;
  end;
end.
