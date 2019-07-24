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
	<div class="layui-form">
		<div class="layui-form-item">
			<div class="layui-input-inline">
				<a href="${pageContext.request.contextPath}/super/toEdit3"
					class="layui-btn">出勤规则</a>
			</div>
			<label class="layui-form-label" style="">请选择部门:</label>
			<div class="layui-input-inline">
				<select name="department" id="department" lay-filter="department">
					<option value="0">请选择</option>
				</select>
			</div>
		</div>
		<table class="layui-table">
			<colgroup>
				<col width="150">
				<col width="200">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>选择时间</th>
					<th><div class="layui-form-item">
							<!-- <div class="layui-input-inline">
								<select name="timetype" id="timetype" lay-filter="timetype">
									<option value="0">请选择</option>
								</select>
							</div> -->
							<div class="layui-input-inline">
								<input type="text" class="layui-input" id="time" name="time"
									readonly>
							</div>
						</div></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>工作天数</td>
					<td id="workday"></td>
				</tr>
				<tr>
					<td>正常打卡</td>
					<td id="normalsign"></td>
				</tr>
				<tr>
					<td>迟到</td>
					<td id="latesign"></td>
				</tr>
				<tr>
					<td>早退</td>
					<td id="earlysign"></td>
				</tr>
				<tr>
					<td>缺卡</td>
					<td id="lostsign"></td>
				</tr>
				<tr>
					<td>加班</td>
					<td id="overtime"></td>
				</tr>
				<tr>
					<td>出差</td>
					<td id="workout"></td>
				</tr>
				<tr>
					<td>请假</td>
					<td id="leave"></td>
				</tr>
				<tr>
					<td>旷工</td>
					<td id="nowork"></td>
				</tr>
			</tbody>
		</table>
	</div>

	<script
		src="${pageContext.request.contextPath}/src/layuiadmin/layui/layui.js"></script>
	<script>
		layui
				.use(
						'form',
						function() {
							var form = layui.form;
							$
									.ajax({
										url : "${pageContext.request.contextPath}/super/selDepartment",
										type : "POST",
										data : {},
										success : function(data) {
											console.log(data);
											html = '';
											html += '<option value="0">请选择部门</option>';
											for (var i = 0; i < data.data.length; i++) {
												html += '<option value="'+data.data[i].id+'">'
														+ data.data[i].comname
														+ data.data[i].name
														+ '</option>';
											}
											$('#department').html(html);
											form.render('select');
										},
									});

							/* $
									.ajax({
										url : "${pageContext.request.contextPath}/super/selSignSum",
										type : "POST",
										data : {time : $('#time').val()},
										success : function(data) {
											console.log(data);
										},
									}); */

							form
									.on(
											'select(department)',
											function(data) {
												console.log(data.elem);
												console.log(data.value);
												console.log(data.othis);
												$
														.ajax({
															url : "${pageContext.request.contextPath}/super/selSignSum",
															type : "POST",
															data : {
																department : $(
																		'#department')
																		.val(),
																time : $(
																		'#time')
																		.val()
															},
															success : function(
																	data) {
																console
																		.log(data);
																$('#workday')
																		.html(
																				data.workday
																						+ "天");
																$('#normalsign')
																		.html(
																				data.normalsign
																						+ "人次");
																$('#latesign')
																		.html(
																				data.latesign
																						+ "人次");
																$('#earlysign')
																		.html(
																				data.earlysign
																						+ "人次");
																$('#lostsign')
																		.html(
																				data.lostsign
																						+ "人次");
																$('#overtime')
																		.html(
																				data.overtime
																						+ "人次");
																$('#workout')
																		.html(
																				data.workout
																						+ "人次");
																$('#leave')
																		.html(
																				data.leave
																						+ "人次"
																						+ '<button id="leavelist" name="leavelist">详情</button>');
																$('#nowork')
																		.html(
																				data.nowork
																						+ "人次"
																						+ '<button id="noworklist" name="noworklist">详情</button>');
																//form.render();
																$('#leavelist')
																		.on(
																				'click',
																				function() {
																					layer
																							.open({
																								type : 2,
																								area : [
																										'100%',
																										'100%' ],
																								offset : 'auto',
																								content : " ${pageContext.request.contextPath}/super/toLeaveList?department="
																										+ $(
																												'#department')
																												.val()
																										+ "&time="
																										+ $(
																												'#time')
																												.val(),
																							});
																				});
																$('#noworklist')
																		.on(
																				'click',
																				function() {
																					layer
																							.open({
																								type : 2,
																								area : [
																										'100%',
																										'100%' ],
																								offset : 'auto',
																								content : " ${pageContext.request.contextPath}/super/toNoworkList?department="
																										+ $(
																												'#department')
																												.val()
																										+ "&time="
																										+ $(
																												'#time')
																												.val(),
																							});
																				});
															}
														});
											});

						});

		layui
				.use(
						'laydate',
						function() {
							var laydate = layui.laydate;

							laydate
									.render({
										elem : '#time',
										type : 'month',
										value : "2019-07",
										done : function(value) {
											console.log(value);
											$
													.ajax({
														url : "${pageContext.request.contextPath}/super/selSignSum",
														type : "POST",
														data : {
															department : $(
																	'#department')
																	.val(),
															time : value
														},
														success : function(data) {
															console.log(data);
															$('#workday')
																	.html(
																			data.workday
																					+ "天");
															$('#normalsign')
																	.html(
																			data.normalsign
																					+ "人次");
															$('#latesign')
																	.html(
																			data.latesign
																					+ "人次");
															$('#earlysign')
																	.html(
																			data.earlysign
																					+ "人次");
															$('#lostsign')
																	.html(
																			data.lostsign
																					+ "人次");
															$('#overtime')
																	.html(
																			data.overtime
																					+ "人次");
															$('#workout')
																	.html(
																			data.workout
																					+ "人次");
															$('#leave')
																	.html(
																			data.leave
																					+ "人次"
																					+ '<button id="leavelist" name="leavelist">详情</button>');
															$('#nowork')
																	.html(
																			data.nowork
																					+ "人次"
																					+ '<button id="noworklist" name="noworklist">详情</button>');
															$('#leavelist')
																	.on(
																			'click',
																			function() {
																				layer
																						.open({
																							type : 2,
																							area : [
																									'100%',
																									'100%' ],
																							offset : 'auto',
																							content : " ${pageContext.request.contextPath}/super/toLeaveList?department="
																									+ $(
																											'#department')
																											.val()
																									+ "&time="
																									+ $(
																											'#time')
																											.val(),
																						});
																			});
															$('#noworklist')
																	.on(
																			'click',
																			function() {
																				layer
																						.open({
																							type : 2,
																							area : [
																									'100%',
																									'100%' ],
																							offset : 'auto',
																							content : " ${pageContext.request.contextPath}/super/toNoworkList?department="
																									+ $(
																											'#department')
																											.val()
																									+ "&time="
																									+ $(
																											'#time')
																											.val(),
																						});
																			});
														},
													});
										}
									});

						});
	</script>
</body>
</html>