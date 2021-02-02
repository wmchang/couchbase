<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/css/index.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->

<style>
	input[type="text"]{
		height: auto; /* ���� �ʱ�ȭ */
		line-height: normal; /* line-height �ʱ�ȭ */
		padding: .6em .02em; /* ���� ���� */
		width:200px;
	}
	textarea {
	word-wrap: break-word;
	white-space: pre-wrap;
	white-space: -moz-pre-wrap;
	white-space: -pre-wrap;
	white-space: -o-pre-wrap;
	word-break: break-all;
	width:450px;
	height:400px;
}
</style>
</head>
<script>
	function addDocument(){
		
		let data = $("#documentForm").serializeArray();

		$.ajax({
			type:	"post",
			url:	"<%= request.getContextPath()%>/addDocument",
			data:	data,
			error:	function(xhr, status, error){
				alert('������ �߻��߽��ϴ�. ����ε� JSON�������� Ȯ�����ֽʽÿ�.');
			},
			success: function(data){
				alert(data);
				window.close();
			}
		});
	}
	
	function closeEvent(){
	    opener.document.location.reload();
	}
</script>
<body onunload="closeEvent();">

	<div style=text-align:center;margin-top:15px;>
		<form id=documentForm name=documentForm>
			<input type="hidden" name=bucketName id=bucketName value='${bucketName }' />
			<p>Document ID: <input type="text" name=documentId id=documentId class="doc"/></p>
			<textarea id="documentText" name=documentText onkeydown="if(event.keyCode===9){var v=this.value,s=this.selectionStart,e=this.selectionEnd;this.value=v.substring(0, s)+'\t'+v.substring(e);this.selectionStart=this.selectionEnd=s+1;return false;}"></textarea>
		</form>
	</div>
	
	<br>
	<div style="text-align:right;margin-right:15px;">
		<button class="btn btn-primary" onclick="addDocument()">�����ϱ�</button>
	</div>
	
</body>
</html>