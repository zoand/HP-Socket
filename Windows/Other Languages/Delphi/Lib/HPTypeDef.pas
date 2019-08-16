unit HPTypeDef;

interface

uses
  Winapi.Windows;

const
  HPSocketDLL = 'HPSocket4C_U.dll';

  HP_VERSION_MAJOR=	5;	// ���汾��
  HP_VERSION_MINOR=5;	// �Ӱ汾��
  HP_VERSION_REVISE=1;	// �����汾��
  HP_VERSION_BUILD=5;	// �������

{/*****************************************************************************************************************************************************/
/**************************************************************** Base Type Definitions **************************************************************/
/*****************************************************************************************************************************************************/}

type
  {$Z4}

  { /************************************************************************
    ���ƣ����� ID ��������
    �������������� ID ����������
    ************************************************************************/ }
  CONNID  = PLongWord;
  HP_CONNID = PLongWord;
  HP_CONNIDArray = array of HP_CONNID; { TODO : ����������������ȡ��������id }
  
  {TODO:/************************************************************************
    ���ƣ�ͨ���������״̬
    ������Ӧ�ó������ͨ��ͨ������� GetState() ������ȡ�����ǰ����״̬
    ************************************************************************ }
  En_HP_ServiceState = (
    SS_STARTING  = 0,    // ��������
    SS_STARTED   = 1,    // �Ѿ�����
    SS_STOPPING  = 2,    // ����ֹͣ
    SS_STOPPED   = 3     // �Ѿ�ֹͣ
  );

  { TODO:************************************************************************
    ���ƣ�Socket ��������
    ������Ӧ�ó���� OnClose() �¼���ͨ���ò�����ʶ�����ֲ������µĴ���
    ************************************************************************ }
  En_HP_SocketOperation = (
    SO_UNKNOWN = 0,  // Unknown
    SO_ACCEPT  = 1,  // Acccept
    SO_CONNECT = 2,  // Connnect
    SO_SEND    = 3,  // Send
    SO_RECEIVE = 4,  // Receive
    SO_CLOSE	 = 5   // Close
  );

  {TODO: ************************************************************************
    ���ƣ��¼�֪ͨ������
    �������¼�֪ͨ�ķ���ֵ����ͬ�ķ���ֵ��Ӱ��ͨ������ĺ�����Ϊ
    ************************************************************************ }
  En_HP_HandleResult = (
    HR_OK     = 0, // �ɹ�����
    HR_IGNORE = 1, // ���Դ���
    HR_ERROR  = 2  // ������
  );

  { TODO:/************************************************************************
    ���ƣ�����ץȡ���
    ����������ץȡ�����ķ���ֵ
    ************************************************************************/ }
  En_HP_FetchResult = (
    FR_OK               = 0,  // �ɹ�
    FR_LENGTH_TOO_LONG  = 1,  // ץȡ���ȹ���
    FR_DATA_NOT_FOUND   = 2   // �Ҳ��� ConnID ��Ӧ������
  );

  { TODO:/************************************************************************
    ���ƣ����ݷ��Ͳ���
    ������Server ����� Agent ��������ݷ��Ͳ���

    * ���ģʽ��Ĭ�ϣ�	�������Ѷ�����Ͳ��������������һ���ͣ����Ӵ���Ч��
    * ��ȫģʽ			    �������Ѷ�����Ͳ��������������һ���ͣ������ƴ����ٶȣ����⻺�������
    * ֱ��ģʽ			    ����ÿһ�����Ͳ�����ֱ��Ͷ�ݣ������ڸ��ز��ߵ�Ҫ��ʵʱ�Խϸߵĳ���
    ************************************************************************/ }
  En_HP_SendPolicy = (
    SP_PACK    = 0, // ���ģʽ��Ĭ�ϣ�
    SP_SAFE    = 1, // ��ȫģʽ
    SP_DIRECT  = 2 // ֱ��ģʽ
  );

  {************************************************************************
   ���ƣ�OnSend �¼�ͬ������
   ������Server ����� Agent ����� OnSend �¼�ͬ������

   * ��ͬ����Ĭ�ϣ�	����ͬ�� OnSend �¼�������ͬʱ���� OnReceive �� OnClose �¼�
   * ͬ�� OnClose	��ֻͬ�� OnClose �¼�������ͬʱ���� OnReceive �¼�
   * ͬ�� OnReceive	����ֻ���� TCP �����ͬ�� OnReceive �� OnClose �¼���������ͬʱ���� OnReceive �� OnClose �¼�
   ************************************************************************}
  En_HP_OnSendSyncPolicy = (
	  OSSP_NONE			  = 0,	// ��ͬ����Ĭ�ϣ�
	  OSSP_CLOSE			= 1,	// ͬ�� OnClose
	  OSSP_RECEIVE		= 2	  // ͬ�� OnReceive��ֻ���� TCP �����
  );

  { TODO:************************************************************************
    ���ƣ������������
    ������Start() / Stop() ����ִ��ʧ��ʱ����ͨ�� GetLastError() ��ȡ�������
    ************************************************************************ }
  En_HP_SocketError = (
    SE_OK                     = 0, // �ɹ�
    SE_ILLEGAL_STATE          = 1, // ��ǰ״̬���������
    SE_INVALID_PARAM          = 2, // �Ƿ�����
    SE_SOCKET_CREATE          = 3, // ���� SOCKET ʧ��
    SE_SOCKET_BIND            = 4, // �� SOCKET ʧ��
    SE_SOCKET_PREPARE         = 5, // ���� SOCKET ʧ��
    SE_SOCKET_LISTEN          = 6, // ���� SOCKET ʧ��
    SE_CP_CREATE              = 7, // ������ɶ˿�ʧ��
    SE_WORKER_THREAD_CREATE   = 8, // ���������߳�ʧ��
    SE_DETECT_THREAD_CREATE   = 9, // ��������߳�ʧ��
    SE_SOCKE_ATTACH_TO_CP     = 10, // ����ɶ˿�ʧ��
    SE_CONNECT_SERVER         = 11, // ���ӷ�����ʧ��
    SE_NETWORK                = 12, // �������
    SE_DATA_PROC              = 13, // ���ݴ������
    SE_DATA_SEND              = 14, // ���ݷ���ʧ��

    //***** SSL Socket ��չ����������� *****/
    SE_SSL_ENV_NOT_READY      = 101     // SSL ����δ����
  );

  {TODO:/************************************************************************
  ���ƣ�����ģʽ
  ������UDP ����Ĳ���ģʽ���鲥��㲥��
  ************************************************************************/}
  En_HP_CastMode = (
    CM_MULTICAST = 0, // �鲥
    CM_BROADCAST = 1  // �㲥
  );

  {************************************************************************
      ���ƣ�IP ��ַ����
      ������IP ��ַ����ö��ֵ
  ************************************************************************/}
  En_HP_IPAddrType =
  (
    IPT_ALL		= 0,		// ����
    IPT_IPV4	= 1,		// IPv4
    IPT_IPV6	= 2		  // IPv6
  );


  {/************************************************************************
  ���ƣ�IP ��ַ��Ŀ�ṹ��
  ������IP ��ַ�ĵ�ַ��/��ֵַ�ṹ��
  ************************************************************************/}
  HP_TIPAddr = packed record
    Ftype: En_HP_IPAddrType;
    address: pAnsiChar;
  end;

  LPTIPAddr= ^HP_TIPAddr;
  HP_LPTIPAddr= LPTIPAddr;

  {/************************************************************************
    ���ƣ��ܾ�����
    ���������ñ��ܾ���Ĵ������
   ************************************************************************/}
  En_HP_RejectedPolicy = (
    TRP_CALL_FAIL	= 0,	// ���̷���ʧ��
    TRP_WAIT_FOR	= 1,	// �ȴ���ֱ���ɹ�����ʱ���̳߳عرյ�ԭ����ʧ�ܣ�
    TRP_CALLER_RUN	= 2	// �������߳�ֱ��ִ��
  );

  {/************************************************************************
   ���ƣ����񻺳�������
   ������TSockeTask ���󴴽�������ʱ�����ݲ�ͬ���͵Ļ�������������ͬ�Ĵ���
   ************************************************************************/}
  En_HP_TaskBufferType = (
	  TBT_COPY		= 0,	// ���
	  TBT_REFER		= 1,	// ǳ����
	  TBT_ATTACH		= 2	// ���ӣ������𴴽������������٣�
  );

  {/************************************************************************
    ���ƣ���������
    ��������������ں���
    ������pvArg -- �Զ������
    ����ֵ�����ޣ�
    ************************************************************************/}
    //typedef VOID (CALLBACK *Fn_TaskProc)(PVOID pvArg);
    //typedef Fn_TaskProc	HP_Fn_TaskProc;

  Fn_TaskProc  =procedure(pvArg: pointer);  stdcall;
  HP_Fn_TaskProc = Fn_TaskProc;

  LPTSocketTask = ^TSocketTask;

  {/************************************************************************
    ���ƣ�Socket ��������
    ������Socket ��������ں���
    ������pTask -- Socket ����ṹ��ָ��
    ����ֵ�����ޣ�
    ************************************************************************/}
  //typedef VOID (CALLBACK *Fn_SocketTaskProc)(TSocketTask* pTask);
  //typedef Fn_SocketTaskProc	HP_Fn_SocketTaskProc;
  Fn_SocketTaskProc  = procedure(pTask: LPTSocketTask);  stdcall;
  HP_Fn_SocketTaskProc = Fn_SocketTaskProc;


  {/************************************************************************
    ���ƣ�Socket ����ṹ��
    ��������װ Socket ����������ݽṹ
    ************************************************************************/}
  TSocketTask = record
  	fn: Fn_SocketTaskProc;			// ��������
	  sender: pointer	;		// �������
	  connID: CONNID;		// ���� ID
	  buf: PByte;		// ���ݻ�����
	  bufLen: Integer;		// ���ݻ���������
	  bufType: En_HP_TaskBufferType;	// ����������
	  wparam: WPARAM;		// �Զ������
	  lparam: LPARAM;		// �Զ������
  end;
  HP_TSocketTask = TSocketTask;
  HP_LPTSocketTask=  ^HP_TSocketTask;

  {/************************************************************************
  ���ƣ�SSL ����ģʽ
  ��������ʶ SSL �Ĺ���ģʽ���ͻ���ģʽ������ģʽ
  ************************************************************************/}
  En_HP_SSLSessionMode   =
  (
    SSL_SM_CLIENT	= 0,	// �ͻ���ģʽ
    SSL_SM_SERVER	= 1	  // �����ģʽ
  );

  {/************************************************************************
  ���ƣ�SSL ��֤ģʽ
  ������SSL ��֤ģʽѡ�SSL_VM_PEER ���Ժͺ�������ѡ�����һ��
  ************************************************************************/}
  En_HP_SSLVerifyMode =
  (
    SSL_VM_NONE					        = $00,	// SSL_VERIFY_NONE
    SSL_VM_PEER					        = $01,	// SSL_VERIFY_PEER
    SSL_VM_FAIL_IF_NO_PEER_CERT	= $02,	// SSL_VERIFY_FAIL_IF_NO_PEER_CERT
    SSL_VM_CLIENT_ONCE			    = $04	  // SSL_VERIFY_CLIENT_ONCE
  );

{/************************************************************************
���ƣ�SNI �������ƻص�����
���������ݷ���������ѡ�� SSL ֤��
������
		lpszServerName -- ���������ƣ�������
����ֵ��
		0	 -- �ɹ���ʹ��Ĭ�� SSL ֤��
		����	 -- �ɹ���ʹ�÷���ֵ��Ӧ�� SNI ����֤��
		����	 -- ʧ�ܣ��ж� SSL ����

************************************************************************/}
  Fn_SNI_ServerNameCallback  =function(lpszServerName: PChar): Integer;  stdcall;
  HP_Fn_SNI_ServerNameCallback = Fn_SNI_ServerNameCallback;


{/************************************************************************
���ƣ�HTTP �汾
���������ֽڣ����汾�ţ����ֽڣ��ΰ汾��
************************************************************************/}
  En_HP_HttpVersion = (
    HV_1_0 = 1,
    HV_1_1 = 257
  );

{/************************************************************************
���ƣ�URL ��
������HTTP �������� URL ��λ������
************************************************************************/ }
  En_HP_HttpUrlField = (
    HUF_SCHEMA		= 0,	// Schema
    HUF_HOST		  = 1,	// Host
    HUF_PORT		  = 2,	// Port
    HUF_PATH		  = 3,	// Path
    HUF_QUERY		  = 4,	// Query String
    HUF_FRAGMENT	= 5,	// Fragment
    HUF_USERINFO	= 6,	// User Info
    HUF_MAX			  = 7	  // (Field Count)
  );

{/************************************************************************
���ƣ�HTTP ���������ʶ
������ָʾ HTTP �������Ƿ����ִ�н�������
************************************************************************/}
  En_HP_HttpParseResult = (

    HPR_OK	      = 0,			// ��������
    HPR_SKIP_BODY	= 1,	    // ������ǰ���� BODY�������� OnHeadersComplete �¼���
    HPR_UPGRADE		= 2,	    // ����Э�飨������ OnHeadersComplete �¼���
    HPR_ERROR		  = -1	    // ��ֹ�������Ͽ�����
  );

{/************************************************************************
���ƣ�HTTP Э����������
��������ʶ HTTP ����Ϊ����Э��
************************************************************************/ }
  En_HP_HttpUpgradeType = (

    HUT_NONE		    = 0,	// û������
    HUT_WEB_SOCKET	= 1,	// WebSocket
    HUT_HTTP_TUNNEL	= 2,	// HTTP ���
    HUT_UNKNOWN		  = -1	// δ֪����
  );

{/************************************************************************
���ƣ�HTTP ״̬��
������HTTP ��׼״̬��
************************************************************************/}
  En_HP_HttpStatusCode = (

    HSC_CONTINUE						            = 100,
    HSC_SWITCHING_PROTOCOLS				      = 101,
    HSC_PROCESSING						          = 102,

    HSC_OK								              = 200,
    HSC_CREATED							            = 201,
    HSC_ACCEPTED						            = 202,
    HSC_NON_AUTHORITATIVE_INFORMATION	  = 203,
    HSC_NO_CONTENT						          = 204,
    HSC_RESET_CONTENT					          = 205,
    HSC_PARTIAL_CONTENT					        = 206,
    HSC_MULTI_STATUS				            = 207,
    HSC_ALREADY_REPORTED				        = 208,
    HSC_IM_USED							            = 226,

    HSC_MULTIPLE_CHOICES				        = 300,
    HSC_MOVED_PERMANENTLY				        = 301,
    HSC_MOVED_TEMPORARILY				        = 302,
    HSC_SEE_OTHER						            = 303,
    HSC_NOT_MODIFIED					          = 304,
    HSC_USE_PROXY						            = 305,
    HSC_SWITCH_PROXY					          = 306,
    HSC_TEMPORARY_REDIRECT				      = 307,
    HSC_PERMANENT_REDIRECT				      = 308,

    HSC_BAD_REQUEST						          = 400,
    HSC_UNAUTHORIZED					          = 401,
    HSC_PAYMENT_REQUIRED				        = 402,
    HSC_FORBIDDEN						            = 403,
    HSC_NOT_FOUND						            = 404,
    HSC_METHOD_NOT_ALLOWED				      = 405,
    HSC_NOT_ACCEPTABLE					        = 406,
    HSC_PROXY_AUTHENTICATION_REQUIRED	  = 407,
    HSC_REQUEST_TIMEOUT					        = 408,
    HSC_CONFLICT						            = 409,
    HSC_GONE							              = 410,
    HSC_LENGTH_REQUIRED					        = 411,
    HSC_PRECONDITION_FAILED				      = 412,
    HSC_REQUEST_ENTITY_TOO_LARGE		    = 413,
    HSC_REQUEST_URI_TOO_LONG			      = 414,
    HSC_UNSUPPORTED_MEDIA_TYPE			    = 415,
    HSC_REQUESTED_RANGE_NOT_SATISFIABLE	= 416,
    HSC_EXPECTATION_FAILED				      = 417,
    HSC_MISDIRECTED_REQUEST				      = 421,
    HSC_UNPROCESSABLE_ENTITY			      = 422,
    HSC_LOCKED							            = 423,
    HSC_FAILED_DEPENDENCY				        = 424,
    HSC_UNORDERED_COLLECTION			      = 425,
    HSC_UPGRADE_REQUIRED				        = 426,
    HSC_PRECONDITION_REQUIRED			      = 428,
    HSC_TOO_MANY_REQUESTS				        = 429,
    HSC_REQUEST_HEADER_FIELDS_TOO_LARGE	= 431,
    HSC_UNAVAILABLE_FOR_LEGAL_REASONS	  = 451,
    HSC_RETRY_WITH						          = 449,

    HSC_INTERNAL_SERVER_ERROR			      = 500,
    HSC_NOT_IMPLEMENTED					        = 501,
    HSC_BAD_GATEWAY						          = 502,
    HSC_SERVICE_UNAVAILABLE				      = 503,
    HSC_GATEWAY_TIMEOUT					        = 504,
    HSC_HTTP_VERSION_NOT_SUPPORTED		  = 505,
    HSC_VARIANT_ALSO_NEGOTIATES			    = 506,
    HSC_INSUFFICIENT_STORAGE			      = 507,
    HSC_LOOP_DETECTED					          = 508,
    HSC_BANDWIDTH_LIMIT_EXCEEDED		    = 509,
    HSC_NOT_EXTENDED					          = 510,
    HSC_NETWORK_AUTHENTICATION_REQUIRED	= 511,

    HSC_UNPARSEABLE_RESPONSE_HEADERS	  = 600
  );

{/************************************************************************
���ƣ�Name/Value �ṹ��
�������ַ�����ֵ�Խṹ��
************************************************************************/}
  //WSABUF = Record
  //  name: PAnsiChar; { the length of the buffer }
  //  value: PAnsiChar; { the pointer to the buffer }
 // end { WSABUF };
  //TNVPair = array of WSABUF;

  TNVPair = record
	  name:  pAnsichar;
	  value: pAnsichar;
  end;

  HP_TNVPair= TNVPair;

  LPPARAM=    ^TParam;
  TParam = TNVPair;
	HP_LPPARAM= ^HP_TParam;
  HP_TParam=  TNVPair;

  LPHEADER=     ^THeader;
  THeader =  TNVPair;
  HP_LPHEADER = ^HP_THeader;
  HP_THeader=   THeader;

  LPCOOKIE=   ^TCookie;
  TCookie =  TNVPair;
  HP_LPCOOKIE = ^HP_TCookie;
  HP_TCookie=   TCookie;



  HP_THeaderAry = array of HP_THeader;


  HP_TCookieAry= array of HP_TCookie;

{/************************************************************************
���ƣ���ȡ HPSocket �汾��
�������汾�ţ�4 ���ֽڷֱ�Ϊ�����汾�ţ��Ӱ汾�ţ������汾�ţ�������ţ�
************************************************************************/}
function GetHPSocketVersion(): int64;

implementation

{/************************************************************************
���ƣ���ȡ HPSocket �汾��
�������汾�ţ�4 ���ֽڷֱ�Ϊ�����汾�ţ��Ӱ汾�ţ������汾�ţ�������ţ�
************************************************************************/}
function GetHPSocketVersion(): int64;
begin
	result:= (HP_VERSION_MAJOR shl 24) or
           (HP_VERSION_MINOR shl 16) or
           (HP_VERSION_REVISE shl 8) or
           HP_VERSION_BUILD;
end;

end.
