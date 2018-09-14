<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/common/header.jsp"%>
<html>
<head>
	<title>Indesx.jsp </title>
</head>
<body>
<h1>
	Main.Page 
</h1>
<section>
   <h1>회원가입 등록 페이지</h1>
   <form id='reg_form' action='${pageContext.request.contextPath}/register' method='post'>
    <%-- <form onsubnit='return register()method='post'> --%>
      <table>
         <tr>
            <td><label for='member_id'>회원아이디: </label></td>
            <td><input type='text' name='member_id' required></td>
         </tr>
         <tr>
            <td>비밀번호</td>
            <td><input id='mem_pw1' type='password' name='member_pw1' placeholder='Enter Password' required></td>
         </tr>
         <tr>
            <td>비밀번호 확인</td>
            <td><input id='mem_pw2' type='password' name='member_pw2' placeholder='Enter Password again' required></td>
         </tr>
         <tr>
            <td>회원성명</td>
            <td><input id='mem_name' type='text' name='member_name' placeholder='Enter name...' required ></td>
         </tr>
         <tr>
            <td>가입일자</td>
            <td><input type='text' name='member_join_date' value='${today }'></td>
         </tr>

         <tr>
            <td colspan='2'><input id='reg_button' type='submit' onclick='register()' value='가입'>
            				<input id='list_button' type='submit' onclick='list()' value='조회'>
            </td>
         </tr>
      </table>
   </form>
   
</section>
</body>


<script>
	var request;
	var idCheckDone = false;
	
	function idinput_change() {
		idCheckDone = false;	
	}
	
	function register() {
		console.log('register called');
		
		if (idCheckDone == false) {
			alert('id check를 하세요')
			return false;
		} 
		
		var params = '';
		var formObj = document.getElementById('reg_form');
		request = new XMLHttpRequest();
		var url = "${pageContext.request.contextPath}/register";
		var elem = formObj.elements;
		
		for (var i = 0; i < elem.length; i++) {
			if (elem[i].tagName == "SELECT") {
	            value = elem[i].options[elem[i].selectedIndex].value;
	        } else {
	            value = elem[i].value;                
	        }
			params += elem[i].name + '=' + encodeURIComponent(value) + '&';
		}
		
		try {
			request.onreadystatechange = getResult;
			request.open("POST", url, true);
			request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			request.send(params);
		} catch(e) {
			alert('서버로 요청이 실패');
		}
		
		return false;
	}
	
	function getResult() {
		if (request.readyState == 4) {
			var result = request.responseText;
			
			if (result == 'success') {
				alert('업데이트 성공')
			} else {
				alert('업데이트 실패')
			}
		}
	}
	
	function getIdCheckResult() {
		if (request.readyState == 4) {
			var result = request.responseText;
			
			if (result == 'available') {
				idCheckDone = true;
				
				alert('사용가능')
			} else {
				alert('이미 사용된 아이디 입니다. 다른 아이디를 쓰세요')
			}
		}
	}
	
	function pw_validate() {
		var pw1 = document.getElementById('mem_pw1');
		var pw2 = document.getElementById('mem_pw2');
		
		if (pw1 == pw2) {
			return true;
		} else {
			return false;
		}
	}
	
	function id_check() {
		
		var id = document.getElementById('mem_id');
		console.log('id check called: ' + id.value)
		
		var params = 'id=' + id.value;
		var formObj = document.getElementById('reg_form');
		request = new XMLHttpRequest();
		var url = "${pageContext.request.contextPath}/idcheck";
		
		try {
			request.onreadystatechange = getIdCheckResult;
			request.open("POST", url, true);
			request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			request.send(params);
		} catch(e) {
			alert('서버로 요청이 실패');
		}
		
		return false;
		
	}
	
	function list_member() {
		console.log("list called")
		location.href = "${pageContext.request.contextPath}/list"
	}
</script>
</html>
