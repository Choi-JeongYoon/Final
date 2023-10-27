<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 : 다나와유</title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=1260" />
	<meta name="Title" content="종합 쇼핑몰 ! 가격비교 다나와유" />
	<meta name="Keywords" content="해당섹션 설명" />
	<meta name="Description" content="" />
	
	<link rel="shortcut icon" href="/resources/img/8651574782_7d7d5261-303c-4a51-b4f2-1d6be0844973.png" />
	<script type="text/javascript" src="/resources/js/util/envUtils.js?v=10"></script>
	
	<!-- Google Tag Manager -->
<script type="text/javascript">
    (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer', 'GTM-WLPCFBQ');</script>


	<!-- End Google Tag Manager -->
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="/resources/login/css/login.css">
	<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/resources/js/library/underscore-1.8.3.min.js"></script>
	<script type="text/javascript" src="/resources/js/util/envUtils.js"></script>
	<script type="text/javascript" src="/resources/js/util/dataUtils.js"></script>
	<script type="text/javascript" src="/resources/js/util/logUtils.js"></script>
	<script type="text/javascript" src="/resources/js/application/common/global.js"></script>
	<script type="text/javascript" src="/resources/js/util/navigationUtils.js"></script>
	<script type="text/javascript" src="/resources/js/service/netService.js"></script>
	<script type="text/javascript" src="/resources/js/DanawaMemberValidation.js?dt=20231012"></script>
	<script type="text/javascript" src="/resources/js/application/model/join/joinStep.js?dt=202310120225"></script>
	<script type="text/javascript" src="/resources/js/application/model/realChk/realChk.js"></script>
<!-- 	<script type="text/javascript"> 
// 		$(document).ready(function() {
// 			var memberJoinStep = new DanawaMemberJoinStep();
// 			memberJoinStep.initialize('');

// 			var memberValidation = new DanawaMemberValidation();
// 			var validatonTagetId = {
// 				tagetFome : "danawa-member-joinStep-form-id",
// 				member : {
// 					id:"danawa-member-joinStep-member-id",
// 					password : "danawa-member-joinStep-member-password",
// 					passwordConfirm :"danawa-member-joinStep-member-passwordConfim",
// 					emailText : "danawa-member-joinStep-member-email",
// 					selectMailBox : "danawa-member-joinStep-selectBox-mail",
// 					emailFrontText : "danawa-member-joinStep-member-emailFront",
// 					emailBackText : "danawa-member-joinStep-member-emailBack",
// 					license : 'danawa-member-joinStep-company-license'
// 				},
// 				message : {
// 					id:"danawa-member-joinStep-message-id",
// 					password : "danawa-member-joinStep-message-password",
// 					passwordConfirm : "danawa-member-joinStep-message-passwordConfirm",
// 					name : "danawa-member-joinStep-message-name",
// 					nickname : "danawa-member-joinStep-message-nickname",
// 					email :"danawa-member-joinStep-message-email"
// 				}
// 			};
// 			memberValidation.initialize(validatonTagetId);

// 			var memberRealChk = new DanawaMemberRealChk();
// 			memberRealChk.initialize();
// 		});
<!-- 	</script> -->

	
<script type="text/javascript">
	function inputCheck() {
		//비밀번호 확인
		let pass = $("#pwd").val();
		let re_pass = $("#re_pwd").val();
		
		// 비밀번호 다르면 return false.
		if (pass !== re_pass){
			 $("#pwd").val("");
			 $("#re_pwd").val("");
			 $("#pwd").focus();
			 alert("비밀번호가 일치하지 않습니다. 확인하세요")
			 return false;
		}
			//이용약관 체크
		if(!$('#agree-term').is(':checked')){
			alert("이용약관 동의해 주세요.")
			return false;
		}
			//이상없으면 return true 
			return true;
	}

	}
	/*************************************************************
	 * 파라미터 디코딩 // Usage: b64_to_utf8('4pyTIMOgIGxhIG1vZGU='); // "✓ à la mode"
	 *************************************************************/
	function b64_to_utf8(str) {
		return decodeURIComponent(escape(window.atob(str)));
	}
</script>
</head>

<body class="body__login">
	<!-- Google Tag Manager -->
	
	<div class="main">
		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">회원가입</h2>
						<form method="POST" class="register-form" id="register-form">
						
							
								<div class="form-group">
									<label for="name"><i
										class="zmdi zmdi-account material-icons-name"></i></label> <input
										type="text" name="id" id="id" placeholder="id" required />
								</div>
								<div class="form-group">
									<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
										type="password" name="pwd" id="pwd" placeholder="비밀번호"
										required />
								</div>
								<div class="form-group">
									<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
									<input type="password" name="re_pwd" id="re_pwd"
										placeholder="비밀번호 재입력" required />
								</div>
								<div class="form-group">
								<label for="addr"><i class="zmdi zmdi-city"></i></label> <input
									type="text" name="email" id="email" placeholder="이메일 주소"
									required />
								<div class="form-group">
									<input type="checkbox" name="agree-term" id="agree-term"
										class="agree-term" /> <label for="agree-term"
										class="label-agree-term" required><span><span></span></span>회원가입시
										<a href="#" class="term-service">이용약관에</a> 동의합니다.</label>
								</div>
								<div class="form-group form-button">
									<input type="submit" name="signup" id="signup"
										class="form-submit" value="회원가입" />
								</div>
						</form>
					</div>
				</div>
			</div>
		</section>

	</div>

		<!-- footer -->
		<div id="footer" class="footer footer__join">
	<a href="home" ><img src="/resources/img/8651574782_7d7d5261-303c-4a51-b4f2-1d6be0844970.png"
								alt="sing up image"></a>
			<address>Copyright © <strong>connectwave</strong> Co., Ltd. All Rights Reserved.</address>
		</div>
		
		<!--// footer -->
	</div>
<script src="//static.danawa.com/globaljs/static/logger_Insight_WebAnalytics.js"></script>

<!--// login_wrap -->
<script type="text/javascript">
	(function(w, d, a){
		w.__beusablerumclient__ = {
			load : function(src){
				var b = d.createElement("script");
				b.src = src; b.async=true; b.type = "text/javascript";
				d.getElementsByTagName("head")[0].appendChild(b);
			}
		};w.__beusablerumclient__.load(a);
	})(window, document, "//rum.beusable.net/script/b200115e112333u798/7c904e004c");
</script>

<!-- Google Tag Manager -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-L8D5P2KD8Z"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'G-L8D5P2KD8Z');
</script>
<script>
    function setGtagEvent(keyword) {
        gtag('event', keyword);
    }
</script>

<!-- End Google Tag Manager -->
</body>
</html>