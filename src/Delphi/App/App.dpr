program App;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UStarter in 'UStarter.pas',
  UEngine in 'UEngine.pas',
  UCommon in 'UCommon.pas';

begin
  try
    //TStarter.Execute;
    TEngine.Execute;
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
