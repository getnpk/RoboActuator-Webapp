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
	hm.put("size", request.getParameter("size"));
	hm.put("control", request.getParameter("control"));
	hm.put("maintainence", request.getParameter("maintainence"));
	hm.put("life", request.getParameter("life"));
}

%>

<%!
	public String getValue(String k, String v){

		String value = "default";
		
		if ((k.equals("current_type")) && (v.equals("AC")))
			value = "Alternating current";
		if (k.equals("current_type") && (v.equals("DC")))
			value = "Direct current";
		
		
		if ((k.equals("current_efficiency")) && (v.equals("High")))
			value = "Efficiency between 70-95%";
		if (k.equals("current_efficiency") && (v.equals("Low")))
			value = "Efficiency between 55-70%";
		
		if ((k.equals("ambient_temp")) && (v.equals("High")))
			value = "Choose Insulation class F or H";
		if (k.equals("ambient_temp") && (v.equals("Low")))
			value = "Choose Insulation class A or B";
		
		if ((k.equals("noise")) && (v.equals("Yes")))
			value = "High: ~> 90 Decibels.";
		if (k.equals("noise") && (v.equals("No")))
			value = "Low: ~< 90 Decibels.";
		
		if ((k.equals("ipxx_solid")) && (v.equals("Yes")))
			value = "IP First rating > 4";
		if (k.equals("ipxx_solid") && (v.equals("No")))
			value = "IP First rating < 4";
		
		if ((k.equals("ipxx_liquid")) && (v.equals("Yes")))
			value = "IP Second rating > 6";
		if (k.equals("ipxx_liquid") && (v.equals("No")))
			value = "IP Second rating < 6";
		
		
		if ((k.equals("speed")) && (v.equals("High")))
			value = "High: 8000-20000+ RPM";
		if (k.equals("speed") && (v.equals("Low")))
			value = "Low: < 8000 RPM";
		
		if ((k.equals("stall")) && (v.equals("High")))
			value = "High: 8-10 times of rated torque.";
		if (k.equals("stall") && (v.equals("Low")))
			value = "Low: < 8 times of rated torque.";
		
		if ((k.equals("duty")) && (v.equals("Yes")))
			value = "Continous load with periodic changes in load and speed.";
		if (k.equals("duty") && (v.equals("No")))
			value = "Short time to intermittent periodic duty cycle.";
		
		
		if ((k.equals("life")) && (v.equals("Yes")))
			value = "High: > 18000 Hours";
		if (k.equals("life") && (v.equals("No")))
			value = "Low: < 2000 Hours";
		
		if ((k.equals("maintainence")) && (v.equals("Yes")))
			value = "Low: < 200 Hours";
		if (k.equals("maintainence") && (v.equals("No")))
			value = "High: > 200 Hours";
		
		if ((k.equals("size")) && (v.equals("Heavy")))
			value = "High: See specifics of application";
		if (k.equals("size") && (v.equals("Light")))
			value = "Low: See specifics of application";
		
		if ((k.equals("control")) && (v.equals("Yes")))
			value = "External component for control.";
		if (k.equals("control") && (v.equals("No")))
			value = "Not required.";
		
		
		return value;
	}
%>

<html>
<head>
<style>

#list1{
font: italic 1em verdana;
}

a {
	font: bold 1em verdana;
}

</style></head>

<body bgcolor="#E6E6FA">
<center><h1><strong><font face="verdana">Motor Recommendation System for Robot Actuators</font></strong></h1></center>


</body>

<%

/*
{control=Yes, ambient_temp=Low, current_type=DC, stall=High, duty=Yes, speed=Low, ipxx_solid=Yes, 
		current_source=High, maintainence=Yes, size=Heavy, ipxx_liquid=Yes, noise=Yes}
*/

String control = hm.get("control");
String ambient_temp = hm.get("ambient_temp");
String current_type = hm.get("current_type");
String current_efficiency = hm.get("current_efficiency");
String stall = hm.get("stall");
String duty = hm.get("duty");
String speed = hm.get("speed");
String size = hm.get("size");
String ipxx_solid = hm.get("ipxx_solid");
String ipxx_liquid = hm.get("ipxx_liquid");
String noise = hm.get("noise");
String life = hm.get("life");

String motor = "Default Motor";

//Rule 1
if (current_type.equals("AC"))
	motor = "AC Induction Motor";

//Rule 2
if (current_type.equals("DC") && stall.equals("Low"))
	motor = "Universal Motor";

//Rule 3
if (current_type.equals("DC") && stall.equals("High") && speed.equals("Low"))
	motor = "Permanenet Magnet DC Motor";

//Rule 4
if (current_type.equals("DC") && stall.equals("High") && speed.equals("High") && size.equals("Heavy"))
	motor = "Permanenet Magnet DC Motor";
	
//Rule 5
if (current_type.equals("DC") && stall.equals("High") && speed.equals("High") && size.equals("Light"))
	motor = "Brushless DC Motor";

%>

<center><h2><strong><font face="verdana">Motor type: <%= motor %></font></strong></h2></center><br>


<%

if (motor.equals("AC Induction Motor"))
{
	%>
	<br />
	<img src="http://www.groschopp.com/wp-content/themes/groschopp/images/products/motors_ac_1.jpg" style="float:right;margin:0 100px 0 0;"/>
	<br />
	<%} %>
<%if (motor.equals("Brushless DC Motor"))
{
	%>
<br />
<img src="http://www.groschopp.com/wp-content/themes/groschopp/images/products/motors_brushless_2.jpg" style="float:right;margin:0 100px 0 0;"/>	
<br/>
<%} %>
<%if (motor.equals("Permanenet Magnet DC Motor"))
{
	%>
<br />
<img src="http://www.groschopp.com/wp-content/themes/groschopp/images/products/motors_dc_1.jpg" style="float:right;margin:0 100px 0 0;"/>	
<br/>
<%} %>
<%if (motor.equals("Universal Motor"))
{
	%>
<br />
<img src="http://www.groschopp.com/wp-content/uploads/motors_universal_1.jpg" style="float:right;margin:0 100px 0 0;"/>	
<br/>
<%} %>
<center><table border="1" id="list1">
<tr>
	<th>Specifics</th>
	<th>Values</th>
</tr>

<%
for (String key: hm.keySet()){
%>
	<tr>
	<td><center><%= key.substring(0, 1).toUpperCase() + key.substring(1) %></center></td>
	<td><%= getValue(key, hm.get(key)) %></td>
	</tr>	
<%
} 
%>

</table>

</center>	

<br>
<center><a href="index.jsp">HOME PAGE</a></center>

<!-- 	<%	
for (String key : hm.keySet()){
	%><center><%=key %> : <%= hm.get(key) %></center><br /><%
}
%>
 -->
</html>