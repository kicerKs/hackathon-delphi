unit Database;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDataModule1 = class(TDataModule)
    PozyczkomatDatabaseConnection: TFDConnection;
    CMDSelectAllPozyczkaPrzedmiot: TFDCommand;
    TASelectAllPozyczkaPrzedmiot: TFDTableAdapter;
    MTSelectAllPozyczkaPrzedmiot: TFDMemTable;
    DSPozyczkaPrzedmiot: TDataSource;
    CMDSelectAllOsoba: TFDCommand;
    TASelectAllOsoba: TFDTableAdapter;
    MTSelectAllOsoba: TFDMemTable;
    DSOsoba: TDataSource;
    CMDSelectAllPrzedmiot: TFDCommand;
    TASelectAllPrzedmiot: TFDTableAdapter;
    MTSelectAllPrzedmiot: TFDMemTable;
    DSPrzedmiot: TDataSource;
    CMDSelectAllPozyczkaPieniadze: TFDCommand;
    TASelectAllPozyczkaPieniadze: TFDTableAdapter;
    MTSelectAllPozyczkaPieniadze: TFDMemTable;
    DSPozyczkaPieniadze: TDataSource;
    QAddPerson: TFDQuery;
    QAddItem: TFDQuery;
    QUpdatePerson: TFDQuery;
    QDeletePerson: TFDQuery;
    QUpdateItem: TFDQuery;
    QDeleteItem: TFDQuery;
    QAddPozyczkaPrzedmiot: TFDQuery;
    QAddPozyczkaPieniadze: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
