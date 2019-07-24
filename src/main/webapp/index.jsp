<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台登录界面</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/src/layuiadmin/layui/css/layui.css"
	media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/src/layuiadmin/style/admin.css"
	media="all">
<link id="layuicss-layer" rel="stylesheet"
	href="https://www.layui.com/admin/std/dist/layuiadmin/layui/css/modules/layer/default/layer.css?v=3.1.1"
	media="all">
</head>
<body>
	<form class="layui-form" action="" id="frm">
		<div class="layui-form-item">
			<label class="layui-form-label">账号</label>
			<div class="layui-input-inline">
				<input type="text" name="username" required lay-verify="required"
					placeholder="" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-inline">
				<input type="password" name="password" required
					lay-verify="required" placeholder="" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
			</div>
		</div>
	</form>
</body>
<script
	src="${pageContext.request.contextPath}/src/layuiadmin/layui/layui.js"></script>
<script>
	layui
			.use(
					[ 'form', 'jquery', 'upload' ],
					function() {
						var form = layui.form;
						$ = layui.$, upload = layui.upload;
						form
								.on(
										'submit(formDemo)',
										function(data) {
											$
													.ajax({
														url : "${pageContext.request.contextPath}/super/superLogin",
														type : "POST",
														data : $("#frm")
																.serialize(),
														success : function(data) {
															console.log(data);
															if(data.count!=0){
															 window.location.href = "${pageContext.request.contextPath}/src/views/mainPage.jsp?id="
																	+ data.data[0].id
																	+ "&name="
																	+ data.data[0].name; 
															 }else{
																window.location.href="${pageContext.request.contextPath}/index.jsp";
															} 
														}
													})

											return false;
										});
					});
</script>
</html>