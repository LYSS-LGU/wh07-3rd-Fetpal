# Fetpal: AI 기반 반려동물 통합 케어 플랫폼

**🔗 [프로젝트 바로가기 (Vercel 배포 링크)](https://your-project-url.vercel.app/)**

## 📋 프로젝트 문서

> **📁 [docs](./docs/) 폴더**에서 상세한 프로젝트 문서를 확인할 수 있습니다.

- **[02_WBS.md](./docs/02_WBS.md)** - 작업 분해 구조 및 일정 계획
- **[03*시스템*흐름도.md](./docs/03_시스템_흐름도.md)** - 시스템 프로세스 및 데이터 흐름
- **[04*시스템*아키텍처.md](./docs/04_시스템_아키텍처.md)** - 기술 스택 및 시스템 구조
- **[05_ERD.md](./docs/05_ERD.md)** - 데이터베이스 설계 및 관계도
- **[06*요구사항*정의서.md](./docs/06_요구사항_정의서.md)** - 기능적/비기능적 요구사항

## 🐾 프로젝트 팀원 소개

<div align="center">

|                               **프로필**                                | **정보**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| :---------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <img src="./assets/p3_profile.png" width="120" height="120" alt="석이"> | **이름**: 이유석<br>**역할**: 1인 개발자<br>**_"하나씩 배워가며 만드는 첫 작품, 혼자여도 포기하지 않는 마음!"_**<br><br>**Contact Me:**<br>[<img src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1566899596/noticon/slhw4nu8hybreryigopq.png" width="25" height="25" alt="GitHub">](https://github.com/LYSS-LGU) [<img src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1606895317/noticon/cffnbxeed08p0l4u44ru.png" width="25" height="25" alt="Gmail">](mailto:leeyss1991@gmail.com) [<img src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1644169460/noticon/frvhykszxhjz4asz77oi.png" width="25" height="25" alt="Naver">](mailto:lyss91@naver.com) |

</div>

**👨‍💻담당 업무**

|   **영역**   |         **기술 스택**         | **세부 내용**                            |
| :----------: | :---------------------------: | :--------------------------------------- |
|   **기획**   |      프로젝트 매니지먼트      | 요구사항 분석, WBS 작성, 시스템 설계     |
| **Frontend** |  Next.js, React, TypeScript   | 사용자 인터페이스, 반응형 웹, 상태 관리  |
| **Backend**  | Supabase, FastAPI, PostgreSQL | 데이터베이스 설계, API 개발, 인증 시스템 |
|  **AI/ML**   |    YOLOv8, OpenCV, PyTorch    | 이미지 분석, 객체 탐지, 모델 학습        |
|   **기타**   |        UI/UX, 아키텍처        | 디자인 시스템, 시스템 아키텍처 설계      |

---

## 1. 🐾 프로젝트 소개

### **프로젝트 개요**

**Fetpal (펫팔)**은 AI 기술을 활용하여 반려동물의 건강 이상 징후를 초기에 파악하고, 상황별 대처 방안을 제시하여 보호자의 불안감을 해소하는 것을 목표로 하는 **AI 기반 반려동물 통합 케어 플랫폼**입니다.

> **💡 명칭의 의미**: **Family**(가족) + **Vet**(수의사) + **Pet**(반려동물) + **Pal**(친구)의 합성어로, 가족과 반려동물이 함께하는 건강한 일상을 수의학적 지식과 친구 같은 AI가 도와준다는 의미를 담고 있습니다.

---

### 🚨 **해결하고자 하는 문제**

<div align="center">

#### **🏥 응급 상황 대처의 어려움**

> _"새벽 2시, 강아지 눈이 갑자기 빨개졌는데 병원은 문을 닫았고, 응급실은 너무 멀어요. 지금 당장 가야 할까요?"_
>
> _"피부에 뾰루지 같은 게 났는데, 병원 가기엔 애매하고 그냥 두기엔 불안해요."_

#### **🐶 초보 반려인의 일상 케어 고민**

> _"타지에서 처음 강아지를 키우는데, 하루에 몇 번 밥을 줘야 하는지, 언제 산책을 시켜야 하는지, 기본적인 훈련은 어떻게 시켜야 하는지 아무것도 모르겠어요. 주변에 물어볼 사람도 없고..."_
>
> _"혼자 살면서 반려동물을 키우는데, 갑자기 아픈 것 같을 때 어떻게 대처해야 할지 막막해요. 온라인 정보는 너무 많아서 뭘 믿어야 할지 모르겠어요."_

**반려동물 1500만 시대, 수많은 보호자들이 위와 같은 고민을 매일 겪고 있습니다.**

</div>

---

### 🎯 **솔루션**

Fetpal은 이러한 **불안감과 정보 비대칭 문제**를 해결하고자 합니다:

#### **🐾 응급 상황 지원**

- **AI 기술**로 시공간 제약 없이 반려동물의 상태를 객관적으로 확인
- **검증된 정보**를 바탕으로 침착하게 다음 행동을 결정할 수 있도록 지원
- **응급 상황의 골든타임**을 놓치지 않도록 즉시 대처 방안 제공

#### **🐾 초보 반려인 가이드**

- **일상 케어 가이드**: 급식 시간, 산책 방법, 기본 훈련법 등 체계적 정보 제공
- **커뮤니티 연결**: 경험 있는 반려인들과의 소통을 통한 실질적 조언
- **단계별 가이드**: 반려동물 성장 단계별 맞춤 케어 정보 제공

#### **🐾 경제적 부담 완화**

- **불필요한 의료비 지출**을 줄이고 적절한 시기의 병원 방문 유도
- 보호자와 반려동물 모두의 **삶의 질 향상**을 목표

---

<div align="center">

### 💝 **프로젝트 미션**

> **"내 선택으로 내게 온 사랑스러운 반려동물, Fetpal이 함께 지켜드립니다."**

</div>

## 2. 🐾 주요 기능

| 구분                 | 기능                        | 상세 설명                                                                                                                                       |
| :------------------- | :-------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------- |
| **🩺 AI 임의진단**   | 이미지 기반 건강 분석       | 스마트폰으로 촬영한 피부/안구 사진을 **YOLOv8 & OpenCV** 모델로 분석하여 이상 징후를 탐지하고, 신뢰도/심각도와 함께 시각적으로 보여줍니다.      |
| **💬 AI 어드바이저** | RAG/LLM 기반 대처 방안 제시 | 분석 결과에 따라, 검증된 지식 기반의 **RAG/LLM**이 비진단적 소견과 응급 상황 대처법, 주변 병원/약국 추천 등 신뢰도 높은 정보를 제공합니다.      |
| **🗺️ 지도 연동**     | 주변 시설 검색 (LBS)        | **Kakao Map API**와 연동하여 내 위치 기반으로 24시 동물병원, 약국, 펫샵 등의 위치, 평점, 영업시간 등 상세 정보를 즉시 확인할 수 있습니다.       |
| **🐾 커뮤니티**      | 지식 공유 및 소셜 네트워킹  | `#해시태그`를 통해 관련 게시글과 **YouTube 케어 영상**을 한번에 보고, 위치 기반 모임과 **실시간 채팅**으로 동네 펫 친구들과 교류할 수 있습니다. |
| **🗓️ 스마트 플래너** | 일정 및 지출 통합 관리      | 예방접종 자동 스케줄링, 병원/미용 예약, 사료 구매까지. 캘린더와 가계부를 통합하여 모든 케어 활동을 체계적으로 기록하고 관리합니다.              |

## 3. 🐾 기술 스택 및 아키텍처

Fetpal은 **MSA(Microservice Architecture)** 기반의 클라이언트-서버 아키텍처를 채택하여 각 기능의 독립적인 확장과 업데이트가 용이하도록 설계되었습니다.

### 🐾기술 스택

#### 💻 **사용 언어**

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white) ![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black) ![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB) ![Next.js](https://img.shields.io/badge/Next.js-000000?style=for-the-badge&logo=next.js&logoColor=white) ![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)

#### 📊 **데이터 분석 및 처리**

![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white) ![NumPy](https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white) ![OpenCV](https://img.shields.io/badge/OpenCV-5C3EE8?style=for-the-badge&logo=opencv&logoColor=white)

#### 🤖 **AI / ML**

- **모델**: ![YOLO](https://img.shields.io/badge/YOLO-00FFFF?style=for-the-badge&logo=yolo&logoColor=black)
- **프레임워크**: ![PyTorch](https://img.shields.io/badge/PyTorch-EE4C2C?style=for-the-badge&logo=pytorch&logoColor=white)
- **AI 플랫폼**: ![Hugging Face](https://img.shields.io/badge/🤗%20Hugging%20Face-FFD21E?style=for-the-badge&logoColor=black)
- **LLM**: ![OpenAI](https://img.shields.io/badge/OpenAI-412991?style=for-the-badge&logo=openai&logoColor=white) ![Gemini](https://img.shields.io/badge/Google%20Gemini-8E75B2?style=for-the-badge&logo=googlegemini&logoColor=white) ![Claude](https://img.shields.io/badge/Claude-FF6B35?style=for-the-badge&logo=anthropic&logoColor=white)

#### 🌐 **인프라 & 배포 & 서버**

- **클라우드**: ![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white) ![EC2](https://img.shields.io/badge/EC2-FF9900?style=for-the-badge&logo=amazon-ec2&logoColor=white)
- **데이터베이스**: ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white) ![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)
- **서버**: ![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white) ![Next.js](https://img.shields.io/badge/Next.js-000000?style=for-the-badge&logo=next.js&logoColor=white) ![Vercel](https://img.shields.io/badge/Vercel-000000?style=for-the-badge&logo=vercel&logoColor=white)

### 3-1. 🐾아키텍처 다이어그램

```mermaid
graph TD
    subgraph "사용자 영역"
        A["사용자 (웹 브라우저)"]
    end

    subgraph "프론트엔드 (Vercel)"
        B["Next.js / React 앱"]
    end

    subgraph "백엔드 서비스"
        C["Supabase BaaS"]
        D["Python AI 서버 (FastAPI)"]
    end

    subgraph "Supabase 내부"
        C1["Authentication"]
        C2["PostgreSQL DB"]
        C3["Storage"]
        C4["Realtime"]
    end

    subgraph "AI 서버 내부"
        D1["API Endpoint (/analyze)"]
        D2["YOLO & OpenCV 모델"]
        D3["RAG/LLM 모듈"]
    end

    subgraph "외부 서비스 API"
        E["LLM Provider"]
        F["Kakao Map API"]
        G["YouTube Data API"]
    end

    A -- HTTPS --> B

    B -- "데이터 CRUD" --> C2
    B -- "사용자 인증" --> C1
    B -- "파일 업로드" --> C3
    B -- "실시간 채팅" --> C4

    B -- "이미지 분석 요청 (REST)" --> D1
    B -- "지도/장소 요청 (REST)" --> F
    B -- "영상 검색 요청 (REST)" --> G

    D1 -- "모델 추론" --> D2
    D1 -- "정보 생성" --> D3
    D3 -- "API 호출" --> E
```

## 4. 🐾 시스템 흐름도

> 주요 사용자 시나리오에 따른 데이터 및 제어 흐름을 나타냅니다.

### 4.1. 사용자 온보딩 (회원가입 및 반려동물 등록)

```mermaid
graph TD
    subgraph "사용자"
        A1(시작: 서비스 접속)
        A2(회원가입/로그인 선택)
        A3(이메일/소셜 정보 입력)
        A4(온보딩: 프로필 정보 입력)
        A5(반려동물 정보 입력)
        A6(등록 완료)
    end

    subgraph "시스템 (프론트엔드 + Supabase)"
        B1(메인 페이지 표시)
        B2(Supabase Auth UI 제공)
        B3{소셜/이메일 인증}
        B4(profiles 테이블에 사용자 정보 저장)
        B5(palProfiles 테이블에 반려동물 정보 저장)
        B6(대시보드 페이지로 리디렉션)
    end

    A1 --> B1
    B1 --> A2
    A2 --> B2
    B2 -- "사용자 정보" --> A3
    A3 -- "인증 요청" --> B3
    B3 -- "성공" --> B4
    B4 -- "프로필 입력 요청" --> A4
    A4 -- "프로필 정보 제출" --> B4
    B4 -- "반려동물 등록 유도" --> A5
    A5 -- "반려동물 정보 제출" --> B5
    B5 -- "성공" --> A6
    A6 --> B6
```

### 4.2. AI 건강진단 (핵심 기능)

```mermaid
graph TD
    subgraph "사용자"
        C1(건강진단 메뉴 선택)
        C2(사진 업로드)
        C3(결과 확인)
        C4(상세 정보/대처 방안 확인)
    end

    subgraph "프론트엔드"
        D1(업로드 UI 표시)
        D2(이미지 파일 Supabase Storage에 업로드)
        D3(이미지 URL을 AI 서버로 전송)
        D4(AI 서버로부터 분석 결과 수신)
        D5(결과 시각화: 이미지 + 텍스트)
    end

    subgraph "백엔드"
        E1[Supabase Storage]
        E2[Python AI 서버]
        E3[YOLO/OpenCV 모델]
        E4[RAG/LLM 모듈]
    end

    C1 --> D1
    D1 --> C2
    C2 -- "이미지 파일" --> D2
    D2 -- "이미지 저장" --> E1
    E1 -- "이미지 URL 반환" --> D2
    D2 --> D3
    D3 -- "분석 요청" --> E2
    E2 -- "모델 호출" --> E3
    E3 -- "1차 분석 결과" --> E2
    E2 -- "LLM 연동" --> E4
    E4 -- "최종 텍스트 생성" --> E2
    E2 -- "JSON 결과 반환" --> D4
    D4 --> D5
    D5 --> C3
    C3 --> C4
```

### 4.3. 커뮤니티 게시글 작성 및 정보 얻기

```mermaid
graph TD
    subgraph "사용자 (작성자)"
        F1(커뮤니티 진입)
        F2(글쓰기 버튼 클릭)
        F3(제목, 내용, #해시태그, 이미지 입력)
        F4(작성 완료)
    end

    subgraph "사용자 (독자)"
        G1(커뮤니티 진입)
        G2(#해시태그 클릭)
        G3(연관 게시글 및 YouTube 영상 확인)
    end

    subgraph "시스템"
        H1[프론트엔드]
        H2[Supabase DB]
        H3[YouTube API]
    end

    F1 --> H1
    F2 --> H1
    F3 -- "게시글 데이터" --> H1
    H1 -- "데이터 저장 요청" --> H2
    H2 -- "저장 완료" --> H1
    H1 --> F4

    G1 --> H1
    H1 -- "게시글 목록 로드" --> H2
    H2 -- "목록 반환" --> H1
    H1 --> G2
    G2 -- "태그 정보 전달" --> H1
    H1 -- "1. 태그 기반 게시글 검색" --> H2
    H1 -- "2. 태그 기반 영상 검색" --> H3
    H2 -- "검색 결과 반환" --> H1
    H3 -- "영상 목록 반환" --> H1
    H1 -- "결과 통합 표시" --> G3
```

### 4.4. 주변 병원/매장 찾기 (지도 API 연동)

```mermaid
graph TD
    subgraph "사용자"
        I1(주변 시설 찾기 메뉴 선택)
        I2{현재 위치 제공 동의}
        I3(지도에서 병원/매장 정보 확인)
        I4(특정 장소 선택)
        I5(상세 정보 확인: 평점, 거리, 길찾기)
    end

    subgraph "시스템"
        J1[프론트엔드]
        J2[브라우저 Geolocation API]
        J3[Kakao Map API]
    end

    I1 --> J1
    J1 -- "위치 정보 요청" --> I2
    I2 -- "동의" --> J1
    J1 -- "위치 좌표 요청" --> J2
    J2 -- "좌표 반환" --> J1
    J1 -- "(좌표 + '동물병원') 검색 요청" --> J3
    J3 -- "주변 병원 목록 반환" --> J1
    J1 -- "지도에 마커 표시" --> I3
    I3 --> I4
    I4 -- "상세 정보 요청" --> J1
    J1 -- "장소 ID로 상세 정보 요청" --> J3
    J3 -- "상세 정보 반환" --> J1
    J1 -- "상세 정보 팝업 표시" --> I5
```

## 5. 🐾 데이터베이스 설계 (ERD)

> Supabase PostgreSQL 스키마를 기반으로 설계되었습니다. 상세한 ERD는 **[05_ERD.md](./docs/05_ERD.md)**에서 확인할 수 있습니다.

```mermaid
erDiagram
    %% =================================
    %% 1. 사용자 및 인증 (User & Auth)
    %% =================================
    "auth.users" {
        UUID id PK
        TEXT email
        TIMESTAMP createdAt
    }
    "profiles" {
        UUID id PK, FK
        TEXT email
        TEXT displayName
        TEXT avatarUrl
        TEXT phone
        TEXT address
        BOOLEAN profileComplete
        TIMESTAMP createdAt
        TIMESTAMP updatedAt
    }
    "profileCompletion" {
        UUID userId PK, FK
        INTEGER completionScore
        BOOLEAN hasBasicInfo
        BOOLEAN hasAvatar
        BOOLEAN hasPalProfile
    }

    %% =================================
    %% 2. 반려동물 (Pal)
    %% =================================
    "palProfiles" {
        UUID palId PK
        UUID userId FK
        TEXT palName
        TEXT palSex
        DATE palBirthdate
        TEXT palBreed
        DECIMAL palWeight
        TEXT palProfileImage
        BOOLEAN isPrimary
        TEXT animalType
        TIMESTAMP createdAt
    }
    "palHealthRecords" {
        UUID id PK
        UUID palId FK
        TEXT recordType
        DATE recordDate
        TEXT title
        TEXT description
        DATE nextSchedule
    }
    "palVaccinations" {
        UUID id PK
        UUID palId FK
        INTEGER vaccinationTypeId FK
        INTEGER shotNumber
        DATE scheduledDate
        DATE actualDate
        BOOLEAN isCompleted
    }

    %% =================================
    %% 3. 커뮤니티 (Community)
    %% =================================
    "communityPosts" {
        UUID id PK
        UUID userId FK
        TEXT title
        TEXT content
        TEXT[] postImages
        INTEGER likes
        INTEGER commentsCount
        TIMESTAMP createdAt
    }
    "postComments" {
        UUID id PK
        UUID postId FK
        UUID userId FK
        TEXT content
        TIMESTAMP createdAt
    }
    "postLikes" {
        UUID postId PK, FK
        UUID userId PK, FK
        TIMESTAMP createdAt
    }

    %% =================================
    %% 4. 플래너 (Planner)
    %% =================================
    "plannerEvents" {
        UUID id PK
        UUID userId FK
        UUID palId FK
        TEXT title
        TEXT eventType
        DATE eventDate
        TIME eventTime
        TEXT description
        BOOLEAN isCompleted
    }
    "plannerExpenses" {
        UUID id PK
        UUID userId FK
        UUID palId FK
        TEXT expenseType
        TEXT description
        INTEGER amount
        DATE expenseDate
        TEXT paymentMethod
    }

    %% 관계 정의
    "auth.users" ||--|| "profiles" : "has"
    "profiles" ||--|| "profileCompletion" : "tracks"
    "profiles" ||--o{ "palProfiles" : "owns"
    "palProfiles" ||--o{ "palHealthRecords" : "has"
    "palProfiles" ||--o{ "palVaccinations" : "receives"
    "profiles" ||--o{ "communityPosts" : "writes"
    "communityPosts" ||--o{ "postComments" : "has"
    "communityPosts" ||--o{ "postLikes" : "receives"
    "profiles" ||--o{ "postComments" : "writes"
    "profiles" ||--o{ "postLikes" : "gives"
    "profiles" ||--o{ "plannerEvents" : "plans"
    "profiles" ||--o{ "plannerExpenses" : "tracks"
    "palProfiles" ||--o{ "plannerEvents" : "involves"
    "palProfiles" ||--o{ "plannerExpenses" : "involves"
```

## 6. 🐾 프로젝트 진행 계획 (WBS)

프로젝트는 총 7개의 Phase로 구성되어 있으며, 기획부터 개발, 배포, 유지보수까지 체계적으로 관리됩니다.

- **Phase 1: 프로젝트 기획 및 설계** (진행중)
- **Phase 2: 백엔드 개발 (Supabase)** (진행중)
- **Phase 3: AI 서버 개발** (진행 중)
- **Phase 4: 프론트엔드 개발 (Next.js)** (진행중)
- **Phase 5: 통합 및 테스트**
- **Phase 6: 배포 및 런칭**
- **Phase 7: 유지보수 및 고도화**

현재 3차 프로젝트에서는 **AI 서버 개발 및 실제 서비스 연동**과 **실시간 커뮤니티 기능 완성**에 집중하고 있습니다.

## 7. 🐾 기대 효과

- **보호자**: 반려동물 양육에 대한 불안감을 줄이고, 객관적 데이터를 통해 수의사와 원활하게 소통할 수 있습니다.
- **반려동물**: 이상 징후를 조기에 발견하여 질병을 예방하고 건강한 삶의 질을 향상시킬 수 있습니다.
- **산업**: 축적된 비식별 건강 데이터를 통해 펫 보험, 펫 푸드 등 연관 산업 발전에 기여할 수 있습니다.
