<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="gvtv" uri="http://www.gvtv.com.cn/jsp/jstl/common"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!-- Content Header (Page header) -->
<section class="content-header">
	<gvtv:navigater path="blog/page"></gvtv:navigater>
</section>
<style>
.modal-dialog{
	width: 1024px;
}
</style>
<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<button type="button" data-url="blog/toAddOrUpd" data-model="dialog" class="btn btn-sm btn-primary">
						<i class="fa fa-fw fa-plus"></i>新增
					</button>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table id="default_table" class="table table-primary table-hover table-striped">
						<thead>
							<tr>
								<th width="10px" style="padding-right: 12px;"><input type='checkbox' id="defaultCheck" /></th>
								<th width="20px" style="padding-right: 12px;"></th>
								<th>标题</th>
								<th>类型</th>
								<th>作者</th>
								<th>来源</th>
								<th>发布状态</th>
								<th>内容</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>

<script type="text/javascript">
	var defTable;
	$(document).ready(function() {
		defTable = $('#default_table').DataTable({
			"ordering" : false,
			"pagingType" : "simple_numbers",
			"autoWidth": false,
			"processing" : true,
			"serverSide" : true,
			"ajax" : {
				"url" : "blog/list",
				"type" : "post",
				"data" : function(data) {
					data.keyword = $("#keyword").val();
				}
			},
			"language" : {
				"url" : "<%=basePath%>static/AdminLTE/plugins/datatables/cn.txt"
			},
			"createdRow" : function(row, data, index) {
				$('td:eq(0)', row).html("<input type='checkbox' name='chx_default' value='" + data.id + "'/>");
			},
			"lengthMenu": [[10, 15, 20], [10, 15, 20]],
			"columns" : [ 
			              {"data" : "id"},
			              {"data" : null},
			              {"data" : "blogTitle"},
			              {"data" : "blogType"}, 
			              {"data" : "blogAuthor"},
			              {"data" : "blogSource"},
			              {"data" : "blogStatus"},
			              {"data" : "blogContext"}
			            ],
			"columnDefs" : [ {
				"targets" : 1,
				"render" : function(data, type, row) {
					var html = htmlTpl.dropdown.prefix
		            	  + '  <li><a href="blog/toAddOrUpd?id='+row.id+'" data-model="dialog"><i class="fa fa-pencil"></i>编辑</a></li>'
		            	  + '  <li><a href="blog/delete?id='+row.id+'" data-msg="确定删除吗？" data-model="ajaxToDo" data-callback="refreshTable"><i class="fa fa-trash-o"></i>删除</a></li>'
		            	  + '  <li class="divider"></li>'
		            	  if(row.blogStatus == '0'){
		            		  html += '<li><a href="blog/updStatus?blogStatus=1&id='+row.id+'" data-msg="确定发布吗？" data-model="ajaxToDo" data-callback="refreshTable">审核(发布)</a></li>'
		            	  }else if(row.blogStatus == '1'){
		            		  html += '<li><a href="blog/updStatus?blogStatus=0&id='+row.id+'" data-msg="确定取消发布吗？" data-model="ajaxToDo" data-callback="refreshTable">取消发布</a></li>'
		            	  }
		            	  + htmlTpl.dropdown.suffix;
					return html;
				}
			},
			{
				"targets" : 2,
				"render" : function(data, type, row) {
					return "<a href='blog/details?id="+row.id+"' target='_blank'>"+data+"</a>";
				}
			},
			{
				"targets" : 3,
				"render" : function(data, type, row) {
					if(data == '1'){
						return "<font color='orange'>媒体报道</font>";
					}else if(data == '2'){
						return "<font color='#6495ED'>业务文章</font>";
					}
				}
			},
			{
				"targets" : 6,
				"render" : function(data, type, row) {
					if(data == '0'){
						return "<font color='red'>未发布</font>";
					}else if(data == '1'){
						return "<font color='blue'>发布中</font>";
					}
				}
			},
			{
				"targets" : 7,
				"render" : function(data, type, row) {
					if(data && data != null && data != '' && data.length > 60){
						var index = data.indexOf(">");
						if(index != -1){
							return data.substring((index+1),(index+50))+"...";
						}else{
							return data.substring(0,50)+"...";
						}
					}else{
						return data;
					}
				}
			}],
			"drawCallback": function (settings) {
				drawICheck('defaultCheck', 'chx_default');
	      	},
			"initComplete": function () {
				initSearchForm("", "搜索标题、来源、作者");
				$("#startTime").datetimepicker({
					format : 'yyyy-mm-dd hh:ii',
					language : 'zh',
					weekStart : 1,
					todayBtn : 1,
					autoclose : 1,
					todayHighlight : 1,
					startView : 2,
					minView : 0,
					forceParse : 0,
					showMeridian : 0,
					pickerPosition : "bottom-left"
				});
			}
		});
	});

	function refreshTable(toFirst) {
		//defaultTable.ajax.reload();
		if(toFirst){//表格重绘，并跳转到第一页
			defTable.draw();
		}else{//表格重绘，保持在当前页
			defTable.draw(false);
		}
	}
</script>