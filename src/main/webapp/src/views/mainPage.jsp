<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>考勤后台管理</title>
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
<body class="layui-layout-body" layadmin-themealias="default">
	<div id="LAY_app">
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<!-- 头部区域 -->
				<ul class="layui-nav layui-bg-black" lay-filter="">
					<li class="layui-nav-item"><a href="" style="color:white">考勤后台管理</a></li>
					<li class="layui-nav-item" style="float: right"><a href="" style="color:white"><img
							src="" class="layui-nav-img"></a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">修改信息</a>
							</dd>
							<dd>
								<a href="javascript:;">安全管理</a>
							</dd>
							<dd>
								<a href="javascript:;">退出</a>
							</dd>
						</dl></li>
				</ul>
			</div>

			<!-- 侧边菜单 -->
		 	<div class="layui-side layui-side-menu">
				<div class="layui-side-scroll">
				<div class="layui-logo" lay-href="home/console.html">
            <span>考勤后台管理</span>
          </div>
					<ul class="layui-nav layui-nav-tree" lay-shrink="all"
						id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
						<li data-name="home" class="layui-nav-item layui-nav-itemed">
							<dl class="layui-nav-child">
								<dd data-name="console" class="layui-this">
									<a lay-href="userList.jsp">用户</a>
								</dd>
							</dl>
							<dl class="layui-nav-child">
								<dd data-name="console">
									<a lay-href="itemList.jsp">审核单</a>
								</dd>
							</dl>
							<dl class="layui-nav-child">
								<dd data-name="console">
									 <a lay-href="workList.jsp">出勤统计</a>
								</dd>
							</dl>
							<dl class="layui-nav-child">
								<dd data-name="console">
									<a lay-href="departmentList.jsp">部门管理</a>
								</dd>
							</dl>
						</li>
						<span class="layui-nav-bar"></span>
					</ul>
				</div>
			</div> 

			<!-- 页面标签 -->
			<div class="layadmin-pagetabs" id="LAY_app_tabs">
				<div class="layui-icon layadmin-tabs-control layui-icon-down">
					<ul class="layui-nav layadmin-tabs-select"
						lay-filter="layadmin-pagetabs-nav">
						<li class="layui-nav-item" lay-unselect=""><a
							href="javascript:;"><span class="layui-nav-more"></span></a>
							<dl class="layui-nav-child layui-anim-fadein">
								<dd layadmin-event="closeThisTabs">
									<a href="javascript:;">关闭当前标签页</a>
								</dd>
								<dd layadmin-event="closeOtherTabs">
									<a href="javascript:;">关闭其它标签页</a>
								</dd>
								<dd layadmin-event="closeAllTabs">
									<a href="javascript:;">关闭全部标签页</a>
								</dd>
							</dl></li>
						<span class="layui-nav-bar"></span>
					</ul>
				</div>
				<div class="layui-tab" lay-unauto="" lay-allowclose="true"
					lay-filter="layadmin-layout-tabs">
					<ul class="layui-tab-title" id="LAY_app_tabsheader">
						<li lay-id="home/console.html" lay-attr="home/console.html"
							class="layui-this"><i class="layui-icon layui-icon-home"></i><i
							class="layui-icon layui-unselect layui-tab-close">ဆ</i></li>
					</ul>
				</div>
			</div>


			<!-- 主体内容 -->
			<div class="layui-body" id="LAY_app_body">
				<div class="layadmin-tabsbody-item layui-show">
					<iframe src="userList.jsp" frameborder="0"
						class="layadmin-iframe"></iframe>
				</div>
			</div>

			<!-- 辅助元素，一般用于移动设备下遮罩 -->
			<div class="layadmin-body-shade" layadmin-event="shade"></div>
		</div>
	</div>


	<script
		src="${pageContext.request.contextPath}/src/layuiadmin/layui/layui.js"></script>
	<script>
		layui.config({
			base : '${pageContext.request.contextPath}/src/layuiadmin/' //静态资源所在路径
		}).extend({
			index : 'lib/index' //主入口模块
		}).use('index');
	</script>
</body>
</html>