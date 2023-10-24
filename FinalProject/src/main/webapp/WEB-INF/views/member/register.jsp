<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<!-- Font Icon -->
<link rel="stylesheet"
	href="/resources/login/fonts/material-icon/css/material-design-iconic-font.min.css">
<!-- Main css -->
<link rel="stylesheet" href="/resources/login/css/style.css">
<meta name="robots" content="noindex, follow">
<title>회원 가입</title>
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
<body>
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
					<div class="signup-image">
						<figure>
							<img src="/resources/login/images/signup-image.jpg"
								alt="sing up image">
						</figure>
						<a href="#" class="signup-image-link">로그인 페이지로</a>
					</div>
				</div>
			</div>
		</section>

	</div>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>