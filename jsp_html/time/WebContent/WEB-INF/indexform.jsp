<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>타임캡슐</title>
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
                <h1>추억을 추억하세요,<br>온라인 타임캡슐</h1>
                <p>
                    당신의 추억을 적어 저장하세요 어쩌구 저쩌구, <br>
                    감동적인 멘트를 길게 적는건 저한테는 너무 어려운 일입니다,<br>
                    지금은 이렇게 썼지만 나중에 꼭 잘 적어 놔야지 길이 맞추기 위해 적은 글. 
                </p>
                <div class="play-btn">
                    <div class="play-btn-inner">
                        <i class="fas fa-play"></i>
                    </div>
                    <small><b>타임캡슐 만들기</b></small>
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