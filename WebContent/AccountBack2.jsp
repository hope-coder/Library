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
                        <p><strong>Set</strong></p>
                    </div>
                    <div class="intro">
                        <h2>your new password</h2>
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
	                <form action="AccountBack2.jsp">
	                    <div class="form-group">
	                        <label for="inputCode3" class="col-sm-5 col-sm-offset-2">Verification code</label>
	                        <div class="col-sm-8 col-sm-offset-2">
	                            <input class="form-control input-lg" id="inputCode" name="inputCode"
	                                placeholder="verification code">
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="inputNewPwd3" class="col-sm-5 col-sm-offset-2">New password</label>
	                        <div class="col-sm-8 col-sm-offset-2">
	                            <input type="password" class="form-control input-lg" id="newPwd" name="newPwd"
	                                placeholder="new password">
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="confirmPwd3" class="col-sm-5 col-sm-offset-2">Confirm the password</label>
	                        <div class="col-sm-8 col-sm-offset-2">
	                            <input type="password" class="form-control input-lg" id="confirmPwd" name="confirmPwd"
	                                placeholder="confirm your password">
	                        </div>
	                    </div>
	                    <br><br><br>
	                    <div class="form-group">
	                        <div class="form-group">
	                            <div class="col-sm-offset-2 col-sm-8">
	                                <button type="submit" style="margin-left:0px;color:white" class="btn btn-lg btn-block">
	                                    <div class="sign-in">Get back your account</div>
	                                </button>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                    	<div class="form-group">
	                        	<div class="col-sm-offset-2 col-sm-8">
	                                <button type="button" style="margin-left:0px;color:white" class="btn btn-lg btn-block" 
	                                onclick="location.href='AccountBack1.jsp'" >
	                                    <div class="Back">Back</div>
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
String inputCode=(String)request.getParameter("inputCode");
String newPwd=(String)request.getParameter("newPwd");
String confirmPwd=(String)request.getParameter("confirmPwd");
if(inputCode==null||newPwd==null||confirmPwd==null) return;
else if(inputCode.equals("")||newPwd.equals("")||confirmPwd.equals("")) return;
else{
	AccountBack a=new AccountBack();
	a.SetAccount((String)session.getAttribute("account1"));
	a.SetRanNum((int)session.getAttribute("verCode1"));
	try{
		int t=Integer.parseInt(inputCode);
	}
	catch(NumberFormatException e)
	{
		out.print("<script>function err3() {alert('please input the correct verification code!');} err3()</script>");
		return;
	}
	if(a.Main2(Integer.valueOf(inputCode),newPwd))
	{
		if(newPwd.equals(confirmPwd)){
			out.print("<script>function tips() {alert('you have gotten back your account!');window.loca"+
					"tion.href = 'login.jsp';} tips()</script>");
		}
		else out.print("<script>function err() {alert('two password you input are different!');} err()</script>");
	}
	else out.print("<script>function err2() {alert('your verification code is wrong!');} err2()</script>");
}
%>
</body>
</html>