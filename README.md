# SURVIVOR: 끝없는 던전

Pygame으로 만든 2D 생존형 던전 게임입니다. 이 저장소에는 게임 소스 코드와 Windows 실행 파일을 자동으로 만드는 설정이 들어 있습니다.

## 친구에게 Windows 실행 파일 보내기

이 프로젝트는 업로드한 `SURVIVOR-Windows.zip` 예시와 같은 **폴더형(one-folder) 배포**를 만듭니다.

압축을 풀면 다음 구조가 됩니다.

```text
SURVIVOR-Windows/
├─ SURVIVOR.exe
└─ _internal/
   └─ (실행에 필요한 Python/Pygame 파일들)
```

`SURVIVOR.exe`만 따로 옮기면 실행되지 않습니다. 반드시 `_internal` 폴더와 함께 보관하고, ZIP 전체를 압축 해제한 뒤 `SURVIVOR.exe`를 실행하세요.

### GitHub에서 자동 빌드하기

1. 이 폴더 안의 파일들을 새 GitHub 저장소에 업로드합니다.
2. 저장소의 **Actions** 탭을 열고 `Build SURVIVOR for Windows` 작업이 끝날 때까지 확인합니다.
3. 작업이 성공하면 해당 실행 기록의 **Artifacts**에서 `SURVIVOR-Windows` ZIP을 다운로드할 수 있습니다.
4. 친구에게 계속 공유할 정식 다운로드 링크를 만들려면 **Releases → Create a new release**에서 새 태그(예: `v1.0.0`)를 만들고 공개합니다.
5. Release 공개로 Windows 빌드가 자동 실행되고, 완료되면 `SURVIVOR-Windows.zip`이 해당 Release의 Assets에 첨부됩니다.

친구는 Release 페이지에서 `SURVIVOR-Windows.zip`을 다운로드해 압축을 풀고 실행하면 됩니다. 친구 컴퓨터에는 Python이나 Pygame을 별도로 설치할 필요가 없습니다.

## 내 컴퓨터에서 직접 빌드하기

Windows에서 Python 3.12를 설치한 뒤 `build_windows.bat`을 더블클릭합니다. 완료되면 `dist/SURVIVOR-Windows.zip`이 생성됩니다.

명령 프롬프트에서 직접 빌드하려면:

```bat
py -3.12 -m pip install -r requirements.txt pyinstaller==6.22.3
py -3.12 -m PyInstaller --noconfirm --clean --onedir --windowed --name SURVIVOR --contents-directory _internal --collect-all pygame main.py
```

## 글꼴 (선택 사항)

`fonts/neodgm.ttf` 파일을 `fonts` 폴더에 넣으면 해당 글꼴을 사용합니다. 파일이 없어도 운영체제의 기본 글꼴로 실행됩니다.

## 저장 데이터

게임 실행 시 `save.json`, `best.json`, `class.json`, `challenge.json` 및 오류 기록 파일이 실행 파일 옆에 만들어질 수 있습니다. 각 플레이어의 저장 데이터이므로 GitHub에 올리지 않습니다. `.gitignore`에서 제외하고 있습니다.

## 빌드 환경

- Windows x64
- Python 3.12
- pygame 2.6.1
- PyInstaller 6.22.3
