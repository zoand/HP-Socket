program TcpClient;

uses
  Vcl.Forms,
  uTcpClient in 'uTcpClient.pas' {F_TcpClient},
  HPSocketSDK_SSLUnit in 'sdk\HPSocketSDK_SSLUnit.pas',
  HPSocketSDKUnit in 'sdk\HPSocketSDKUnit.pas',
  HPTypeDef in 'sdk\HPTypeDef.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_TcpClient, F_TcpClient);
  Application.Run;
end.
