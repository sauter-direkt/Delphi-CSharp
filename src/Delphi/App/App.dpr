program App;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UStarter in 'UStarter.pas';

begin
  try
    TStarter.Execute;
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
