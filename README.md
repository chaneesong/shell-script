## 귀찮은 명령어 한 번에 쉘 스크립트로 만들어 씀

### all-branch-pull-origin-main

모든 브랜치를 한 번에 원격 저장소(main)으로 pull 시키는 스크립트

#### 의존성 패키지

```
brew install autojump
```

| 파일명                         | 설명                                                            |
| ------------------------------ | --------------------------------------------------------------- |
| all-branch-pull-origin-main.sh | 스크립트 경로/all-branch-pull-origin-main (pull 하게 될 저장소) |

### tmux command

tmux의 긴 명령어들을 더 간단하게 만듬

#### 의존성 패키지

```
brew install tmux
```

| 파일명          | 설명                                 |
| --------------- | ------------------------------------ |
| new_session.sh  | 입력한 name으로 새로운 새션 생성     |
| kill_session.sh | 입력한 name에 해당하는 세션 삭제     |
| attach_session  | 입력한 name에 해당하는 세션으로 진입 |
