<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html lang="ko">
<head>
</head>
<body class="body__login">

<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WLPCFBQ"
                  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
    <!-- login_wrap -->
    <div id="wrap" class="login_wrap">
        <!-- header -->
        <div id="header" class="header__login">
            <h1 class="logo"><a href="home" class="ico h_logo"><span class="blind">DANAWA</span></a></h1>
            <h2 class="s_tit blind">로그인</h2>
                    
	<meta charset="UTF-8">
	<title>다나와 로그인 페이지</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=1260" />
	<meta name="Keywords" content="가격비교사이트, 가격비교 싸이트, 가격 검색, 최저가,추천,인터넷쇼핑,온라인쇼핑,쇼핑, 조립PC,피씨,컴퓨터,조립컴퓨터,부품,주변기기,PC세트,중고,호환, PC방, 조립견적, 용산, 용산전자상가, mp3,엠피쓰리,가전, 디카,디지털카메라,디지탈카메라,노트북,랩탑,핸드폰,휴대폰,게임,자동차,쇼핑포탈,쇼핑포털,공짜폰, 특가폰, 네비게이션,고진샤, 하이얼,미니오븐,서브노트북, 스카이,모토로라, 엑스박스,xbox, 애니콜,사이언,싸이언,삼성전자,엘지전자, lcd 모니터,무선 공유기,DSLR, 닌텐도DS,엑스노트,매직스테이션,divx,T-flash,microSD,김치냉장고,냉장고,네비게이션,노트북,디오스,딤채,만도,샤프,아이나비,아이리버,아이팟,에이원 ,위니아,지펠,청풍,캐논,니콘,쿠쿠,테팔,하우젠,휘센,가구,가스레인지,가스렌지,가스오븐렌지,공기청정기,그래픽카드,기저귀,분유,,듀오백,드럼세탁기,등산화,디지털카메라,디지털TV,PDP, LCD,디카,마우스,메인보드,면도기,모니터,믹서,스키복,보행기,복사기,복합기,분유,선풍기,세탁기,소파,스캐너,식기세척기,악기,에어컨,에어콘,엠피쓰리,오디오,오븐레인지,워크맨,이어폰, 유모차 사무용가구,인라인,인라인스케이트,자동차용품,자전거,전기밥솥,전동칫솔,전자레인지,전자사전,전화기,정수기,이온수기,비데,책상,청소기,침대,캠코더,커피메이커,팩스,프린터,플레이스테이션,플스,하드디스크,향수,홈씨어터,화장대,화장품,휴대폰,핸드폰,dmb,dvd플레이어,gps,hdd,PSP" />
	<meta name="Description" content="다나와는 온라인 전제품에 대한 가격비교 사이트 입니다. 안전구매시스템(전자보증,Escrow)을 갖춘 쇼핑몰의 최저 가격 정보를 보여드리며, 다양한 각도의 상품 사진, 상세 설명, 소비자 의견 등을 한곳에서 볼 수 있습니다. 즐거운 비교 쇼핑,다나와!" />
	
	<link rel="shortcut icon" href="/resources/img/8651574782_7d7d5261-303c-4a51-b4f2-1d6be0844973.png" />
	<script type="text/javascript" src="/resources/js/util/envUtils.js?v=10"></script>
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="/resources/login/css/login.css">

	<div style="height:20px"></div>
	<form action="login" method="post">
		<div class="box-body">	
			<div class="form-group row">
				<label for="name" class="col-sm-2 col-form-label">아이디</label>
				<div class="col-sm-10">
				<input type="text" name="id" id="id" size="22" required
				class="form-control" maxlength='20'  placeholder="아이디 입력">										
				</div>
			</div>
			<div style="height:20px"></div>
			<div class="form-group row">
				<label for="name" class="col-sm-2 col-form-label">패스워드</label>
				<div class="col-sm-10">
				<input type="password" name="pwd" id="pwd" size="22" required
				class="form-control" maxlength='20'  placeholder="패스워드 입력">										
				</div>
			</div>				
			<div style="height:20px"></div>
			<div class="form-group text-center">
				<button type="submit" class="btn btn-primary">로 그 인</button>
				<button type="reset" class="btn btn-danger">초 기 화</button>
			</div>
			<div style="height:20px"></div>
			<div>${message}</div>
		</div>
	</form>
	
	</body>
</html>
