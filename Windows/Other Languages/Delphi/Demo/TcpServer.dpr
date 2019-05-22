program TcpServer;

uses
  Vcl.Forms,
  uTcpServer in 'uTcpServer.pas' {F_TcpServer},
  HPSocketSDK_SSLUnit in 'sdk\HPSocketSDK_SSLUnit.pas',
  HPSocketSDKUnit in 'sdk\HPSocketSDKUnit.pas',
  HPTypeDef in 'sdk\HPTypeDef.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_TcpServer, F_TcpServer);
  Application.Run;
end.
