<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.IOException"%>
<%@page import="java.net.http.HttpClient"%>
<%@page import="java.net.http.HttpResponse"%>
<%@page import="java.net.URI"%>
<%@page import="java.net.http.HttpRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	HttpRequest reques = HttpRequest.newBuilder().uri(URI.create("https://exercisedb.p.rapidapi.com/exercises/name/chest"))
			.header("X-RapidAPI-Key", "caadb00afdmsh36cd95a51945ca7p1fa837jsnb48876348d7b")
			.header("X-RapidAPI-Host", "exercisedb.p.rapidapi.com").method("GET", HttpRequest.BodyPublishers.noBody())
			.build();
	HttpResponse<String> respons = null;
	try {
		respons = HttpClient.newHttpClient().send(reques, HttpResponse.BodyHandlers.ofString());
	} catch (IOException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (InterruptedException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	String jsonresponse = respons.body();

	JSONArray jsonArray = new JSONArray(jsonresponse);
	for (int i = 0; i < jsonArray.length(); i++) {
		JSONObject jsonObject = jsonArray.getJSONObject(i);
		String bodyPart = jsonObject.getString("bodyPart");
		String name= jsonObject.getString("name");
		String gifUrl = jsonObject.getString("gifUrl");
		String equipment = jsonObject.getString("equipment");
		String target = jsonObject.getString("target");
		// ...

		// Print the extracted key values
	%>
	<p>
		<strong>Body Part:</strong>
		<%=bodyPart%></p>
	<p>
		<strong>Workout Name:</strong>
		<%=name%></p>

	<p></p>
	<p>
		<strong>Equipment :</strong>
		<%=equipment%></p>
	<p>
		<strong>Target Muscle:</strong>
		<%=target%></p>

	<p>
		<strong>Workout Demo:</strong>
	</p>
	<img src="<%=gifUrl%>" alt=""></img>

	      <%
	}
	%>
</body>
</html>