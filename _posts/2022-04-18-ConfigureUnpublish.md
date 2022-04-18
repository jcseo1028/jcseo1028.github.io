---
layout: posts
comments: true
title : "Jekyll 비공개 포스트 설정하기"
categories: Life
tags: [jekyll, python]
published: true
---

### _Config.yml 수정

해당 파일에서 별도 설정은 필요없다.

```python

```

### Post 등록시 published 변수 설정

Post 등록 시 다음과 같이 포스트 header에 published 변수를 설정한다.

```python
---
...
published: false # true(공개), false(비공개)
---

```

### 비공개 Post 를 로컬빌드로 보고 싶을 경우

Github 서버에서는 보이지 않더라도, 로컬에서는 해당 포스트를 확인하고 싶을 경우가 있을 것이다.

로컬 Jekyll 실행 시 아래와 같이 -unpublished 옵션을 추가하면 비공개 포스트를 확인할 수 있다.

```bsh
> bundler exec jekyll serve -unpublished
```