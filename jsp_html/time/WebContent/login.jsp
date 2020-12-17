<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="mirim.hs.kr.*"%>
<%@ page import="java.sql.*"%>    
    
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	LogonDataBean manager = LogonDataBean.getInstance();
	int check = manager.userCheck(id, passwd);
	
	if(check==1) {
		//out.println("회원");
		session.setAttribute("userid", id);
		response.sendRedirect("indexform.jsp");
	}
	else if(check==0) {
		//out.println("회원은 맞으나 비번이 틀림"); %>
<script>
			alert("비밀번호를 다시한번 입력해주세요.");
			location.href = "login.html"
		</script>
<% }
	else if(check==-1) {
		//out.println("비회원"); %>
<script>  
			alert("아이디가 존재하지 않습니다.");
			location.href = "login.html"
		</script>
<%
	}
%>