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
	<title>다나와유 로그인 페이지</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=1260" />
	<meta name="Keywords" content="가격비교사이트, 가격비교 싸이트, 가격 검색, 최저가,추천,인터넷쇼핑,온라인쇼핑,쇼핑, 조립PC,피씨,컴퓨터,조립컴퓨터,부품,주변기기,PC세트,중고,호환, PC방, 조립견적, 용산, 용산전자상가, mp3,엠피쓰리,가전, 디카,디지털카메라,디지탈카메라,노트북,랩탑,핸드폰,휴대폰,게임,자동차,쇼핑포탈,쇼핑포털,공짜폰, 특가폰, 네비게이션,고진샤, 하이얼,미니오븐,서브노트북, 스카이,모토로라, 엑스박스,xbox, 애니콜,사이언,싸이언,삼성전자,엘지전자, lcd 모니터,무선 공유기,DSLR, 닌텐도DS,엑스노트,매직스테이션,divx,T-flash,microSD,김치냉장고,냉장고,네비게이션,노트북,디오스,딤채,만도,샤프,아이나비,아이리버,아이팟,에이원 ,위니아,지펠,청풍,캐논,니콘,쿠쿠,테팔,하우젠,휘센,가구,가스레인지,가스렌지,가스오븐렌지,공기청정기,그래픽카드,기저귀,분유,,듀오백,드럼세탁기,등산화,디지털카메라,디지털TV,PDP, LCD,디카,마우스,메인보드,면도기,모니터,믹서,스키복,보행기,복사기,복합기,분유,선풍기,세탁기,소파,스캐너,식기세척기,악기,에어컨,에어콘,엠피쓰리,오디오,오븐레인지,워크맨,이어폰, 유모차 사무용가구,인라인,인라인스케이트,자동차용품,자전거,전기밥솥,전동칫솔,전자레인지,전자사전,전화기,정수기,이온수기,비데,책상,청소기,침대,캠코더,커피메이커,팩스,프린터,플레이스테이션,플스,하드디스크,향수,홈씨어터,화장대,화장품,휴대폰,핸드폰,dmb,dvd플레이어,gps,hdd,PSP" />
	<meta name="Description" content="다나와유는 온라인 전제품에 대한 가격비교 사이트 입니다. 안전구매시스템(전자보증,Escrow)을 갖춘 쇼핑몰의 최저 가격 정보를 보여드리며, 다양한 각도의 상품 사진, 상세 설명, 소비자 의견 등을 한곳에서 볼 수 있습니다. 즐거운 비교 쇼핑,다나와!" />
	
	<link rel="shortcut icon" href="/resources/img/8651574782_7d7d5261-303c-4a51-b4f2-1d6be0844973.png" />
	<script type="text/javascript" src="/resources/js/util/envUtils.js?v=10"></script>
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="/resources/login/css/login.css">

<div id="container" class="container content__login">
	<form class="login_form" action="/login" id="danawa-member-login-loginForm" method="post">
	<input type="hidden" id="danawa-member-login-redirectUrl" name="redirectUrl" value="https://www.danawa.com/" />
                <input type="hidden" id="danawa-member-login-dm" name="dm" value="" />
                
<!--                 <div class="select_area"> -->
<!--             <span class="chk_w"> -->
<!--                         <input type="checkbox" name="autoLogin" id="danawa-member-login-autoLogin" value="true" data-gtm-form-interact-field-id="2"> -->
<!--                         <label for="danawa-member-login-autoLogin" class="ico">로그인 상태 유지</label> -->
<!--                     </span> -->
             
        </div>
                
		<div class="id_area">	
			<div class="input_wrap" id="danawa-member-login-loginIdInputArea">
			
			<span class="input_box">
				<label for="name" class="lb" style="display:block;"></label>
				<input type="text" id="id" maxlength="40" name="id" class="int"
                        placeholder="아이디/인증 이메일" value="" required="required">
				<button type="button" id="danawa-member-login-input-id-del" class="btn_del"><span
                            class="ico i_del"></span></button>			
				   </span>
				   
				  <button type="button" class="btn_pwview btn_idsave" id="danawa-member-login-saveId">저장</button>
                <input type="hidden" name="isSaveId" id="danawa-member-login-input-saveId" value="">						
				</div>
			</div>
			
			 <div class="pw_area">
            <div class="input_wrap" id="danawa-member-login-loginPwdInputArea">
            
				<span class="input_box">
                    <label for="name" class="lb"
                        style="display:block;"></label><!-- input 입력시 display:none; -->
                    <input type="password" maxlength="20" id="pwd" name="pwd" class="int"
                        placeholder="비밀번호" required="required"><!-- 표시 버튼 체크하면 input type="text" 로 변경 -->
                    <button type="button" id="danawa-member-login-input-pwd-del" class="btn_del"><span
                            class="ico i_del"></span></button><!-- 입력시 on 클래스 추가 -->
                </span>
				</div>
			</div>		
					
			 <div class="txt_error_area" id="danawa-member-login-error-area" style="display: none;">
            <p class="err_txt" id="danawa-member-login-error-message"></p>
        </div>
        <button type="submit" class="btn_login" id="login" >로그인</button>
        <a href="register">
        <button type="button" class="btn_login" >회원 가입</button></a> 

			
			  <div class="sns_area content__sns" id="danawa-member-login-loginSnsArea">
            <div class="box__sns">
                <a href="javascript:;" class="link_sns_btn link__sns link__sns--naver"
                    id="danawa-member-login-snsButton-naver" onclick="setGtagEvent('로그인_네이버로그인');">
                    <img src="/resources/login/images/naverlogin2.png"
				data-src="/resources/login/images/naverlogin2.png" alt="네이버로그인" class="">
<!--                     <div class="thumb__sns"></div> -->
<!--                     <span class="title__sns">네이버 로그인</span> -->
							<span>네이버 로그인</span> 
                </a>
                <div class="box__tooltip " id="box__tooltip-naver">
                    <span class="text__history">마지막 로그인</span>
                    <button type="button" class="button__close" onclick="closeTooltip();"><span
                            class="blind">닫기</span></button>
                </div>
            </div>
            
            <div class="box__sns">
                <a href="javascript:;" class="link_sns_btn link__sns link__sns--kakao"
                    id="danawa-member-login-snsButton-kakao" onclick="setGtagEvent('로그인_카카오로그인');">
                    <img src="/resources/login/images/kakaologin2.png"
				data-src="/resources/login/images/kakaologin2.png" alt="카카오로그인" class="">
<!--                     <div class="thumb__sns"></div> -->
                    <span class="title__sns">카카오 로그인</span>
<!--                     <span>카카오 로그인</span> -->
                </a>
                <div class="box__tooltip " id="box__tooltip-kakao">
                    <span class="text__history">마지막 로그인</span>
                    <button type="button" class="button__close" onclick="closeTooltip();"><span
                            class="blind">닫기</span></button>
                </div>
            </div>
            
            <div class="box__sns">
                <a href="javascript:;" class="link_sns_btn link__sns link__sns--facebook"
                    id="danawa-member-login-snsButton-facebook" onclick="setGtagEvent('로그인_페이스북로그인');">
                    <img src="/resources/login/images/facebooklogin2.png"
				data-src="/resources/login/images/facebooklogin2.png" alt="페이스북로그인" class="">
<!--                     <div class="thumb__sns"></div> -->
<!--                     <span class="title__sns">페이스북 로그인</span> -->
                    <span">페이스북 로그인</span>
                </a>
                <div class="box__tooltip " id="box__tooltip-facebook">
                    <span class="text__history">마지막 로그인</span>
                    <button type="button" class="button__close" onclick="closeTooltip();"><span
                            class="blind">닫기</span></button>
                </div>
            </div>
			
			<div>${message}</div>
		</div>
		
	</form>
	
	</body>
</html>
