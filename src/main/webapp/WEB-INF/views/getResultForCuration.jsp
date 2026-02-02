<%@ page import="edu.mcw.rgd.services.RgdContext" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Getting Result</title>
</head>
<body onload='document.forms[0].submit()'>
<%
 String hostURL="";
 if(RgdContext.isDev()){
  hostURL+="https://dev.rgd.mcw.edu";
 }else {
  hostURL+="https://ontomate.rgd.mcw.edu";
 }
%>
Searching... Condition: <span style="color:brown;">${message_label}</span> 
<form action="<%=hostURL%>/${source}/browse" method="post">
<input type="hidden" name="q" value = '${q}'/>
 <input type="hidden" name="sort" value = "${sort}"/>
 <!--input type="hidden" name="sort" value = "p_date desc"/-->
 <input type="hidden" name="qf" value="title^2 mesh_terms^1.4 abstract^0.8 mt_term^1"/>
 <input type="hidden" name="v.template" value="browseCuration"/>
 <input type="hidden" name="curHost" value="${curHost}"/>
 <input type="hidden" name="userKey" value="${userKey}"/>
 <input type="hidden" name="userId" value="${userId}"/>
 <input type="hidden" name="userFullName" value="${userFullName}"/>
 <input type="hidden" name="start" value="0"/>
 <!--input type="hidden" name="fq" value="p_year:  2011 TO  "/-->
 <input type="hidden" name="facet.field" value="organism_term_s"/>
 <input type="hidden" name="facet.field" value="gene_s"/>
 <input type="hidden" name="facet.field" value="mt_term_s"/>
 <input type="hidden" name="facet.field" value="rdo_id"/>
 <input type="hidden" name="facet.limit" value="100"/>
  <input type="hidden" name="mm" value="1"/>
 <input type="hidden" name="message_label" value='${message_label}'/>
</form>
</body>
</html>