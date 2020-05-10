<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="reader.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="./bootstrap-3.3.7-dist/css/bootstrap-theme.css">
    
    <script src="../jquery-3.4.1.min.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <style>
    	* {
   			 padding: 0;
   			 margin: 0;
			}

		html {
    		height: 100%;
		}
        .login-left{
            width: 56%;
            height: 912px;
            background-color: rgb(79,87,97);
            margin-left: -15px;
            margin-top: -10px;            
            float: left;
        }
        .login-right{
            width: 34%;
            height: 912px;
            background-color: white;;
            float: right;
            margin-top: -10px;
        }
        .welcome{
            color: white;
            margin-left: 30%;
            margin-top: 56%;
            font-size: 60px;

        }
        .intro{
            color: white;
            margin-left: 30%;
        }
        .form-horizontal{
            margin-top: 70%;
            margin-left: -20%;
        }
        .btn-block{
            margin-left: 50%;
            background-color: rgb(79,87,97);
        }
        .sign-in{
            color: white;
        }
        .info{
            color:  rgb(79,87,97);
            font-size: 40px;
            margin-left: 20%;
        }
        .checkbox{
            float: left;
            margin-left: -15%;
            margin-right: 25%;
        }
        .forgetpassword{
            font-size: 18px;
            color: rgb(79,87,97);
        }
        .option{
            margin-left: 20%;
        }
        .optionx{
            margin-right: 16%;
        }
        body{
            /* overflow: hidden; */
            height: 100%;
        }
    </style>

</head>
<body>
    <div class="container-fluid">
        <div class="login">
            <!--找回密码左边-->
            <div class="login-left">
                <div class="word">
                    <div class="welcome">
                        <p><strong>Forget</strong></p>
                    </div>
                    <div class="intro">
                        <h2>your password?</h2>
                    </div>
                </div>
            </div>
            <!-- 找回密码右边 -->
	        <div class="login-right">
	            <div class="form-horizontal">
	                <div class="info">
	                    <p>
	                        <img src="./assets/images/LOGO.jpg" alt="">
	                    </p>
	                </div>
	                <div class="head-of-login">
	                </div>
	                <form action="AccountBack1.jsp">
	                    <div class="form-group">
	                        <label for="inputAccount3" class="col-sm-5 col-sm-offset-2">Input your Account</label>
	                        <div class="col-sm-8 col-sm-offset-2">
	                            <input class="form-control input-lg" id="account" name="account" placeholder="Account">
	                        </div>
	                    </div>
	                	<div class="option" >
	                    	<div class="form-group">
	                        	<div class="col-sm-8">
	                            	<button type="submit" style="margin-left:0px;color:white" class="btn btn-lg btn-block">
	                                	<div class="verCode">Get your verification code</div>
	                            	</button>
	                        	</div>
	                        </div>
	                    </div>
	                    <div class="option">
	                    	<div class="form-group">
	                        	<div class="col-sm-8">
	                            	<button type="button" style="margin-left:0px;color:white"  class="btn btn-lg btn-block" onClick="location.href='login.jsp'"
	                            	onclick="location.href='login.jsp'"> 
	                                	<div class="back">Back</div>
	                            	</button>
	                            </div>
	                        </div>
	                    </div>
	                </form>
	            </div>
	        </div>
        </div>
    </div>
<%
String Account=(String)request.getParameter("account");
if(Account==null||Account.equals("")) return;
else{
	AccountBack a=new AccountBack();
	String outputCode=null;
	if(!a.checkAccount(Account))
	{
		out.print("<script>function err() {alert('account not found!');} err()</script>");
		return;
	}
	a.Main1();
	session.putValue("verCode1",a.getRanNum());
	session.putValue("account1",a.getAccount());
	out.print("<script>function tips() {alert('please check your email for the verification code!');window.loca"+
			"tion.href = 'AccountBack2.jsp';} tips()</script>");
}
%>
</body>
</html>