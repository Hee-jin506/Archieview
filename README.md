# 🎞 **Archiview : 영화 후기 SNS 플랫폼 프로젝트** 🎞

![](https://github.com/Hee-jin506/Archiview/blob/main/Archiview_jpg/1.%EB%A1%9C%EA%B7%B8%EC%95%84%EC%9B%83%20%EC%83%81%ED%83%9C%ED%99%94%EB%A9%B4%20%EB%A0%88%EC%9D%B4%EC%95%84%EC%9B%83%203.jpg?raw=true )

## 🎥 <기획 단계> 🎥

### 🎞 문제 현황

- `네이버 영화 / 다음 영화`
  
  - 특정 영화들의 후기들에서 지정한 평점이 그 영화를 대표하는 평점으로 나타나고, 네이버 영화는 이 평점이 랭킹에 반영되기 때문에 평점의 존재감이 크다. 따라서 사용자들이 후기를 작성할 때 **평점과 평가적인 내용에 집중하도록** 유도된다.
  
- 특정 회원의 후기를 조회하려면, 특정 영화 페이지로 들어가서 특정 후기 정보 우측에 있는 아이디(gml****)를 클릭해야 한다. 즉, **회원을 기준으로 후기를 조회하는 방법이 번거로우며**, 특히 영화 페이지에 들어가지 않고 사용자가 원하는 회원의 후기를 볼 수 있는 방법이 없다.
  - **사용자가 좋아하는 후기를 저장하는 기능이 없으므로** 영화 페이지에 들어가지 않고는 바로 후기를 볼 수 없을 뿐만 아니라, 사용자가 이전에 보았던 후기를 영화 페이지에서 직접 찾아야한다. 
  - 사용자가 원하는 내용이 포함된 **후기를 검색하는 기능**이 없다.

- `왓챠 피디아`

  - 후기에서 작성자의 구체적인 정보가 드러나지만, 이 계정을 클릭하면 그 회원이 후기를 작성한 영화만 알 수 있으며, **그 회원이** **작성한 후기를 편리하게 모아 볼 수 있는 기능이 없다.**

  - 사용자를 검색하는 기능은 있으나 **후기를 검색하는 기능**이 없다.

    

___

### 🎞 주요 기능

#### 일반 회원

- ***후기에 감성 더하기*** : 지나치게 영화 중심적인 기존 서비스들에 비해, 영화 후기에 무게를 둠으로써 후기 자체의 개성과 감성을 부각하여 사용자들이 후기를 정성들여 작성할 수 있도록 한다.
- `후기 편집 기능` : 영화 후기를 작성할 때, 자신이 작성할 영화의 스틸컷 중 하나를 골라 그 위에 자유롭게 텍스트를 편집할 수 있다. `인스타그램 게시물 편집 화면, 모씨(MOCI) 게시물 편집 화면 벤치마킹`
  - `평점 생략` : 평점 기능을 삭제함으로써 평가적인 내용의 존재감을 줄인다.
- ***SNS 형식과 결합*** : SNS 형식을 빌려 후기를 서로 공유하는 문화를 활성화하고, 팔로우 기능과 함께 인기가 많은 회원을 랭킹으로 띄움으로써 오피니언 리더를 자연스럽게 형성시켜 사용자들이 더 멋진 후기를 작성하도록 유도한다.
- `메인 피드` : 최대한 다양한 회원들의 후기가 서로에게 공유될 수 있도록, 메인 화면에서 나타나는 후기들은 사용자의 팔로우 여부와 무관하게 가장 최근에 업로드된 순서대로 나타난다.
  - `계정 관리 기능` : 사용자가 아카이뷰 플랫폼에서 계정을 생성하고 관리할 수 있으며, 서비스를 이용하기 위해서는 로그인을 반드시 하도록 제약된다.
  - `타회원 팔로우 기능` : 원하는 회원을 팔로우하고, ''팔로우한 회원의 피드'에서 자신이 팔로우한 회원들의 게시물들을 최근순으로 모아볼 수 있다. 각 계정의 팔로워 수는 회원의 인기도에 반영된다. `트위터, 인스타그램 벤치마킹`
  - `프로필 관리 기능` : 회원 이름과 한줄 소개, 이미지, 사용자를 팔로우한 회원들과 사용자가 팔로우한 회원들의 목록, 그리고 사용자가 개인 저장소에 저장한 후기 목록이 프로필에 나타난다. `트위터, 인스타그램, 페이스북 등 각종 SNS 벤치마킹`
  - `개인 저장소 관리 기능` : 영화, 회원에 상관 없이, 원하는 후기들을 개인 저장소에 저장하면, 언제든지 본인의 프로필에서 후기들을 모아볼 수가 있다. `인스타그램 저장소 벤치마킹`
  - `게시물 추천 기능` : 영화 후기가 마음에 들면, 해당 후기를 추천할 수 있으며 각 게시물의 추천수가 회원의 인기도에 반영된다. `각종 SNS 벤치마킹`
  - `태그 기능` : 후기를 업로드할 때마다 태그를 새로 생성하거나, 기존에 있는 태그를 달 수 있으며, 이 태그를 기준으로 게시물이 검색된다. `인스타그램, 트위터 벤치마킹`

  - `검색 기능` : 검색어가 #으로 시작하면, 검색어가 포함된 태그를 갖는 게시물을 검색할 수 있으며, #으로 시작하지 않으면 검색어가 포함된 이름을 갖는 회원과 검색어가 포함된 제목을 갖는 영화의 정보를 검색할 수 있다. `인스타그램, 트위터 벤치마킹`
  - `인기 랭킹 조회 기능` : 회원, 태그, 영화 별로 인기도를 관리함으로써 사용자가 가장 인기도가 높은 회원, 태그, 영화들을 조회할 수 있도록 한다. `트위터 벤치마킹`
  - `알림 기능` : 타 회원이 사용자의 게시물을 추천하거나 사용자를 팔로우할 경우 해당 소식을 사용자에게 알리고, 해당 회원의 정보를 조회할 수 있다. `인스타그램 벤치마킹`
- ***후기와 연결된 영화 정보*** : 영화에 대한 후기 뿐만 아니라, 영화의 기본 정보도 함께 관리함으로써 영화별로 후기들을 모아보거나, 반대로 사용자가 후기를 보고 영화가 궁금해지면 바로 영화 정보를 확인할 수 있도록 한다.
- `영화 정보 조회 기능` : 한국에서 상영한 대부분의 영화들의 기본 정보를 조회할 수 있는 페이지가 제공되고, 각 영화에 대해 업로드된 후기들을 모아볼 수 있다. `왓챠, 왓챠 피디아, 넷플릭스 벤치마킹`

#### 관리자

- ***기본적인 데이터 관리*** : 관리자는 아카이뷰에서 관리하고 있는 회원, 게시물, 영화, 태그를 검색, 상세 조회, 블락할 수 있다. 아카이뷰는 회원들이 주도적으로 문화를 이끌어가는 SNS 플랫폼이므로, 관리자가 적극적인 정보 수정이 불가능하게 제약한다. 가령, 관리자는 회원, 게시물, 영화, 태그들을 등록하거나 수정할 수 없다. 데이터의 블락은 물리적인 데이터 삭제가 아니라, 해당 데이터를 무효화하는 기능이며, 데이터의 물리적인 삭제로 인한 연관 정보의 손상을 방지하기 위함이다.
  - 회원관리 기능 : 특정 회원을 번호, 이름, 이메일, 등록일로 검색할 수 있고, 부적절한 활동 이력이 있는 회원을 블락할 수 있다.
  - 게시물 관리 기능: 특정 게시물을 번호, 작성자, 영화, 등록일로 검색할 수 있고, 부적절한 내용이 있는 게시물을 블락할 수 있다.
  - 영화 관리 기능 : 특정 영화를 번호, 제목, 등록일로 검색할 수 있고, 부적절한 영화를 블락할 수 있다.
  - 태그 관리 기능 : 특정 태그를 번호, 태그명, 등록일로 검색할 수 있고, 부적절한 태그를 블락할 수 있다.

- ***플랫폼에서 발생하는 데이터 통계 조회*** : 관리자가 회원이나, 게시물, 영화, 태그 관리에 적극적으로 개입하지 않는 대신, 회원들의 SNS 활동 중에 발생하는 다양한 데이터를 제공받는다. 이를 통해 관리자는 플랫폼의 전반적인 운영 현황을 확인하고, SNS 서비스 이외에도 영화 관련 비즈니스로 확장할 수 있는 아이디어를 얻을 수 있다.
  - 회원 관련 통계 조회 기능 : 최근 일주일/한달 간 일일 방문자와 일일 회원 가입 수의 추이를 그래프로 나타낸다. 
  - 게시물 관련 통계 조회 기능 : 최근 일주일/한달 간 게시물 일일 등록 수의 추이를 그래프로 나타낸다.
  - 영화 관련 통계 조회 기능 : 관리자가 입력한 기간 동안. 가장 게시물이 많이 달린 영화의 순위를 10위까지 그래프로 나타낸다.
  - 태그 관련 통계 조회 기능 : 관리자가 입력한 기간 동안, 가장 게시물이 많이 달린 태그의 순위를 10위까지 그래프로 나타낸다.

___

### 🎞 선택 기능

#### 일반 회원

- 신고 기능 : 사용자가 부적절한 게시물을 발견하면 게시물을 신고할 수 있다. 또한, 부적절한 태그나 영화에 대해서도 신고할 수 있다. 
- 댓글 기능 : 게시물에 대하여 댓글을 달 수 있다.
- 인기 급상승 게시물 피드 : 최근에 인기도가 급격히 오르는 게시물들을 인기순으로 띄우는 피드를 제공한다.
- 태그 팔로우 기능 : 사용자 뿐만 아니라 태그도 팔로우 할 수 있도록 한다.
- 댓글 좋아요 기능 : 게시물 뿐만 아니라 댓글도 좋아요를 누를 수 있도록 한다.
<details>
   - 팔로우 : Followable 테이블 생성 -> 회원 테이블뿐만 아니라 태그 테이블이나 다른 테이블을 Followable의 자식으로 만듬 -> 회원과 Followable의 다대다 관계 해소
   - 좋아요 : Likeable 테이블 생성 -> 게시물 테이블뿐만 아니라 댓글 테이블이나 다른 테이블을 Likeable의 자식으로 만듬 ->  회원과 Likable의 다대다 관계 해소
   - 참고 : https://stackoverrun.com/ko/q/3100055)
</details>
- 카드 편집 기능 : 카드 편집 화면에 다음과 같은 편집 툴을 제공한다.
  - 텍스트 폰트
  - 텍스트 위치
  - 스티커
  - 필터
 
#### 관리자

- 신고 접수/처리 기능 : 관리자가 일반 회원이 게시물이나, 태그, 영화에 대해서 신고한 이력을 확인하고, 해당 게시물, 태그, 영화를 편리하게 블락할 수 있다.
- 게시물 인기도 통계 조회 : 관리자가 입력한 기간 동안, 가장 추천수를 많이 받은 게시물을 10위까지 그래프로 나타낸다.
- 태그의 인기도 통계 조회 : 각 태그에 대하여 태그된 게시물 개수 + 태그 팔로우 수를 갖고 인기도를 계산하여 그래프로 나타낸다.



___

### 🎞 화면

- 메인 화면

![]( https://github.com/Hee-jin506/Archiview/blob/main/Archiview_jpg/2.%EB%A9%94%EC%9D%B8%EB%A9%94%EC%9D%B8%20(%EC%A2%8B%EC%95%84%EC%9A%94&%ED%8C%94%EB%A1%9C%EC%9A%B0%20%EC%95%88%20%EB%88%84%EB%A5%B8%20%EA%B2%83)!!!!!!!!.jpg?raw=true )

___





