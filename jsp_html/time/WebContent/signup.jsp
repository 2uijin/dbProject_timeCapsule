<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mirim.hs.kr.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="mirim.hs.kr.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
	member.setReg_date(new Timestamp(System.currentTimeMillis()));
	
	LogonDataBean manager = LogonDataBean.getInstance();
	manager.insertMember(member);
	
	response.sendRedirect("login.html");


%>
