<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form class="form-horizontal" action="blog/addOrUpd" method="post" id="defForm" callfn="refreshTable">
	<div class="modal-header">
		<div class='bootstrap-dialog-header'>
			<div class='bootstrap-dialog-close-button' style='display: block;'>
				<button class='close' data-dismiss='modal' aria-label='Close'>×</button>
			</div>
			<div class='bootstrap-dialog-title'>
				<c:if test="${empty blog.id}">新增</c:if><c:if test="${not empty blog.id}">编辑</c:if>
			</div>
		</div>
	</div>
	<input type="hidden" name="description" id="description" value="${blog.description}"/>
	<input type="hidden" name="id" value="${blog.id}"/>
	<div class="modal-body">
		<div class="container-fluid">
			<div class="form-group">
				<label for="loginName" class="col-sm-3 control-label">标题：</label>
				<div class="col-sm-7">
					<input id="blogTitle" name="blogTitle" type="text" maxlength="10" value="${blog.blogTitle}" class="form-control required" placeholder="请输入标题"/>
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">类型:</label>
				<div class="col-sm-7">
					<select name="userStatus" id="userStatus" class="form-control">
						<option value="1" <c:if test="${blog.blogType eq 1}">selected</c:if>>媒体报道</option>
						<option value="2" <c:if test="${blog.blogType eq 2}">selected</c:if>>业务文章</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">作者:</label>
				<div class="col-sm-7">
					<input class="form-control required" type="text" name="blogAuthor" id="blogAuthor" value="${blog.blogAuthor}"/>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">来源:</label>
				<div class="col-sm-7">
					<input class="form-control required" type="text" name="blogSource" id="blogSource" value="${blog.blogSource}"/>
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-3 control-label">描述:</label>
				<div class="col-sm-7">
					<script type="text/plain" id="myEditor" style="width:800px;height:340px;">
    					<p>这里输入内容</p>
					</script>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		<button type="submit" class="btn btn-primary">保存</button>
	</div>
</form>
<script>
	//实例化编辑器
	var um = UM.getEditor('myEditor');
	$("#defForm").validate();
</script>