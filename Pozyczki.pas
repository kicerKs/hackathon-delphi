unit Pozyczki;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils,
      System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
      Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls,
      Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids,
  Database, uFrameAdd, uFrameMain, uFrameCalendar, uFramePeople, uFrameOption, uFrameItems,
  uFrameNav;

type

  TForm1 = class(TForm)
    panelNav: TPanel;
    panelContent: TPanel;

    procedure FormCreate(Sender: TObject);

    private
      FrameAdd: TFrameAdd;
      FrameMain: TFrameMain;
      FrameCalendar: TFrameCalendar;
      FramePeople: TFramePeople;
      FrameOption: TFrameOption;
      FrameItems: TFrameItems;
      FrameNav: TFrameNav;

    public
    { Public declarations }

    end;

    var
      Form1: TForm1;

  implementation
  {$R *.dfm}


  //procedury(klasy te co wykonuje bez zwracania wartosci)
  //stworzenie i wywolanie frame'ow
  procedure TForm1.FormCreate(Sender: TObject);
  var
    Frames: array[0..5] of TFrame;
    i: Integer;
  begin
    FrameNav := TFrameNav.Create(Self);
    FrameNav.Parent := panelNav;
    FrameNav.Align := alTop;
    FrameNav.Visible := True;

    // Tworzymy tablicê frame'ów
    Frames[0] := TFrameMain.Create(Self);
    Frames[1] := TFrameAdd.Create(Self);
    Frames[2] := TFrameCalendar.Create(Self);
    Frames[3] := TFramePeople.Create(Self);
    Frames[4] := TFrameOption.Create(Self);
    Frames[5] := TFrameItems.Create(Self);

    // Pêtla ustawiaj¹ca w³aœciwoœci wspólne dla wszystkich frame'ów
    for i := 0 to High(Frames) do
    begin
      Frames[i].Parent := panelContent;
      Frames[i].Align := alClient;
      Frames[i].Visible := i = 0;
    end;

    // Inicjalizacja FrameNav
    FrameNav.Initialize(panelContent, Frames[0], Frames[1], Frames[2],
    Frames[3], Frames[4], Frames[5]);
  end;

end.
