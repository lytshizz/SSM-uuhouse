<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title>
</head>
<body>
    id:${user.uid} <br>
    nickName: ${user.nickname} <br>
    birthday: <fmt:parseDate value=" ${user.birthday}" pattern="yyyy-MM-dd HH:mm:ss" var="birthday" />
    		  <fmt:formatDate value="${birthday}" pattern="yyyy-MM-dd HH:mm:ss"/><br>
    age: ${user.sex} <br>
</body>
</html>