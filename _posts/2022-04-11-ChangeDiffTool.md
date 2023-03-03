---
layout: posts
comments: true
title : "Visual Studio 의 기본 Diff Tool 변경하기"
categories: Development
tags: [Git]
published: true
---

### Visual Studio 내 기본 Diff Tool 의 문제점. (Git 전용 설정)

차이점 보기만 가능하고, 특정 line 의 변경 및 취소가 용이하지 않음. 
- 취소 시 해당 파일 내, 전체 수정사항이 취소됨.
- 내가 아직 사용법을 잘 모르는 것일 수도...

Git 을 사용하기 전 주로 사용했던 Beyond Compare 로 변경해 보기로 함.

---



### Diff Tool 변경을 위한 설정 파일의 위치.

```

C:\Users\계정명\.gitconfig

```

### 해당 .gitconfig 파일을 다음과 같이 Beyond Compare 를 사용할 수 있도록 수정.

```

[diff]
    tool = BeyondCompare

[difftool]
	prompt = false

[difftool "BeyondCompare"]  
  trustExitCode = true
  cmd = \"D:\\_Util\\Portable\\Beyond Compare 3\\BCompare.exe\" -u -e \"$LOCAL\" \"$REMOTE\"

[merge]
    tool = BeyondCompare
[mergetool]
    prompt = false
    keepBackup = false
[mergetool "BeyondCompare"]
    cmd = \"D:\\_Util\\Portable\\Beyond Compare 3\\BCompare.exe\" \"$LOCAL\" \"$REMOTE\" \"$BASE\" \"$MERGED\"
    trustExitCode = true

```

@2023.03.03 재설정
Visual Studio 2017 및 2022 버전이 동시에 적용된다.

---

<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-7159086721305762"
     crossorigin="anonymous"></script>

이렇게 넣으면 애드센스 작동되나? -> 1차 실패해서 다시 받아야 할 거 같음.

