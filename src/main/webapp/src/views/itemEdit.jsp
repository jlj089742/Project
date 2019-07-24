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
		<input type="text" id="id" name="id" value="${item.id}" hidden="">
		<div class="layui-form-item">
			<label class="layui-form-label">申请人</label>
			<div class="layui-input-inline">
				<input type="text" name="memname" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input"
					value="${item.memname}" readonly>
			</div>
			<%-- <label class="layui-form-label">公司logo</label>
			<div class="layui-upload" id="test10">
				<img class="layui-upload-img" id="himg" width="50" height="50"
					src="${pageContext.request.contextPath}/${customer.logo}"> <input
					name="logo" id="logo" hidden="" value="${customer.logo}">
			</div> --%>
			<label class="layui-form-label">类型</label>
			<div class="layui-input-inline">
				<input type="text" name="typename" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input"
					value="${item.typename}" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">天数</label>
			<div class="layui-input-inline">
				<input type="text" name="day" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input"
					value="${item.day}" readonly>
			</div>
			<label class="layui-form-label">花费</label>
			<div class="layui-input-inline">
				<input type="text" name="cost" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input"
					value="${item.cost}" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">理由</label>
			<div class="layui-input-inline">
				<input type="text" name="cost" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input"
					value="${item.reason}" readonly>
			</div>
			<label class="layui-form-label">审核状态</label>
			<div class="layui-input-inline">
				<input type="text" name="passname" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input"
					value="${item.passname}" readonly>
			</div>
		</div>
		<div class="layui-form-item" id="itemcontent">

			<!-- '<label class="layui-form-label">请假类型</label>'+ '
			<div class="layui-input-inline">
				'+ '<input type="text" name="typename" required
					lay-verify="required" placeholder="单行输入" autocomplete="off"
					class="layui-input" value='+data.data[i].typename'+'>'+ '
			</div>
			'+ '<label class="layui-form-label">开始时间</label>'+ '
			<div class="layui-input-inline">
				'+ '<input type="text" name="typename" required
					lay-verify="required" placeholder="单行输入" autocomplete="off"
					class="layui-input" value='+data.data[i].time1'+'>'+ '
			</div>
			'+ '<label class="layui-form-label">结束时间</label>'+ '
			<div class="layui-input-inline">
				'+ '<input type="text" name="typename" required
					lay-verify="required" placeholder="单行输入" autocomplete="off"
					class="layui-input" value='+data.data[i].time2+'>'+ '
			</div>
			' -->

			<!-- <div>明细+i+</div>
			<label class="layui-form-label">地点</label>
			<div class="layui-input-inline">
				<input type="text" name="typename" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input"
					value="data.data[i].place">
			</div>
			<label class="layui-form-label">开始时间</label>
			<div class="layui-input-inline">
				<input type="text" name="typename" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input"
					value="data.data[i].time1">
			</div>
			<label class="layui-form-label">结束时间</label>
			<div class="layui-input-inline">
				<input type="text" name="typename" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input"
					value="data.data[i].time2">
			</div> -->


		</div>
		 <div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">审核通过</button>
			</div>
		</div> 
	</form>


	<script
		src="${pageContext.request.contextPath}/src/layuiadmin/layui/layui.js"></script>
	<script>
		$
				.ajax({
					url : "${pageContext.request.contextPath}/item/selItemContent.action",
					type : "post",
					data : {
						itemid : $('#id').val(),
					},
					success : function(data) {
						console.log(data);
						 var html = '';
						 for (var i = 0; i < data.data.length; i++) {
							if (data.data[i].leavetype != 0
									&& data.data[i].leavetype != '') {
								html += '<label class="layui-form-label">请假类型</label>'
										+ '<div class="layui-input-inline">'
										+ '<input type="text" name="typename" required lay-verify="required" placeholder="单行输入" autocomplete="off" class="layui-input" value="'+data.data[i].typename +'" readonly>'
										+ '</div>'
										+ '<label class="layui-form-label">开始时间</label>'
										+ '<div class="layui-input-inline">'
										+ '<input type="text" name="typename" required lay-verify="required" placeholder="单行输入" autocomplete="off" class="layui-input" value="'+data.data[i].time1 +'" readonly>'
										+ '</div>'
										+ '<label class="layui-form-label">结束时间</label>'
										+ '<div class="layui-input-inline">'
										+ '<input type="text" name="typename" required lay-verify="required" placeholder="单行输入" autocomplete="off" class="layui-input" value="'+data.data[i].time2 +'" readonly>'
										+ '</div>';
							}
							
							if (data.data[i].place != null
									&& data.data[i].place != '') {
								html += '<div>明细'+(i+1)+'</div>'
									    +'<label class="layui-form-label">地点</label>'
										+ '<div class="layui-input-inline">'
										+ '<input type="text" name="typename" required lay-verify="required" placeholder="单行输入" autocomplete="off" class="layui-input" value="'+data.data[i].place +'" readonly>'
										+ '</div>'
										+ '<label class="layui-form-label">开始时间</label>'
										+ '<div class="layui-input-inline">'
										+ '<input type="text" name="typename" required lay-verify="required" placeholder="单行输入" autocomplete="off" class="layui-input" value="'+data.data[i].time1 +'" readonly>'
										+ '</div>'
										+ '<label class="layui-form-label">结束时间</label>'
										+ '<div class="layui-input-inline">'
										+ '<input type="text" name="typename" required lay-verify="required" placeholder="单行输入" autocomplete="off" class="layui-input" value="'+data.data[i].time2 +'" readonly>'
										+ '</div>';
							}
						}  
						$('#itemcontent').html(html);
					}
				})
				
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
													url : "${pageContext.request.contextPath}/item/checkItem.action",
													type : "POST",
													data : {
														itemid : $('#id').val(),
													},
													success : function(
															data) {
														console
																.log(data)
														layer
																.msg("审核成功！");
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