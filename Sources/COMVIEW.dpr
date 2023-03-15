program COMVIEW;







uses
  Forms,
  main in 'main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'CYtime';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
