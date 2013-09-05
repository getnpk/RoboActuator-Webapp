<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.HashMap" %>

<%
HashMap<String,String> hm= (HashMap<String, String>) session.getAttribute("configs");

if(hm==null){
	hm=new HashMap<String,String>();
	session.setAttribute("configs",hm);
}
%>

<html>
<head>
<style>

#list1{
font: italic 1em verdana;
}

input[type=submit] {
	font-size: 24px;
}

</style>
</head>
<body bgcolor="#E6E6FA">
<center><h1><strong><font face="verdana">Motor Recommendation System for Robot Actuators</font></strong></h1></center>
<center><h2><strong><font face="verdana">Input Source Specifications</font></strong></h2></center>



<form action="two.jsp" method="POST">



<p>
<img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQXkoMYGk1V2j5cKTEM-zQcMnoTmQgazHpGzAmuCOlGIjwlLxaDAg" style="float:right;margin:0 100px 0 0;"/>
<br><ol id="list1">
<li>Which current type should the motor operate on?</li></br>

<input type="radio" name="current_type" checked="checked" value="AC"><font face="verdana">Alternating Current (AC)</font><br>
<input type="radio" name="current_type" value="DC"><font face="verdana">Direct Current (DC)</font><br>


<br><li>What is the current efficiency that you expect from your motor?</li></br>
<input type="radio" name="current_efficiency" checked="checked" value="High"><font face="verdana">High (between 70-95%)</font><br>
<input type="radio" name="current_efficiency" value="Low"><font face="verdana">Low (between 55-70%)</font><br>
<br>
</ol>
</p>
<center><input type="submit" value="Continue"></center>
</form>

</body>
</html>