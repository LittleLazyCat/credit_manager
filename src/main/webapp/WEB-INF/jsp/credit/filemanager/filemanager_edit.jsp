<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<form class="form-horizontal" action="filemanager/edit" method="post" id="defForm" callfn="refreshTable">
	<div class="modal-header">
		<div class='bootstrap-dialog-header'>
			<div class='bootstrap-dialog-close-button'
				style='display: block;'>
				<button class='close' data-dismiss='modal' aria-label='Close'>×</button>
			</div>
			<div class='bootstrap-dialog-title'>新增法律文件模版</div>
		</div>
	</div>
	<div class="modal-body">
		<div class="container-fluid">
			<div class="form-group">
				<label for="loginName" class="col-sm-2 control-label">文件类型</label>
				<div class="col-sm-7">${fileManager.fileType }
						<select name="fileType" id="fileType" class="form-control required" >
						<option value="1"  <c:if test="${fileManager.fileType == 1}">selected="selected"</c:if>>法律文书</option>
						<option value="2"  <c:if test="${fileManager.fileType == 2}">selected="selected"</c:if>>合同模版</option>
						<option value="3"  <c:if test="${fileManager.fileType == 3}">selected="selected"</c:if>>实用文件</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">文件名称</label>
				<div class="col-sm-7">
					<input id="fileTitle" name="fileTitle" type="text" maxlength="32" class="form-control required" placeholder="请输入文件名称" value="${fileManager. fileTitle}">
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-2 control-label">下载地址</label>
				<div class="col-sm-7">
					<textarea id="downloadUrl" name="downloadUrl" class="form-control"
						rows="3">${fileManager. downloadUrl}</textarea>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		<shiro:hasPermission name="user/add">
			<button type="submit" class="btn btn-primary">保存</button>
		</shiro:hasPermission>
	</div>
</form>
<script type="text/javascript">
$('#defForm').validate({
	rules: {
		loginName: {
            required: true,
            remote: {
                type: "post",
                url: "user/checkName",
                dataType: "json",
                dataFilter: function(data, type) {
                    if (data == 1){
                    	return false;
                    }else{
                    	return true;
                    }  
                }
            }
    	}
    },
    messages: {
    	loginName: {
            required: "请输入用户名",
            remote: "用户名重复"
        }
    }
});
</script>