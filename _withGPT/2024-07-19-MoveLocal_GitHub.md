---
layout: posts
comments: true
title : " 2024-07-19 Local Git 저장소롤 GitHub 로 옮기는 방법 "
categories: ETC
tags: [ GPT ]
published: false
---

로컬 Git 저장소를 그대로 원격 저장소로 옮기기 위해서는 다음의 절차를 따르시면 됩니다. 이 절차는 이미 로컬에 있는 Git 저장소를 원격 저장소와 연결하고, 모든 변경 사항을 푸시하는 방법을 포함합니다.

### 1. 원격 저장소 생성

GitHub, GitLab, Bitbucket 등에서 새로운 원격 저장소를 만듭니다. 예를 들어 GitHub에서 원격 저장소를 만든다고 가정합니다.

1. GitHub에 로그인합니다.
2. 오른쪽 상단의 `+` 아이콘을 클릭하고 `New repository`를 선택합니다.
3. 저장소 이름을 입력하고 `Create repository` 버튼을 클릭합니다.

### 2. 로컬 저장소와 원격 저장소 연결

터미널을 열고 로컬 Git 저장소로 이동한 후, 원격 저장소를 추가합니다.

```sh
cd /path/to/your/local/repo
git remote add origin https://github.com/username/repository.git
```

위의 `username`과 `repository`는 GitHub 사용자 이름과 원격 저장소 이름으로 변경합니다.

### 3. 모든 변경 사항 푸시

로컬 저장소의 모든 변경 사항을 원격 저장소로 푸시합니다.

```sh
git push -u origin master
```

여기서 `master`는 기본 브랜치 이름입니다. 만약 기본 브랜치 이름이 `main`이라면 `master` 대신 `main`을 사용하세요.

기본적으로 GitHub 원격저장소를 생성할 시에 Main branch 는 'main' 이므로 'main' 으로 변경하여 사용합니다.

```sh
git push -u origin main
```

### 4. 변경 사항 확인

원격 저장소의 웹사이트에서 파일들이 정상적으로 업로드 되었는지 확인합니다.

이 과정을 통해 로컬 Git 저장소를 원격 저장소로 옮길 수 있습니다. 추가적으로, 만약 로컬 저장소에 있는 특정 브랜치만 푸시하고 싶다면, 해당 브랜치를 지정하여 푸시할 수 있습니다. 예를 들어, `develop` 브랜치를 푸시하려면 다음 명령어를 사용하세요:

```sh
git push -u origin develop
```

원하는 브랜치를 반복해서 푸시하여 모든 내용을 원격 저장소로 옮길 수 있습니다.
