<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>用户详情</title>
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
</head>
<body>
	<form class="layui-form" action="" id="frm"
		style="float: left; position: fixed">
		<input type="text" id="id" name="id" value="${member.id}" hidden="">
		<div class="layui-form-item">
			<label class="layui-form-label">账号</label>
			<div class="layui-input-inline">
				<input type="text" name="username" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input"
					value="${member.username}">
			</div>
			<%-- <label class="layui-form-label">公司logo</label>
			<div class="layui-upload" id="test10">
				<img class="layui-upload-img" id="himg" width="50" height="50"
					src="${pageContext.request.contextPath}/${customer.logo}"> <input
					name="logo" id="logo" hidden="" value="${customer.logo}">
			</div> --%>
			<label class="layui-form-label">密码</label>
			<div class="layui-input-inline">
				<input type="text" name="password" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input"
					value="${member.password}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">名字</label>
			<div class="layui-input-inline">
				<input type="text" name="name" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input"
					value="${member.name}">
			</div>
			<label class="layui-form-label">性别</label>
			<div class="layui-input-inline">
				<input type="text" name="sex" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input"
					value="${member.sex}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">电话</label>
			<div class="layui-input-inline">
				<input type="text" name="phone" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input"
					value="${member.phone}">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">修改</button>
				<button type="reset" class="layui-btn layui-btn-primary" id="reset">重置</button>
			</div>
		</div>
	</form>

<%-- 	<form class="layui-form" action="" id="frm2"
		style="float: right; margin-right: 35%;">
		<input type="text" id="cusid" name="cusid" value="${customer.id}"
			hidden="">
		<div class="layui-form-item">
			<label class="layui-form-label"
				style="font-size: 20px; text-align: left">动态</label>
		</div>
		<div class="layui-form-item">
			<div>
				<div class="layui-upload">
					<button type="button" class="layui-btn" id="test1">图片</button>
					<div class="layui-upload-list">
						<img class="layui-upload-img" id="demo1" width="50" height="50">
						<input name="img" id="img" hidden="">
					</div>
				</div>
			</div>
			<div>
				<button type="button" class="layui-btn" id="test4">文档</button>
				<input name="files" id="files" hidden="">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-inline">
				<textarea cols="35" rows="5" placeholder="多行输入" name="content"
					id="content"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-inline">
				<button class="layui-btn" lay-submit lay-filter="send">发送</button>
			</div>
		</div>
		<div class="layui-form-item">
			<ul class="layui-timeline" id="trends">
				<img class="layui-upload-img" width="50" height="50"
					src="${pageContext.request.contextPath}/${trends.img}">
				<a href="${pageContext.request.contextPath}/">附件</a>
			</ul>
			<div id="yema"
				style="display: flex; flex-direction: row; justify-content: center; background: white; margin-top: 10px;">
			</div>
		</div>
	</form> --%>

	<script
		src="${pageContext.request.contextPath}/src/layuiadmin/layui/layui.js"></script>
	<script>
		layui
				.use(
						[ 'form', 'jquery', 'upload' ],
						function() {
							var form = layui.form;
							$ = layui.$, upload = layui.upload;

							//监听提交
							form
									.on(
											'submit(formDemo)',
											function(data) {
												$
														.ajax({
															url : "${pageContext.request.contextPath}/super/updateMember.action",
															type : "POST",
															data : $("#frm")
																	.serialize(),
															success : function(
																	data) {
																console
																		.log(data)
																layer
																		.msg("修改成功")
																setTimeout(
																		function() {
																			var index = parent.layer
																					.getFrameIndex(window.name);
																			parent.layer
																					.close(index);
																			top.location
																					.reload()
																		}, 1000);
															}
														})

												//layer.msg(JSON.stringify(data.field));
												return false;
											});
							
							
						});
	</script>
</body>
</html>