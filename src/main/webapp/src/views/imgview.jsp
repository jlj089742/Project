<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>imgview</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/src/layuiadmin/layui/css/layui.css"
	media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/src/layuiadmin/style/admin.css"
	media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/src/layuiadmin/style/login.css"
	media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/src/layuiadmin/layui/layui.js"
	media="all">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
     
   <% 
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("utf-8");
String address = request.getParameter("address");

%>  
</head>
<body>
<img class="layui-upload-img" width="100%" height="100%" src="<%=address%>">
</body>
</html>