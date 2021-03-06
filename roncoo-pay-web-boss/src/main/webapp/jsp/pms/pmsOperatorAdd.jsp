<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib/taglib.jsp"%>
<style>
<!--
.pageFormContent fieldset label{
	width: 200px;
}
-->
</style>
<div class="pageContent">
	<form id="form" method="post" action="pms_addPmsOperator.action" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="60">
		    <input type="hidden" name="navTabId" value="listPmsOperator">
			<input type="hidden" name="callbackType" value="closeCurrent">
			<input type="hidden" name="forwardUrl" value="">
			
			<s:hidden id="selectVal" name="selectVal"></s:hidden>
			
			<p style="width:99%">
				<label></label>
				<span style="color:red;">提示：操作员添加后将不可删除，登录名不可修改，请确保添加信息的准确性！</span>
			</p>
			<p style="width:99%">
				<label>操作员姓名：</label>
				<s:textfield name="realName" cssClass="required" minlength="2" maxlength="45" size="30" />
			</p>
			<p style="width:99%">
				<label>操作员登录名：</label>
				<input type="text" accept="loginName" class="required email" maxlength="30" size="30" />
			</p>
			<s:if test="id==null">
			<p style="width:99%">
				<label>密码：</label>
				<input type="password" accept="loginPwd" class="required" maxlength="20" size="30" />
				<span class="info"></span>
			</p>
			</s:if>
			<p style="width:99%">
				<label>手机号码：</label>
				<s:textfield name="mobileNo" cssClass="required mobile"  maxlength="12" size="30" />
			</p>
			<p style="width:99%">
				<label>状态：</label>
				<select name="status" class="required combox">
					<option value="">-请选择-</option>
					<c:forEach items="${OperatorStatusEnumList}" var="operatorStatus">
						<option value="${operatorStatus.value}"
							<c:if test="${status ne null and status eq operatorStatus.value}">selected="selected"</c:if>>
							${operatorStatus.desc}
						</option>
					</c:forEach>
				</select>
				<font color="red">*</font>
			</p>
			<p style="width:99%">
				<label>操作员类型：</label>
				普通操作员
			</p>
			<p style="width:99%;height:50px;">
				<label>描述：</label>
				<s:textarea name="remark" cssClass="required" maxlength="100" rows="3" cols="30"></s:textarea>
			</p>
			
			<fieldset style="width:99%">
				<legend>选择角色<font color="red">*</font></legend>
				<s:iterator value="rolesList" status="st">
					<c:if test="${roleType eq RoleTypeEnum.USER.value}">
						<label>
							<input class="selectOperatorRole" type="checkbox" name="selectRole" value="${id }">${roleName }
						</label>
					</c:if>
				</s:iterator>
			</fieldset>
			
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="submitForm()">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
<script type="text/javascript">
	function submitForm() {
		var str = "";
		$(":checkbox:checked").each(function() {
			if ($(this).hasClass('selectOperatorRole')){
				// 加样式判断，避免与其他复选框冲突
				str += $(this).val() + ",";
			}
		});
		$("#selectVal").val(str);
		
		$("#form").submit();
	}
</script>