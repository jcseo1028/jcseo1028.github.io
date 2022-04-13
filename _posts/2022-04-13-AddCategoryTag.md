---
layout: posts
comments: true
title : "Jekyll Blog 에 Category 및 Tag 추가하는 방법"
categories: Life
tags: [jekyll, python]
---

### _config.yml 설정

아래 부분의 주석을 해제한다.

```python

# https://github.com/jekyll/jekyll-archives
jekyll-archives:
  enabled:
    - categories
    - tags
  layouts:
    category: archive-taxonomy
    tag: archive-taxonomy
  permalinks:
    category: /categories/:name/
    tag: /tags/:name/

```

### Category 및 Tag 설정 파일 추가하기

_pages 폴더를 생성한다.

category-archive.md 파일을 생성하여 다음과 같은 내용으로 편집한다.

```python

---
title: "Category"
layout: categories
permalink: /categories/
author_profie: true
sidebar_main: true
---

```

---

tag-archive.md 파일을 생성하여 다음과 같은 내용으로 편집한다.

```python

---
title: "Tag"
layout: tags
permalink: /tags/
author_profie: true
sidebar_main: true
---

```

### _data/navigation.yml 파일 설정

해당 파일을 다음과 같이 수정한다.

```python

main:
  - title: "Quick-Start Guide"
    url: https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/
  - title: "Category"
    url: /categories/
  - title: "Tag"
    url: /tags/
  
```

화면 상단에 Category 및 Tag 메뉴가 표시된다.

### Post 작성 시 header 부분에 다음과 같이 Category 및 Tag 를 지정한다.

```python

---
layout: posts
comments: true
title : "Post Title"
categories: category_name
tags: [tag_name1, tag_name2]
---

```