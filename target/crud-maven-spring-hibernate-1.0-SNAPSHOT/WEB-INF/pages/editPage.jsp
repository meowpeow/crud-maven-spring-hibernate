<%--
  Created by IntelliJ IDEA.
  User: meowp
  Date: 26-Aug-19
  Time: 12:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="<c:url value="/res/style.css"/>" rel="stylesheet" type="text/css"/>
    <c:if test="${empty book.title}">
        <title>Add</title>
    </c:if>
    <c:if test="${!empty book.title}">
        <title>Edit</title>
    </c:if>
</head>
<body>
<c:if test="${empty book.title}">
    <c:url value="/add" var="var"/>
</c:if>
<c:if test="${!empty book.title}">
    <c:url value="/edit" var="var"/>
</c:if>

<form action="${var}" method="POST">
    <c:if test="${!empty book.title}">
        <input type="hidden" name="id" value="${book.id}">
    </c:if>
    <label for="title">Title</label>
    <input type="text" name="title" id="title">
    <label for="author">Author</label>
    <input type="text" name="author" id="author">
    <label for="year">Year</label>
    <input type="text" name="year" id="year">
    <label for="genre">Genre</label>
    <input type="text" name="genre" id="genre">
    <label for="price">Price</label>
    <input type="text" name="price" id="price">
    <label for="quantity">Quantity</label>
    <input type="text" name="quantity" id="quantity">

    <c:if test="${empty book.title}">
        <input type="submit" value="Add new book">
    </c:if>
    <c:if test="${!empty book.title}">
        <input type="submit" value="Edit book">
    </c:if>
</form>
</body>
</html>
<%--
<form> — форма для сбора и отправки данных, с указанием кто их будет обрабатывать (/edit)
<input> — элементы интерфейса для взаимодействия с пользователем (кнопки, поля ввода и т.д.)
<label> — текстовая метка
--%>