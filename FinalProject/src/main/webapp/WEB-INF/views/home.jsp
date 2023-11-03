<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<hr class="my-4">

<!-- 왼쪽 카테고리 부분 -->
<div id="wrap">
	<header>
		<div class="head">
			<div class="navi_box">
				<ul>
					<c:forEach items="${list}" var="cate">
						<li><a href="#">${cate.ptype1}</a>
							<ul class="sub">
								<c:forEach items="${cate.ptype2}" var="scate">
									<li><a href="productList?ptype2=${scate.ptype2}">${scate.ptype2}</a></li>
								</c:forEach>
							</ul></li>
					</c:forEach>
				</ul>
			</div>
			<!-- 메뉴 navi_box-->
		</div>
		<!-- head -->
	</header>

	<section>
		<div class="slide"></div>
	</section>

	<section>
		<div class="contents">
			<ul class="c_box">
				<li></li>
				<!-- 공지사항/갤러리-->
				<li></li>
				<!-- 배너 -->
				<li></li>
				<!-- 바로가기아이콘 -->
			</ul>
		</div>
	</section>

	<footer>
		<div class="copyright">
			<ul class="f_box">
				<li></li>
				<!-- 하단로고-->
				<li></li>
				<!-- 카피라이트 -->
				<li></li>
				<!-- SNS아이콘 -->
			</ul>
		</div>
	</footer>
</div>
<!-- #wrap -->

<!-- 주요이슈 보더 게시판 부분 -->
<div class="main-info shopping-info-swiper">
	<div class="main__header">
		<h2 class="title">쇼핑정보</h2>
		<input type="hidden" id="shoppingInfoRandomSeq" value="4">
		<div class="sub-menu">
			<ul class="sub-menu__list">
				<li class="sub-menu__item col1 sub-menu__item--select" id="newsMenu_1"><a
					href="https://dpg.danawa.com/news/list?boardSeq=64,66,63,62,67,294,293,130"
					target="_blank" role="button">주요이슈</a></li>
				<li class="sub-menu__item col2 " id="newsMenu_2"><a
					href="https://dpg.danawa.com/news/list?boardSeq=60,61,62,63,64,65,66,67,68,130&site=1"
					target="_blank" role="button">컴퓨터</a></li>
				<li class="sub-menu__item col3 " id="newsMenu_3"><a
					href="http://dpg.danawa.com/news/list?boardSeq=60,61,62,63,64,65,66,67,68,130&site=4"
					target="_blank" role="button">테크</a></li>
				<li class="sub-menu__item col1 "
					id="newsMenu_4"><a
					href="http://dpg.danawa.com/news/list?boardSeq=60,61,62,63,64,65,66,67,68,130&site=8"
					target="_blank" role="button">자동차</a></li>
				<li class="sub-menu__item col2 " id="newsMenu_5"><a
					href="https://tour.danawa.com/?logger_kw=dpg_tour" target="_blank"
					role="button">여행</a></li>
				<li class="sub-menu__item col3 " id="newsMenu_6"><a
					href="https://dpg.danawa.com/news/list?boardSeq=60,61,62,63,64,65,66,67,68,130&site=6"
					target="_blank" role="button">게임</a></li>
				<li class="sub-menu__item col4 " id="newsMenu_7"><a
					href="https://dpg.danawa.com/bbs/list?boardSeq=28" target="_blank"
					role="button">사용기</a></li>
			</ul>
		</div>
	</div>

	<div class="main__cont">
		<div class="swiper-container" id="shopping-info-swiper">
			<div class="swiper-wrapper" id="news_room_contents">
				<div class="swiper-slide" id="one_0" data-section="1">
					<ul class="main-info__list2">
						<li class="main-info__list2__item">
							<div class="main-info__list2__thumb">
								<a
									href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9806&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D63%26listSeq%3D5459426'
									target='_blank' class='main-info-thumb-image__link'> <span
									class='inner'> <img
										src='//img.danawa.com/images/attachFiles/newsRoom/20231024/1698125421549.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*'
										class='img_resize' alt='손하트, 브이는 이제 그만!'
										onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"'
										aria-hidden='true' />
								</span>
								</a>
							</div>
							<div class='main-info__list2__cont'>
								<a
									href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9806&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D63%26listSeq%3D5459426'
									class='link_title main-info-thumb-text__link' target='_blank'>손하트,
									브이는 이제 그만!</a> <a
									href='https://prod.danawa.com/info/?pcode=23561909'
									target='_blank' class='link_relate main-info-thumb-prod__link'><span
									class='txt'>상품보기</span></a>
							</div>
						</li>
						<li class="main-info__list2__item">
							<div class="main-info__list2__thumb">
								<a
									href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9794&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5457948'
									target='_blank' class='main-info-thumb-image__link'> <span
									class='inner'> <img
										src='//img.danawa.com/images/attachFiles/newsRoom/20231024/1698106868786.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*'
										class='img_resize' alt='화장품 CM이 알려주는 맨즈뷰티'
										onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"'
										aria-hidden='true' />
								</span>
								</a>
							</div>
							<div class='main-info__list2__cont'>
								<a
									href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9794&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5457948'
									class='link_title main-info-thumb-text__link' target='_blank'>화장품
									CM이 알려주는 맨즈뷰티</a> <a
									href='https://prod.danawa.com/info/?pcode=11737328'
									target='_blank' class='link_relate main-info-thumb-prod__link'><span
									class='txt'>상품보기</span></a>
							</div>
						</li>
						<li class="main-info__list2__item">
							<div class="main-info__list2__thumb">
								<a
									href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9775&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5455704'
									target='_blank' class='main-info-thumb-image__link'> <span
									class='inner'> <img
										src='//img.danawa.com/images/attachFiles/newsRoom/20231019/1697681993066.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*'
										class='img_resize' alt='속옷에도 퍼스널 컬러가 있다?'
										onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"'
										aria-hidden='true' />
								</span>
								</a>
							</div>
							<div class='main-info__list2__cont'>
								<a
									href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9775&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5455704'
									class='link_title main-info-thumb-text__link' target='_blank'>속옷에도
									퍼스널 컬러가 있다?</a> <a
									href='https://prod.danawa.com/info/?pcode=27478733'
									target='_blank' class='link_relate main-info-thumb-prod__link'><span
									class='txt'>상품보기</span></a>
							</div>
						</li>
						<li class="main-info__list2__item">
							<div class="main-info__list2__thumb">
								<a
									href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9783&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D294%26listSeq%3D5457205'
									target='_blank' class='main-info-thumb-image__link'> <span
									class='inner'> <img
										src='//img.danawa.com/images/attachFiles/newsRoom/20231020/1697786593013.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*'
										class='img_resize' alt='RAM 값이 올랐다고?!'
										onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"'
										aria-hidden='true' />
								</span>
								</a>
							</div>
							<div class='main-info__list2__cont'>
								<a
									href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9783&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D294%26listSeq%3D5457205'
									class='link_title main-info-thumb-text__link' target='_blank'>RAM
									값이 올랐다고?!</a>
							</div>
						</li>
					</ul>
					<ul class="main-info__list3">
						<li class="main-info__list3__row"><a
							href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9777&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5456811"
							class="main-info__list3__link main-info-thumb-text__link"
							target="_blank">수험생을 위한 센스 있는 선물</a></li>
						<li class="main-info__list3__row"><a
							href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9738&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D293%26listSeq%3D5454459"
							class="main-info__list3__link main-info-thumb-text__link"
							target="_blank">벌써 1년이 지난 RTX 4090</a></li>
						<li class="main-info__list3__row"><a
							href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9776&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D63%26listSeq%3D5456506"
							class="main-info__list3__link main-info-thumb-text__link"
							target="_blank">단풍 인생샷 건지는 방법</a></li>
						<li class="main-info__list3__row"><a
							href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9758&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D62%26listSeq%3D5455572"
							class="main-info__list3__link main-info-thumb-text__link"
							target="_blank">오비스 의자, 한 번 골라볼까?</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="swipe-control">
		<div class="swipe-control__num">
			<em class="current"><span class="blind">현재</span><span
				id="newsRoomNowPage">1</span></em>/<span class="blind">전체</span>7
		</div>
		<div class="swipe-control__btn">
			<button type="button" class="btn_prev" id="newsRoomPrevPage">
				<span class="blind">이전</span>
			</button>
			<button type="button" class="btn_next" id="newsRoomNextPage">
				<span class="blind">다음</span>
			</button>
			<button type="button" class="btn_stop" id="newsRoomAutoPlay">
				<span class="blind">자동재생 적용</span>
			</button>
			<input type="hidden" id="newsRoomAutoPlayManualYN" value="N">
		</div>
	</div>
</div>
<div id="danawa_main_container">
	<div class="main-top main__inner">


		<!-- 지금 가장 인기 있는 상품 -->
		<div class="main__header">
			<h2 class="title">
				지금 가장 <em class="point">인기 있는</em> 상품
			</h2>

			<div class="main-top100__cont" id="top100_0" data-section="0">
					<div
						class="main-top100__banner swiper-container swiper-container-fade swiper-container-initialized swiper-container-horizontal"
						style="position: absolute;">

						<div class="swipe-control-hover">
							<button type="button" class="btn_prev">
								<span class="blind">가격비교 TOP100 전체 다음</span>
							</button>
							<button type="button" class="btn_next">
								<span class="blind">가격비교 TOP100 전체 이전</span>
							</button>
						</div>
						<input type="hidden" id="top100_0_PlanRandomSeq"
							class="top100PlanRandomSeq" value="3"> <span
							class="swiper-notification" aria-live="assertive"
							aria-atomic="true"></span>
					</div>
				<div
					class="main-top100__right swiper-container swiper-container-fade swiper-container-initialized swiper-container-horizontal">
					<!-- <div class="main-top100__right"> -->
					<div class="swipe-control" style="z-index: 1000000">
						<div class="swipe-control__num">
							<em class="current"></em>
						</div>


					</div>
					<div class="swiper-wrapper">
						<ul class="prod-list swiper-slide swiper-slide-active"
							style="width: 865px; opacity: 1; transform: translate3d(0px, 0px, 0px);">
							<li class="prod-list__item"><a
								href="productView?pnum=131"
								class="prod-list__link top100ProductClick" target="_blank">
									<span class="prod-list__thumb"><img
										src="https://img.danawa.com/prod_img/500000/687/791/img/18791687_1.jpg?shrink=330:*&_v=20230705111010" alt="삼성전자 갤럭시S23 256GB, 자급제 (자급제,공기계)" aria-hidden="true"
										class="swiper-lazy swiper-lazy-loaded"></span> <span
									class="prod-list__txt">삼성전자 갤럭시S23 256GB, 자급제 (자급제,공기계)</span> <span
									class="prod-list__price"><span class="num">1,141,640</span>원</span>
							</a></li>
							<li class="prod-list__item"><a
								href="productView?pnum=33"
								class="prod-list__link top100ProductClick" target="_blank">
									<span class="prod-list__thumb"><img
										src="https://img.danawa.com/prod_img/500000/834/506/img/27506834_1.jpg?shrink=330:*&_v=20230817124241"
										alt="파워윈 맥세이프 블리자드 3in1 고속 무선충전거치대" aria-hidden="true"
										class="swiper-lazy swiper-lazy-loaded"></span> <span
									class="prod-list__txt">파워윈 맥세이프 블리자드 3in1 고속 무선충전거치대</span> <span
									class="prod-list__price"><span class="num">28,150</span>원</span>
							</a></li>
							<li class="prod-list__item"><a
								href="https://prod.danawa.com/info/?pcode=19627808"
								class="prod-list__link top100ProductClick" target="_blank">
									<span class="prod-list__thumb"><img
										src="//img.danawa.com/prod_img/500000/808/627/img/19627808_1.jpg?shrink=130:130"
										alt="AMD 라이젠7-5세대 7800X3D (라파엘) (정품)" aria-hidden="true"
										class="swiper-lazy swiper-lazy-loaded"></span> <span
									class="prod-list__txt">AMD 라이젠7-5세대 7800X3D (라파엘) (정품)</span> <span
									class="prod-list__price"><span class="num">585,800</span>원</span>
							</a></li>
							<li class="prod-list__item"><a
								href="https://prod.danawa.com/info/?pcode=16742642"
								class="prod-list__link top100ProductClick" target="_blank">
									<span class="prod-list__thumb"><img
										src="//img.danawa.com/prod_img/500000/642/742/img/16742642_1.jpg?shrink=130:130"
										alt="Microsoft Windows 11 Home (처음사용자용 한글)" aria-hidden="true"
										class="swiper-lazy swiper-lazy-loaded"></span> <span
									class="prod-list__txt">Microsoft Windows 11 Home (처음사용자용
										한글)</span> <span class="prod-list__price"><span class="num">168,060</span>원</span>
							</a></li>

							<li class="prod-list__item"><a
								href="https://prod.danawa.com/info/?pcode=13314890"
								class="prod-list__link top100ProductClick" target="_blank">
									<span class="prod-list__thumb"><img
										src="//img.danawa.com/prod_img/500000/890/314/img/13314890_1.jpg?shrink=130:130"
										alt="제닉스 아레나-X 풋레스트 발받침 게이밍 의자" aria-hidden="true"
										class="swiper-lazy swiper-lazy-loaded"></span> <span
									class="prod-list__txt">제닉스 아레나-X 풋레스트 발받침 게이밍 의자</span> <span
									class="prod-list__price"><span class="num">169,000</span>원</span>
							</a></li>
							<li class="prod-list__item"><a
								href="https://prod.danawa.com/info/?pcode=17641574"
								class="prod-list__link top100ProductClick" target="_blank">
									<span class="prod-list__thumb"><img
										src="//img.danawa.com/prod_img/500000/574/641/img/17641574_1.jpg?shrink=130:130"
										alt="삼성전자 갤럭시 버즈2 프로 SM-R510 (정품)" aria-hidden="true"
										class="swiper-lazy swiper-lazy-loaded"></span> <span
									class="prod-list__txt">삼성전자 갤럭시 버즈2 프로 SM-R510 (정품)</span> <span
									class="prod-list__price"><span class="num">146,940</span>원</span>
							</a></li>
							<li class="prod-list__item"><a
								href="https://prod.danawa.com/info/?pcode=20011487"
								class="prod-list__link top100ProductClick" target="_blank">
									<span class="prod-list__thumb"><img
										src="//img.danawa.com/prod_img/500000/487/011/img/20011487_1.jpg?shrink=130:130"
										alt="파인디지털 파인뷰 X550 빌트인 와이파이 2채널 (32GB)" aria-hidden="true"
										class="swiper-lazy swiper-lazy-loaded"></span> <span
									class="prod-list__txt">파인디지털 파인뷰 X550 빌트인 와이파이 2채널
										(32GB)</span> <span class="prod-list__price"><span class="num">142,850</span>원</span>
							</a></li>

							<li class="prod-list__item"><a
								href="https://prod.danawa.com/info/?pcode=17747624"
								class="prod-list__link top100ProductClick" target="_blank">
									<span class="prod-list__thumb"><img
										src="//img.danawa.com/prod_img/500000/624/747/img/17747624_1.jpg?shrink=130:130"
										alt="엔케이맥스 엔케이365 멀티비타민&amp;미네랄 120캡슐 (1개)" aria-hidden="true"
										class="swiper-lazy swiper-lazy-loaded"></span> <span
									class="prod-list__txt">엔케이맥스 엔케이365 멀티비타민&amp;미네랄 120캡슐
										(1개)</span> <span class="prod-list__price"><span class="num">105,000</span>원</span>
							</a></li>
						</ul>
					</div>

					<span class="swiper-notification" aria-live="assertive"
						aria-atomic="true"></span>
				</div>
			</div>




			<!-- <!-- 스크롤시 선택 메뉴창 -->
			<!-- <div class="main__cont"> -->
			<!-- 	<div class="main-top100__nav" style="top: 259.2px;"> -->
			<!-- 		<!-- 선택 시 active 클래스 추가 -->
			<!-- 		<!--             <a href="#" role="button" id="top100Nav_0" class="main-top100__nav__anchor active">전체</a> -->
			<!-- 		<a href="#top100_0" role="button" id="top100Nav_0" -->
			<!-- 			class="main-top100__nav__anchor" data-section="top100_0">전체</a><a -->
			<!-- 			href="#top100_10" role="button" id="top100Nav_10" -->
			<!-- 			class="main-top100__nav__anchor" data-section="top100_10">가전<br>TV -->
			<!-- 		</a><a href="#top100_11" role="button" id="top100Nav_11" -->
			<!-- 			class="main-top100__nav__anchor" data-section="top100_11">컴퓨터<br>노트북<br>조립PC -->
			<!-- 		</a><a href="#top100_12" role="button" id="top100Nav_12" -->
			<!-- 			class="main-top100__nav__anchor" data-section="top100_12">태블릿<br>모바일<br>디카 -->
			<!-- 		</a><a href="#top100_13" role="button" id="top100Nav_13" -->
			<!-- 			class="main-top100__nav__anchor active" data-section="top100_13">아웃도어<br>스포츠<br>골프 -->
			<!-- 		</a><a href="#top100_14" role="button" id="top100Nav_14" -->
			<!-- 			class="main-top100__nav__anchor" data-section="top100_14">자동차<br>용품<br>공구 -->
			<!-- 		</a><a href="#top100_15" role="button" id="top100Nav_15" -->
			<!-- 			class="main-top100__nav__anchor" data-section="top100_15">가구<br>조명 -->
			<!-- 		</a><a href="#top100_16" role="button" id="top100Nav_16" -->
			<!-- 			class="main-top100__nav__anchor" data-section="top100_16">식품<br>유아<br>완구 -->
			<!-- 		</a><a href="#top100_17" role="button" id="top100Nav_17" -->
			<!-- 			class="main-top100__nav__anchor" data-section="top100_17">생활<br>주방<br>건강 -->
			<!-- 		</a><a href="#top100_18" role="button" id="top100Nav_18" -->
			<!-- 			class="main-top100__nav__anchor" data-section="top100_18">패션<br>잡화<br>뷰티 -->
			<!-- 		</a><a href="#top100_19" role="button" id="top100Nav_19" -->
			<!-- 			class="main-top100__nav__anchor" data-section="top100_19">반려동물<br>취미<br>사무 -->
			<!-- 		</a> -->
			<!-- 	</div> -->

			<!-- 연결 쇼핑몰 -->
			<strong class="main-mall__title">인기쇼핑몰</strong>

			<ul class="main-mall__list">
				<li class="main-mall__item"><a
					href="http://www.gmarket.co.kr/index.asp?jaehuid=200002657"
					target="_blank" data-name="지마켓"><img
						src="/resources/shop-logoimg/EE128_logo.gif"
						data-src="/resources/shop-logoimg/EE128_logo.gif" class=""></a></li>
				<li class="main-mall__item"><a
					href="http://www.lotteimall.com/coop/affilGate.lotte?chl_no=23"
					target="_blank" data-name="롯데홈쇼핑"><img
						src="/resources/shop-logoimg/ED903_logo.gif"
						data-src="/resources/shop-logoimg/ED903_logo.gif" alt="롯데홈쇼핑"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="http://www.hmall.com/front/shNetworkShop.do?NetworkShop=Html&amp;ReferCode=250&amp;Url=http://www.hmall.com/Home.html"
					target="_blank" data-name="Hmall"><img
						src="/resources/shop-logoimg/ED907_logo.gif"
						data-src="/resources/shop-logoimg/ED907_logo.gif" alt="Hmall"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="http://www.thehyundai.com/front/shNetworkShop.thd?NetworkShop=Html&amp;ReferCode=030&amp;utm_source=danawa&amp;utm_medium=cps&amp;utm_term=danawa&amp;"
					target="_blank" data-name="더현대닷컴"><img
						src="/resources/shop-logoimg/TP90D_logo.gif"
						data-src="/resources/shop-logoimg/TP90D_logo.gif" alt="더현대닷컴"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="http://banner.auction.co.kr/bn_redirect.asp?ID=BN00011729"
					target="_blank" data-name="옥션"><img
						src="/resources/shop-logoimg/EE715_logo.gif"
						data-src="/resources/shop-logoimg/EE715_logo.gif" alt="옥션"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="https://www.lotteon.com/p/display/main/lotteon?mall_no=1&amp;ch_no=100071&amp;ch_dtl_no=1000227"
					target="_blank" data-name="롯데ON"><img
						src="/resources/shop-logoimg/av_keyvisual_20210908_10_01_18.jpg"
						data-src="/resources/shop-logoimg/av_keyvisual_20210908_10_01_18.jpg"
						alt="롯데ON" class=""></a></li>
				<li class="main-mall__item"><a
					href="http://with.gsshop.com/jsp/jseis_withLGeshop.jsp?media=Qm&amp;gourl=http://www.gsshop.com/index.gs"
					target="_blank" data-name="GSSHOP"><img
						src="/resources/shop-logoimg/ED908_logo.gif"
						data-src="/resources/shop-logoimg/ED908_logo.gif" alt="GSSHOP"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="http://www.e-himart.co.kr/index.jsp?fromShop=dnw"
					target="_blank" data-name="하이마트"><img
						src="/resources/shop-logoimg/TJ418_logo.gif"
						data-src="/resources/shop-logoimg/TJ418_logo.gif" alt="하이마트"
						class="lazy"></a></li>
				<li class="main-mall__item"><a
					href="http://www.11st.co.kr/connect/Gateway.tmall?method=Xsite&amp;tid=1000002531"
					target="_blank" data-name="11번가"><img
						src="/resources/shop-logoimg/TH201_logo.gif"
						data-src="/resources/shop-logoimg/TH201_logo.gif" alt="11번가"
						class="lazy"></a></li>
				<li class="main-mall__item"><a
					href="https://www.lotteon.com/p/display/main/ellotte?mall_no=2&amp;ch_no=100072&amp;ch_dtl_no=1000228"
					target="_blank" data-name="롯데백화점"><img
						src="/resources/shop-logoimg/TLC16_logo.gif"
						data-src="/resources/shop-logoimg/TLC16_logo.gif" alt="롯데백화점"
						class="lazy"></a></li>
				<li class="main-mall__item"><a
					href="https://store.musinsa.com/?utm_source=danawa&amp;utm_medium=sh&amp;source=DANAWA"
					target="_blank" data-name="무신사"><img
						src="/resources/shop-logoimg/musinsa_72x32.gif"
						data-src="/resources/shop-logoimg/musinsa_72x32.gif  " alt="무신사"
						class="lazy"></a></li>
				<li class="main-mall__item"><a
					href="http://display.cjonstyle.com/p/homeTab/main?infl_cd=I0651&amp;utm_medium=mallname&amp;utm_source=danawa"
					target="_blank" data-name="CJ온스타일"><img
						src="/resources/shop-logoimg/ED909_logo.gif"
						data-src="/resources/shop-logoimg/ED909_logo.gif" alt="CJ온스타일"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="https://www.etlandmall.co.kr/pc/main/index.do?chlCode=A072"
					target="_blank" data-name="전자랜드"><img
						src="/resources/shop-logoimg/TJ918_logo.gif"
						data-src="/resources/shop-logoimg/TJ918_logo.gif" alt="전자랜드"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="http://www.interpark.com/gate/ippgw.jsp?biz_cd=P01415&amp;url=http://www.interpark.com"
					target="_blank" data-name="인터파크"><img
						src="/resources/shop-logoimg/ED910_logo.gif"
						data-src="/resources/shop-logoimg/ED910_logo.gif" alt="인터파크"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="http://www.ssg.com?ckwhere=danawa_direct" target="_blank"
					data-name="SSG"><img
						src="/resources/shop-logoimg/TN118_logo.gif"
						data-src="/resources/shop-logoimg/TN118_logo.gif" alt="SSG"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="http://www.nsmall.com/jsp/site/gate.jsp?co_cd=430"
					target="_blank" data-name="Nsmall"><img
						src="/resources/shop-logoimg/ED904_logo.gif"
						data-src="/resources/shop-logoimg/ED904_logo.gif" alt="Nsmall"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="https://affiliate.homeplus.co.kr/external/bridge?channelId=1000018&amp;targetUrl=https%3a%2f%2ffront.homeplus.co.kr"
					target="_blank" data-name="홈플러스"><img
						src="/resources/shop-logoimg/TK316_logo.gif"
						data-src="/resources/shop-logoimg/TK316_logo.gif" alt="홈플러스"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="https://front.wemakeprice.com/affiliate/bridge?channelId=1000016&amp;affiliateExtraNo=wmp_logo"
					target="_blank" data-name="위메프"><img
						src="/resources/shop-logoimg/TN729_logo.gif"
						data-src="/resources/shop-logoimg/TN729_logo.gif" alt="위메프"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="http://shinsegaemall.ssg.com?ckwhere=s_danawa"
					target="_blank" data-name="신세계몰"><img
						src="/resources/shop-logoimg/ED901_logo.gif"
						data-src="/resources/shop-logoimg/ED901_logo.gif" alt="신세계몰"
						class="lazy"></a></li>
				<li class="main-mall__item"><a
					href="http://www.hnsmall.com/channel/channel.do?channel_code=20039"
					target="_blank" data-name="홈앤쇼핑"><img
						src="/resources/shop-logoimg/TLB17_logo.gif"
						data-src="/resources/shop-logoimg/TLB17_logo.gif" alt="홈앤쇼핑"
						class="lazy"></a></li>
				<li class="main-mall__item"><a
					href="http://mall.hanssem.com/interface/danawa.do?PARTNERID=hanssem_partner_01&amp;URL=http://mall.hanssem.com/"
					target="_blank" data-name="한샘"><img
						src="/resources/shop-logoimg/TNB05_logo.gif"
						data-src="/resources/shop-logoimg/TNB05_logo.gif" alt="한샘"
						class="lazy"></a></li>
				<li class="main-mall__item"><a
					href="http://www.ticketmonster.co.kr/entry/?jp=80023&amp;ln=231789"
					target="_blank" data-name="티몬"><img
						src="/resources/shop-logoimg/TN920_logo.gif"
						data-src="/resources/shop-logoimg/TN920_logo.gif" alt="티몬"
						class="lazy"></a></li>
				<li class="main-mall__item"><a
					href="http://emart.ssg.com/main.ssg?ckwhere=danawa&amp;sid=dn001"
					target="_blank" data-name="이마트몰"><img
						src="/resources/shop-logoimg/EE311_logo.gif"
						data-src="/resources/shop-logoimg/EE311_logo.gif" alt="이마트몰"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="http://www.shinsegaetvshopping.com?inMediaCode=MC04&amp;ckwhere=danawaetc"
					target="_blank" data-name="신세계TV쇼핑"><img
						src="/resources/shop-logoimg/TRB03_logo.gif"
						data-src="/resources/shop-logoimg/TRB03_logo.gif" alt="신세계TV쇼핑"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="https://www.tstation.com/?epChl=DANAWA&amp;epChlDtl=2"
					target="_blank" data-name="티스테이션"><img
						src="/resources/shop-logoimg/TTB3F7_logo.gif"
						data-src="/resources/shop-logoimg/TTB3F7_logo.gif" alt="티스테이션"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="https://link.coupang.com/re/PCSDANAWAPCHOME" target="_blank"
					data-name="쿠팡"><img
						src="/resources/shop-logoimg/TP40F_logo.gif"
						data-src="/resources/shop-logoimg/TP40F_logo.gif" alt="쿠팡"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="http://www.akmall.com/assc/assc_conv.jsp?assc_comp_id=24931&amp;url=http://www.akmall.com"
					target="_blank" data-name="Akmall"><img
						src="/resources/shop-logoimg/ED905_logo.gif"
						data-src="/resources/shop-logoimg/ED905_logo.gif" alt="Akmall"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="https://www.gongyoungshop.kr/gate/selectAliance.do?alcLnkCd=dnwpcs"
					target="_blank" data-name="공영쇼핑"><img
						src="/resources/shop-logoimg/logo_gongyoung.gif"
						data-src="/resources/shop-logoimg/logo_gongyoung.gif" alt="공영쇼핑"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="http://www.qoo10.com?jaehuid=2026301862" target="_blank"
					data-name="Qoo10"><img
						src="/resources/shop-logoimg/TP402_logo.gif"
						data-src="/resources/shop-logoimg/TP402_logo.gif" alt="Qoo10"
						class=""></a></li>
				<li class="main-mall__item"><a
					href="https://www.skstoa.com/index?mediaCode=EP16" target="_blank"
					data-name="SK스토아"><img
						src="/resources/shop-logoimg/TSB275_logo.gif"
						data-src="/resources/shop-logoimg/TSB275_logo.gif" alt="SK스토아"
						class="lazy"></a></li>
				<li class="main-mall__item"><a
					href="https://ohou.se/store?utm_source=danawa_shop&amp;utm_medium=cpc&amp;utm_campaign=uc_web-all-web_all-danawa_shop&amp;affect_type=UtmUrl"
					target="_blank" data-name="오늘의 집"><img
						src="/resources/shop-logoimg/TU710C_logo.gif"
						data-src="/resources/shop-logoimg/TU710C_logo.gif" alt="오늘의 집"
						class="lazy"></a></li>
				<li class="main-mall__item"><a
					href="https://www.kshop.co.kr/?with_code=000010" target="_blank"
					data-name="KT알파 쇼핑"><img
						src="/resources/shop-logoimg/TP304_logo2.gif"
						data-src="/resources/shop-logoimg/TP304_logo2.gif" alt="KT알파 쇼핑"
						class="lazy"></a></li>
			</ul>

			<script type="text/javascript">
			var sProductListUrl = "https://prod.danawa.com/list";
			var oCategoryLnb = null;
			var oExplodeCategoryLnb = null;
			var sCategoryExplodeLoggerText = "main";

			//카테고리 LNB, 펼쳐보기 draw
			$(document)
					.ready(
							function() {
								oCategoryLnb = new CategoryLnb();
								oCategoryLnb
										.setListRootUrl("https://prod.danawa.com/list/");
								oCategoryLnb
										.setRootElement($(".main-header__category .category_hover_layer_wrap"));
								oCategoryLnb
										.setSectionElement($(".main-header__category #sectionLayer"));
							});

			_TRK_PI = "Main";

			var memberId = ""
		</script>
			<script src="//static.danawa.com/globaljs/external/yall/yall.min.js"></script>
			<script
				src="//static.danawa.com/globaljs/external/yall/intersection-observer.js"></script>
			<script
				src="//static.danawa.com/globaljs/external/modernizr/2.8.3/modernizr.custom.touch-events.js?v=2309221348"></script>
			<script
				src="//static.danawa.com/globaljs/external/jquery/plugin/jquery.mousewheel/3.1.12/jquery.mousewheel.min.js?v=2309221348"></script>
			<script
				src="//static.danawa.com/globaljs/static/bdl/dsas_client.min.js?v=1.0.0"></script>
			<script
				src="//static.danawa.com/globaljs/com/danawa/util/common_lnb.js?v=2309221348"></script>
			<script
				src="//static.danawa.com/globaljs/com/danawa/common/category/mainLNBMenu.js?v=2309221348"></script>
			<script
				src="https://www.danawa.com/main/js/mainLayer.js?v=2309221348"></script>
			<script
				src="https://www.danawa.com/main/js/priceCompareTop100.js?v=2309221348"></script>
			<script
				src="//static.danawa.com/globaljs/com/danawa/common/category/main_lnb_ui.js?v=2309221348"></script>
			<script
				src="https://www.danawa.com/main/js/mainLogger.js?v=2309221348"></script>
			<script
				src="//static.danawa.com/globaljs/external/swiper/5.4.5/swiper.min.js?v=2309221348"></script>
			<script>
			src="//static.danawa.com/globaljs/external/postscribe/postscribe.min.js"></script>
			<script>
			var _TRK_CP = '메인_NEW/통합메인';
		</script>
		</div>
	</div>
</div>
<script src="//static.danawa.com/globaljs/static/logger_trackEvent.js"></script>
<script
	src="//static.danawa.com/globaljs/static/logger_Insight_WebAnalytics.js"></script>
<script src="//static.danawa.com/globaljs/static/wcslog.js?v1607061545="></script>
<script>
	if (!wcs_add)
		var wcs_add = {};
	wcs_add["wa"] = "s_3b3fb74948b1";
	if (!_nasa)
		var _nasa = {};
	wcs.inflow("danawa.com");
	wcs_do(_nasa);
</script>
<script>
	(function(w, d, a) {
		w.__beusablerumclient__ = {
			load : function(src) {
				var b = d.createElement("script");
				b.src = src;
				b.async = true;
				b.type = "text/javascript";
				d.getElementsByTagName("head")[0].appendChild(b);
			}
		};
		w.__beusablerumclient__.load(a);
	})(window, document,
			'//rum.beusable.net/script/b200115e112333u798/dce25d2b02');
</script>
<script>
	var _CZN = '1';
</script>

<div id="mainDim"></div>
<script type="application/ld+json">
		{
			"@context": "http://schema.org",
			"@type": "Person",
			"name": "다나와",
			"url": "http://www.danawa.com",
			"sameAs": [
				"http://m.post.naver.com/my.nhn?memberNo=639132",
				"http://kin.naver.com/profile/danawa02",
				"https://www.facebook.com/danawastory",
				"https://play.google.com/store/apps/details?id=com.sktelecom.Danawa.Main&hl=ko",
				"https://itunes.apple.com/kr/app/%EB%8B%A4%EB%82%98%EC%99%80-%EA%B0%80%EA%B2%A9%EB%B9%84%EA%B5%90/id454345858?mt=8",
				"http://blog.naver.com/danawaelec",
				"http://cafe.naver.com/shopdanawa"
			]
		}
	</script>
<!-- view as mobile script -->
<script
	src="//static.danawa.com/globaljs/com/danawa/common/setUpMobileView.js"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-37762359-14"></script>
<!-- Google Analytics 4(GA4) -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-L8D5P2KD8Z"></script>
<script>
	window.dataLayer = window.dataLayer || [];

	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'UA-37762359-14', {
		'sample_rate' : 5
	}); // 유니버셜
	gtag('config', 'AW-963914956'); // 제휴캠페인
	gtag('config', 'AW-631507961'); // 확장캠페인
	gtag('config', 'AW-10932905353'); // 듀얼_기존
	gtag('config', 'AW-10933251710'); // 듀얼_확장
	gtag('config', 'G-L8D5P2KD8Z'); // GA4
</script>
<!-- Enliple Tracker Start -->
<script>
	var ENP_VAR = {
		collect : {},
		conversion : {
			product : []
		}
	};

	(function(a, g, e, n, t) {
		a.enp = a.enp || function() {
			(a.enp.q = a.enp.q || []).push(arguments)
		};
		n = g.createElement(e);
		n.defer = !0;
		n.src = "https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js";
		t = g.getElementsByTagName(e)[0];
		t.parentNode.insertBefore(n, t)
	})(window, document, "script");
	enp('create', 'common', 'danawa', {
		device : 'W'
	});
	enp('send', 'common', 'danawa');
</script>
<!-- Enliple Tracker End -->
<!-- AceCounter Log Gathering Script V.8.0.2019080601 -->
<script
	src="//static.danawa.com/globaljs/static/acecounter/acecounter_script_pc.js?v=2205041250"></script>
<noscript>
	<img src="//gtp13.acecounter.com:8080/?uid=AH6A45867192252&je=n&"
		border="0" width="0" height="0" alt="">
</noscript>
<!-- AceCounter Log Gathering Script End -->

<%@ include file="include/footer.jsp"%>