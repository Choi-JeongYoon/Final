<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<hr class="my-4">
 <a class="btn btn-primary btn-lg" href="productList" role="button">다~나옵니다</a>
<!-- 왼쪽 카테고리 부분 -->
<div class="category" id="category">

	 	<ul id="sectionLayer" class="category__list " role="menu">
	 	 <li role="menuitem" class="category__list__row" group-code="10" section-name="가전/TV">
            <a href="#categoryHoverLayer10" role="button" class="category__list__btn" onclick="return false">가전·TV</a>
            
				   <div id="categoryHoverLayer10" class="category__2depth category_hover_layer" style="display: none;">
                <div class="category__2depth__left">
                    <ul role="menu" class="category__depth">
                    
                    <li class="category__depth__row depth1 dp_dot" group-code="10" category-code="19342"><a href="#"
                                role="menuitem" class="category__depth__btn" onclick="return false;"><span
                                    class="category__depth__txt">TV</span></a>
                                    
                                    <li class="category__depth__row depth1 dp_dot" group-code="10" category-code="47178"><a href="#"
                                role="menuitem" class="category__depth__btn" onclick="return false;"><span
                                    class="category__depth__txt">냉장고</span></a>
					<li><a href="#">세탁기/건조기</a></li>
					<li><a href="#">계절가전</a></li>					
				</ul>
			</li>
			
			 <li class="category__depth__row depth1 dp_dot" group-code="10" category-code="44603"><a href="#"
                                role="menuitem" class="category__depth__btn" onclick="return false;"><span
                                    class="category__depth__txt">컴퓨터·노트북</span></a>
                                   
                                            <ul role="menu" class="category__depth ">
                                                <li role="none" class="category__depth__row" group-code="10"
                                                    category-code="51509"><a
                                                        href="https://prod.danawa.com/list/?cate=10351509&amp;15main_10_03"
                                                        role="menuitem" data-catelist="가전/TV_냉장고_냉장고_4도어"
                                                        class="category__depth__link"><span
                                                            class="category__depth__txt"><span
                                                                class="icom ico_h">인기메뉴</span>4도어</span></a></li>
                                                <li role="none" class="category__depth__row" group-code="10"
                                                    category-code="51510"><a
                                                        href="https://prod.danawa.com/list/?cate=10351510&amp;15main_10_03"
                                                        role="menuitem" data-catelist="가전/TV_냉장고_냉장고_양문형"
                                                        class="category__depth__link"><span
                                                            class="category__depth__txt">양문형</span></a></li>
                                                <li role="none" class="category__depth__row" group-code="10"
                                                    category-code="51511"><a
                                                        href="https://prod.danawa.com/list/?cate=10351511&amp;15main_10_03"
                                                        role="menuitem" data-catelist="가전/TV_냉장고_냉장고_일반형"
                                                        class="category__depth__link"><span
                                                            class="category__depth__txt">일반형</span></a></li>
                                                <li role="none" class="category__depth__row" group-code="10"
                                                    category-code="51512"><a
                                                        href="https://prod.danawa.com/list/?cate=10351512&amp;15main_10_03"
                                                        role="menuitem" data-catelist="가전/TV_냉장고_냉장고_1도어"
                                                        class="category__depth__link"><span
                                                            class="category__depth__txt">1도어</span></a></li>
                                                <li role="none" class="category__depth__row" group-code="10"
                                                    category-code="51513"><a
                                                        href="https://prod.danawa.com/list/?cate=10351513&amp;15main_10_03"
                                                        role="menuitem" data-catelist="가전/TV_냉장고_냉장고_소형(~150L)"
                                                        class="category__depth__link"><span
                                                            class="category__depth__txt">소형(~150L)</span></a></li>
                                                <li role="none" class="category__depth__row" group-code="10"
                                                    category-code="51514"><a
                                                        href="https://prod.danawa.com/list/?cate=10351514&amp;15main_10_03"
                                                        role="menuitem" data-catelist="가전/TV_냉장고_냉장고_냉장+냉동+김치"
                                                        class="category__depth__link"><span
                                                            class="category__depth__txt">냉장+냉동+김치</span></a></li>
                                            </ul>
<!-- 			<li><a href="#">컴퓨터·노트북</a> -->
<!-- 				<ul class="sub"> -->
<!-- 					<li><a href="#">컴퓨터</a></li> -->
<!-- 					<li><a href="#">노트북</a></li> -->
<!-- 					<li><a href="#">PC 주요부품</a></li> -->
<!-- 					<li><a href="#">PC 저장장치</a></li>		 -->
<!-- 					<li><a href="#">게임기</a></li> -->
<!-- 				</ul> -->
			</li>

			<li><a href="#">테블릿·모바일</a>
				<ul class="sub">
					<li><a href="#">휴대폰/스마트폰</a></li>
					<li><a href="#">태블릿/전자책</a></li>
					<li><a href="#">스마트워치/VR</a></li>
					<li><a href="#">이어폰/헤드폰</a></li>
				</ul>
			</li>

			<li><a href="#">패션·잡화·뷰티</a>
				<ul class="sub">
					<li><a href="#">가방/지갑</a></li>
					<li><a href="#">남성 의류</a></li>
					<li><a href="#">여성 의류</a></li>
					<li><a href="#">스킨케어/향수</a></li>
				</ul>
			</li>
		</ul>
	 </div><!-- 메뉴 navi_box-->

	<!-- <div id="danawa_main_container"></div> <div class="main-top main__inner">
	<div class="main-top__center">
<div class="main-middlebnr" id="main-middlebnr"></div> -->

<!-- 주요이슈 보더 게시판 부분 -->
<div class="main-info shopping-info-swiper">
			<div class="main__header">
				<div class="main-middlebnr" id="main-middlebnr"></div> 	
				<h2 class="title">쇼핑정보</h2>
				<input type="hidden" id="shoppingInfoRandomSeq" value="4">
				<div class="sub-menu">
					<ul class="sub-menu__list">
														<li class="sub-menu__item col1 " id="newsMenu_1"><a href="https://dpg.danawa.com/news/list?boardSeq=64,66,63,62,67,294,293,130" target="_blank" role="button" >주요이슈</a></li>
														<li class="sub-menu__item col2 " id="newsMenu_2"><a href="https://dpg.danawa.com/news/list?boardSeq=60,61,62,63,64,65,66,67,68,130&site=1" target="_blank" role="button" >컴퓨터</a></li>
														<li class="sub-menu__item col3 " id="newsMenu_3"><a href="http://dpg.danawa.com/news/list?boardSeq=60,61,62,63,64,65,66,67,68,130&site=4" target="_blank" role="button" >테크</a></li>
														<li class="sub-menu__item col1 sub-menu__item--select" id="newsMenu_4"><a href="http://dpg.danawa.com/news/list?boardSeq=60,61,62,63,64,65,66,67,68,130&site=8" target="_blank" role="button" >자동차</a></li>
														<li class="sub-menu__item col2 " id="newsMenu_5"><a href="https://tour.danawa.com/?logger_kw=dpg_tour" target="_blank" role="button" >여행</a></li>
														<li class="sub-menu__item col3 " id="newsMenu_6"><a href="https://dpg.danawa.com/news/list?boardSeq=60,61,62,63,64,65,66,67,68,130&site=6" target="_blank" role="button" >게임</a></li>
														<li class="sub-menu__item col4 " id="newsMenu_7"><a href="https://dpg.danawa.com/bbs/list?boardSeq=28" target="_blank" role="button" >사용기</a></li>
											</ul>
				</div>
			</div>
			
			<div class="main__cont">
				<div class="swiper-container" id="shopping-info-swiper">
					<div class="swiper-wrapper" id="news_room_contents">
						<div class="swiper-slide" id="one_0" data-section="1"> <ul class="main-info__list2"> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9806&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D63%26listSeq%3D5459426' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231024/1698125421549.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='손하트, 브이는 이제 그만!' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9806&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D63%26listSeq%3D5459426' class='link_title main-info-thumb-text__link' target='_blank'>손하트, 브이는 이제 그만!</a> 		<a href='https://prod.danawa.com/info/?pcode=23561909' target='_blank' class='link_relate main-info-thumb-prod__link'><span class='txt'>상품보기</span></a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9794&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5457948' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231024/1698106868786.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='화장품 CM이 알려주는 맨즈뷰티' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9794&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5457948' class='link_title main-info-thumb-text__link' target='_blank'>화장품 CM이 알려주는 맨즈뷰티</a> 		<a href='https://prod.danawa.com/info/?pcode=11737328' target='_blank' class='link_relate main-info-thumb-prod__link'><span class='txt'>상품보기</span></a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9775&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5455704' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231019/1697681993066.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='속옷에도 퍼스널 컬러가 있다?' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9775&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5455704' class='link_title main-info-thumb-text__link' target='_blank'>속옷에도 퍼스널 컬러가 있다?</a> 		<a href='https://prod.danawa.com/info/?pcode=27478733' target='_blank' class='link_relate main-info-thumb-prod__link'><span class='txt'>상품보기</span></a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9783&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D294%26listSeq%3D5457205' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231020/1697786593013.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='RAM 값이 올랐다고?!' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9783&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D294%26listSeq%3D5457205' class='link_title main-info-thumb-text__link' target='_blank'>RAM 값이 올랐다고?!</a>		</div> </li></ul><ul class="main-info__list3"><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9777&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5456811" class="main-info__list3__link main-info-thumb-text__link" target="_blank">수험생을 위한 센스 있는 선물</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9738&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D293%26listSeq%3D5454459" class="main-info__list3__link main-info-thumb-text__link" target="_blank">벌써 1년이 지난 RTX 4090</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9776&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D63%26listSeq%3D5456506" class="main-info__list3__link main-info-thumb-text__link" target="_blank">단풍 인생샷 건지는 방법</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9758&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D62%26listSeq%3D5455572" class="main-info__list3__link main-info-thumb-text__link" target="_blank">오비스 의자, 한 번 골라볼까?</a></li></ul></div><div class="swiper-slide" id="two_0" data-section="2"> <ul class="main-info__list2"> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9807&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5460118' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231024/1698138497078.gif?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='2023년 3분기, SSD가격 초비상!!' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9807&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5460118' class='link_title main-info-thumb-text__link' target='_blank'>2023년 3분기, SSD가격 초비상!!</a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9803&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5457848' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231024/1698120055932.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='ATDT 01410, 이거 알면 아재 인증?' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9803&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5457848' class='link_title main-info-thumb-text__link' target='_blank'>ATDT 01410, 이거 알면 아재 인증?</a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9774&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5455877' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231019/1697677700337.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='인텔 14세대 중 그나마 착한애야..' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9774&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5455877' class='link_title main-info-thumb-text__link' target='_blank'>인텔 14세대 중 그나마 착한애야..</a> 		<a href='https://prod.danawa.com/info/?pcode=28799435' target='_blank' class='link_relate main-info-thumb-prod__link'><span class='txt'>상품보기</span></a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9800&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fbbs%2Fview%3FboardSeq%3D28%26listSeq%3D5458832' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231024/1698134077817.gif?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='15분만 있으면 됩니다.' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9800&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fbbs%2Fview%3FboardSeq%3D28%26listSeq%3D5458832' class='link_title main-info-thumb-text__link' target='_blank'>15분만 있으면 됩니다.</a> 		<a href='https://prod.danawa.com/info/?pcode=20712227' target='_blank' class='link_relate main-info-thumb-prod__link'><span class='txt'>상품보기</span></a>		</div> </li></ul><ul class="main-info__list3"><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9786&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D62%26listSeq%3D5457444" class="main-info__list3__link main-info-thumb-text__link" target="_blank">실드 가능? 14세대 vs 7800X3D</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9789&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fbbs%2Fview%3FboardSeq%3D28%26listSeq%3D5458755" class="main-info__list3__link main-info-thumb-text__link" target="_blank">언제 어디서나 항상 네 곁에 있을게!</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9790&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D62%26listSeq%3D5458991" class="main-info__list3__link main-info-thumb-text__link" target="_blank">360도로 돌아가는 신상 갤럭시북</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9797&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D62%26listSeq%3D5457715" class="main-info__list3__link main-info-thumb-text__link" target="_blank">서명은 할 수 있어야 비즈니스북</a></li></ul></div><div class="swiper-slide" id="three_0" data-section="3"> <ul class="main-info__list2"> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9795&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D62%26listSeq%3D5459327' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231024/1698107024267.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='저만 와이파이 답답한가요?' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9795&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D62%26listSeq%3D5459327' class='link_title main-info-thumb-text__link' target='_blank'>저만 와이파이 답답한가요?</a> 		<a href='https://prod.danawa.com/info/?pcode=27549584' target='_blank' class='link_relate main-info-thumb-prod__link'><span class='txt'>상품보기</span></a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9801&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D62%26listSeq%3D5458074%26site%3D4' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231024/1698110613121.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='갤럭시 Z 폴드5, 많이 발전했네' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9801&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D62%26listSeq%3D5458074%26site%3D4' class='link_title main-info-thumb-text__link' target='_blank'>갤럭시 Z 폴드5, 많이 발전했네</a> 		<a href='https://prod.danawa.com/info/?pcode=21369995' target='_blank' class='link_relate main-info-thumb-prod__link'><span class='txt'>상품보기</span></a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9773&redirectUrl=http%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D62%26listSeq%3D5456662' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231019/1697676952228.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='건조기는 무조건 큰 게 좋다? 땡!' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9773&redirectUrl=http%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D62%26listSeq%3D5456662' class='link_title main-info-thumb-text__link' target='_blank'>건조기는 무조건 큰 게 좋다? 땡!</a> 		<a href='https://prod.danawa.com/info/?pcode=20526197' target='_blank' class='link_relate main-info-thumb-prod__link'><span class='txt'>상품보기</span></a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9782&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5455992' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231020/1697776460301.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='메타 퀘스트3, 요놈 완전 물건인데?' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9782&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5455992' class='link_title main-info-thumb-text__link' target='_blank'>메타 퀘스트3, 요놈 완전 물건인데?</a> 		<a href='https://prod.danawa.com/info/?pcode=20397257' target='_blank' class='link_relate main-info-thumb-prod__link'><span class='txt'>상품보기</span></a>		</div> </li></ul><ul class="main-info__list3"><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9772&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3Foption%3D571%26listSeq%3D5455803" class="main-info__list3__link main-info-thumb-text__link" target="_blank">리전 Y700 2023 이거 물건인데?</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9787&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5458811" class="main-info__list3__link main-info-thumb-text__link" target="_blank">아이폰 15 시리즈 꿀팁 10가지!</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9791&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5458237" class="main-info__list3__link main-info-thumb-text__link" target="_blank">새로운 갤럭시는 아이폰스럽게?</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9779&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D63%26listSeq%3D5457207" class="main-info__list3__link main-info-thumb-text__link" target="_blank">소니 VS 캐논, 미러리스 카메라 대결</a></li></ul></div><div class="swiper-slide" id="four_0" data-section="4" data-swiper-autoplay="7000"> <ul class="main-info__list2"> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9804&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D60%26listSeq%3D5459710' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231024/1698120254645.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='늘 좋은 평가를 받는 이 차..뭘까?' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9804&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D60%26listSeq%3D5459710' class='link_title main-info-thumb-text__link' target='_blank'>늘 좋은 평가를 받는 이 차..뭘까?</a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9792&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D60%26listSeq%3D5457585' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231023/1698024406801.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='사이버트럭, 게임체인저 될까?' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9792&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D60%26listSeq%3D5457585' class='link_title main-info-thumb-text__link' target='_blank'>사이버트럭, 게임체인저 될까?</a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9751&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5454992' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231017/1697506163584.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='BMW X5 이제 이길 수 있을까?' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9751&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5454992' class='link_title main-info-thumb-text__link' target='_blank'>BMW X5 이제 이길 수 있을까?</a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9767&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D60%26listSeq%3D5455847' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231018/1697594284301.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='가격 확 낮춘 테슬라 모델Y RWD' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9767&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D60%26listSeq%3D5455847' class='link_title main-info-thumb-text__link' target='_blank'>가격 확 낮춘 테슬라 모델Y RWD</a>		</div> </li></ul><ul class="main-info__list3"><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9739&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D60%26listSeq%3D5453159" class="main-info__list3__link main-info-thumb-text__link" target="_blank">충돌평가 안전 TOP, 제네시스 G80</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9704&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D61%26listSeq%3D5451592" class="main-info__list3__link main-info-thumb-text__link" target="_blank">GV80 쿠페 9190만원부터 시작</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9703&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FlistSeq%3D5451948%26boardSeq%3D60" class="main-info__list3__link main-info-thumb-text__link" target="_blank">폭스바겐 전기차 완전 업글됐네??</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9642&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5445916" class="main-info__list3__link main-info-thumb-text__link" target="_blank">2억 원대 최고의 오픈카는?!</a></li></ul></div><div class="swiper-slide" id="five_0" data-section="5"> <ul class="main-info__list2"> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9717&redirectUrl=https%3A%2F%2Ftour.danawa.com%2Fgoods%3Fid%3D14049%26UseCache%3Dfalse%26pageID%3D1276' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231013/1697155136080.png?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='특별한 나의 3박4일 대만여행' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9717&redirectUrl=https%3A%2F%2Ftour.danawa.com%2Fgoods%3Fid%3D14049%26UseCache%3Dfalse%26pageID%3D1276' class='link_title main-info-thumb-text__link' target='_blank'>특별한 나의 3박4일 대만여행</a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9718&redirectUrl=https%3A%2F%2Ftour.danawa.com%2Fgoods%3Fid%3D14060%26UseCache%3Dfalse%26pageID%3D1276' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231013/1697155204841.png?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='2023 가을 해외여행지 추천' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9718&redirectUrl=https%3A%2F%2Ftour.danawa.com%2Fgoods%3Fid%3D14060%26UseCache%3Dfalse%26pageID%3D1276' class='link_title main-info-thumb-text__link' target='_blank'>2023 가을 해외여행지 추천</a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9719&redirectUrl=https%3A%2F%2Ftour.danawa.com%2Fgoods%3Fid%3D13652%26UseCache%3Dfalse%26pageID%3D1276' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231013/1697155253961.png?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='낭만적인 낮과 밤을 위하여, 나트랑' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9719&redirectUrl=https%3A%2F%2Ftour.danawa.com%2Fgoods%3Fid%3D13652%26UseCache%3Dfalse%26pageID%3D1276' class='link_title main-info-thumb-text__link' target='_blank'>낭만적인 낮과 밤을 위하여, 나트랑</a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9720&redirectUrl=https%3A%2F%2Ftour.danawa.com%2Fgoods%3Fid%3D14011%26UseCache%3Dfalse%26pageID%3D1276' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231013/1697155293664.png?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='가볍게 떠나는 오사카 여행' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9720&redirectUrl=https%3A%2F%2Ftour.danawa.com%2Fgoods%3Fid%3D14011%26UseCache%3Dfalse%26pageID%3D1276' class='link_title main-info-thumb-text__link' target='_blank'>가볍게 떠나는 오사카 여행</a>		</div> </li></ul><ul class="main-info__list3"><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9721&redirectUrl=https%3A%2F%2Ftour.danawa.com%2Fgoods%3Fid%3D14078%26UseCache%3Dfalse%26pageID%3D1276" class="main-info__list3__link main-info-thumb-text__link" target="_blank">잊혀지지 않을 인생의 명산, 장가계</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9722&redirectUrl=https%3A%2F%2Ftour.danawa.com%2Fgoods%3Fid%3D13547%26UseCache%3Dfalse%26pageID%3D1276" class="main-info__list3__link main-info-thumb-text__link" target="_blank">나의 첫 버킷리스트 ✎ 유럽여행 </a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9723&redirectUrl=https%3A%2F%2Ftour.danawa.com%2Fgoods%3Fid%3D14074%26UseCache%3Dfalse%26pageID%3D1276" class="main-info__list3__link main-info-thumb-text__link" target="_blank">공항에서 떠나는 완벽한 해외여행</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9724&redirectUrl=https%3A%2F%2Ftour.danawa.com%2Fgoods%3Fid%3D14077%26UseCache%3Dfalse%26pageID%3D1276" class="main-info__list3__link main-info-thumb-text__link" target="_blank">알찬 일정은 덤! 후쿠오카 오전출발</a></li></ul></div><div class="swiper-slide" id="six_0" data-section="6"> <ul class="main-info__list2"> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9799&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5458238' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231024/1698107837407.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='이거 좋아하시는 분~ 일단 나부터' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9799&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5458238' class='link_title main-info-thumb-text__link' target='_blank'>이거 좋아하시는 분~ 일단 나부터</a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9810&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5459507' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231025/1698193856292.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='도색 장인들의 게임기는 다르다' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9810&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5459507' class='link_title main-info-thumb-text__link' target='_blank'>도색 장인들의 게임기는 다르다</a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9788&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5457788' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231023/1698023378195.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='이 게임은 왜 91점을 받았을까?' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9788&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5457788' class='link_title main-info-thumb-text__link' target='_blank'>이 게임은 왜 91점을 받았을까?</a> 		<a href='https://prod.danawa.com/info/?pcode=20510270' target='_blank' class='link_relate main-info-thumb-prod__link'><span class='txt'>상품보기</span></a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9771&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5455723' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231019/1697675077295.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='스파이더맨 게임 시리즈 변천사' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9771&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5455723' class='link_title main-info-thumb-text__link' target='_blank'>스파이더맨 게임 시리즈 변천사</a>		</div> </li></ul><ul class="main-info__list3"><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9766&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D60%26listSeq%3D5455654" class="main-info__list3__link main-info-thumb-text__link" target="_blank">국산 게임 새 역사 쓰고 있는 게임</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9756&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2FmovieDetail%3FlistSeq%3D5454179" class="main-info__list3__link main-info-thumb-text__link" target="_blank">설렘 주의보! 최저가 43,250원</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9746&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D60%26listSeq%3D5452840" class="main-info__list3__link main-info-thumb-text__link" target="_blank">MS의 대들보가 썩고 있다...</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9748&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D64%26listSeq%3D5452875" class="main-info__list3__link main-info-thumb-text__link" target="_blank">마왕이 그리울 땐 길티기어</a></li></ul></div><div class="swiper-slide" id="seven_0" data-section="7"> <ul class="main-info__list2"> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9796&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fbbs%2Fview%3FboardSeq%3D28%26listSeq%3D5458720' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231024/1698107049995.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='도시 남자를 위한 브런치 메뉴 추천' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9796&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fbbs%2Fview%3FboardSeq%3D28%26listSeq%3D5458720' class='link_title main-info-thumb-text__link' target='_blank'>도시 남자를 위한 브런치 메뉴 추천</a> 		<a href='https://prod.danawa.com/info/?pcode=12459386' target='_blank' class='link_relate main-info-thumb-prod__link'><span class='txt'>상품보기</span></a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9798&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fbbs%2Fview%3FboardSeq%3D28%26listSeq%3D5459542' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231024/1698107464225.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='엄마표 미역국이 그리울 때' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9798&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fbbs%2Fview%3FboardSeq%3D28%26listSeq%3D5459542' class='link_title main-info-thumb-text__link' target='_blank'>엄마표 미역국이 그리울 때</a> 		<a href='https://prod.danawa.com/info/?pcode=20662031' target='_blank' class='link_relate main-info-thumb-prod__link'><span class='txt'>상품보기</span></a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9785&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fbbs%2Fview%3FboardSeq%3D28%26listSeq%3D5458674' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231023/1698021226971.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='세제값 줄이는 방법 알려드립니다' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9785&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fbbs%2Fview%3FboardSeq%3D28%26listSeq%3D5458674' class='link_title main-info-thumb-text__link' target='_blank'>세제값 줄이는 방법 알려드립니다</a> 		<a href='https://prod.danawa.com/info/?pcode=28467740' target='_blank' class='link_relate main-info-thumb-prod__link'><span class='txt'>상품보기</span></a>		</div> </li> <li class="main-info__list2__item"> 		<div class="main-info__list2__thumb"> 			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9784&redirectUrl=http%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D28%26listSeq%3D5458639' target='_blank' class='main-info-thumb-image__link'>				<span class='inner'>					<img src='//img.danawa.com/images/attachFiles/newsRoom/20231023/1698021047582.jpeg?fitting=Large|150:88&amp;crop=150:88;*,*' class='img_resize' alt='비린내 없는 오메가3 제품 발견!' onerror='this.src="//img.danawa.com/new/noData/img/nolmg_320x240.jpg"' aria-hidden='true' />				</span>			</a> 		</div>		<div class='main-info__list2__cont'>			<a href='http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9784&redirectUrl=http%3A%2F%2Fdpg.danawa.com%2Fnews%2Fview%3FboardSeq%3D28%26listSeq%3D5458639' class='link_title main-info-thumb-text__link' target='_blank'>비린내 없는 오메가3 제품 발견!</a> 		<a href='https://prod.danawa.com/info/?pcode=10749003' target='_blank' class='link_relate main-info-thumb-prod__link'><span class='txt'>상품보기</span></a>		</div> </li></ul><ul class="main-info__list3"><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9780&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fbbs%2Fview%3FboardSeq%3D28%26listSeq%3D5457402" class="main-info__list3__link main-info-thumb-text__link" target="_blank">스벅 텀블러 각인 서비스 신청 후기</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9781&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fbbs%2Fview%3FboardSeq%3D28%26listSeq%3D5457388" class="main-info__list3__link main-info-thumb-text__link" target="_blank">무릎 관절도 휴식이 필요해요</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9761&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fbbs%2Fview%3FboardSeq%3D28%26listSeq%3D5455113" class="main-info__list3__link main-info-thumb-text__link" target="_blank">내가 이래서 매드포갈릭을 좋아해</a></li><li class="main-info__list3__row">	<a href="http://dpg.danawa.com/bbs/newsRoomBridge?newsRoomItemSeq=9759&redirectUrl=https%3A%2F%2Fdpg.danawa.com%2Fbbs%2Fview%3FboardSeq%3D28%26listSeq%3D5455091" class="main-info__list3__link main-info-thumb-text__link" target="_blank">진짜로 햄이 듬뿍 들어가 있네?</a></li></ul></div>					</div>
				</div>
			</div>
			<div class="swipe-control">
				<div class="swipe-control__num">
					<em class="current"><span class="blind">현재</span><span id="newsRoomNowPage">4</span></em>/<span class="blind">전체</span>7				</div>
				<div class="swipe-control__btn">
					<button type="button" class="btn_prev" id="newsRoomPrevPage"><span class="blind">이전</span></button>
					<button type="button" class="btn_next" id="newsRoomNextPage"><span class="blind">다음</span></button>
					<button type="button" class="btn_stop" id="newsRoomAutoPlay"><span class="blind">자동재생 적용</span></button>
					<input type="hidden" id="newsRoomAutoPlayManualYN" value="N">
				</div>
			</div>
		</div>
	</div>
	<div id="danawa_main_container"><div class="main-top main__inner">
	

<!-- 지금 가장 인기 있는 상품 -->
<div class="main__header">
		<h2 class="title">지금 가장 <em class="point">인기 있는</em> 상품</h2>
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
				data-src="/resources/shop-logoimg/EE715_logo.gif" alt="옥션" class=""></a></li>
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
			data-name="SSG"><img src="/resources/shop-logoimg/TN118_logo.gif"
				data-src="/resources/shop-logoimg/TN118_logo.gif" alt="SSG" class=""></a></li>
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
				data-src="/resources/shop-logoimg/TN729_logo.gif" alt="위메프" class=""></a></li>
		<li class="main-mall__item"><a
			href="http://shinsegaemall.ssg.com?ckwhere=s_danawa" target="_blank"
			data-name="신세계몰"><img
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
			data-name="쿠팡"><img src="/resources/shop-logoimg/TP40F_logo.gif"
				data-src="/resources/shop-logoimg/TP40F_logo.gif" alt="쿠팡" class=""></a></li>
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
		$(document).ready(function(){
			oCategoryLnb = new CategoryLnb();
			oCategoryLnb.setListRootUrl("https://prod.danawa.com/list/");
			oCategoryLnb.setRootElement($(".main-header__category .category_hover_layer_wrap"));
			oCategoryLnb.setSectionElement($(".main-header__category #sectionLayer"));
		});

		_TRK_PI = "Main";

		var memberId = ""
	</script>
<script src="//static.danawa.com/globaljs/external/yall/yall.min.js"></script><script src="//static.danawa.com/globaljs/external/yall/intersection-observer.js"></script><script src="//static.danawa.com/globaljs/external/modernizr/2.8.3/modernizr.custom.touch-events.js?v=2309221348"></script><script src="//static.danawa.com/globaljs/external/jquery/plugin/jquery.mousewheel/3.1.12/jquery.mousewheel.min.js?v=2309221348"></script><script src="//static.danawa.com/globaljs/static/bdl/dsas_client.min.js?v=1.0.0"></script><script src="//static.danawa.com/globaljs/com/danawa/util/common_lnb.js?v=2309221348"></script><script src="//static.danawa.com/globaljs/com/danawa/common/category/mainLNBMenu.js?v=2309221348"></script><script src="https://www.danawa.com/main/js/mainLayer.js?v=2309221348"></script><script src="https://www.danawa.com/main/js/priceCompareTop100.js?v=2309221348"></script><script src="//static.danawa.com/globaljs/com/danawa/common/category/main_lnb_ui.js?v=2309221348"></script><script src="https://www.danawa.com/main/js/mainLogger.js?v=2309221348"></script><script src="//static.danawa.com/globaljs/external/swiper/5.4.5/swiper.min.js?v=2309221348"></script><script src="//static.danawa.com/globaljs/external/postscribe/postscribe.min.js"></script>			<script>
				var _TRK_CP = '메인_NEW/통합메인';
			</script>
			</div>
</div>
</div>
		<script src="//static.danawa.com/globaljs/static/logger_trackEvent.js"></script>
		<script src="//static.danawa.com/globaljs/static/logger_Insight_WebAnalytics.js"></script>
			<script src="//static.danawa.com/globaljs/static/wcslog.js?v1607061545="></script>
		<script>
			if (!wcs_add) var wcs_add = {};
			wcs_add["wa"] = "s_3b3fb74948b1";
			if (!_nasa) var _nasa = {};
			wcs.inflow("danawa.com");
			wcs_do(_nasa);
		</script>
			<script>
			(function(w, d, a) {
				w.__beusablerumclient__ = {
					load: function(src) {
						var b = d.createElement("script");
						b.src = src;
						b.async = true;
						b.type = "text/javascript";
						d.getElementsByTagName("head")[0].appendChild(b);
					}
				};
				w.__beusablerumclient__.load(a);
			})(window, document, '//rum.beusable.net/script/b200115e112333u798/dce25d2b02');
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
<script src="//static.danawa.com/globaljs/com/danawa/common/setUpMobileView.js"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-37762359-14"></script>
<!-- Google Analytics 4(GA4) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-L8D5P2KD8Z"></script>
<script>
	window.dataLayer = window.dataLayer || [];

	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'UA-37762359-14', {
		'sample_rate': 5
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
			collect: {},
			conversion: {
				product: []
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
			device: 'W'
		});
		enp('send', 'common', 'danawa');

			</script>
	<!-- Enliple Tracker End -->
<!-- AceCounter Log Gathering Script V.8.0.2019080601 -->
<script src="//static.danawa.com/globaljs/static/acecounter/acecounter_script_pc.js?v=2205041250"></script>
<noscript>
	<img src="//gtp13.acecounter.com:8080/?uid=AH6A45867192252&je=n&" border="0" width="0" height="0" alt="">
</noscript>
<!-- AceCounter Log Gathering Script End -->

	<%@ include file="include/footer.jsp"%>