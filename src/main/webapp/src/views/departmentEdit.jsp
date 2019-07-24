<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>部门详情</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/src/layuiadmin/layui/css/layui.css"
	media="all">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="layui-form">
		<div class="layui-form-item">
			<div class="layui-input-inline">
				<input type="text" name="name" id="name" placeholder="请输入名称"
					autocomplete="off" class="layui-input">
			</div>
			<div class="layui-input-inline">
				<input type="text" name="phone" id="phone" placeholder="请输入手机号"
					autocomplete="off" class="layui-input">
			</div>
			<div class="layui-btn-group">
				<button class="layui-btn" id="souBtn">搜索</button>
				<!-- <button class="layui-btn" id="test1">111</button> -->
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
										url : '${pageContext.request.contextPath}/super/selDepMember.action?depid=${department.id}',
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
										},  {
											field : 'username',
											title : '用户名',
										}, {
											field : 'password',
											title : '密码',
										},{
											field : 'name',
											title : '名字',
										},{
											field : 'sex',
											title : '性别',
										},{
											field : 'phone',
											title : '电话',
										},{
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
												console.log(obj);
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
																					url : "${pageContext.request.contextPath}/",
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
																content : '${pageContext.request.contextPath}/super/toMemberEdit.action?id='
																		+ obj.data.id
															});
													break;
												}
												;
											});



							$('#souBtn').on('click', function() {
								table.reload('customer', {
									where : {
										name : $('#name').val(),
										phone : $('#phone').val(),
										
									},
									page : {
										curr : 1
									}
								});
							})
							
							
					
							
							
							
						});

	</script>
</body>
</html>