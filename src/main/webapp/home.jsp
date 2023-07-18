<%@page import="java.sql.ResultSet"%>
<%@page import="com.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style/stylesheet.css">
</head>
<body>

	<%
	String uname = (String) session.getAttribute("username");
	UserDao userdao = new UserDao();
	ResultSet rs = userdao.userinfo(uname);
	%>
	<div class="userinfo">
		<table>
			<%
			while (rs.next()) {
			%>
			<tr>
				<th>Name</th>
				<td><%=rs.getString("username")%></td>
			</tr>
			<tr>
				<th>password</th>
				<td><%=rs.getString("password")%></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><%=rs.getString("email")%></td>
			</tr>
			<tr>
				<th>Gender</th>
				<td><%=rs.getString("gender")%></td>
			</tr>
			<tr>
				<th>Date of Birth</th>
				<td><%=rs.getString("dob")%></td>
			</tr>
			<tr>
			<td>
			<form action="ContollerSevlet" method="post">
			<input type="hidden" name="action" value="update"> 
			<input  type="submit" value="Update">
		</form>
		</td>
		<td>
		<form action="ContollerSevlet" method="post">
			<input type="hidden" name="action" value="delete"> 
			<input  type="submit" value="Delete">
		</form>
		</td>
		</tr>
			<%
			}
			%>
			
		</table>
		
	</div>


</body>
</html>