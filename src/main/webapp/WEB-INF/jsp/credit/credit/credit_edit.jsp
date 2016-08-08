<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
 
<form class="form-horizontal" action="credit/edit" method="post" id="defForm" callfn="refreshTable" enctype="multipart/form-data">
<input type="hidden" name="creditType" value="${credit.creditType }">
<input type="hidden" name="crStatus" value="${credit.crStatus}">
<input type="hidden" name="id" value="${credit.id}">
	<div class="modal-header">
		<div class='bootstrap-dialog-header'>
			<div class='bootstrap-dialog-close-button'
				style='display: block;'>
				<button class='close' data-dismiss='modal' aria-label='Close'>×</button>
			</div>
			<div class='bootstrap-dialog-title'>修改债权</div>
		</div>
	</div>
	<div class="modal-body">
	<div class="container-fluid">
                          <div class="form-group">
                                <label class="col-sm-3 control-label">债权类型：</label>
                                <div class="col-sm-8">
                                        <select  name="crType" class="form-control">
													<option value="1" <c:if test="${credit.crType == 1}">selected</c:if>>民间借贷</option>
													<option value="2" <c:if test="${credit.crType == 2}">selected</c:if>>应收账款</option>
													<option value="3" <c:if test="${credit.crType == 3}">selected</c:if>>银行借贷</option>
													<option value="4" <c:if test="${credit.crType == 4}">selected</c:if>>互联网金融</option>
													<option value="5" <c:if test="${credit.crType == 5}">selected</c:if>>小额信贷</option>
													<option value="6" <c:if test="${credit.crType == 6}">selected</c:if>>典当担保</option>
													<option value="7" <c:if test="${credit.crType == 7}">selected</c:if>>司法裁决</option>
										</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">债权金额：</label>
                                <div class="col-sm-8">
                                    <input id="crAmount" name="crAmount" class="form-control" type="text" required="required" value="${credit.crAmount }">
                                    <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 注意：金额币种人民币(￥)</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">你期望的处置方式：</label>
                                <div class="col-sm-8">
	                              <input name="disposalType" id="su1" class="exts1" type="checkbox" value="1"> 
								  <span>诉讼</span>
						          <input name="disposalType" id="fsu1" class="exts1" type="checkbox" checked="checked" value="2">
								  <span>催收</span>
						          <input name="disposalType" class="exts1" id="rang1" type="checkbox" value="3">
						          <span>债权转让</span> 
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">支付佣金范围：</label>
                                <div class="col-sm-8">
                                     <select name="commisionRange" class="form-control" required="required" aria-required="true">
									 <option value="10%"  <c:if test="${credit.commisionRange == '10%'}">selected</c:if>>10%</option>
									 <option value="10%-20%">10%-20%</option>
									 <option value="20%-30%" selected="selected">20%-30%</option>
									 <option value="30%-40%">30%-40%</option>
									 <option value="40%-50%">40%-50%</option>
									 <option value="50%-60%">50%-60%</option>
									 <option value="60%以上">60%以上</option>
									 </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">联系人姓名：</label>
                                <div class="col-sm-8">
                                    <input id="contactName" name="contactName" class="form-control" type="text" placeholder="可以是本人也可以委托他人" required="required" aria-required="true" value="${credit.contactName }">
                                    <span class="help-block m-b-none"><i class="fa fa-info-circle"></i>可以是本人也可以委托他人</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">联系人电话：</label>
                                <div class="col-sm-8">
                                    <input id="contactNumber" name="contactNumber" class="form-control" type="text" placeholder="请填写有效的手机号码" required="required" aria-required="true" value="${credit.contactNumber }">
                                </div>
                            </div>
                           <div class="hr-line-dashed"></div>
                          <a class="list-group-item active">
					      <h4 class="list-group-item-heading">
					         债务方信息
					      </h4>
					      </a><br/>
					     
                         <div class="form-group">
                                <label class="col-sm-3 control-label">债务方名称：</label>
                                <div class="col-sm-8">
                                    <input id="debtName" name="debtName" class="form-control" type="text" required="required" aria-required="true" value="${credit.debtName }">
                                    <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 这里写点提示的内容</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">债务方地址：</label>
                                <div class="col-sm-4">
												   <select onchange="loadCity(this)" id="debtProvince" name="debtProvince" class="form-control input-sm"  required="required" aria-required="true">
													 <option value="1">请选择</option>
													 <c:forEach items="${provinceList}" var="item">
													 <option value="${item}">${item}</option>
													<c:if test="${not empty credit.debtProvince }">
							                        <option value="${credit.debtProvince }" selected="selected">${credit.debtProvince}</option>
							                        </c:if>
													 </c:forEach>
							                       </select>
								</div>
								<div class="col-sm-4">
									 <select id="debtCity" name="debtCity" class="form-control input-sm" style="width: 120px;">
							              <option value="">请选择</option>
							               <c:if test="${not empty credit.debtCity }">
							               <option value="${credit.debtCity }" selected="selected">${credit.debtCity}</option>
							               </c:if>
							          </select>
								</div>
                            </div>
                                
                                
                            <div class="form-group">
                                <label class="col-sm-3 control-label">债务方联系电话：</label>
                                <div class="col-sm-8">
                                    <input id="debtPhone" name="debtPhone" class="form-control" type="text" required="required" aria-required="true" value="${credit.debtPhone }">
                                </div>
                            </div>
                             <%-- --%>
		                    <div class="form-group">
		                        <label class="col-sm-3 control-label">照片：</label>
		                        <div class="col-sm-8">
		                             <input class="form-control" type="file" name="uploadFiles" accept=".jpg,.png,.jpeg,.gif,.bmp"/>
		                             <div id="addFileUpload"></div>
		                             <span class="help-block m-b-none">
		                             	<button type="button" class="btn btn-white btn-xs" onclick="addFileUpload()"><span class="glyphicon glyphicon-plus-sign">继续添加</span></button>
		                         </span>
		                    </div>
		                               
                            <div class="form-group">
                                <label class="col-sm-3 control-label">债权开始日期：</label>
                                <div class="col-sm-8">
                                    <input class="form-control required" type="text" name="openDate" id="datetimepicker"  value="<fmt:formatDate value="${credit.openDate }" pattern="yyyy-MM-dd"/>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">债权描述：</label>
                                <div class="col-sm-8">
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
function addFileUpload(){
	$("#addFileUpload").append('<input class="form-control" type="file" name="uploadFiles" accept=".jpg,.png,.jpeg,.gif,.bmp"/>');
}
function loadCity(obj) {
	var proName = $(obj).val();
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
</script>