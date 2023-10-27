<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="footer__wrap">
	<div class="footer__inner">
		<div class="footer__info">
			<div class="footer__about">
				<span class="address">주소 (우) 08754 서울특별시 관악구 신림동 1422-5 (르네상스
					복합쇼핑몰)</span> <span class="txt">대표: 이젠컴퓨터아카데미</span><br>
				<span class="txt">사업자번호: 123-45-67890</span> <span class="txt">통신판매업:
					제1111-서울신림-22222호</span> <span class="txt">부가통신사업: 제333333호<a
					href="https://sl.ezenac.co.kr/" class="btn_footer" target="_blank">사업자정보확인</a></span>
			</div>
			<div class="footer__law">
				<strong class="title">콘텐츠산업진흥법</strong><span class="summary">콘텐츠산업
					진흥법에 의한 콘텐츠 보호</span> <a href="#" role="button" class="btn_footer"
					id="content_see_more">자세히보기</a>
				<div class="layer__basic" id="footer_law_layer" role="dialog"
					aria-label="콘텐츠산업진흥법에 의한 표시" style="display: none;">
					<div class="layer__basic__wrap">
						<div class="layer__basic__header">
							<strong class="layer__basic__title">콘텐츠산업진흥법에 의한 표시</strong>
						</div>
						<div class="layer__basic__cont">
							<div class="layer__footer-law">
								<div class="layer__footer-law__detail">
									<dl class="row">
										<dt class="title">콘텐츠의 명칭</dt>
										<dd class="cont">상품콘텐츠(정보) 및 기사, 이벤트 정보</dd>
									</dl>
									<dl class="row">
										<dt class="title">콘텐츠의 제작 및 표시 연월일</dt>
										<dd class="cont">개별 표기된 제작일 또는 갱신일</dd>
									</dl>
									<dl class="row">
										<dt class="title">콘텐츠의 제작자</dt>
										<dd class="cont">
											이젠컴퓨터아카데미<br>전화: 6789 - 1234 (유료) / 팩스: 1234-5678<br>서울특별시 관악구 신림로 340, 르네상스복합쇼핑몰 6층
										</dd>
									</dl>
									<dl class="row">
										<dt class="title">콘텐츠의 이용조건</dt>
										<dd class="cont">
											이용약관 및 서비스 안내 참조<br>(동의 없이 무단복제 및 가공을 금함)<a
												href="https://www.danawa.com/info/agreement.html"
												target="_blank" class="btn_footer">이용약관 보기</a>
										</dd>
									</dl>
								</div>
								<div class="layer__footer-law__noti">
									<p class="text">
										다나와유 홈페이지 내의 모든 콘텐츠는 『콘텐츠산업 진흥법』에 따라 <br> 제작일 또는 그
										갱신일로부터 5년간 보호 됩니다.
									</p>
								</div>
							</div>
						</div>
						<button type="button" class="layer__basic__close">
							<span class="blind">닫기</span>
						</button>
					</div>
				</div>
				<a href="http://help.danawa.com/bizCenter/index.php?depth1=11"
					class="btn_footer" target="_blank">콘텐츠이용안내</a>
			</div>
			<div class="footer__point">
				다나와유는 상품판매와 직접적인 관련이 없으며, 모든 상거래의 책임은 구매자와 판매자에게 있습니다.<br>
				이에 대해 다나와유는 일체의 책임을 지지 않습니다.<br> 본사에 등록된 모든 광고와 저작권 및
				법적책임은 자료제공사 (또는 글쓴이)에게 있으므로 본사는 광고에 대한 책임을 지지 않습니다.
			</div>
			<address class="footer__copy">
				Copyright © <strong>connectwave</strong> Co., Ltd. All Rights
				Reserved.
			</address>
			<div class="footer__kolsa">
				<a target="_blank" href="http://www.kolsa.or.kr"> <span
					class="blind">KOLSA 한국온라인 쇼핑협회</span>
				</a>
			</div>
		</div>
		<div class="footer__cs">
			<strong class="title">다나와유 고객센터</strong>
			<div class="service">
				<a href="http://help.danawa.com" target="_blank"
					class="link link--home">고객센터 홈</a> <a href="#" target="_blank"
					onclick="window.open('https://help.danawa.com/onlineInquiry.php?referUrl='+ window.location.href,'_blank', 'width=800, height=900, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no'); return false;"
					class="link link--inquiry">신고/문의/제안</a> <a
					href="http://help.danawa.com/serviceHelpList.php" target="_blank"
					class="link link--help">서비스도움말</a>
			</div>
			<ul class="info">
				<li class="item">전화: 6789-1234 (유료)</li>
				<li class="item">팩스: 1234-6789</li>
				<li class="item">이메일: ezen@ezenac.co.kr</li>
			</ul>
			<ul class="relative">
				<li class="item"><a href="#" role="button" class="btn_footer"
					id="denyEmailOpenBtn" onclick="return false;">이메일수집거부</a>
					<div class="layer__basic" id="denyEmailNoticeArea" role="dialog"
						aria-label="이메일 주소 무단 수신수집 거부" style="display: none;">
						<div class="layer__basic__wrap">
							<div class="layer__basic__header">
								<strong class="layer__basic__title">이메일 주소 무단 수신수집 거부</strong>
							</div>
							<div class="layer__basic__cont">
								<div class="layer__footer-denyemail">
									<p class="contents">
										영리목적 다나와유에서는 본 웹사이트에 게시된 이메일 주소가<br> 전자우편 수집 프로그램이나
										그 밖의 기술적 장치를 이용하여<br> 무단으로 수집되는 것을 거부하며, 이를 위반시<br>
										<strong class="point">정보통신망법에 의해 형사처벌됨</strong>을 유념하시기 바랍니다.
									</p>
									<span class="date">[게시일 2004년 1월 16일]</span>
								</div>
							</div>
							<button type="button" id="denyEmailCloseBtn"
								class="layer__basic__close">
								<span class="blind">닫기</span>
							</button>
						</div>
					</div></li>
				<li class="item"><a
					href="http://help.danawa.com/ars_suggestion.php" target="_blank"
					class="btn_footer">ARS문의안내</a></li>
			</ul>
		</div>
	</div>
</div>

</body>
</html>