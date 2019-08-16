program TcpPackServer;

uses
  Vcl.Forms,
  uTcpPackServer in 'uTcpPackServer.pas' {F_TcpPackServer},
  HPSocketSDK_SSLUnit in 'sdk\HPSocketSDK_SSLUnit.pas',
  HPSocketSDKUnit in 'sdk\HPSocketSDKUnit.pas',
  HPTypeDef in 'sdk\HPTypeDef.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_TcpPackServer, F_TcpPackServer);
  Application.Run;
end.
