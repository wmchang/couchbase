<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/css/index.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->

</head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<body>

	<div id="header">
		<a> <img src="<%= request.getContextPath()%>/static/image/cb_logo_bug_white_2.svg"
			alt="Couchbase Server" class="logobug">
		</a>
	</div>
	<div id=header-tab>
		<div class="menu">
			<a href="<%= request.getContextPath()%>/"> ���� ���� ���� </a>
		</div>
		<div class="menu">
			<a href="<%= request.getContextPath()%>/nodeManagePage"> ��� </a>
		</div>
		<div class="menu">
			<a href="<%= request.getContextPath()%>/bucketManagePage"> ��Ŷ </a>
		</div>
		<div class="menu">
			<a href="<%= request.getContextPath()%>/documents/documentPage"> ���� </a>
		</div>
		<div class="menu">
			<a href="<%= request.getContextPath()%>/queryExcutePage"> ���� </a>
		</div>
		<div class="menu">
			<a href="<%= request.getContextPath()%>/fts/ftsPage" > FTS </a>
		</div>
		<div class="menu">
			<a href="<%= request.getContextPath()%>/eventingPage" > �̺�Ʈ </a>
		</div>
		<div class="menu">
			<a href="<%= request.getContextPath()%>/analyticsPage" > �м� </a>
		</div>
		<div class="menu">
			<a href="<%= request.getContextPath()%>/randomDataPage"> ���� ������ </a>
		</div>
		<div class="menu">
			<a href="<%= request.getContextPath()%>/CsvOrFileUpsertPage"> ���� ���ε� </a>
		</div>
		<div class="menu">
			<a href="<%= request.getContextPath()%>/logPage"> �α� </a>
		</div>
		<div class="menu">
			<div class=dropdown>
				<a href="<%= request.getContextPath()%>/settings/setting"> ȯ�� ���� </a>
				<div class="dropdown-content">
				    <a href="<%= request.getContextPath()%>/settings/setting">�Ϲ� ����</a>
				    <a href="<%= request.getContextPath()%>/settings/autoCompactionPage">�ڵ� ����</a>
				    <a href="<%= request.getContextPath()%>/settings/emailAlertsPage">�̸��� �˸�</a>
				    <a href="<%= request.getContextPath()%>/settings/sampleBucketPage">���� ��Ŷ</a>
				    <a href="<%= request.getContextPath()%>/settings/querySettingPage">���� ����</a>
				</div>
			</div>
		</div>
	</div>
	
<script SameSite="None; Secure" src="https://static.landbot.io/landbot-widget/landbot-widget-1.0.0.js"></script>
<script>
  var myLandbot = new LandbotLivechat({
    index: 'https://chats.landbot.io/v2/H-732845-Q0420772Y6TURE5U/index.html',
  });
</script>

</body>
</html>