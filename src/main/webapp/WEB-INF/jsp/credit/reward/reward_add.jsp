<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
pageContext.setAttribute("basePath",basePath);
%>
<form class="form-horizontal" action="reward/saveReward" method="post" id="defForm" callfn="refreshTable" enctype="multipart/form-data">
	<div class="modal-header">
		<div class='bootstrap-dialog-header'>
			<div class='bootstrap-dialog-close-button' style='display: block;'>
				<button class='close' data-dismiss='modal' aria-label='Close'>×</button>
			</div>
			<div class='bootstrap-dialog-title'>
				<c:if test="${empty blog.id}">新增</c:if><c:if test="${not empty blog.id}">编辑</c:if>悬赏
			</div>
		</div>
	</div>
	<input type="hidden" name="userId" value="${userId}"> 
	<input type="hidden" name="id" value="${reward.id}"> 
	<input type="hidden" name="images" value="${reward.images}"> 
	<div class="modal-body">
		<div class="container-fluid">
		         <b><font color="blue">基本信息</font></b>
			<hr>
			<div class="form-group">
                 <label class="col-sm-3 control-label">悬赏类型：</label>
                 <div class="col-sm-8">
                      <select  name="rewardType" class="form-control" required="required" aria-required="true"  id="rewardType" onchange="changeRewardType()">
							<option value="0">找人</option>
							<option value="1">找车辆</option>
							<option value="2">找房产</option>
							<option value="3">找应收款</option>
							<option value="4">其他</option>
					  </select>
                 </div>
             </div>
             <div class="form-group">
                 <label class="col-sm-3 control-label">悬赏金额(元)：</label>
                 <div class="col-sm-8">
                     <input id="rewardAmount" name="rewardAmount" class="form-control" required="required" type="text" aria-required="true" class="valid"/>
                 </div>
             </div>
             <div class="form-group">
                 <label class="col-sm-3 control-label">姓名：</label>
                 <div class="col-sm-8">
                     <input id="rewardName" name="rewardName" class="form-control" type="text" required="required" aria-required="true" class="valid">
                 </div>
             </div>
             <div class="form-group">
                 <label class="col-sm-3 control-label">身份证：</label>
                 <div class="col-sm-8">
                       <input id="cartId" name="cartId" class="form-control" type="text" required="required" aria-required="true" class="valid">
                 </div>
             </div>
             <div class="form-group" style="display:none" id="carBrandDiv">
              <label class="col-sm-3 control-label">车牌号：</label>
                 <div class="col-sm-8">
                       <input id="carBrand" name="carBrand" class="form-control" type="text"  >
                 </div>
             </div>
              <b><font color="blue">其他信息</font></b>
              <hr>
		      <div class="form-group">
                     <label class="col-sm-3 control-label">所在地：</label>
                     <div class="col-sm-4">
					<select onchange="loadCity(this)" id="debtProvince" name="province" class="form-control input-sm"  required="required" aria-required="true">
							 <option value="1">请选择</option>
							 <c:forEach items="${provinceList}" var="item">
						 <option value="${item}">${item}</option>
						 </c:forEach>
                	</select>
					</div>
					<div class="col-sm-4">
							<select id="debtCity" name="city" class="form-control input-sm" required="required">
					             <option value="">请选择</option>
					         </select>
					</div>
                    </div>
                        
                    <div class="form-group">
                        <label class="col-sm-3 control-label">照片：</label>
                        <div class="col-sm-8">
                             <input class="form-control required" type="file" name="uploadFiles" accept=".jpg,.png,.jpeg,.gif,.bmp"/>
                             <div id="addFileUpload"></div>
                             <span class="help-block m-b-none">
                             	<button type="button" class="btn btn-white btn-xs" onclick="addFileUpload()"><span class="glyphicon glyphicon-plus-sign">继续添加</span></button>
                         </span>
                    </div>
                </div>
                <div class="form-group" id="data_1">
                 <label class="col-sm-3 control-label">悬赏有效日期：</label>
                <div class="col-sm-8">
                     <input class="form-control" type="text" name="endTime" id="datetimepicker" aria-required="true" required="required">
                 </div>
               </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">悬赏描述：</label>
                    <div class="col-sm-8">
                        <textarea id="description" name="description" class="form-control" rows="3"></textarea>
                    </div>
                </div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		<button type="submit" class="btn btn-primary">保存</button>
	</div>
</form>
	
<script type="text/javascript">
	function addFileUpload(){
		$("#addFileUpload").append('<input class="form-control" type="file" name="uploadFiles" accept=".jpg,.png,.jpeg,.gif,.bmp"/>');
	}
	function loadCity(obj) {
		var proName = $(obj).val();
		//$("#provinceSel1").val(province);
		$.ajax({
			url : 'reward/loadCity',
			async : false,
			data : {
				"proName" : proName
			},
			type : "POST",
			success : function(data) {
				
				$("#debtCity").empty();
				$('#debtCity').append('<option>请选择</option>');
				$.each(data, function (i,item) {
					$('#debtCity').append('<option value='+item+'>'+item+'</option>');
			    });
			},
			error : function() {
				alert("获取城市数据失败");
			}
		});
	}

	$(function () {
	    $('#datetimepicker').datetimepicker({
	    	minView: "month",//选择日期后，不会再跳转去选择时分秒 
	    	format: "yyyy-mm-dd",
	    	language: 'zh-CN',
	    	autoclose:true
	    });
	});

	function changeRewardType(){
		var rewardType =$("#rewardType").val();
		if(rewardType==1){
			$("#carBrandDiv").show();
		}else{
			$("#carBrandDiv").hide();
		}
	}
</script>
