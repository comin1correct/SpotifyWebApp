<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%String songTitle = request.getParameter("songTitle"); %>
<h2>You entered </h2><p>(<%= songTitle %>)</p>

<!-- 
<!-- https://www.tutorialspoint.com/jsp/jsp_syntax.htm -->
</body>
</html>