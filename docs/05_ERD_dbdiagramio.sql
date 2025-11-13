// ============================================
// Fetpal 데이터베이스 ERD - 4차 스프린트 최신화 (2025-11-14)
// dbdiagram.io 전용 스키마
// 4차 신규: lifestylechatmessagehashtags 테이블 추가 (통합 해시태그 4개 영역)
// ============================================

// ============================================
// 사용자 및 프로필 관련 테이블
// ============================================

Table profiles {
  id uuid [pk, note: '사용자 고유 ID (auth.users.id와 연결)']
  email text [not null, note: '이메일 주소']
  displayName text [not null, note: '표시 이름']
  avatarUrl text [note: '프로필 이미지 URL']
  phone text [note: '전화번호']
  address text [note: '주소']
  zipCode text [note: '우편번호']
  detailAddress text [note: '상세 주소']
  profileComplete boolean [default: false, note: '프로필 완성 여부']
  uploadedimages jsonb [default: '[]', note: '업로드된 이미지들']
  createdAt timestamp [not null, default: `now()`, note: '생성 시간']
  updatedAt timestamp [not null, default: `now()`, note: '수정 시간']
}

Table profileCompletion {
  userId uuid [pk, ref: - profiles.id, note: '사용자 ID (1:1 관계)']
  completionScore integer [default: 0, note: '완성도 점수']
  hasBasicInfo boolean [default: false, note: '기본 정보 보유 여부']
  hasDisplayName boolean [default: false, note: '표시 이름 보유 여부']
  hasPhone boolean [default: false, note: '전화번호 보유 여부']
  hasAddress boolean [default: false, note: '주소 보유 여부']
  hasAvatar boolean [default: false, note: '아바타 보유 여부']
  hasPalProfile boolean [default: false, note: '반려동물 프로필 보유 여부']
  lastCalculated timestamp [note: '마지막 계산 시간']
  createdAt timestamp [not null, default: `now()`, note: '생성 시간']
  updatedAt timestamp [not null, default: `now()`, note: '수정 시간']
}

// ============================================
// 반려동물(Pal) 관련 테이블
// ============================================

Table palProfiles {
  palId uuid [pk, note: '반려동물 고유 ID']
  userId uuid [not null, ref: > profiles.id, note: '소유자 사용자 ID']
  palName text [not null, note: '반려동물 이름']
  palUniqueName text [unique, not null, note: '고유 이름 (중복 불가)']
  palSex text [note: '성별 (male, female, unknown)']
  palBirthdate date [note: '생년월일']
  palAdoptionDate date [note: '입양일']
  palBreed text [note: '품종']
  palWeight numeric [note: '체중 (kg)']
  palProfileImage text [note: '프로필 이미지 URL']
  isPrimary boolean [default: false, note: '주 반려동물 여부']
  animalType text [default: 'dog', note: '동물 종류 (dog, cat, hamster, rabbit, bird, other)']
  profileType text [default: 'photo', note: '프로필 타입 (photo, 3d)']
  profileImageUrl text [note: '프로필 이미지 URL']
  uploadedimages jsonb [default: '[]', note: '업로드된 이미지들']
  createdAt timestamp [not null, default: `now()`, note: '생성 시간']
  updatedAt timestamp [not null, default: `now()`, note: '수정 시간']
}

Table userPals {
  id uuid [pk, note: '사용자-반려동물 관계 ID']
  userId uuid [not null, ref: > profiles.id, note: '사용자 ID']
  palId uuid [not null, ref: > palProfiles.palId, note: '반려동물 ID']
  relationship text [default: 'owner', note: '관계 (owner, co-owner, caretaker)']
  createdAt timestamp [not null, default: `now()`, note: '생성 시간']
}

Table palHealthRecords {
  id uuid [pk, note: '건강 기록 ID']
  palId uuid [not null, ref: > palProfiles.palId, note: '반려동물 ID']
  recordType text [not null, note: '기록 타입 (vaccination, checkup, medication, surgery, other)']
  recordDate date [not null, note: '기록 날짜']
  title text [not null, note: '제목']
  description text [note: '설명']
  vetName text [note: '수의사 이름']
  nextSchedule date [note: '다음 일정']
  createdAt timestamp [not null, default: `now()`, note: '생성 시간']
  updatedAt timestamp [not null, default: `now()`, note: '수정 시간']
}

// ============================================
// 백신 관련 테이블
// ============================================

Table vaccinationTypes {
  id integer [pk, increment, note: '백신 종류 ID']
  animalType text [not null, note: '동물 종류 (dog, cat, rabbit, hamster, bird, other)']
  vaccineNameKor text [not null, note: '백신 한글명']
  vaccineCode text [unique, not null, note: '백신 코드']
  category text [not null, note: '카테고리 (core, recommended, legal)']
  isLegalRequired boolean [default: false, note: '법적 필수 여부']
  isRequired boolean [default: false, note: '필수 여부']
  simpleSchedule text [not null, note: '간단한 일정 설명']
  totalDoses integer [not null, default: 1, note: '총 접종 횟수']
  firstDoseWeeks integer [not null, note: '첫 접종 주차']
  intervalWeeks integer [not null, note: '접종 간격 (주)']
  isBoosterRequired boolean [default: false, note: '부스터 필요 여부']
  boosterInterval text [default: 'yearly', note: '부스터 간격']
  preventsDiseases text [note: '예방 질병 목록 (array)']
  description text [note: '설명']
  rescueCaseMessage text [note: '구조 케이스 안내 메시지']
  createdAt timestamp [default: `now()`, note: '생성 시간']
  updatedAt timestamp [default: `now()`, note: '수정 시간']
}

Table palVaccinations {
  id uuid [pk, note: '백신 접종 기록 ID']
  palId uuid [not null, ref: > palProfiles.palId, note: '반려동물 ID']
  vaccinationTypeId integer [not null, ref: > vaccinationTypes.id, note: '백신 종류 ID']
  shotNumber integer [not null, default: 1, note: '접종 차수']
  scheduledDate date [note: '예정 날짜']
  actualDate date [note: '실제 접종 날짜']
  userCompletedDate date [note: '사용자 완료 날짜']
  completedBy uuid [note: '완료한 사용자 ID']
  completionSource text [default: 'user', note: '완료 출처 (user, vet, admin)']
  isCompleted boolean [default: false, note: '완료 여부']
  hospitalName text [note: '병원 이름']
  veterinarianName text [note: '수의사 이름']
  notes text [note: '메모']
  status text [default: 'scheduled', note: '상태 (scheduled, completed, overdue, skipped)']
  nextDueDate date [note: '다음 예정일']
  reminderSent boolean [default: false, note: '알림 전송 여부']
  isAutoGenerated boolean [default: true, note: '자동 생성 여부']
  generatedFromBirthdate boolean [default: true, note: '생일로부터 생성 여부']
  isManualInput boolean [default: false, note: '수동 입력 여부']
  isRequired boolean [default: true, note: '필수 여부']
  scheduleTime time [note: '예정 시간']
  plannerEventId uuid [ref: > plannerEvents.id, note: '플래너 이벤트 ID']
  createdAt timestamp [default: `now()`, note: '생성 시간']
  updatedAt timestamp [default: `now()`, note: '수정 시간']
}

Table palVaccinationSummary {
  id uuid [pk, note: '백신 요약 ID']
  palId uuid [unique, not null, ref: - palProfiles.palId, note: '반려동물 ID (1:1 관계)']
  coreVaccinesCompleted boolean [default: false, note: '핵심 백신 완료 여부']
  legalVaccinesCompleted boolean [default: false, note: '법적 백신 완료 여부']
  isAdultClassified boolean [default: false, note: '성체 분류 여부']
  adultClassifiedAt timestamp [note: '성체 분류 시간']
  isRescueCase boolean [default: false, note: '구조 케이스 여부']
  needsManualScheduling boolean [default: false, note: '수동 일정 필요 여부']
  schedulingModeChangedAt timestamp [note: '일정 모드 변경 시간']
  lastSchedulingMode text [default: 'auto', note: '마지막 일정 모드 (auto, manual, mixed)']
  totalScheduled integer [default: 0, note: '총 예정된 접종 수']
  totalCompleted integer [default: 0, note: '총 완료된 접종 수']
  totalOverdue integer [default: 0, note: '총 지연된 접종 수']
  completionRate numeric [default: 0.00, note: '완료율 (%)']
  firstVaccinationDate date [note: '첫 접종일']
  lastVaccinationDate date [note: '마지막 접종일']
  nextDueDate date [note: '다음 예정일']
  createdAt timestamp [default: `now()`, note: '생성 시간']
  updatedAt timestamp [default: `now()`, note: '수정 시간']
}

// ============================================
// 플래너 관련 테이블
// ============================================

Table plannerEvents {
  id uuid [pk, note: '플래너 이벤트 ID']
  userId uuid [not null, ref: > profiles.id, note: '사용자 ID']
  palId uuid [ref: > palProfiles.palId, note: '반려동물 ID']
  title text [not null, note: '제목']
  eventDate date [not null, note: '이벤트 날짜']
  eventTime time [note: '이벤트 시간']
  location text [note: '장소']
  memo text [note: '메모']
  eventType text [default: 'general', note: '이벤트 타입 (general, medical, grooming, vaccination, exercise, training, social)']
  priority text [default: 'normal', note: '우선순위 (low, normal, starred)']
  isConsecutive boolean [default: false, note: '연속 이벤트 여부']
  consecutiveGroupId uuid [note: '연속 그룹 ID']
  consecutiveDays integer [note: '연속 일수']
  isCompleted boolean [default: false, note: '완료 여부']
  completedAt timestamp [note: '완료 시간']
  userCompletedDate date [note: '사용자 완료 날짜']
  hasAttachment boolean [default: false, note: '첨부파일 여부']
  reminderMinutes integer [note: '알림 시간 (분)']
  titleVaccin text [note: '백신 제목']
  isVaccineEvent boolean [default: false, note: '백신 이벤트 여부']
  vaccinationId uuid [ref: > palVaccinations.id, note: '백신 ID']
  vaccineUrgencyColor text [note: '백신 긴급도 색상']
  createdAt timestamp [default: `now()`, note: '생성 시간']
  updatedAt timestamp [default: `now()`, note: '수정 시간']
}

Table plannerEventTags {
  id uuid [pk, note: '이벤트 태그 ID']
  eventId uuid [not null, ref: > plannerEvents.id, note: '이벤트 ID']
  tagName text [not null, note: '태그 이름']
  createdAt timestamp [default: `now()`, note: '생성 시간']
}

Table plannerExpenses {
  id uuid [pk, note: '플래너 지출 ID']
  userId uuid [not null, ref: > profiles.id, note: '사용자 ID']
  palId uuid [ref: > palProfiles.palId, note: '반려동물 ID']
  title text [not null, note: '제목']
  amount numeric [not null, note: '금액 (0 이상)']
  currency text [default: 'KRW', note: '통화']
  category text [not null, note: '카테고리']
  expenseDate date [not null, note: '지출 날짜']
  paymentMethod text [default: 'card', note: '결제 방법 (card, cash, transfer, other)']
  location text [note: '장소']
  memo text [note: '메모']
  isRecurring boolean [default: false, note: '반복 여부']
  recurringPeriod text [note: '반복 주기 (weekly, monthly, yearly)']
  hasReceipt boolean [default: false, note: '영수증 여부']
  createdAt timestamp [default: `now()`, note: '생성 시간']
  updatedAt timestamp [default: `now()`, note: '수정 시간']
}

Table plannerExpenseTags {
  id uuid [pk, note: '지출 태그 ID']
  expenseId uuid [not null, ref: > plannerExpenses.id, note: '지출 ID']
  tagName text [not null, note: '태그 이름']
  createdAt timestamp [default: `now()`, note: '생성 시간']
}

// ============================================
// 커뮤니티 관련 테이블
// ============================================

Table communityposts {
  id uuid [pk, note: '커뮤니티 게시글 ID']
  userid uuid [ref: > profiles.id, note: '사용자 ID']
  authortype text [not null, default: 'pal', note: '작성자 타입 (pal, user)']
  authorid uuid [not null, note: '작성자 ID (palId 또는 userId)']
  authorname text [not null, note: '작성자 이름']
  authorimage text [note: '작성자 이미지 URL']
  category text [not null, default: '일상', note: '카테고리']
  title text [not null, note: '제목']
  content text [not null, note: '내용']
  postimages text [note: '게시글 이미지 URL들 (array)']
  likes integer [default: 0, note: '좋아요 수 (deprecated)']
  likescount integer [default: 0, note: '좋아요 수']
  commentscount integer [default: 0, note: '댓글 수']
  ispublic boolean [default: true, note: '공개 여부']
  createdat timestamp [not null, default: `now()`, note: '생성 시간']
  updatedat timestamp [not null, default: `now()`, note: '수정 시간']
}

Table postlikes {
  id uuid [pk, note: '게시글 좋아요 ID']
  postid uuid [ref: > communityposts.id, note: '게시글 ID']
  userid uuid [ref: > profiles.id, note: '사용자 ID']
  createdat timestamp [not null, default: `now()`, note: '생성 시간']
}

Table postcomments {
  id uuid [pk, note: '게시글 댓글 ID']
  postid uuid [ref: > communityposts.id, note: '게시글 ID']
  userid uuid [ref: > profiles.id, note: '사용자 ID']
  username text [not null, note: '사용자 이름']
  usercommunityimage text [note: '사용자 커뮤니티 이미지']
  authortype varchar [default: 'user', note: '작성자 타입']
  authorname varchar [note: '작성자 이름']
  authorimage text [note: '작성자 이미지']
  content text [not null, note: '댓글 내용']
  parentcommentid uuid [ref: > postcomments.id, note: '부모 댓글 ID (대댓글)']
  likescount integer [default: 0, note: '좋아요 수']
  isedited boolean [default: false, note: '수정 여부']
  editedat timestamp [note: '수정 시간']
  createdat timestamp [not null, default: `now()`, note: '생성 시간']
  updatedat timestamp [not null, default: `now()`, note: '수정 시간']
}

Table commentlikes {
  id uuid [pk, note: '댓글 좋아요 ID']
  commentid uuid [not null, ref: > postcomments.id, note: '댓글 ID']
  userid uuid [not null, ref: > profiles.id, note: '사용자 ID']
  createdat timestamp [not null, default: `now()`, note: '생성 시간']
}

// ============================================
// 이벤트 모임 관련 테이블
// ============================================

Table communityevents {
  id uuid [pk, note: '커뮤니티 이벤트 ID']
  organizerid uuid [ref: > profiles.id, note: '주최자 ID']
  organizername text [not null, note: '주최자 이름']
  title text [not null, note: '제목']
  description text [not null, note: '설명']
  eventdate timestamp [not null, note: '이벤트 날짜시간']
  location text [not null, note: '장소']
  latitude numeric [note: '위도']
  longitude numeric [note: '경도']
  maxparticipants integer [note: '최대 참가자 수']
  currentparticipants integer [default: 0, note: '현재 참가자 수']
  category text [not null, default: '모임', note: '카테고리']
  tags text [note: '태그들 (array)']
  imageurl text [note: '이벤트 이미지 URL']
  isactive boolean [default: true, note: '활성 여부']
  createdat timestamp [not null, default: `now()`, note: '생성 시간']
  updatedat timestamp [not null, default: `now()`, note: '수정 시간']
}

Table eventparticipants {
  id uuid [pk, note: '이벤트 참가자 ID']
  eventid uuid [ref: > communityevents.id, note: '이벤트 ID']
  userid uuid [ref: > profiles.id, note: '사용자 ID']
  username text [not null, note: '사용자 이름']
  palname text [note: '반려동물 이름']
  status text [default: 'joined', note: '참가 상태']
  joinedat timestamp [not null, default: `now()`, note: '참가 시간']
}

// ============================================
// 채팅 관련 테이블 (이벤트 채팅)
// ============================================

Table eventchat {
  id uuid [pk, note: '이벤트 채팅 메시지 ID']
  eventid uuid [ref: > communityevents.id, note: '이벤트 ID']
  userid uuid [ref: > profiles.id, note: '사용자 ID']
  username text [not null, note: '사용자 이름']
  useravatar text [note: '사용자 아바타 URL']
  content text [not null, note: '메시지 내용']
  messagetype text [default: 'user', note: '메시지 타입 (user, system, admin)']
  replytomessageid uuid [ref: > eventchat.id, note: '답장 대상 메시지 ID']
  isedited boolean [default: false, note: '수정 여부']
  editedat timestamp [note: '수정 시간']
  reactions jsonb [default: '{}', note: '반응들 (이모지)']
  attachments jsonb [default: '[]', note: '첨부파일들']
  mentions text [default: '{}', note: '멘션된 사용자들 (array)']
  createdat timestamp [not null, default: `now()`, note: '생성 시간']
  updatedat timestamp [not null, default: `now()`, note: '수정 시간']
}

Table chatmessagereads {
  id uuid [pk, note: '채팅 읽음 기록 ID']
  chatid uuid [not null, ref: > eventchat.id, note: '채팅 메시지 ID']
  userid uuid [not null, ref: > profiles.id, note: '읽은 사용자 ID']
  readat timestamp [not null, default: `now()`, note: '읽은 시간']
}

Table eventchatpresence {
  id uuid [pk, note: '이벤트 채팅 접속 상태 ID']
  eventid uuid [not null, ref: > communityevents.id, note: '이벤트 ID']
  userid uuid [not null, ref: > profiles.id, note: '사용자 ID']
  username text [not null, note: '사용자 이름']
  useravatar text [note: '사용자 아바타']
  isonline boolean [default: true, note: '온라인 여부']
  lastseen timestamp [not null, default: `now()`, note: '마지막 접속 시간']
  joinedat timestamp [not null, default: `now()`, note: '참가 시간']
}

Table eventchatsettings {
  eventid uuid [pk, ref: - communityevents.id, note: '이벤트 ID (1:1 관계)']
  allowanonymous boolean [default: false, note: '익명 허용 여부']
  maxmessagelength integer [default: 500, note: '최대 메시지 길이']
  slowmodeseconds integer [default: 0, note: '슬로우 모드 초']
  isarchived boolean [default: false, note: '보관 여부']
  createdat timestamp [not null, default: `now()`, note: '생성 시간']
  updatedat timestamp [not null, default: `now()`, note: '수정 시간']
}

// ============================================
// 라이프스타일 채팅 관련 테이블 (4차 리팩토링)
// ============================================

Table lifestylechatrooms {
  id uuid [pk, note: '라이프스타일 채팅방 ID']
  type varchar [not null, note: '채팅방 타입 (global, location, hashtag)']
  name varchar [not null, note: '채팅방 이름']
  description text [note: '설명']
  centerlat double [note: '중심 위도']
  centerlng double [note: '중심 경도']
  radius integer [note: '반경 (미터)']
  hashtag varchar [note: '해시태그']
  participantcount integer [default: 0, note: '참가자 수']
  messagecount integer [default: 0, note: '메시지 수']
  isactive boolean [default: true, note: '활성 여부']
  createdby uuid [ref: > profiles.id, note: '생성자 ID']
  createdat timestamp [not null, default: `now()`, note: '생성 시간']
  updatedat timestamp [not null, default: `now()`, note: '수정 시간']
}

Table lifestylechatparticipants {
  id uuid [pk, note: '라이프스타일 채팅 참가자 ID']
  roomid uuid [not null, ref: > lifestylechatrooms.id, note: '채팅방 ID']
  userid uuid [not null, ref: > profiles.id, note: '사용자 ID']
  currentlat double [note: '현재 위도']
  currentlng double [note: '현재 경도']
  isonline boolean [default: true, note: '온라인 여부']
  lastseen timestamp [not null, default: `now()`, note: '마지막 접속 시간']
  lastreadat timestamp [not null, default: `now()`, note: '마지막 읽은 시간']
  unreadcount integer [default: 0, note: '읽지 않은 메시지 수']
  joinedat timestamp [not null, default: `now()`, note: '참가 시간']
  lastreadaltat timestamp [default: `now()`, note: '마지막 읽은 시간 (별도)']
}

Table lifestylechatmessages {
  id uuid [pk, note: '라이프스타일 채팅 메시지 ID']
  roomid uuid [not null, ref: > lifestylechatrooms.id, note: '채팅방 ID']
  userid uuid [not null, ref: > profiles.id, note: '사용자 ID']
  authorname varchar [not null, note: '작성자 이름']
  authorimage text [note: '작성자 이미지']
  authortype varchar [default: 'user', note: '작성자 타입 (user, pal)']
  content text [not null, note: '메시지 내용']
  messagetype varchar [default: 'user', note: '메시지 타입 (user, system, admin)']
  attachments jsonb [default: '[]', note: '첨부파일들']
  mentions text [note: '멘션된 사용자들 (array)']
  replytomessageid uuid [ref: > lifestylechatmessages.id, note: '답장 대상 메시지 ID']
  reactions jsonb [default: '{}', note: '반응들']
  isedited boolean [default: false, note: '수정 여부']
  editedat timestamp [note: '수정 시간']
  createdat timestamp [not null, default: `now()`, note: '생성 시간']
}

// ============================================
// 알림 관련 테이블
// ============================================

Table chatnotifications {
  id uuid [pk, note: '채팅 알림 ID']
  recipientid uuid [not null, ref: > profiles.id, note: '수신자 ID']
  senderid uuid [not null, ref: > profiles.id, note: '발신자 ID']
  chatid uuid [not null, ref: > eventchat.id, note: '채팅 메시지 ID']
  eventid uuid [not null, ref: > communityevents.id, note: '이벤트 ID']
  notificationtype varchar [not null, note: '알림 타입']
  isread boolean [default: false, note: '읽음 여부']
  createdat timestamp [not null, default: `now()`, note: '생성 시간']
}

Table commentnotifications {
  id uuid [pk, note: '댓글 알림 ID']
  recipientid uuid [not null, ref: > profiles.id, note: '수신자 ID']
  senderid uuid [not null, ref: > profiles.id, note: '발신자 ID']
  commentid uuid [not null, ref: > postcomments.id, note: '댓글 ID']
  postid uuid [not null, ref: > communityposts.id, note: '게시글 ID']
  notificationtype varchar [not null, note: '알림 타입']
  isread boolean [default: false, note: '읽음 여부']
  createdat timestamp [not null, default: `now()`, note: '생성 시간']
}

Table notificationsettings {
  id uuid [pk, note: '알림 설정 ID']
  userid uuid [unique, not null, ref: > profiles.id, note: '사용자 ID']
  commentnotifications boolean [default: true, note: '댓글 알림']
  likenotifications boolean [default: true, note: '좋아요 알림']
  mentionnotifications boolean [default: true, note: '멘션 알림']
  eventnotifications boolean [default: true, note: '이벤트 알림']
  chatnotifications boolean [default: true, note: '채팅 알림']
  lifestylenotifications boolean [default: true, note: '라이프스타일 알림']
  pushenabled boolean [default: true, note: '푸시 알림 활성화']
  emailenabled boolean [default: false, note: '이메일 알림 활성화']
  quiethoursenabled boolean [default: false, note: '조용한 시간 활성화']
  quiethoursstart time [note: '조용한 시간 시작']
  quiethoursend time [note: '조용한 시간 종료']
  locationenabled boolean [default: true, note: '위치 기반 알림']
  createdat timestamp [default: `now()`, note: '생성 시간']
  updatedat timestamp [default: `now()`, note: '수정 시간']
}

Table usernotifications {
  id uuid [pk, note: '사용자 알림 ID']
  recipientuserid uuid [not null, ref: > profiles.id, note: '수신자 사용자 ID']
  actoruserid uuid [ref: > profiles.id, note: '행동한 사용자 ID']
  actorname text [not null, note: '행동한 사용자 이름']
  actorimage text [note: '행동한 사용자 이미지']
  palId uuid [ref: > palProfiles.palId, note: '관련 반려동물 ID']
  notificationtype text [not null, note: '알림 타입 (comment, reply, like, mention, event_join, chat_message, follow, vaccination, planner)']
  notificationtitle text [not null, note: '알림 제목']
  notificationbody text [note: '알림 본문']
  notificationimage text [note: '알림 이미지']
  relatedpostid uuid [ref: > communityposts.id, note: '관련 게시글 ID']
  relatedcommentid uuid [ref: > postcomments.id, note: '관련 댓글 ID']
  relatedeventid uuid [note: '관련 이벤트 ID']
  targeturl text [note: '이동할 URL']
  isread boolean [default: false, note: '읽음 여부']
  isdelivered boolean [default: false, note: '전달 여부']
  createdat timestamp [default: `now()`, note: '생성 시간']
  readat timestamp [note: '읽은 시간']
  expiresat timestamp [note: '만료 시간 (30일)']
}

// ============================================
// 통합 해시태그 시스템 (4차 확장: 4개 영역)
// ============================================

Table globalHashtags {
  id uuid [pk, note: '글로벌 해시태그 ID']
  tagName text [unique, not null, note: '태그 이름 (고유)']
  userId uuid [ref: > profiles.id, note: '생성한 사용자 ID']
  palId uuid [ref: > palProfiles.palId, note: '관련 반려동물 ID']
  totalUsageCount integer [default: 1, note: '총 사용 횟수']
  weeklyUsageCount integer [default: 1, note: '주간 사용 횟수']
  monthlyUsageCount integer [default: 1, note: '월간 사용 횟수']
  primaryCategory text [default: 'general', note: '주요 카테고리']
  subCategories text [default: '{}', note: '하위 카테고리들 (array)']
  isRecommended boolean [default: false, note: '추천 여부']
  confidenceScore numeric [default: 0.50, note: '신뢰도 점수']
  relatedTags text [default: '{}', note: '관련 태그들 (array)']
  coOccurrenceTags jsonb [default: '{}', note: '동시 출현 태그들']
  lastUsed timestamp [default: `now()`, note: '마지막 사용 시간']
  firstUsed timestamp [default: `now()`, note: '첫 사용 시간']
  createdAt timestamp [default: `now()`, note: '생성 시간']
  updatedAt timestamp [default: `now()`, note: '수정 시간']
}

Table communityPostHashtags {
  postId uuid [ref: > communityposts.id, note: '게시글 ID']
  tagName text [ref: > globalHashtags.tagName, note: '태그 이름']
  extractionMethod text [default: 'auto', note: '추출 방법 (auto, manual)']
  positionInText integer [default: 0, note: '텍스트 내 위치']
  context text [note: '컨텍스트']
  createdAt timestamp [default: `now()`, note: '생성 시간']

  indexes {
    (postId, tagName) [pk]
  }
}

Table plannerEventHashtags {
  eventId uuid [ref: > plannerEvents.id, note: '이벤트 ID']
  tagName text [ref: > globalHashtags.tagName, note: '태그 이름']
  createdAt timestamp [default: `now()`, note: '생성 시간']

  indexes {
    (eventId, tagName) [pk]
  }
}

Table plannerExpenseHashtags {
  expenseId uuid [ref: > plannerExpenses.id, note: '지출 ID']
  tagName text [ref: > globalHashtags.tagName, note: '태그 이름']
  createdAt timestamp [default: `now()`, note: '생성 시간']

  indexes {
    (expenseId, tagName) [pk]
  }
}

Table lifestylechatmessagehashtags {
  messageid uuid [ref: > lifestylechatmessages.id, note: '메시지 ID']
  tagname text [ref: > globalHashtags.tagName, note: '태그 이름']
  extractionmethod text [default: 'auto', note: '추출 방법 (auto, manual)']
  positionintext integer [default: 0, note: '텍스트 내 위치']
  context text [note: '컨텍스트']
  createdat timestamp [default: `now()`, note: '생성 시간']

  indexes {
    (messageid, tagname) [pk]
  }

  Note: '4차 신규: 라이프스타일 채팅 해시태그 자동 추출 (DB 트리거)'
}

// ============================================
// 파일 및 RAG 관련 테이블
// ============================================

Table file_metadata {
  id uuid [pk, note: '파일 메타데이터 ID']
  file_url text [not null, note: '파일 URL']
  file_name text [not null, note: '파일 이름']
  file_path text [not null, note: '파일 경로']
  file_type text [not null, note: '파일 타입']
  file_size bigint [not null, note: '파일 크기 (bytes)']
  uploaded_by uuid [ref: > profiles.id, note: '업로드한 사용자 ID']
  uploaded_at timestamp [default: `now()`, note: '업로드 시간']
  upload_ip text [note: '업로드 IP 주소']
  entity_type text [note: '연결된 엔티티 타입']
  entity_id uuid [note: '연결된 엔티티 ID']
  image_width integer [note: '이미지 너비 (픽셀)']
  image_height integer [note: '이미지 높이 (픽셀)']
  image_hash text [note: '이미지 해시 (SHA-256)']
  thumbnail_url text [note: '썸네일 URL']
  video_duration integer [note: '비디오 길이 (초)']
  video_codec text [note: '비디오 코덱']
  is_public boolean [default: true, note: '공개 여부']
  is_deleted boolean [default: false, note: '삭제 여부']
  deleted_at timestamp [note: '삭제 시간']
  download_count integer [default: 0, note: '다운로드 횟수']
  view_count integer [default: 0, note: '조회 횟수']
  ai_tags text [note: 'AI 자동 태그들 (array)']
  ai_is_safe boolean [default: true, note: 'AI 안전 여부']
  ai_analysis jsonb [note: 'AI 분석 결과']
  metadata jsonb [note: '기타 메타데이터']
  mime_type text [note: 'MIME 타입']
  bucket_name text [note: 'Supabase 버킷 이름']
}

Table pet_knowledge_base {
  id uuid [pk, note: 'RAG 지식 베이스 ID']
  content text [not null, note: '콘텐츠 내용']
  hashtags text [note: '해시태그들 (array)']
  source text [not null, note: '소스 (community, manual, faq, youtube, lifestyle)']
  source_id uuid [note: '소스 ID']
  source_url text [note: '소스 URL']
  metadata jsonb [default: '{}', note: '메타데이터']
  embedding text [note: 'Vector embedding (pgvector)']
  is_verified boolean [default: false, note: '검증 여부']
  verified_by uuid [ref: > profiles.id, note: '검증한 사용자 ID']
  quality_score numeric [default: 0.50, note: '품질 점수']
  created_at timestamp [default: `now()`, note: '생성 시간']
  updated_at timestamp [default: `now()`, note: '수정 시간']
}

// ============================================
// 주석: 관계 요약 (4차 업데이트)
// ============================================
// 1. profiles -> palProfiles (1:N) - 사용자가 여러 반려동물 소유
// 2. palProfiles -> palVaccinations (1:N) - 반려동물이 여러 백신 접종
// 3. profiles -> communityposts (1:N) - 사용자가 여러 게시글 작성
// 4. communityposts -> postcomments (1:N) - 게시글에 여러 댓글
// 5. profiles -> plannerEvents (1:N) - 사용자가 여러 일정 관리
// 6. globalHashtags -> 4개 연결 테이블 (1:N) - 통합 해시태그 시스템 ⭐
//    - communityPostHashtags (커뮤니티)
//    - plannerEventHashtags (플래너 일정)
//    - plannerExpenseHashtags (지출)
//    - lifestylechatmessagehashtags (라이프스타일 채팅) ⭐ 4차 신규
// 7. communityevents -> eventchat (1:N) - 이벤트에 채팅 메시지들
// 8. lifestylechatrooms -> lifestylechatmessages (1:N) - 채팅방에 메시지들
// 9. lifestylechatmessages -> lifestylechatmessagehashtags (1:N) - 메시지에 해시태그들 ⭐ 4차 신규
