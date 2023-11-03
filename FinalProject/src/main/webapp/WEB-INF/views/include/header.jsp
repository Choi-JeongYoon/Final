<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.ezen.biz.dto.ProductVO"%>

<!DOCTYPE html>
<html>
<head>
<title>알뜰한 쇼핑 다 나와유 : 가격비교 쇼핑몰</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="Title" content="스마트한 쇼핑검색, 다나와! : 가격비교 사이트" />
<meta name="Description"
	content="가격비교 사이트 - 온라인 쇼핑몰, 소셜커머스 전 상품 정보 가격비교 사이트, 비교하면 다나와" />
<meta name="Keywords"
	content="가격비교, 상품 추천, 가격비교사이트, 다나와, 가격비교 사이트, 가격비교 싸이트, 가격 검색, 최저가, 추천, 인터넷쇼핑, 온라인쇼핑, 쇼핑, 쇼핑몰, 싸게 파는 곳, 지식쇼핑" />
<meta name="Subject" content="스마트한 쇼핑검색, 다나와! : 가격비교 사이트">
<meta name="author" content="http://www.danawa.com">
<meta name="robots" content="index, follow">
<meta property="og:title" content="스마트한 쇼핑검색, 다나와! : 가격비교 사이트" />
<meta property="og:url" content="home" />
<meta property="og:type" content="website" />
<meta property="og:description"
	content="가격비교 사이트 - 온라인 쇼핑몰, 소셜커머스 전 상품 정보 가격비교 사이트, 비교하면 다나와" />
<meta property="og:site_name" content="스마트한 쇼핑검색, 다나와! : 가격비교 사이트" />
<meta property="og:image"
	content="http://img.danawa.com/new/tour/img/logo/sns_danawa.jpg" />
<meta name="google-site-verification"
	content="Zd_kQLEjiNKsk4p5LtRWR2AZFpJf5XlwGsmhy3iAukc" />
<meta name="naver-site-verification"
	content="4379d7b598f27c5fef523e358a8390cdc785ce0f" />
<link rel="alternate" href="http://m.danawa.com/">
<link rel="canonical" href="http://www.danawa.com/">
<meta content="width=1200" name="viewport" />
<link rel="shortcut icon"
	href="/resources/img/8651574782_7d7d5261-303c-4a51-b4f2-1d6be0844973.png" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/headerandfooter.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/headerandfooter2.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/headerandfooter3.css" />
<link href="/resources/css/style.css" type="text/css" rel="stylesheet">
<script src="/resources/js/jquery-3.6.3.min.js" type="text/javascript"></script>
<script src="/resources/js/jQuery.js" type="text/javascript"></script>
<script type="text/javascript"
	src="//static.danawa.com/globaljs/external/jquery/core/1.11.0/jquery-1.11.0.min.js?v=2305031517"></script>
<script type="text/javascript" charset="euc-kr"
	src="//static.danawa.com/globaljs/com/danawa/common/gnb_ui.js?v=2305031517"></script>
<script type="text/javascript" charset="euc-kr"
	src="//static.danawa.com/globaljs/com/danawa/common/jquery.addProductToWishList.js?v=2305031517"></script>
<script type="text/javascript"
	src="//static.danawa.com/globaljs/external/jquery/plugin/jquery.cookie/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8"
	src="//static.danawa.com/globaljs/com/danawa/common/searchAutocompleteLayer_UTF8.js?v=2305031517"></script>

<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-WLPCFBQ');
</script>
<!-- End Google Tag Manager -->
</head>

<div class="main-header__banner">
	<h1 class="main-header__logo">
		<a href="/"> <span class="blind"></span><img
			src="/resources/img/8651574782_7d7d5261-303c-4a51-b4f2-1d6be0844970.png"
			alt="다나와유 로고">
		</a>
	</h1>


	<div class="main-header__search">
		<div class="search">
			<form id="srchFRM_TOP" name="srchFRM_TOP" style="margin: 0px;"
				method="GET" action="//search.danawa.com/dsearch.php"
				data-gtm-form-interact-id="0">
				<fieldset>
					<legend class="blind">통합 검색</legend>
					<div class="search__box search_area_content">
						<input type="text" class="search__input" name="k1" id="AKCSearch"
							autocomplete="off" placeholder="검색어를 입력해주세요." title="검색어 입력"
							value="" data-gtm-form-interact-field-id="0"> <input
							id="module" name="module" value="goods" type="hidden"> <input
							id="act" name="act" value="dispMain" type="hidden">
						<button type="submit" class="search__submit">
							<span class="blind">검색</span>
						</button>
					</div>
					<div style="display: none" id="searchBoxHidden">
						<script type="text/javascript"
							src="//ad.danawa.com/RealMedia/ads/adstream_jx.ads/www.danawa.com/main@x50"></script>
					</div>
					<!-- script type="text/javascript">
						var adv_srch_type = null;
						var adv_srch_obj = null;
						var adv_srch_url = null;
						$(function() {
							new $("FORM#srchFRM_TOP")
									.danawaSearchAutoComplete();

							postscribe(
									'#searchBoxHidden',
									'<script type="text/javascript" src="//ad.danawa.com/RealMedia/ads/adstream_jx.ads/www.danawa.com/main@x50"><\/script>',
									{
										done : function() {
											//먼저 생성된 자동완성 레이어 삭제
											$("FORM#srchFRM_TOP").find(
													'.auto_complete_area')
													.remove();
											//기존에 광고스크립트 내부에서 변수 전달하는 부분을 별도로 전달 (비동기로 호출하게 되면서 불가피한 부분)
											window.parent
													.postMessage([
															adv_srch_type,
															adv_srch_obj,
															adv_srch_url ], '*');

											new $("FORM#srchFRM_TOP")
													.danawaSearchAutoComplete();
										}
									});

						});
						</script -->
					<div id="auto_area2" class="auto_complete_area"
						style="display: none;">
						<div id="akcLayer" class="auto_word_list">
							<ul style="display: none;"></ul>
							<div id="mySearchKeywordBlockArea" style="display: block;">
								<dl class="searched_keyword">
									<dt>최근 검색어</dt>
									<dd>
										<ul id="mySearchKeywordListArea" class="searched_keyword_info">
											<li id="mySearchKeyword_1" text="스마트워치"><a
												href="//search.danawa.com/dsearch.php?k1=%EC%8A%A4%EB%A7%88%ED%8A%B8%EC%9B%8C%EC%B9%98">스마트워치</a>
												<span class="etc"> <span class="date">10.19.</span> <input
													type="button" id="deleteSearchKeyword_1"
													class="btn btn_delete" title="검색한 키워드 삭제">
											</span></li>
										</ul>
									</dd>
								</dl>
							</div>
							<div id="switch_autocomplete" class="func_opt">
								<a href="#" class="com_gnb keyword_all_delete">전체 삭제</a><a
									href="#" class="com_gnb auto_function_switch">자동완성 끄기</a>
							</div>
						</div>
						<div class="auto_product_list">
							<ul id="auto_goods_list" class="auto_goods_list"
								style="display: none;"></ul>
							<ul id="auto_banner_layer" class="goods_banner">
								<li><iframe width="300" height="250" marginheight="0"
										marginwidth="0" title="자동완성 광고영역" scrolling="no"
										frameborder="0"
										src="//ad.danawa.com/RealMedia/ads/adstream_sx.ads/www.danawa.com/main@Top1"></iframe>
								</li>
							</ul>
						</div>
						<div></div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<div class="main-header__user">
		<input type="hidden" id="browserCode"
			value="02c06842-dd4b-454c-8cf5-7180dc2a9745"> <input
			type="hidden" id="memberSeq" value="">

		<div class="item">
			<div class="layer__user-recent" role="dialog" aria-label="최근 본 상품"
				style="display: none;">
				<div class="user-recent">
					<div class="user-recent__wrap" id="recentProduct"></div>
					<div class="user-recent__wrap" id="recentCate"></div>
					<div class="user-recent__wrap" id="buyingGuide"></div>
					<button type="button" class="btn_close">
						<span class="blind">최근 본 상품 닫기</span>
					</button>
				</div>
			</div>
		</div>
		<div class="item">
			<c:choose>
				<c:when test="${sessionScope.name==null}">
					<a href="login" role="button" class="btn_user btn_user--login">
						<span class="txt">로그인</span>
					</a>
				</c:when>
				<c:otherwise>
					<a href="/" role="button" class="btn_user btn_user--login"> <span
						class="txt">${sessionScope.name}</span><em class="lo_nim">님</em>
					</a>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="layer__user-more" style="display: none;">
			<ul class="more-list">
				<c:choose>
					<c:when test="${sessionScope.name==null}">
						<li class="item_more"><a href="login" class="link_more">로그인</a></li>
						<li class="item_more"><a href="register" class="link_more">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li class="item_more"><a href="logout" class="link_more">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				<li class="item_more"><a href="http://help.danawa.com"
					class="link_more">고객센터</a></li>
			</ul>
		</div>
	</div>
</div>