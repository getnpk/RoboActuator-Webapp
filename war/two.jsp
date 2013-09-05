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
	hm.put("current_type", request.getParameter("current_type"));
	hm.put("current_efficiency", request.getParameter("current_efficiency"));
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
<form action="three.jsp" method="POST">

<center><h1><strong><font face="verdana">Motor Recommendation System for Robot Actuators</font></strong></h1></center>
<center><h2><strong><font face="verdana">Motor Environment Specifications</font></strong></h2></center>
<p>
<img src="http://www.tms.org/pubs/journals/JOM/0311/fig1.gif" style="float:right;margin:0 100px 0 0;"/>
<br><ol id="list1"><li>Is the ambient temperature high or low?</li></br>

<input type="radio" name="ambient_temp" checked="checked" value="High">High (Greater than room temperature)<br>
<input type="radio" name="ambient_temp" value="Low">Low (Normal room temperature)<br>


<br><li>Can the noise level made by the motor be high?</li></br>
<input type="radio" name="noise" checked="checked" value="Yes">Yes (~> 90 Decibels)<br>
<input type="radio" name="noise" value="No">No (~< 90 Decibels)<br>

<br><li>Will the motor be exposed to liquid particles?</li></br>
<input type="radio" name="ipxx_liquid" checked="checked" value="Yes">Yes (IP Second rating > 6)<br>
<input type="radio" name="ipxx_liquid" value="No">No (IP Second rating < 6)<br>

<br><li>Will the motor be exposed to solid particles?</li></br>
<input type="radio" name="ipxx_solid" checked="checked" value="Yes">Yes (IP First rating > 4)<br>
<input type="radio" name="ipxx_solid" value="No">No (IP First rating < 4)<br>
</ol>
</p>
<center><input type="submit" value="Continue"></center>
</form>

</body>
</html>