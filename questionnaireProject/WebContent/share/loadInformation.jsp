<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Session/Session.jsp" %>
<%@ include file="../Session/logOut.jsp" %>
<%@ include file="../Session/check2.jsp" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css"> 
body { 
    margin:0; 
    padding:0; 
    background:url(image5.jpg);
    background-size:cover;
} 
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>重新载入个人信息</title>
</head>
<body>
	<%
	String sql1="SELECT * FROM Student WHERE STUID='"+session.getAttribute("用户名").toString()+"'";
	if(shareFunction.selectStudentInformation(sql1)!=null)
	{
		String sql="DELETE FROM Student WHERE STUID='"+session.getAttribute("用户名").toString()+"'";
		System.out.println("打印删除学员信息sql语句"+sql);
		shareFunction.updateInformation(sql);
		out.println("<script>alert('请重新输入个人信息');location.href='completeInformation.jsp';</script>");
	}else
	{
		out.println("<script>alert('请完善个人信息');location.href='completeInformation.jsp';</script>");
	}
	%>
</body>
</html>