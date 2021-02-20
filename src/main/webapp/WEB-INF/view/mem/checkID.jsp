<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Id Check</title>
</head>
<body>
Id Check
<hr>
<%
   Object obj = request.getAttribute("listAll");
   int listAll = ((Integer)obj).intValue();
   System.out.println("checkID listAll >>> : " + listAll);
   String sVal = "";
   if(listAll >=1){
      sVal = "ID_BAD";
   }else{
      sVal = "ID_GOOD";
   }
   
%>
<?xml version='1.0' encoding='UTF-8'?>
<login>
   <result><%= sVal %></result>   
</login>
</body>
</html>