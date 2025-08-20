program Pozyczkomat;

uses
  Vcl.Forms,
  Pozyczki in 'Pozyczki.pas' {Form1},
  Database in 'Database.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
