---
layout: posts
comments: true
title : "왜 Wakatime Stats 이 Github Profile 에 표시가 안되는가?"
categories: Development
tags: [Wakatime, Git]
published: true
---

### Wakatime 이 Github Profile 에 나타나지 않음.
1주일 전에 Wakatime 적용을 완료했다.

그런데, 1주일이 지나도 아직 아무정보 없다고 한다.

![정보 없음.](/assets/images/2022-04-25/no_wakatime_info.jpg)

Github Stats 데모 사이트에도 위와 같이 보여서 뭔가 문제가 있나 싶었는데,

[데모 사이트 anuraghazra]('https://github.com/anuraghazra/github-readme-stats.git")


직접 링크를 주소창에 넣으니, 아래와 같이 잘 표시가 되었다.

[![jcseo's wakatime stats](https://github-readme-stats.vercel.app/api/wakatime?username=jcseo1028&theme=merko&show_icons=true&hide_border=true)](https://wakatime.com/@jcseo1028)

--- 

### 문제 해결

표시가 안 된 원인은 아래와 같이 Wakatime 설정이 비공개로 되어 있어서 발생한 문제였다.

![설정 방법](/assets/images/2022-04-25/config_wakatime_profile.jpg)

이와 같이 설정 후, 2시간 정도 경과되니 Github Profile 에 정상적으로 표시된다.

[My Github Profile](https://github.com/jcseo1028)

---

