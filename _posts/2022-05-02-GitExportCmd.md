---
layout: posts
comments: true
title : "Git 특정(main or master) branch 를 압축파일로 Export 하기"
categories: Development
tags: [ Git]
published: false
---

### Export 명령어

Git Hub Repository 폴더에서 Git Bsh 을 열어 다음과 같이 입력한다.

```sh
> git archive --format zip --output out.zip main
```

- out.zip 원하는 파일명.
- main 원하는 branch명.

작업 사본에 커밋되지 않은 내용이 있으면, 커밋 후 수행해야 한다.

### 폴더 압축 ?

윈도우 상에서 Repositories 폴더를 그냥 압축하면 결과가 다를까?
