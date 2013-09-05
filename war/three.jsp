<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.HashMap" %>

<%

HashMap<String,String> hm= (HashMap<String,String>) session.getAttribute("configs");
if(hm==null){
	
	//response.sendRedirect("index.jsp");
	
	%> 
		<jsp:forward page="index.jsp">
			<jsp:param name="FailReason" value="No session key" /> 
		</jsp:forward>
	<%
	
	hm=new HashMap<String,String>();
	session.setAttribute("configs",hm);
}else{
	session.setAttribute("configs",hm);
	hm.put("ambient_temp", request.getParameter("ambient_temp"));
	hm.put("noise", request.getParameter("noise"));
	hm.put("ipxx_solid", request.getParameter("ipxx_solid"));
	hm.put("ipxx_liquid", request.getParameter("ipxx_liquid"));

}

%>



<html>
<head>
<style>

input[type=submit] {
	font-size: 24px;
}

#list1{
font: italic 1em verdana;
}
</style></head>
<body bgcolor="#E6E6FA">
<form action="four.jsp" method="POST">
<center><h1><strong><font face="verdana">Motor Recommendation System for Robot Actuators</strong></font></h1></center>
<center><h2><strong><font face="verdana">Motor Performance Specifications</strong></font></h2></center>



<p>
<img src="http://static.ddmcdn.com/gif/robot-9.jpg" style="float:right;margin:0 100px 0 0;"/>

<br><ol id="list1"><li>What is the Speed and Torque range do you desire?</li></br>
<input type="radio" name="speed" checked="checked" value="High">High (8000-20000+ RPM)<br>
<input type="radio" name="speed" value="Low">Low (Less than 8000 RPM)<br>


<br><li>Would you like a high starting and stalling torque?</li></br>
<input type="radio" name="stall" checked="checked" value="High">High (8-10 times of rated torque)<br>
<input type="radio" name="stall" value="Low">Low (Less than 8 times rated torque)<br>
<br>

<br><li>Will the motor undergo heavy load in each duty cycle?</li></br>
<input type="radio" name="duty" checked="checked" value="Yes">Yes (continuous load)<br>
<input type="radio" name="duty" value="No">No (short to intermediate load)<br>
<br>
</ol>
</p>
<center><input type="submit" value="Continue"></center>
</form>

</body>
</html>