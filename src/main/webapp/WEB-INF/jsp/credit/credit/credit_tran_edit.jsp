<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
 
<form class="form-horizontal" action="credit/edit" method="post" id="defForm" callfn="refreshTable" enctype="multipart/form-data">
<input type="hidden" name="creditType" value="${credit.creditType }">
<input type="hidden" name="debtProof" value="${credit.debtProof }">
<input type="hidden" name="crStatus" value="${credit.crStatus}">
<input type="hidden" name="isAudit" value="${credit.isAudit}">
<input type="hidden" name="id" value="${credit.id}">
	<div class="modal-header">
		<div class='bootstrap-dialog-header'>
			<div class='bootstrap-dialog-close-button' style='display: block;'>
				<button class='close' data-dismiss='modal' aria-label='Close'>×</button>
			</div>
			<div class='bootstrap-dialog-title'>修改债权</div>
		</div>
	</div>
	<div class="modal-body">
	<div class="container-fluid">
	<b><font color="blue">基本信息</font></b>
                 		 <hr>
                          <div class="form-group">
                                <label class="col-sm-3 control-label">债权类型：</label>
                                <div class="col-sm-6">
                                        <select  name="crType" class="form-control">
													<option value="8" <c:if test="${credit.crType == 8}">selected</c:if>>资产包债权</option>
													<option value="9" <c:if test="${credit.crType == 9}">selected</c:if>>单笔债权</option>
										</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">债权发布者：</label>
                                <div class="col-sm-6">
                                        <select  name="userId" class="form-control required">
                                        <c:forEach items="${userList }" var="user">
													<option value="${user.id }">${user.nickname}</option>
                                        </c:forEach>
										</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">债权金额(万元)：</label>
                                <div class="col-sm-6">
                                    <input id="crAmount" name="crAmount" class="form-control" type="text" required="required" value="${credit.crAmount }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">支付佣金范围：</label>
                                <div class="col-sm-6">
                                     <select name="commisionRange" class="form-control" required="required" aria-required="true">
										 <option value="1%-3%" <c:if test="${credit.commisionRange == '1%-3%'}">selected</c:if>>1%-3%</option>
										 <option value="3%-5%" <c:if test="${credit.commisionRange == '3%-5%'}">selected</c:if>>3%-5%</option>
										 <option value="5%-8%" <c:if test="${credit.commisionRange == '5%-8%'}">selected</c:if>>5%-8%</option>
										 <option value="8%-10%" <c:if test="${credit.commisionRange == '8%-10%'}">selected</c:if>>8%-10%"</option>
									 </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">联系人姓名：</label>
                                <div class="col-sm-6">
                                    <input id="contactName" name="contactName" class="form-control" type="text" placeholder="可以是本人也可以委托他人" required="required" aria-required="true" value="${credit.contactName }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">联系人电话：</label>
                                <div class="col-sm-6">
                                    <input id="contactNumber" name="contactNumber" class="form-control" type="text" placeholder="请填写有效的手机号码" required="required" aria-required="true" value="${credit.contactNumber }">
                                </div>
                            </div>
                          <b><font color="blue">债务方信息</font></b>
					      <hr>
                         <div class="form-group">
                                <label class="col-sm-3 control-label">债务方名称：</label>
                                <div class="col-sm-6">
                                    <input id="debtName" name="debtName" class="form-control" type="text" required="required" aria-required="true" value="${credit.debtName }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">债务方地址：</label>
                                <div class="col-sm-3">
												   <select onchange="loadCity(this.value)" id="debtProvince" name="debtProvince" class="form-control input-sm"  required="required" aria-required="true">
													 <option value="">请选择</option>
													 <c:forEach items="${provinceList}" var="item">
													 <option value="${item}" <c:if test="${credit.debtProvince eq item}">selected</c:if> >${item}</option>
													 </c:forEach>
							                       </select>
								</div>
								<div class="col-sm-3">
									 <select id="debtCity" name="debtCity" class="form-control input-sm" required="required">
							          </select>
								</div>
                            </div>
                                
                            <div class="form-group">
                                <label class="col-sm-3 control-label">债务方联系电话：</label>
                                <div class="col-sm-6">
                                    <input id="debtPhone" name="debtPhone" class="form-control" type="text" required="required" aria-required="true" value="${credit.debtPhone }">
                                </div>
                            </div>
                             <%-- --%>
		                    <div class="form-group">
		                        <label class="col-sm-3 control-label">照片：</label>
		                        <div class="col-sm-6">
		                             <!-- <input class="form-control" type="file" name="uploadFiles" accept=".jpg,.png,.jpeg,.gif,.bmp"/> -->
		                             <div id="addFileUpload"></div>
		                             <span class="help-block m-b-none">
		                             	<button type="button" class="btn btn-white btn-xs" onclick="addFileUpload()"><span class="glyphicon glyphicon-plus-sign">添加文件</span></button>
		                         </span>
		                    	</div>
		                    </div>         
                            <div class="form-group">
                                <label class="col-sm-3 control-label">债权开始日期：</label>
                                <div class="col-sm-6">
                                    <input class="form-control required" type="text" name="openDate" id="datetimepicker"  value="<fmt:formatDate value="${credit.openDate }" pattern="yyyy-MM-dd"/>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">债权描述：</label>
                                <div class="col-sm-6">
                                    <textarea id="description" name="description" class="form-control" rows="3">${credit.description }</textarea>
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
$("#defForm").validate();
</script>

<script type="text/javascript">
/* function addFileUpload(){
	$("#addFileUpload").append('<input class="form-control" type="file" name="uploadFiles" accept=".jpg,.png,.jpeg,.gif,.bmp"/>');
} */
var i=0;
function addFileUpload(){
	$("#addFileUpload").append('<input class="form-control" type="file" name="uploadFiles" id="uploadFiles'+i+'" required="required" accept=".jpg,.png,.jpeg,.gif,.bmp"/>');
	$("#uploadFiles"+i).click();
	i++;
}
function loadCity(value) {
	var proName = value;
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
				if('${credit.debtCity}' == item){
					$('#debtCity').append('<option value='+item+' selected>'+item+'</option>');
				}else{
					$('#debtCity').append('<option value='+item+'>'+item+'</option>');
				}
		    });
		},
		error : function() {
			alert("获取城市数据失败");
		}
	});
}
$(function(){
	if($("#debtProvince").val() != ''){
		loadCity($("#debtProvince").val());
	}
});
</script>