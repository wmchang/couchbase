<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->

<script>
	function connectionData() {
		
		var check = inputCheck();
		if(check == false){
			alert('��� �׸��� �Է����ּ���.');
			return;
		}
		
		var data = $("#conDataForm").serializeArray();
		$.ajax({
			type : "post",
			url : "conData",
			data : data,
			error : function(xhr, status, error) {
				alert('�Է��� �߸��Ǿ����ϴ�.');
			},
			success : function(data) {
				alert('������ �Ϸ�Ǿ����ϴ�.');
			}
		});
	
	}
	
	function inputCheck(){
		let inputText = $("#conDataForm input[type=text]");
		
		for(var i=0;i<inputText.length; i++){
			
			if(inputText[i].value == "" || inputText[i].value == null){
				
				
				if( inputText[i].name =="txtSslKeyLoc" ||
					inputText[i].name =="pwdSslKeyPwd"){
					continue;
					
				}
				
				return false;
			}
		}		
		return true;
	}
	
	function testButton(){
		
		document.querySelector('#txtHostName').value='localhost';
		document.querySelector('#portNumber').value='8091';
		document.querySelector('#txtUserName').value='Administrator';
		document.getElementById("pwdPassword").value='admin123';
		document.querySelector('#txtBucketName').value='test';
		connectionData();
	}
</script>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- header.jsp -->
	<c:import url="/WEB-INF/view/header.jsp">
	</c:import>
	
<div class="container-fluid">
	<form id="conDataForm" name="conDataForm" >
    <div class="row">
        <div class="col-lg-2 borderDiv"><br>
        	<h4> &nbsp; ���� </h4><br>
			<div>
				# ȣ��Ʈ �̸� <input type="text" name="txtHostName" id="txtHostName" />
			</div>
			
			<div>
				# ��Ʈ��ȣ <input type="text" name="portNumber" id="portNumber" />
			</div>

			<div>
				# ���� �̸� <input type="text" name="txtUserName" id ="txtUserName" />
			</div>

			<div>
				# �н����� <input type="password" name="pwdPassword" id ="pwdPassword" />
			</div>

			<div>
				# ��Ŷ �̸� <input type="text" name="txtBucketName" id ="txtBucketName" />
			</div>
			<button style=margin-top:5px; class="btn btn-primary float-right" type=button onclick="testButton();">�׽�Ʈ</button>
        </div>
        <div class="col-lg-2 borderDiv"><br>
        	<h4> &nbsp; Timeout �ɼ� </h4><br>
			<div>
				# Key-Value TimeOut 
				<input type="text" name="txtKeyValueTO" size="10" value=2500
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
			<div>
				# View TimeOut 
				<input type="text" name="txtViewTO" size="10" value=75000
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
			<div>
				# Query TimeOut 
				<input type="text" name="txtQueryTO" size="10" value=75000
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
			<div>
				# Connect TimeOut 
				<input type="text" name="txtConnectTO" size="10" value=5000
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
			<div>
				# Disconnect TimeOut 
				<input type="text" name="txtDisConnectTO" size="10" value=25000
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
			<div>
				# Connect TimeOut 
				<input type="text" name="txtManagementTO" size="10" value=75000
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
        </div>
        <div class="col-lg-2 borderDiv"><br>
        	<h4> &nbsp; ��� �ɼ� </h4><br>
			<div>
				# Ring ���� ������ ��û
				<input type="text" name="txtRequestBufferSize" value=16384
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
			<div>
				# Ring ���� ������ ����
				<input type="text" name="txtResponseBufferSize"	value=16384
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
			<div>
				# ���� Ǯ Ȱ��ȭ <br>
				<input type="radio" name="rdoBufferPoolEnab" value="true" />
				<label>True</label>
				<input type="radio" name="rdoBufferPoolEnab" value="false" checked />
				<label>False</label>
			</div><br>
			
			<h4> &nbsp; �ŷڵ� �ɼ� </h4><br>
			<div>
				# �ִ� ��û Lifetime
				<input type="text" name="txtMaxReqLifeTime" 
					value=75000 onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
			<div>
				# ���� ���� �ð�
				<input type="text" name="txtKeepAliveInterval" 
					value=30000 onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
        </div>
        <div class="col-lg-2 borderDiv"><br>
			<h4> &nbsp; ���� �ɼ� </h4><br>
			<div>
				# ���� Key:Value EndPoint
				<input type="text" name="txtKvEndpoints" value=1
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
			<div>
				# ���� View EndPoint
				<input type="text" name="txtViewEndpoint" value=1
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
			<div>
				# ���� Query EndPoint 
				<input type="text" name="txtQueryEndpoint" value=1
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
			<div>
				# TCP Nodelay<br>
				<input type="radio" name="rdoTcpNodelayEnable" value="true" />
				<label>True</label>
				
				<input type="radio" name="rdoTcpNodelayEnable" value="false" checked />
				<label>False</label>
			</div>
        </div>
        <div class="col-lg-2 borderDiv" ><br>
        	<h4> &nbsp; ��Ʈ��Ʈ�� �ɼ� </h4><br>
				
			<div>
				# ��ȣȭ ���<br>
				
				<input type="radio" name="rdoSslEnable" value="true" />
				<label>True</label>
				
				<input type="radio" name="rdoSslEnable" value="false" checked /> 
				<label>False</label>
			</div>
			
			<div>
				# SSL Ű ����� ��ġ
				<input type="text" name="txtSslKeyLoc" value="" />
			</div>
			
			<div>
				# SSL Ű ����� ��й�ȣ
				<input type="password" name="pwdSslKeyPwd" value="" />
			</div>
			<div>
				# HTTP�� ���� Config �ε�<br>
				<input type="radio" name="rdoHttpEnabled" value="true" checked />
				<label>True</label>
				
				<input type="radio" name="rdoHttpEnabled" value="false" /> 
				<label>False</label>
			</div>
			<div>
				# HTTP �� ��ȣȭ ��Ʈ ����
				<input type="text" name="txtHttpDirectPort" value=8891
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
			<div>
				# HTTP ��ȣȭ ��Ʈ ����
				<input type="text" name="txtHttpSslPort" value=18091
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
        </div>
        <div class="col-lg-2 borderDiv"  ><br>
        	<h4> &nbsp; ��Ʈ��Ʈ�� �ɼ�2 </h4><br>
        	<div>
				# Carrier Publication�� ���� config �ε�<br>
				
				<input type="radio" name="rdoCarrierEnable" value="true"  checked /> 
				<label for="True">True</label>
				
				<input type="radio" name="rdoCarrierEnable" value="false" /> 
				<label for="False">False</label>
			</div>
			<div>
				# Carrier ���ȣȭ ��Ʈ ����
				<input type="text" name="txtCarrierDirectPort"
					value=11210 onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
			<div>
				# Carrier ��ȣȭ ��Ʈ ����
				<input type="text" name="txtCarrierSslPort" value=11207
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
			</div>
			<div>
				# DNS SRV ���<br>
				<input type="radio" name="rdoDnsSrvEnable" value="true" />
				<label for=true>True</label>
				
				<input type="radio" name="rdoDnsSrvEnable" value="false" checked /> False
				<label for=true>False</label>
			</div>
			<div>
				# ��� ������ ���� ��ū<br>
				<input type="radio" name="rdoMutationTknEnable" value="true" />
				<label for="True">True</label>
				
				<input type="radio" name="rdoMutationTknEnable" value="false" checked /> 
				<label for="False">False</label>
			</div>
			
				<div style="align-items:bottom; text-align:right;">
				<button type="button" class="btn btn-primary" onclick="connectionData();">����</button>
			</div>
        </div>
    </div>
    </form>
</div>

</body>
</html>