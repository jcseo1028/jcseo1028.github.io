---
layout: posts
comments: true
title : "FASTech Ezi-Servo plusR Motion Library(C++) 를 C# 에서 사용하기"
categories: Development
tags: [FASTech, DLLImport, C#]
published: false
---

### 기본적인 C# 에서 C++ Library 불러오기.

기본적으로 C# DLL 은 지원하지 않는다고 한다.

[홈페이지 Q/A 내용]('https://www.fastech.co.kr/new/board/bbs/board.php?bo_table=sub0501&wr_id=1025')

[MSDN 참고내용]('https://docs.microsoft.com/en-us/archive/msdn-magazine/2003/july/net-column-calling-win32-dlls-in-csharp-with-p-invoke')

### Connect 관련

```cpp
EZI_PLUSR_API BOOL WINAPI	FAS_Connect(BYTE nPortNo, DWORD dwBaud);
EZI_PLUSR_API BOOL WINAPI	FAS_OpenPort(BYTE nPortNo, DWORD dwBaud);
EZI_PLUSR_API BOOL WINAPI	FAS_AttachSlave(BYTE nPortNo, BYTE iSlaveNo);
EZI_PLUSR_API void WINAPI	FAS_Close(BYTE nPortNo);
EZI_PLUSR_API BOOL WINAPI	FAS_IsSlaveExist(BYTE nPortNo, BYTE iSlaveNo);
```

```csharp
[DllImport("EziMOTIONPlusRx64.dll")] static extern Boolean  FAS_Connect(Byte nPortNo, UInt32 dwBaud);
[DllImport("EziMOTIONPlusRx64.dll")] static extern Boolean  FAS_OpenPort(Byte nPortNo, UInt32 dwBaud);
[DllImport("EziMOTIONPlusRx64.dll")] static extern Boolean  FAS_AttachSlave(Byte nPortNo, Byte nSlaveNo);
[DllImport("EziMOTIONPlusRx64.dll")] static extern void     FAS_Close(Byte nPortNo);
[DllImport("EziMOTIONPlusRx64.dll")] static extern Boolean  FAS_IsSlaveExist(Byte nPortNo, Byte iSlaveNo);
```

### 구조체(Union) 를 C# 으로 Wrapping 하기

이건 좀 어렵다.. 고민 좀 해봐야할 듯.

```cpp
typedef union
{
	DWORD	dwValue;
	struct
	{
		unsigned	FFLAG_ERRORALL			: 1; // = 0x00000001;
		unsigned	FFLAG_HWPOSILMT			: 1; // = 0x00000002;
		unsigned	FFLAG_HWNEGALMT			: 1; // = 0x00000004;
		unsigned	FFLAG_SWPOGILMT			: 1; // = 0x00000008;
		unsigned	FFLAG_SWNEGALMT			: 1; // = 0x00000010;
		unsigned	FFLAG_RESERVED0			: 1; // = 0x00000020;
		unsigned	FFLAG_RESERVED1			: 1; // = 0x00000040;
		unsigned	FFLAG_ERRPOSOVERFLOW	: 1; // = 0x00000080;
		unsigned	FFLAG_ERROVERCURRENT	: 1; // = 0x00000100;
		unsigned	FFLAG_ERROVERSPEED		: 1; // = 0x00000200;
		unsigned	FFLAG_ERRPOSTRACKING	: 1; // = 0x00000400;
		unsigned	FFLAG_ERROVERLOAD		: 1; // = 0x00000800;
		unsigned	FFLAG_ERROVERHEAT		: 1; // = 0x00001000;
		unsigned	FFLAG_ERRBACKEMF		: 1; // = 0x00002000;
		unsigned	FFLAG_ERRMOTORPOWER		: 1; // = 0x00004000;
		unsigned	FFLAG_ERRINPOSITION		: 1; // = 0x00008000;
		unsigned	FFLAG_EMGSTOP			: 1; // = 0x00010000;
		unsigned	FFLAG_SLOWSTOP			: 1; // = 0x00020000;
		unsigned	FFLAG_ORIGINRETURNING	: 1; // = 0x00040000;
		unsigned	FFLAG_INPOSITION		: 1; // = 0x00080000;
		unsigned	FFLAG_SERVOON			: 1; // = 0x00100000;
		unsigned	FFLAG_ALARMRESET		: 1; // = 0x00200000;
		unsigned	FFLAG_PTSTOPPED			: 1; // = 0x00400000;
		unsigned	FFLAG_ORIGINSENSOR		: 1; // = 0x00800000;
		unsigned	FFLAG_ZPULSE			: 1; // = 0x01000000;
		unsigned	FFLAG_ORIGINRETOK		: 1; // = 0x02000000;
		unsigned	FFLAG_MOTIONDIR			: 1; // = 0x04000000;
		unsigned	FFLAG_MOTIONING			: 1; // = 0x08000000;
		unsigned	FFLAG_MOTIONPAUSE		: 1; // = 0x10000000;
		unsigned	FFLAG_MOTIONACCEL		: 1; // = 0x20000000;
		unsigned	FFLAG_MOTIONDECEL		: 1; // = 0x40000000;
		unsigned	FFLAG_MOTIONCONST		: 1; // = 0x80000000;
	};
} EZISERVO_AXISSTATUS;
```

Unit BitField 를 받는 방법 ? 
32bit 로 각자 데이터를 받아야 하는데??

```csharp
[Flags]
public enum EZSERVO_AXISSTATUS : int
{
    None = 0,
    FFLAG_ERRORALL =        1,
    FFLAG_HWPOSILMT =       1 << 1,
    FFLAG_HWNEGALMT =       1 << 2,
    FFLAG_SWPOGILMT =       1 << 3,
    FFLAG_SWNEGALMT =       1 << 4,
    FFLAG_RESERVED0 =       1 << 5,
    FFLAG_RESERVED1 =       1 << 6,
    FFLAG_ERRPOSOVERFLOW =  1 << 7,
    FFLAG_ERROVERCURRENT =  1 << 8,
    FFLAG_ERROVERSPEED =    1 << 9,
    FFLAG_ERRPOSTRACKING =  1 << 10,
    FFLAG_ERROVERLOAD =     1 << 11,
    FFLAG_ERROVERHEAT =     1 << 12,
    FFLAG_ERRBACKEMF =      1 << 13,
    FFLAG_ERRMOTORPOWER =   1 << 14,
    FFLAG_ERRINPOSITION =   1 << 15,
    FFLAG_EMGSTOP =         1 << 16,
    FFLAG_SLOWSTOP =        1 << 17,
    FFLAG_ORIGINRETURNING = 1 << 18,
    FFLAG_INPOSITION =      1 << 19,
    FFLAG_SERVOON =         1 << 20,
    FFLAG_ALARMRESET =      1 << 21,
    FFLAG_PTSTOPPED =       1 << 22,
    FFLAG_ORIGINSENSOR =    1 << 23,
    FFLAG_ZPULSE =          1 << 24,
    FFLAG_ORIGINRETOK =     1 << 25,
    FFLAG_MOTIONDIR =       1 << 26,
    FFLAG_MOTIONING =       1 << 27,
    FFLAG_MOTIONPAUSE =     1 << 28,
    FFLAG_MOTIONACCEL =     1 << 29,
    FFLAG_MOTIONDECEL =     1 << 30,
    FFLAG_MOTIONCONST =     1 << 31
}

EZSERVO_AXISSTATUS status;            
status = EZSERVO_AXISSTATUS.FFLAG_EMGSTOP;
Console.WriteLine("{0:X}, size:{1}", status, Marshal.SizeOf(status));

// 이거 왜 에러나는 지 확인 필요.
```

이게 되는 지 테스트해봐야할 거 같다.