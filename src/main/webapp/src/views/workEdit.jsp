<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>出勤管理</title>
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
		<div class="layui-form-item">
			<label class="layui-form-label">上午上班时间</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" id="amcheck" name="amcheck">
			</div>
			<label class="layui-form-label">上午下班时间</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" id="amleave" name="amleave">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">下午上班时间</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" id="pmcheck" name="pmcheck">
			</div>
			<label class="layui-form-label">下午下班时间</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" id="pmleave" name="pmleave">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">上班地点</label>
			<div class="layui-input-inline">
				<input type="text" name="place" required lay-verify="required"
					placeholder="上班地点" autocomplete="off" class="layui-input"
					value="${place}">
			</div>
			<label class="layui-form-label">状态</label>
			<div class="layui-input-block">
				<input type="radio" name="type" value="-1" title="单休"> <input
					type="radio" name="type" value="-2" title="双休">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">修改</button>
				<button type="reset" class="layui-btn layui-btn-primary" id="reset">重置</button>
			</div>
		</div>
	</form>

	<script
		src="${pageContext.request.contextPath}/src/layuiadmin/layui/layui.js"></script>
	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			//执行一个laydate实例
			laydate.render({
				elem : '#amcheck',
				type : 'time',
				value : '${amcheck}'
			});

			laydate.render({
				elem : '#amleave',
				type : 'time',
				value : '${amleave}'
			});

			laydate.render({
				elem : '#pmcheck',
				type : 'time',
				value : '${pmcheck}'
			});

			laydate.render({
				elem : '#pmleave',
				type : 'time',
				value : '${pmleave}'
			});

		});

		layui
				.use(
						[ 'form', 'jquery', 'upload' ],
						function() {
							var form = layui.form;
							$ = layui.$, upload = layui.upload;
							var type=$('input[name=type]');
							  for(var i=0;i<type.length;i++){
								  if($(type[i]).val()==${type}) {
									  $(type[i]).attr("checked",true);
								  }
							  } 
							  form.render('radio');  
							//监听提交
							form
									.on(
											'submit(formDemo)',
											function(data) {
												$
														.ajax({
															url : "${pageContext.request.contextPath}/super/updateSignRule",
															type : "POST",
															data : $("#frm")
																	.serialize(),
															success : function(
																	data) {
																console
																		.log(data);
																layer
																		.msg("修改成功");
																parent.location
																		.reload();
															}
														})

												//layer.msg(JSON.stringify(data.field));
												return false;
											});

						});
	</script>
</body>
</html>