unit HPSocketSDK_SSLUnit;

interface

uses
  Winapi.Windows, HPTypeDef, HPSocketSDKUnit;

type

{
/************************************************************************
���ƣ����� SSL Socket ����ָ�����ͱ���
�������� SSL Socket ����ָ�붨��Ϊ��ֱ�۵ı���
************************************************************************/
}

  HP_SSLServer = HP_Object;
  HP_SSLAgent = HP_Object;
  HP_SSLClient = HP_Object;

  HP_SSLPullServer = HP_Object;
  HP_SSLPullAgent = HP_Object;
  HP_SSLPullClient = HP_Object;

  HP_SSLPackServer = HP_Object;
  HP_SSLPackAgent = HP_Object;
  HP_SSLPackClient = HP_Object;

  HP_HttpsServer = HP_Object;
  HP_HttpsAgent = HP_Object;
  HP_HttpsClient = HP_Object;
  HP_HttpsSyncClient = HP_Object;

//*****************************************************************************************************************************************************/
//******************************************************************** SSL Exports ********************************************************************/
//*****************************************************************************************************************************************************/


//********************************************************/
//************** HPSocket4C-SSL ���󴴽����� **************/

// ���� HP_SSLServer ����
function Create_HP_SSLServer(pListener: HP_TcpServerListener): HP_SSLServer; stdcall; external HPSocketDLL;
// ���� HP_SSLAgent ����
function Create_HP_SSLAgent(pListener: HP_TcpAgentListener): HP_SSLAgent; stdcall; external HPSocketDLL;
// ���� HP_SSLClient ����
function Create_HP_SSLClient(pListener: HP_TcpClientListener): HP_SSLClient; stdcall; external HPSocketDLL;
// ���� HP_SSLPullServer ����
function Create_HP_SSLPullServer(pListener: HP_TcpPullServerListener): HP_SSLPullServer; stdcall; external HPSocketDLL;
// ���� HP_SSLPullAgent ����
function Create_HP_SSLPullAgent(pListener: HP_TcpPullAgentListener): HP_SSLPullAgent; stdcall; external HPSocketDLL;
// ���� HP_SSLPullClient ����
function Create_HP_SSLPullClient(pListener: HP_TcpPullClientListener): HP_SSLPullClient; stdcall; external HPSocketDLL;
// ���� HP_SSLPackServer ����
function Create_HP_SSLPackServer(pListener: HP_TcpServerListener): HP_SSLPackServer; stdcall; external HPSocketDLL;
// ���� HP_SSLPackAgent ����
function Create_HP_SSLPackAgent(pListener: HP_TcpAgentListener): HP_SSLPackAgent;  stdcall; external HPSocketDLL;
// ���� HP_SSLPackClient ����
function Create_HP_SSLPackClient(pListener: HP_TcpClientListener): HP_SSLPackClient;  stdcall; external HPSocketDLL;

// ���� HP_SSLServer ����
procedure Destroy_HP_SSLServer(pServer: HP_SSLServer); stdcall; external HPSocketDLL;
// ���� HP_SSLAgent ����
procedure Destroy_HP_SSLAgent(pAgent: HP_SSLAgent); stdcall; external HPSocketDLL;
// ���� HP_SSLClient ����
procedure Destroy_HP_SSLClient(pClient: HP_SSLClient); stdcall; external HPSocketDLL;
// ���� HP_SSLPullServer ����
procedure Destroy_HP_SSLPullServer(pServer: HP_SSLPullServer); stdcall; external HPSocketDLL;
// ���� HP_SSLPullAgent ����
procedure Destroy_HP_SSLPullAgent(pAgent: HP_SSLPullAgent); stdcall; external HPSocketDLL;
// ���� HP_SSLPullClient ����
procedure Destroy_HP_SSLPullClient(pClient: HP_SSLPullClient); stdcall; external HPSocketDLL;
// ���� HP_SSLPackServer ����
procedure Destroy_HP_SSLPackServer(pServer: HP_SSLPackServer); stdcall; external HPSocketDLL;
// ���� HP_SSLPackAgent ����
procedure Destroy_HP_SSLPackAgent(pAgent: HP_SSLPackAgent); stdcall; external HPSocketDLL;
// ���� HP_SSLPackClient ����
procedure Destroy_HP_SSLPackClient(pClient: HP_SSLPackClient); stdcall; external HPSocketDLL;

//*****************************************************************************************************************************************************/
//*************************************************************** Global Function Exports *************************************************************/
//*****************************************************************************************************************************************************/

//***************************************************************************************/
//************************************ SSL ��ʼ������ ************************************/

{
* ���ƣ������ֲ߳̾����� SSL ��Դ
* �������κ�һ������ SSL ���̣߳�ͨ�Ž���ʱ����Ҫ�����ֲ߳̾����� SSL ��Դ
*		1�����̺߳� HP-Socket �����߳���ͨ�Ž���ʱ���Զ������ֲ߳̾����� SSL ��Դ����ˣ�һ������²����ֹ����ñ�����
*		2����������£����Զ����̲߳��� HP-Socket ͨ�Ų�������鵽 SSL �ڴ�й©ʱ������ÿ��ͨ�Ž���ʱ�Զ����̵߳��ñ�����
*
* ������		dwThreadID	-- �߳� ID��0����ǰ�̣߳�
*
* ����ֵ����
}
procedure HP_SSL_RemoveThreadLocalState(dwThreadID: LongWord); stdcall; external HPSocketDLL;

{/*
* ���ƣ���ʼ��ͨ����� SSL ��������
* ������SSL �������������� SSL ͨ���������ǰ��ɳ�ʼ������������ʧ��
*
* ������		iVerifyMode				-- SSL ��֤ģʽ���ο� EnSSLVerifyMode��
*			lpszPemCertFile			-- ֤���ļ�
*			lpszPemKeyFile			-- ˽Կ�ļ�
*			lpszKeyPasswod			-- ˽Կ���루û��������Ϊ�գ�
*			lpszCAPemCertFileOrPath	-- CA ֤���ļ���Ŀ¼��������֤��ͻ��˿�ѡ��
*			fnServerNameCallback	-- SNI �ص�����ָ�루��ѡ��
*
* ����ֵ��	TRUE	-- �ɹ�
*			      FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡʧ��ԭ��
*/ }
function HP_SSLServer_SetupSSLContext(pServer: HP_SSLServer; iVerifyMode: integer = Integer(SSL_VM_NONE) ; //* SSL_VM_NONE */
    lpszPemCertFile: PChar=nil;            //* nullptr */
    lpszPemKeyFile: PChar=nil;             //* nullptr */
    lpszKeyPasswod: PChar=nil;            //* nullptr */
    lpszCAPemCertFileOrPath: PChar= nil;    //* nullptr */
    fnServerNameCallback: HP_Fn_SNI_ServerNameCallback = nil  //* nullptr */
  ): Bool; stdcall; external HPSocketDLL;

{/*
* ���ƣ����� SNI ����֤��
* ������SSL ������� SetupSSLContext() �ɹ�����Ե��ñ��������Ӷ�� SNI ����֤��
*
* ������		iVerifyMode				-- SSL ��֤ģʽ���ο� EnSSLVerifyMode��
*			lpszPemCertFile			-- ֤���ļ�
*			lpszPemKeyFile			-- ˽Կ�ļ�
*			lpszKeyPasswod			-- ˽Կ���루û��������Ϊ�գ�
*			lpszCAPemCertFileOrPath	-- CA ֤���ļ���Ŀ¼��������֤��ѡ��
*
* ����ֵ��	����		-- �ɹ��������� SNI ����֤���Ӧ�������������������� SNI �ص������ж�λ SNI ����
*			      ����		-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡʧ��ԭ��
*/}
function HP_SSLServer_AddSSLContext(pServer: HP_SSLServer; iVerifyMode: LongWord; lpszPemCertFile: PChar;
        lpszPemKeyFile: PChar;
        lpszKeyPasswod: PChar; //* nullptr */,
        lpszCAPemCertFileOrPath: PChar //* nullptr */
  ): Integer; stdcall; external HPSocketDLL;

{/*
* ���ƣ�����ͨ����� SSL ���л���
* ����������ͨ����� SSL ���л��������� SSL ����ڴ�
*		1��ͨ���������ʱ���Զ����ñ�����
*		2����Ҫ��������ͨ����� SSL ��������ʱ����Ҫ�ȵ��ñ���������ԭ�ȵĻ�������
*
* ������	��
*
* ����ֵ����
*/}
procedure HP_SSLServer_CleanupSSLContext(pServer: HP_SSLServer); stdcall; external HPSocketDLL;

{/*
* ���ƣ���ʼ��ͨ����� SSL ��������
* ������SSL �������������� SSL ͨ���������ǰ��ɳ�ʼ������������ʧ��
*
* ������		iVerifyMode				-- SSL ��֤ģʽ���ο� EnSSLVerifyMode��
*			lpszPemCertFile			-- ֤���ļ����ͻ��˿�ѡ��
*			lpszPemKeyFile			-- ˽Կ�ļ����ͻ��˿�ѡ��
*			lpszKeyPasswod			-- ˽Կ���루û��������Ϊ�գ�
*			lpszCAPemCertFileOrPath	-- CA ֤���ļ���Ŀ¼��������֤��ͻ��˿�ѡ��
*
* ����ֵ��	TRUE	-- �ɹ�
*			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡʧ��ԭ��
*/}
function HP_SSLAgent_SetupSSLContext(pAgent: HP_SSLAgent; iVerifyMode: LongWord; //* SSL_VM_NONE */,
      lpszPemCertFile: PChar;          //* nullptr */,
      lpszPemKeyFile: PChar;           //* nullptr */,
      lpszKeyPasswod: PChar;           //* nullptr */,
      lpszCAPemCertFileOrPath: PChar   //* nullptr */
   ): Bool; stdcall; external HPSocketDLL;

{/*
* ���ƣ�����ͨ����� SSL ���л���
* ����������ͨ����� SSL ���л��������� SSL ����ڴ�
*		1��ͨ���������ʱ���Զ����ñ�����
*		2����Ҫ��������ͨ����� SSL ��������ʱ����Ҫ�ȵ��ñ���������ԭ�ȵĻ�������
*
* ������	��
*
* ����ֵ����
*/ }
procedure HP_SSLAgent_CleanupSSLContext(pAgent: HP_SSLAgent); stdcall; external HPSocketDLL;

{/*
* ���ƣ���ʼ��ͨ����� SSL ��������
* ������SSL �������������� SSL ͨ���������ǰ��ɳ�ʼ������������ʧ��
*
* ������		iVerifyMode				-- SSL ��֤ģʽ���ο� EnSSLVerifyMode��
*			lpszPemCertFile			-- ֤���ļ����ͻ��˿�ѡ��
*			lpszPemKeyFile			-- ˽Կ�ļ����ͻ��˿�ѡ��
*			lpszKeyPasswod			-- ˽Կ���루û��������Ϊ�գ�
*			lpszCAPemCertFileOrPath	-- CA ֤���ļ���Ŀ¼��������֤��ͻ��˿�ѡ��
*
* ����ֵ��	TRUE	-- �ɹ�
*			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡʧ��ԭ��
*/}
function HP_SSLClient_SetupSSLContext(pClient: HP_SSLClient;iVerifyMode: LongWord; //* SSL_VM_NONE */,
     lpszPemCertFile: PChar;         //* nullptr */,
     lpszPemKeyFile: PChar;          //* nullptr */,
     lpszKeyPasswod: PChar;          //* nullptr */,
     lpszCAPemCertFileOrPath: PChar  //* nullptr */
  ): Bool; stdcall; external HPSocketDLL;

{/*
* ���ƣ�����ͨ����� SSL ���л���
* ����������ͨ����� SSL ���л��������� SSL ����ڴ�
*		1��ͨ���������ʱ���Զ����ñ�����
*		2����Ҫ��������ͨ����� SSL ��������ʱ����Ҫ�ȵ��ñ���������ԭ�ȵĻ�������
*
* ������	��
*
* ����ֵ����
*/}
procedure HP_SSLClient_CleanupSSLContext(pClient: HP_SSLClient); stdcall; external HPSocketDLL;

{/***************************************************************************************/
/************************************* SSL �������� ************************************/}

{/*
* ���ƣ����� SSL ����
* ��������ͨ���������Ϊ���Զ�����ʱ����Ҫ���ñ��������� SSL ����
*
* ����ֵ��	TRUE	-- �ɹ�
*			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡʧ��ԭ��
*/}
function HP_SSLServer_StartSSLHandShake(pServer: HP_SSLServer; dwConnID: HP_CONNID): BOOL; stdcall; external HPSocketDLL;

//* ����ͨ��������ַ�ʽ��Ĭ�ϣ�TRUE���Զ����֣� */
procedure HP_SSLServer_SetSSLAutoHandShake(pServer: HP_SSLServer;bAutoHandShake: BOOL); stdcall; external HPSocketDLL;
//* ��ȡͨ��������ַ�ʽ */
function HP_SSLServer_IsSSLAutoHandShake(pServer: HP_SSLServer ): BOOL; stdcall; external HPSocketDLL;

{/*
* ���ƣ����� SSL ����
* ��������ͨ���������Ϊ���Զ�����ʱ����Ҫ���ñ��������� SSL ����
*
* ����ֵ��	TRUE	-- �ɹ�
*			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡʧ��ԭ��
*/}
function HP_SSLAgent_StartSSLHandShake(pAgent: HP_SSLAgent; dwConnID: HP_CONNID): BOOL; stdcall; external HPSocketDLL;

//* ����ͨ��������ַ�ʽ��Ĭ�ϣ�TRUE���Զ����֣� */
procedure HP_SSLAgent_SetSSLAutoHandShake(pAgent: HP_SSLAgent; bAutoHandShake: BOOL); stdcall; external HPSocketDLL;
//* ��ȡͨ��������ַ�ʽ */
function HP_SSLAgent_IsSSLAutoHandShake(pAgent: HP_SSLAgent ): BOOL; stdcall; external HPSocketDLL;

{/*
* ���ƣ����� SSL ����
* ��������ͨ���������Ϊ���Զ�����ʱ����Ҫ���ñ��������� SSL ����
*
* ����ֵ��	TRUE	-- �ɹ�
*			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡʧ��ԭ��
*/}
function HP_SSLClient_StartSSLHandShake(pClient: HP_SSLClient): BOOL; stdcall; external HPSocketDLL;

//* ����ͨ��������ַ�ʽ��Ĭ�ϣ�TRUE���Զ����֣� */
procedure HP_SSLClient_SetSSLAutoHandShake(pClient: HP_SSLClient; bAutoHandShake: BOOL); stdcall; external HPSocketDLL;
//* ��ȡͨ��������ַ�ʽ */
function HP_SSLClient_IsSSLAutoHandShake(pClient: HP_SSLClient): BOOL; stdcall; external HPSocketDLL;

{/*****************************************************************************************************************************************************/
/******************************************************************** HTTPS Exports ******************************************************************/
/*****************************************************************************************************************************************************/

#ifdef _HTTP_SUPPORT
 }
{/****************************************************/
/**************** HTTPS ���󴴽����� *****************/}

// ���� HP_HttpsServer ����
function Create_HP_HttpsServer(pListener: HP_HttpServerListener): HP_HttpsServer; stdcall; external HPSocketDLL;
// ���� HP_HttpsAgent ����
function Create_HP_HttpsAgent(pListener: HP_HttpAgentListener): HP_HttpsAgent; stdcall; external HPSocketDLL;
// ���� HP_HttpsClient ����
function Create_HP_HttpsClient(pListener: HP_HttpClientListener): HP_HttpsClient; stdcall; external HPSocketDLL;
// ���� HP_HttpsSyncClient ����
function Create_HP_HttpsSyncClient(pListener: HP_HttpClientListener): HP_HttpsSyncClient; stdcall; external HPSocketDLL;

// ���� HP_HttpsServer ����
procedure Destroy_HP_HttpsServer(pServer: HP_HttpsServer); stdcall; external HPSocketDLL;
// ���� HP_HttpsAgent ����
procedure Destroy_HP_HttpsAgent(pAgent: HP_HttpsAgent); stdcall; external HPSocketDLL;
// ���� HP_HttpsClient ����
procedure Destroy_HP_HttpsClient(pClient: HP_HttpsClient); stdcall; external HPSocketDLL;
// ���� HP_HttpsSyncClient ����
procedure Destroy_HP_HttpsSyncClient(pClient: HP_HttpsSyncClient); stdcall; external HPSocketDLL;

implementation

initialization
  IsMultiThread := True;

end.


