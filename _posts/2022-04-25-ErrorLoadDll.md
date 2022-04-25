---
layout: posts
comments: true
title : "DLL Module 로딩 시 0x800700B Error 관련"
categories: Development
tags: [DLLImport, C#]
published: false
---

System.BadImageFormatException: 프로그램을 잘못된 형식으로 로드하려고 했습니다. (예외가 발생한 HRESULT: 0x8007000B)

해당 에러의 원인은 32bit 로 만든 DLL 을 64bit 시스템에서 사용할 때 나타나는 에러.

Build 시 64bit 로 옵션을 변경하여 처리한다.



