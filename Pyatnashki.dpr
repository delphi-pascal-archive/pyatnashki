program Pyatnashki;

uses
  Forms,
  GameForm in 'GameForm.pas' {PyatnashkiMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Пятнашки';
  Application.CreateForm(TPyatnashkiMain, PyatnashkiMain);
  Application.Run;
end.
