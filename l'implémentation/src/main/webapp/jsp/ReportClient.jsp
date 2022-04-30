<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ReportClient.css">
<title>Insert title here</title>
</head>
<body>
<form class="report_client" style="display:none;">
	<input id="destination" type="hidden" name="destination" value="serviceClient@email.com">
	<div id="header">
		<p id="header_title">Report client</p>
		<button onclick="closeTab(this)" id="btn_cancel"><img style="width:14px;" src="${pageContext.request.contextPath}/assets/cancel.svg"></button>
	</div>
	<div id="row">
	<div id="title">
		<label>Title</label>
		<input required="required" id="Request_title" name="title" type="text" placeholder="title">
	</div>
	<div id="category">
		<label>Category</label>
		<select name="tag" id="filter">
			<option value="Miss conduct">Miss conduct</option>
			<option value="Missing an appt">Missing Appt</option>
		</select>
	</div>
	</div>
	<label>Description</label>
	<textarea id="content" name="content" placeholder="Description"></textarea>
	<div id="add_files" onclick="selectUpload()">
		<img src="${pageContext.request.contextPath}/assets/add-blue.svg">
		<p id="title">Add References</p>
	</div>
	<button id="send_btn" type="submit"><img src="${pageContext.request.contextPath}/assets/check.svg"><p>Submit</p></button>
</form>
<div id="Upload_refrences" style="display:none;">
	<div id="tab_header">
		<p id="title">Upload Refrences</p>
		<button onclick="closeTab(this)" id="btn_2_cancel"><img style="width:14px;" src="${pageContext.request.contextPath}/assets/cancel.svg"></button>
	</div>
	<div id="tabs">
		<div class="tab active" onclick="selectTab(this)">
			<p id="text">Meeting</p>
		</div>
		<div class="tab" onclick="selectTab(this)">
			<p id="text">File</p>
		</div>
	</div>
	<div id="pages">
		<div id="file_page" style="display:none;">
			<input type="file">
		</div>
		<div id="meeting_page" style="display:flex;">
			<div id="appt" onclick="selectMeeting(this)">
			<input type="hidden" id="Meeting_date">
			<input type="hidden" id="Client_email">
				<div id="time">
					<p id="start_time">10:00</p>
					<p id="end_time">10:15</p>
				</div>
				<div id="appt_info">
					<p id="title">10 Dec , 2022</p>
					<p id="subtitle">Nathanial  Olson</p>
				</div>
				<div id="image_wrapper">
					<div id="client_image">
						<img src="/Atelier/assets/profile_pics/1email.png" style="width: 50px;">
					</div>
				</div>
			</div>
		</div>
	</div>
	<button id="submit_btn_pages" type="submit"><img src="${pageContext.request.contextPath}/assets/check.svg"><p>Submit</p></button>
</div>
<script src="${pageContext.request.contextPath}/js/ReportClient.js"></script>
	
</body>
</html>