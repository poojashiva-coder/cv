<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String s=request.getParameter("val");
if(s==null || s.trim().equals("")){
out.print("Please Type Rollno to search");
}else{
out.println("<img src='ajax.gif' alt='Searching'></img>");
String search=s;
try{
Statement stmt=null;
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","it");
stmt = con.createStatement();
String sql="select * from mark_sheet where rollno like '%"+search+"%' " ;
ResultSet rs = stmt.executeQuery(sql);
while(rs.next()){
out.println(rs.getString(1));
out.println(rs.getString(2));
out.println(rs.getString(3));
out.println(rs.getString(4));
}
rs.close();
stmt.close();
con.close();
}
catch(Exception e)
{
e.printStackTrace();
}
}
%>
