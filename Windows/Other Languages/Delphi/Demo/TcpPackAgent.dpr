program TcpPackAgent;

uses
  Vcl.Forms,
  uTcpPackAgent in 'uTcpPackAgent.pas' {F_TcpPackAgent},
  HPSocketSDK_SSLUnit in 'sdk\HPSocketSDK_SSLUnit.pas',
  HPSocketSDKUnit in 'sdk\HPSocketSDKUnit.pas',
  HPTypeDef in 'sdk\HPTypeDef.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_TcpPackAgent, F_TcpPackAgent);
  Application.Run;
end.
