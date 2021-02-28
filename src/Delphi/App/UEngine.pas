unit UEngine;

interface

uses
  UStarter, UCommon;

const
  ERROR_TXT = 'ERROR';

type
  IEngine=interface(IInterface)
  [(GUID_ENGINE)]
  function HalloWord1: PChar; safecall;
  function HalloWord2: variant; safecall;
  function Number42A: integer; safecall;
  function Number42B: variant; safecall;
  end;

  TEngine=class(Tobject)
  public
    constructor Create;
    destructor Destroy; override;
  private
    FoStarter: TStarter;
    FifSrc   : IEngine;
  public
    function HalloWord1: string;
    function HalloWord2: string;
    function Number42A: integer;
    function Number42B: integer;
  public
    class procedure Execute;
  end;

implementation

uses
  System.SysUtils;

{ TEngine }

constructor TEngine.Create;
var
  Lif  : IInterface;
begin
  inherited Create;

  FoStarter := TStarter.Create;

  if not FoStarter.Execute(Lif) then
    Writeln('Not found')
  else
  if not Supports(Lif, IEngine,  FifSrc) then
    Writeln('Not support');

end;

destructor TEngine.Destroy;
begin
  FreeAndNil(FoStarter);
  inherited;
end;


function TEngine.HalloWord1: string;
begin
  if Assigned(FifSrc) then
    Result := FifSrc.HalloWord1
  else
    Result := ERROR_TXT
end;

function TEngine.HalloWord2: string;
begin
  if Assigned(FifSrc) then
    Result := FifSrc.HalloWord2
  else
    Result := ERROR_TXT
end;

function TEngine.Number42A: integer;
begin
  if Assigned(FifSrc) then
    Result := FifSrc.Number42A
  else
    Result := -1
end;

function TEngine.Number42B: integer;
begin
  if Assigned(FifSrc) then
    Result := FifSrc.Number42B
  else
    Result := -1
end;


class procedure TEngine.Execute;
var
  Leg : TEngine;
begin
  Leg := TEngine.Create;
  try
    writeln('Txt A ', Leg.HalloWord1);
    writeln('Txt B ', Leg.HalloWord2);
    writeln('int A ', Leg.Number42A);
    writeln('int B ', Leg.Number42B);

  finally
    Leg.Free;
  end;
end;

end.
