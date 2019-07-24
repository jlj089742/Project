<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>添加客户</title>
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
	<form class="layui-form" action="" id="frm">
		<div class="layui-form-item">
			<label class="layui-form-label">*联系人</label>
			<div class="layui-input-inline">
				<input type="text" name="name" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input">
			</div>
			<label class="layui-form-label">*联系方式</label>
			<div class="layui-input-inline">
				<input type="text" name="phone" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">邮箱</label>
			<div class="layui-input-inline">
				<input type="text" name="email" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input">
			</div>
			<label class="layui-form-label">公司logo</label>
			<div class="layui-upload" id="test10">
				<img class="layui-upload-img" id="himg" width="50" height="50">
				<input name="logo" id="logo" hidden="">
			</div>

		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">公司名称</label>
			<div class="layui-input-inline">
				<input type="text" name="comname" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input">
			</div>
			<label class="layui-form-label">*客户来源</label>
			<div class="layui-input-inline">
				<select id="source" name="source" lay-verify="required"
					lay-filter="source">
					<option value="0">请选择客户来源</option>
					<option value="1">400电话</option>
					<option value="2">营销QQ</option>
					<option value="3">主动挖掘</option>
					<option value="4">老客户介绍</option>
					<option value="5">其他渠道</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">*意向产品</label>
			<div class="layui-input-inline">
				<input type="text" name="product" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input">
			</div>
			<label class="layui-form-label">签约时间</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" id="signdate" name="time">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">城市</label>
			<div class="layui-input-inline" style="max-width: 100px">
				<select id="proid" name="pid" lay-verify="proid" lay-filter="proid">
					<option value="0">省</option>
				</select>
			</div>
			<div class="layui-input-inline" style="max-width: 100px">
				<select id="cityid" name="cid" lay-verify="cityid"
					lay-filter="cityid">
					<option value="0">市</option>
				</select>
			</div>
			<div class="layui-input-inline" style="max-width: 100px">
				<select id="rid" name="rid" lay-verify="areaid" lay-filter="rid">
					<option value="0">区</option>
				</select>
			</div>
			<div class="layui-input-inline" style="max-width: 100px">
				<button class="layui-btn" id="map" lay-filter="map">地图选点</button>
			</div>
			<div class="layui-input-inline">
				经度为：<input type="text" id="jingdu" name="jingdu"> 
				 维度为：<input type="text" id="weidu" name="weidu"> 
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">详细地址</label>
			<div class="layui-input-inline">
				<input type="text" name="detailed" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">备注</label>
			<div class="layui-input-inline">
				<input type="text" name="note" required lay-verify="required"
					placeholder="单行输入" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">公司介绍</label>
			<div class="layui-input-inline">
				<input type="text" name="comintr" required lay-verify="required"
					placeholder="富文本编辑器" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
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
				elem : '#signdate',
			});

		});
		layui
				.use(
						[ 'form', 'jquery', 'upload' ],
						function() {
							var form = layui.form;
							$ = layui.$, upload = layui.upload;
							$
									.ajax({
										url : "${pageContext.request.contextPath}/PCA/selPro.action",
										type : "POST",
										data : {},
										timeout : 5000,
										success : function(data) {
											console.log(data);
											var html = '';
											for (var i = 0; i < data.data.length; i++) {
												html += '<option value="'+data.data[i].id+'">'
														+ data.data[i].name
														+ '</option>'
											}
											$('#proid').append(html);
											form.render('select');
										},
									});

							form
									.on(
											'select(proid)',
											function(data) {
												console.log(data.elem); //得到select原始DOM对象
												console.log(data.value); //得到被选中的值
												console.log(data.othis); //得到美化后的DOM对象
												$
														.ajax({
															url : "${pageContext.request.contextPath}/PCA/selCity.action",
															type : "POST",
															data : {
																pid : data.value
															},
															timeout : 5000,
															success : function(
																	data) {
																console
																		.log(data);
																$('#cityid')
																		.html(
																				'<option value="0">市</option>');
																$('#rid')
																		.html(
																				'<option value="0">区</option>');
																var html = '';
																for (var i = 0; i < data.data.length; i++) {
																	html += '<option value="'+data.data[i].id+'">'
																			+ data.data[i].name
																			+ '</option>'
																}
																$('#cityid')
																		.append(
																				html);
																form
																		.render('select');
															},
														});
											});

							form
									.on(
											'select(cityid)',
											function(data) {
												console.log(data.elem); //得到select原始DOM对象
												console.log(data.value); //得到被选中的值
												console.log(data.othis); //得到美化后的DOM对象
												$
														.ajax({
															url : "${pageContext.request.contextPath}/PCA/selArea.action",
															type : "POST",
															data : {
																pid : data.value
															},
															timeout : 5000,
															success : function(
																	data) {
																console
																		.log(data);
																$('#rid')
																		.html(
																				'<option value="0">区</option>');
																var html = '';
																for (var i = 0; i < data.data.length; i++) {
																	html += '<option value="'+data.data[i].id+'">'
																			+ data.data[i].name
																			+ '</option>'
																}
																$('#rid')
																		.append(
																				html);
																form
																		.render('select');
															},
														});
											});

							/* 	upload
										.render({
											elem : '#test8',
											url : '${pageContext.request.contextPath}/upLoad/upLoadFile.action',
											auto : false,
											bindAction : '#test9',
											choose : function(obj) {
												var files = obj.pushFile();
												obj.preview(function(index, file,
														result) {
													$('#himg').attr('src', result)
												});
											},
											done : function(res) {
												console.log(res)
												$('#headimg').val(res.data[0])
												$('#demoText').html("上传成功")
											}
										}); */

							upload
									.render({
										elem : '#test10',
										url : '${pageContext.request.contextPath}/upLoad/upLoadFile.action',
										choose : function(obj) {
											var files = obj.pushFile();
											obj.preview(function(index, file,
													result) {
												$('#himg').attr('src', result)
											});
										},
										done : function(res) {
											console.log(res)
											$('#logo').val(res.data[0])
										}
									});

										
						$('#map')
										.on(
												'click',
												function() {
													layer
															.open({
																type : 2,
																area : [ '100%',
																		'100%' ],
																offset : 'auto',
																content : " ${pageContext.request.contextPath}/src/views/list3.jsp",
															})
												});
										
							//监听提交
							form
									.on(
											'submit(formDemo)',
											function(data) {
												$
														.ajax({
															url : "${pageContext.request.contextPath}/customer/addCustomer.action",
															type : "POST",
															data : $("#frm")
																	.serialize(),
															success : function(
																	data) {
																console
																		.log(data)
																layer
																		.msg("添加成功")
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