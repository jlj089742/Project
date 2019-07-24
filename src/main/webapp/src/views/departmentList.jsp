<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/src/layuiadmin/layui/css/layui.css"
	media="all">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="layui-form">
		<div class="layui-form-item">
			<div class="layui-input-inline">
				<input type="text" name="comname" id="comname" placeholder="请输入公司名"
					autocomplete="off" class="layui-input">
			</div>
			<div class="layui-input-inline">
				<input type="text" name="name" id="name" placeholder="请输入部门名"
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
										url : '${pageContext.request.contextPath}/super/selDepartment.action',
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
											field : 'comname',
											title : '公司名',
										}, {
											field : 'name',
											title : '部门名',
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
																content : '${pageContext.request.contextPath}/super/toDepartmentEdit.action?id='
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
										name : $('#name').val(),
										comname : $('#comname').val(),
										
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
				range: '~' //指定元素
				
			});
			
		});
	</script>
</body>
</html>