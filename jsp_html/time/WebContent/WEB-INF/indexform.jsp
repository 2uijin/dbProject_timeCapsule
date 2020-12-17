<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ÿ��ĸ��</title>
    <meta charset="EUC-KR">
    <link rel="stylesheet" href="view/index.css">
    <link rel="stylesheet" herf="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
 <div class ="container">
        <div class="menu">
            <ul>
             <li class ="active">Home</li>
             <li>Make</li>
             <li>Information</li>
             <li>About</li>
			<% if(session.getAttribute("userid")==null){
				out.print("<li><a href='login.html' class='signup-btn'><span>Sign up</span></a></li>");
			} 
			else{
				String userid = (String)session.getAttribute("userid");
				out.print("<li><a href='userinfoform.jsp' class='signup-btn'><span>"+userid+"</span></a></li>");
			}
			%>
            </ul>
        </div>

        <div class="banner">
            <div class="App-text">
                <h1>�߾��� �߾��ϼ���,<br>�¶��� Ÿ��ĸ��</h1>
                <p>
                    ����� �߾��� ���� �����ϼ��� ��¼�� ��¼��, <br>
                    �������� ��Ʈ�� ��� ���°� �����״� �ʹ� ����� ���Դϴ�,<br>
                    ������ �̷��� ������ ���߿� �� �� ���� ������ ���� ���߱� ���� ���� ��. 
                </p>
                <div class="play-btn">
                    <div class="play-btn-inner">
                        <i class="fas fa-play"></i>
                    </div>
                    <small><b>Ÿ��ĸ�� �����</b></small>
                </div>
            </div>
        </div>

        <div class = "waveani">

            <div class ="wave">
            <section>
                <div class="wave wave1">
                </div>
                <div class="wave wave2"></div>
                <div class="wave wave3"></div>
            </section>
                <div class="boat"></div>
            </div>
           
        </div> 
    </div>
</body>
</html>