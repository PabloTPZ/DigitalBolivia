<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/classassignment" user="root" password="" />
	<sql:update dataSource="${dbsource}" var="count">
            DELETE FROM Student_Class WHERE Student_id_student = '${param.id}'
        </sql:update>
	<sql:update dataSource="${dbsource}" var="count">
            DELETE FROM Student WHERE id_student = '${param.id}'
        </sql:update>
	<c:if test="${count>=1}">
           Data deleted
            successfully.
              <a href="index.jsp">Index</a>
	</c:if>
</body>
</html>