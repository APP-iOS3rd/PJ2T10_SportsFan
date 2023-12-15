# PJ2T10_SportsFan

축구 서포터즈들을 위한 정보 앱
<br/>

<aside>

💡 특정 팀을 대상으로 소위 ‘덕질’을 가능케 하는 앱

</aside>

## 개요
- 팀장: 최준현
- 팀원: 박호건, 변정훈, 오성준, 이경헌, 정민규

## 1. 앱소개

![뉴 온보딩](https://github.com/APP-iOS3rd/PJ2T10_SportsFan/assets/83914919/5d995c42-2248-4cd1-9c32-a74db2f4bfc4) ![returnSelection](https://github.com/APP-iOS3rd/PJ2T10_SportsFan/assets/83914919/72c3deb9-cbdd-4703-abdf-a51b36586b9d)


<br/>

- 특정 팀을 대상으로 소위 '덕질’을 가능케 하는 앱 or 사용자가 원하는 '축구 팀의 정보'를 얻을 수 있는 앱

## 2. 프로젝트의 특징

- 축구 경기를 더 재밌게 즐기고, 더 자세한 정보를 얻을 수 있는 '덕질' 앱
  <br/>
  
- 기사, 경기결과, 경기일정 등을 한번에 모아서 볼 수 있다.
  <br/>

## 3. 기대효과 (고객이 가지는 이점)

- 기대효과(이점, 고객이 갖게되는 이익)구별점에서 설명한 것과 같이 단순히 스포츠팀의 경기 정보를 전달하는 것에서 끝나는 것이 아닌 더 깊은 ‘덕질’이 가능
  <br/>
- 고객의 입장에서는 팀에 대한 경기, 뉴스 등 다양한 정보를 편리하게 소비할 수 있다.
  <br/>

## 4. 핵심기능

### 메인화면
<br/>

![new메인](https://github.com/APP-iOS3rd/PJ2T10_SportsFan/assets/83914919/b6856dfa-7593-4d7c-a400-bcb5e999d447)
<br/>

### 리그 선택
<br/>

![리그셀렉](https://github.com/APP-iOS3rd/PJ2T10_SportsFan/assets/83914919/375b9421-a6cc-46d8-94ab-72bf02d8368e)
<br/>

- 전 세계의 리그, 컵 등을 모아 고객이 원하는 팀을 선택할 수 있도록 한다.
  
### 팀 선택
![팀셀렉](https://github.com/APP-iOS3rd/PJ2T10_SportsFan/assets/83914919/47836639-8159-4b4e-8ca9-29718dd4ad90)
<br/>

- 해당 리그 내에 소속된 팀들을 보여준 후 고객이 선택할 수 있도록 한다.
  
### 뉴스 
![뉴스](https://github.com/APP-iOS3rd/PJ2T10_SportsFan/assets/83914919/6a2a7002-3a8f-475e-b0ba-650ba47f7901) ![뉴스 원본](https://github.com/APP-iOS3rd/PJ2T10_SportsFan/assets/83914919/7f490e89-7652-4c79-b478-e10d4d5eb0f6)


- 팀을 선택한 후 경기 일정, 기사, 경기 결과 등을 간편하게 확인할 수 있도록 한다.
<br/>

- 더보기 선택시 더 자세한 정보를 알 수 있다.
<br/>
      
### 경기 일정
<br/>

![메인에서경기일정](https://github.com/APP-iOS3rd/PJ2T10_SportsFan/assets/83914919/78297134-9447-4a8e-9dee-02a3fcf3091d) ![경기일정에서상세](https://github.com/APP-iOS3rd/PJ2T10_SportsFan/assets/83914919/6d95eacf-9427-4c79-a712-8bb3bb15f175)

<br/>

- 이번 달 최근 경기부터 앞으로의 남은 경기 일정을 확인 가능
  <br/>

- 해당 경기완료 후 득점 정보 및 타임 라인 제공
  <br/>
  

## 5. 기술 스택

- **사용한 기술 및 언어**
    - Swift, SwiftUI, Git, REST API, Alamofire
    
- **개발 환경**
    - Xcode 15
  
- **API**
    - Rapid FootBall API: [Rapid FootBall API 문서](https://www.api-football.com/documentation-v3#section/Introduction)
      -  리그 선택: [leagues](https://www.api-football.com/documentation-v3#tag/Leagues/operation/get-leagues)
      -  팀 선택: [teams](https://www.api-football.com/documentation-v3#tag/Teams/operation/get-teams)
      -  경기일정: [fixtures](https://www.api-football.com/documentation-v3#tag/Fixtures/operation/get-fixtures)
      -  경기정보: [events](https://www.api-football.com/documentation-v3#tag/Fixtures/operation/get-fixtures-events)
        
    - newsapi: [newsapi API 문서](https://newsapi.org/)
      - 뉴스기사: [everything](https://newsapi.org/docs/endpoints/everything)

## 6. etc
<br/>

[노션](https://www.notion.so/LAB-10-035cf37f66824ac2b702bb10cc28319f?pvs=4)
<br/>

[피그마](https://www.figma.com/file/EWJ8uSk8UF677a2yOcBTN3/DuckS?type=design&node-id=0%3A1&mode=design&t=Ge92xv8rnqhwS1mC-1)
<br/>
