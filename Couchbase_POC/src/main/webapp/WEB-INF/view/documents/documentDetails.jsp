<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/css/index.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<style>
textarea {
	word-wrap: break-word;
	white-space: pre-wrap;
	white-space: -moz-pre-wrap;
	white-space: -pre-wrap;
	white-space: -o-pre-wrap;
	word-break: break-all;
	width:500px;
	height:500px;
}
</style>
</head>
<script>
	function upsertDocument(){
		
		let data = $("#documentForm").serializeArray();
		
		$.ajax({
			type : "post",
			url : "<%= request.getContextPath()%>/documentUpsert",
			data : data,
			error : function(xhr, status, error) {
				alert('������ �߻��߽��ϴ�. ����ε� JSON �������� Ȯ�����ֽʽÿ�.');
			},
			success : function(data) {
				alert('������ �Ϸ�Ǿ����ϴ�.');
				window.close();
			}
		});
	}
	
	function deleteDocument(){
		
		if(confirm('�����Ͻðڽ��ϱ�?') == false)
			return;
		let data = $("#documentForm").serializeArray();
		
		$.ajax({
			type : "post",
			url : "<%= request.getContextPath()%>/dropDocument",
			data : data,
			error : function(xhr, status, error) {
				alert('������ �߻��߽��ϴ�.');
			},
			success : function(data) {
				alert('�ش� Document�� �����Ǿ����ϴ�.');
				window.close();
			}
		});
	}
	
	function closeEvent(){
	    opener.document.location.reload();
	}

</script>

<body onunload="closeEvent();">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div style=text-align:center;margin-top:15px;>
		<form id=documentForm name=documentForm>
			<input type="hidden" name=bucketName id=bucketName value=${bucketName } />
			<input type="hidden" name=documentId id=documentId value=${documentId } />
			<textarea id="documentText" name=documentText onkeydown="if(event.keyCode===9){var v=this.value,s=this.selectionStart,e=this.selectionEnd;this.value=v.substring(0, s)+'\t'+v.substring(e);this.selectionStart=this.selectionEnd=s+1;return false;}" ><c:out value="${documentDetails}" /></textarea>
		</form>
	</div>
	
	<button class="btn btn-primary float-right" onclick="upsertDocument()" style=margin-right:15px;>����</button>
	<button class="btn btn-primary float-right" onclick="deleteDocument()" style=margin-right:10px;>����</button>
</body>
</html>