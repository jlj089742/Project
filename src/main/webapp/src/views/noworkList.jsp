<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>审核单管理</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/src/layuiadmin/layui/css/layui.css"
	media="all">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

	<table id="customer" lay-filter="test"></table>

	<script
		src="${pageContext.request.contextPath}/src/layuiadmin/layui/layui.js"></script>
	<script>
		layui
				.use(
						'table',
						function() {
							var table = layui.table;
							var form = layui.form;
							table
									.render({
										elem : '#customer',
										url : '${pageContext.request.contextPath}/super/selNoworkList?depid=${department}&time=${time}',
										page : true,
										cols : [ [  {
											field : 'id',
											title : 'ID',
											sort : true,
											fixed : 'left'
										}, {
											field : 'name',
											title : '用户名字',
										},  {
											field : 'sumday',
											title : '总天数',
										},  ] ]
									});

						});
	</script>
</body>
</html>