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
	hm.put("speed", request.getParameter("speed"));
	hm.put("stall", request.getParameter("stall"));
	hm.put("duty", request.getParameter("duty"));
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
<form action="Recommendation.jsp" method="POST">
<center><h1><strong><font face="verdana">Motor Recommendation System for Robot Actuators</font></strong></h1></center>
<center><h2><strong><font face="verdana">Motor Generic specifications</font></strong></h2></center>

<p>
<img src="http://ccl.northwestern.edu/netlogo/docs/images/gogo/netlogolab-motor.jpg" style="float:right;margin:0 100px 0 0;"/>

<br><ol id=list1><li>Would you like your motor to have long life?</li></br>
<input type="radio" name="life" checked="checked" value="Yes">Yes (Greater than 18000 Hours)<br>
<input type="radio" name="life" value="No">No (Less than 2000 Hours)<br>
<br>

<br><li>Can you provide regular maintenance?</li></br>

<input type="radio" name="maintainence" checked="checked" value="Yes">Yes<br>
<input type="radio" name="maintainence" value="No">No<br>


<br><li>Would you like your motor to do a heavy task?</li></br>
<input type="radio" name="size" checked="checked" value="Heavy">Heavy task<br>
<input type="radio" name="size" value="Light">Light task<br>
<br>

<br><li>Would you like the ability to externally control your motor?</li></br>
<input type="radio" name="control" checked="checked" value="Yes">Yes, I want a separate control<br>
<input type="radio" name="control" value="No">No, we don't need a separate control<br>
<br>
</ol>
</p>
<center><input type="submit" value="Submit"></center>

</form>

</body>
</html>