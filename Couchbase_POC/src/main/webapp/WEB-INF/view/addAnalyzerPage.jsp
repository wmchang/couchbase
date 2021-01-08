<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/index.css">

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
	width:500px;
	height:450px;
}
</style>
</head>
<script>
	function addDocument(){
		
		let data = $("#documentForm").serializeArray();

		$.ajax({
			type:	"post",
			url:	"addDocument",
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
		<p>Name: <input type="text" name=documentId id=documentId /></p>
		<p>Character Filters: <input type="text" name=documentId id=documentId /></p>
		<p>Tokenizer: <input type="text" name=documentId id=documentId /></p>
		<p>Token Filters: <input type="text" name=documentId id=documentId /></p>
	</div>
	
	<div style="text-align:right;margin-right:15px;">
		<button class=n1qlexcute onclick="addFTI()">�����ϱ�</button>
	</div>
	
</body>
</html>