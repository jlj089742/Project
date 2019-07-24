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
	<div class="layui-form">
		<div class="layui-form-item">
			<label class="layui-form-label">发起人名称</label>
			<div class="layui-input-inline">
				<input type="text" name="memname" id="memname" placeholder="发起人"
					autocomplete="off" class="layui-input">
			</div>
			<label class="layui-form-label">申请日期</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" id="choosetime">
			</div>
			<label class="layui-form-label">审批类型</label>
			<div class="layui-input-inline">
				<select name="type" id="type" lay-filter="type">
					<option value="0">请选择</option>
					<option value="1">差费审批</option>
					<option value="2">出差</option>
					<option value="3">请假</option>
					<option value="4">加班费审批</option>
					<option value="5">加班</option>
					<option value="6">通用审批</option>
				</select>
			</div>
			<label class="layui-form-label">审核状态</label>
			<div class="layui-input-inline">
				<select name="pass" id="pass" lay-filter="pass">
					<option value="0">请选择</option>
					<option value="-1">未审核</option>
					<option value="1">审核通过</option>
				</select>
			</div>
			<div class="layui-btn-group">
				<button class="layui-btn" id="souBtn">搜索</button>
			</div>
		</div>
	</div>

	<table id="customer" lay-filter="test"></table>

	<script type="text/html" id="toolbtn">
       <div class="layui-btn-container">
            <a class="layui-btn layui-btn-sm" lay-event="update">详情</a>
       </div>
</script>
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
										url : '${pageContext.request.contextPath}/super/selItem.action',
										page : true,
										cols : [ [ {
											field : 'left',
											type : "checkbox",
											fixed : 'left'
										}, {
											field : 'id',
											title : 'ID',
											sort : true,
											fixed : 'left'
										}, {
											field : 'memname',
											title : '用户名字',
										}, {
											field : 'typename',
											title : '类型',
										}, {
											field : 'day',
											title : '天数',
										}, {
											field : 'cost',
											title : '花费',
										}, {
											field : 'reason',
											title : '理由',
										}, {
											field : 'time',
											title : '创建时间',
										}, {
											field : 'passname',
											title : '审核状态',
										}, {
											field : 'right',
											title : '操作',
											fixed : 'right',
											toolbar : "#toolbtn"
										}, ] ]
									});
							table
									.on(
											'tool(test)',
											function(obj) {
												console.log(obj)
												switch (obj.event) {
												/* case 'delete':
													layer
															.confirm(
																	'是否确认删除！！',
																	{
																		btn : [
																				'确定',
																				'取消' ]
																	},
																	function(
																			index) {
																		$
																				.ajax({
																					url : "${pageContext.request.contextPath}/customer/delCustomer.action",
																					type : "POST",
																					data : {
																						id : obj.data.id
																					},
																					success : function(
																							data) {
																						table
																								.reload('customer');
																						layer
																								.close(index);
																					}
																				})
																	})
													break; */
												case 'update':
													layer
															.open({
																type : 2,
																area : [
																		'100%',
																		'100%' ],
																content : '${pageContext.request.contextPath}/super/toItemEdit.action?id='
																		+ obj.data.id
															});
													break;
												}
												;
											});

							/*   form.on('switch(switchTest)',function(data){
							 console.log(data);
								 $.ajax({
									 url:"${pageContext.request.contextPath}/admin/updateAdminStarts.action",
									 type:"POST",
									 data:{id:data.value,
										   starts:this.checked?1:2},
									 success:function(data){
										 //table.reload('admin');
										
									 }
								 })
							 }); */

							/*  $.ajax({
									 url:"${pageContext.request.contextPath}/role/selRole.action",
									 type:"POST",
									 data:{},
									 success:function(data){
										 console.log(data)
										 html='';
										 html+='<option value="0">请选择角色</option>';
										for(var i=0;i<data.count;i++){
											html+='<option value="'+data.data[i].id+'">'+data.data[i].roleName+'</option>'
										}
										$('#roleId').html(html);
										form.render('select');
									 },
								 }); */

							$('#souBtn').on('click', function() {
								table.reload('customer', {
									where : {
										memname : $('#memname').val(),
										type : $('#type').val(),
										pass : $('#pass').val(),
										choosetime: $('#choosetime').val()
									},
									page : {
										curr : 1
									}
								});
							})

							/* 	$('#test1').on('click', function() {
								console.log($("#choosetime").val());
									$.ajax({
										url:"${pageContext.request.contextPath}/customer/test1.action",
										type:"post",
										data:{choosetime:$("#choosetime").val()},
										success:function(data){
											console.log(data);
										}
									})
								}) */

						});
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			//执行一个laydate实例
			laydate.render({
				elem : '#choosetime',
				range : '~' //指定元素

			});

		});
	</script>
</body>
</html>