<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="myform" >
<input>
<input>
<input type="submit" value="submit">

</form>
 <script type="text/javascript">
 const initApp =()=>{
	 const myform =document.querySelector("#myform");
	 myform.addEventListener("submit",(event)=>{
		 event.preventDefault();
	 });
 }
 initApp();
 </script>
</body>
</html>