/*
 * Copyright: JessMA Open Source (ldcsaa@gmail.com)
 *
 * Author	: Bruce Liang
 * Website	: http://www.jessma.org
 * Project	: https://github.com/ldcsaa
 * Blog		: http://www.cnblogs.com/ldcsaa
 * Wiki		: http://www.oschina.net/p/hp-socket
 * QQ Group	: 75375912, 44636872
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

typedef DWORD							TID, THR_ID, NTHR_ID, PID, PRO_ID;

/* ������߳��� */
#define MAX_WORKER_THREAD_COUNT			500
/* Ĭ�϶��󻺴��������ʱ�� */
#define DEFAULT_OBJECT_CACHE_LOCK_TIME	(20 * 1000)
/* Ĭ�϶��󻺴�ش�С */
#define DEFAULT_OBJECT_CACHE_POOL_SIZE	600
/* Ĭ�϶��󻺴�ػ��շ�ֵ */
#define DEFAULT_OBJECT_CACHE_POOL_HOLD	600
/* Ĭ���ڴ�黺������ */
#define DEFAULT_BUFFER_CACHE_CAPACITY	4096
/* Ĭ���ڴ�黺��ش�С */
#define DEFAULT_BUFFER_CACHE_POOL_SIZE	1024
/* Ĭ���ڴ�黺��ػ��շ�ֵ */
#define DEFAULT_BUFFER_CACHE_POOL_HOLD	1024

#define SYS_PAGE_SIZE					(GetSysPageSize())
#define DEFAULT_WORKER_THREAD_COUNT		(GetDefaultWorkerThreadCount())
#define SELF_PROCESS_ID					(::GetCurrentProcessId())
#define SELF_THREAD_ID					(::GetCurrentThreadId())
#define IsSameThread(tid1, tid2)		((tid1) == (tid2))
#define IsSelfThread(tid)				IsSameThread((tid), SELF_THREAD_ID)
#define IsSameProcess(pid1, pid2)		((pid1) == (pid2))
#define IsSelfProcess(pid)				IsSameProcess((pid), SELF_PROCESS_ID)

DWORD GetSysPageSize();
DWORD GetDefaultWorkerThreadCount();

// ��ȡϵͳ��Ϣ
VOID SysGetSystemInfo(LPSYSTEM_INFO pInfo);
// ��ȡ CPU ����
DWORD SysGetNumberOfProcessors();
// ��ȡҳ���С
DWORD SysGetPageSize();
