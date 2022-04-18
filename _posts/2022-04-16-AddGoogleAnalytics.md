---
layout: posts
comments: true
title : "Jekyll Blog 에 Google Analytics 설정하는 방법"
categories: Life
tags: [jekyll, python, Google Analytics]
published: true
---

### Google Analytics 에서 Tag-ID 받기

Google Analytics 에 접속하여 자신의 블로그 주소를 입력하여 Tag ID 를 부여받는다.

### _config.yml 설정

```python
# Analytics
analytics:
  provider               : "google-gtag" # 부여받은 Tag ID 의 종류에 따라 변경 필요.
  google:
    tracking_id          : "G-BFV9QQK..." # Google Analytics 에서 부여받은 ID 입력. 
    anonymize_ip         : false # true, false (default)
```

이렇게 하면 설정 완료.
아직은 블로그에 글이 없으니... ㅠㅠ

