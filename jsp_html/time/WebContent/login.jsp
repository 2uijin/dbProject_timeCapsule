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
		//out.println("ȸ��");
		session.setAttribute("userid", id);
		response.sendRedirect("indexform.jsp");
	}
	else if(check==0) {
		//out.println("ȸ���� ������ ����� Ʋ��"); %>
<script>
			alert("��й�ȣ�� �ٽ��ѹ� �Է����ּ���.");
			location.href = "login.html"
		</script>
<% }
	else if(check==-1) {
		//out.println("��ȸ��"); %>
<script>  
			alert("���̵� �������� �ʽ��ϴ�.");
			location.href = "login.html"
		</script>
<%
	}
%>