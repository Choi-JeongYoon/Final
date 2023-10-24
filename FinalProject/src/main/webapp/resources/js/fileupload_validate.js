/**

 * upload_01.jsp validation
 * => jquery validation 플러그인 이용

 */

$(document).ready(function(){
	$("#uploadForm").validate({		
		//규칙지정
		rules:{
			file:{
				required : true,
				extension:"png|jpg|gif",
				maxsizetotal:2097152 //2*1024*1024
			}			
		},

		//개발자가 원하는 에러 메시지 작성
		messages:{
			name:{ //이름은 필수요소이고 글자는 최소 2~최대4까지만 허용
				required: "(이름 입력)"	
			},
			title:{
				required : "(제목 입력)"	
			},
			file:{
				required : "(파일 선택)",	
				extension:"(이미지 파일 입력)",
				maxsizetotal:"(파일 사이즈 초과)"
			}
		},		
		errorElement: "span",
		errorPlacement: function(error, element) {
			
			if(element.prop("type")==="file"){
				$( element ).closest( "form" )
				.find( "small[id='" + element.attr( "id" ) + "']" )
					.append(error);
			}else{
				$( element ).closest( "form" )
				.find( "label[for='" + element.attr( "id" ) + "']" )
					.append(" ").append(error);
			}
		},

	});	

});
