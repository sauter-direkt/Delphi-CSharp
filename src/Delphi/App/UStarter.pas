unit UStarter;

interface


type
  TStarter=class(TObject)
  public
    const
      DLL_NAME  = 'Starter.dll';
      FUNK_NAME = 'Start';
    type
      TFuncStart=function(var ASrv: IInterface): boolean; stdcall;
  public
    constructor Create;
    destructor Destroy; override;
  strict private
    FhDll: THandle;
    FFunc: TFuncStart;
  public
    function Execute(var Aif: IInterface): boolean;
  end;

implementation

uses
  Winapi.Windows, System.SysUtils;

{ TStarter }

constructor TStarter.Create;
var
  LcMsg: string;
begin
  inherited;
  FhDll := LoadLibrary(DLL_NAME);
  if FhDll = 0 then
  begin
    LcMsg := Format('%s: %s', [SysErrorMessage(GetLastError), DLL_NAME]);
    raise Exception.Create(LcMsg);
  end;

  @FFunc := GetProcAddress(FhDll, FUNK_NAME);
  if not Assigned(FFunc) then
  begin
    LcMsg := Format('%s: %s', [SysErrorMessage(GetLastError), FUNK_NAME]);
    raise Exception.Create(LcMsg);
  end;

end;

destructor TStarter.Destroy;
begin
  if FhDll > 0 then
    FreeLibrary(FhDll);
  inherited;
end;


function TStarter.Execute(var Aif: IInterface): boolean;
begin
  Result := FFunc(Aif);
end;

end.
