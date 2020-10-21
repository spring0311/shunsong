		<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed');}catch(e){}
				
				function AutoScroll(obj) {
					$(obj).find("ul:first").animate({
						marginTop: "-36px"
					}, 500, function() {
						$(this).css({
							marginTop: "0px"
						}).find("li:first").appendTo(this);
					});
				}
				$(document).ready(function() {
					setInterval('AutoScroll("#s1")', 3000);
				});
			</script>

			<div class="navbar-container" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<!-- #section:basics/navbar.layout.brand -->
					<a class="navbar-brand">
						<small> <i class="fa fa-leaf"></i> ${pd.SYSNAME} </small>
					</a>
					<!-- <img src="static/login/images/title0101.png" /> -->
					<div class="scrollDiv" id="s1"> 
			           <!--  <ul> 
			                <li><a class="scrollDivText"><small>我们的口号： 一次性把事情做好</small></a></li> 
			                <li><a class="scrollDivText"><small>我们的目标：精、准、细、严 </small></a></li>  
			                <li><a class="scrollDivText"><small>精：精心地设计、精密地加工；</small></a></li> 
			                <li><a class="scrollDivText"><small>准：标准化作业、准时化生产；</small></a></li>  
			                <li><a class="scrollDivText"><small>细：关注细节、立足专业；</small></a></li>  
			                <li><a class="scrollDivText"><small>严：严谨的工作思维，务实的工作态度。</small></a></li> 
			                <li><a class="scrollDivText"><small>我们的工作原则：流程、准确、效率、预防</small></a></li>
			                <li><a class="scrollDivText"><small>我们的工作原则：积极、主动、诚信、团队</small></a></li>  
			            </ul>  -->
			        </div> 
					<!-- /section:basics/navbar.layout.brand -->

					<!-- #section:basics/navbar.toggle -->

					<!-- /section:basics/navbar.toggle -->
				</div>

				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="grey" >
							<a data-toggle="dropdown" class="dropdown-toggle" href="#"  id = "messUl">
								<i class="ace-icon fa fa-tasks"></i>
								<span class="badge badge-danger" id="messCount"></span>
							</a>
								
							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
 								<!-- <li class="dropdown-header">
									<i class="ace-icon fa fa-check"></i>
									预留功能,待开发
								</li>
								<li class="dropdown-footer">
									<a href="javascript:">
										预留功能,待开发
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
									
								</li> -->	
 								<li class="dropdown-footer">
									<a href="javascript:goSaveEstimate();">
										未录入预估工时数量
										<i class="ace-icon fa fa-arrow-right"></i>
										<span class="badge badge-success" id="estimateCount"></span>
									</a>
									
								</li>
								<li class="dropdown-footer">
									<a href="javascript:goSaveUserWorkTime();">
										未录入出勤工时
										<i class="ace-icon fa fa-arrow-right"></i>
										<span class="badge badge-success" id="userWorktimeCount"></span>
									</a>
								</li>
								<!-- <li>
									<a href="javascript:goStockPartNoEnough();">
										库存配件不足数
										<i class="ace-icon fa fa-arrow-right"></i>
										<span class="badge badge-success" id="stockPartNoEnoughCount"></span>
									</a>
								</li> -->
							</ul>
						</li>

						<li title="即时聊天" class="purple"  onclick="creatw();"><!-- creatw()在 WebRoot\plugins\websocketInstantMsg\websocket.js中 -->
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-bell icon-animated-bell"></i>
								<span class="badge badge-important"></span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-bell-o"></i>
									瞬硕即时通讯
								</li>
								
							</ul>
						</li>
						<!-- <li title="未录入预估工时数量" class="orange" onclick="estimate();" id="estimate">方法在 WebRoot\static\js\myjs\head.js中
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-film icon-animated-vertical"></i>
								<span class="badge badge-success" id="estimateCount"></span>
							</a>
						</li>
						<li title="未录入出勤工时" class="grey" onclick="userWorktime();" id="userWorktime">方法在 WebRoot\static\js\myjs\head.js中
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-star icon-animated-vertical"></i>
								<span class="badge badge-success" id="userWorktimeCount"></span>
							</a>
						</li> -->
						<li title="站内信" class="green" onclick="fhsms();" id="fhsmstss"><!-- fhsms()在 WebRoot\static\js\myjs\head.js中 -->
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
								<span class="badge badge-success" id="fhsmsCount"></span>
							</a>
						</li>

						<!-- #section:basics/navbar.user_menu -->
						<li class="light-blue">
							<a data-toggle="dropdown"  class="dropdown-toggle" href="#">
								<img class="nav-user-photo" src="static/ace/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info" id="user_info">
								</span>
								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a onclick="editUserH();" style="cursor:pointer;"><i class="ace-icon fa fa-cog"></i>修改资料</a><!-- editUserH()在 WebRoot\static\js\myjs\head.js中 -->
								</li>
								<li>
									<a onclick="changeCurrentDept();" style="cursor:pointer;"><i class="ace-icon fa fa-exchange"></i>切换当前部门</a><!-- editUserH()在 WebRoot\static\js\myjs\head.js中 -->
								</li>
								<li id="systemset">
									<a onclick="editSys();" style="cursor:pointer;"><i class="ace-icon fa fa-user"></i>系统设置</a><!-- editSys()在 WebRoot\static\js\myjs\head.js中 -->
								</li>
								<li id="productCode">
									<a onclick="productCode();" style="cursor:pointer;"><i class="ace-icon fa fa-asterisk"></i> 代码生成</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="logout"><i class="ace-icon fa fa-power-off"></i>退出登录</a>
								</li>
							</ul>
						</li>

						<!-- /section:basics/navbar.user_menu -->
					</ul>
				</div>
				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>
		<div id="fhsmsobj"><!-- 站内信声音消息提示 --></div>