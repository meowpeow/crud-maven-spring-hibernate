<%--
  Created by IntelliJ IDEA.
  User: meowp
  Date: 26-Aug-19
  Time: 12:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Books</title>
    <link href="<c:url value="/res/style.css"/>" rel="stylesheet" type="text/css"/>
</head>
<body>

<h2><a href="/">home</a> </h2>
<h2><a href="/books">books</a> </h2>

<h2>Data about Books:</h2>
<table>
    <tr>
        <th>id</th>
        <th>title</th>
        <th>author</th>
        <th>year</th>
        <th>genre</th>
        <th>price</th>
        <th>action</th>
    </tr>
    <c:forEach var="book" items ="${booksList}">
        <tr>
            <td>${book.id}</td>
            <td>${book.title}</td>
            <td>${book.author}</td>
            <td>${book.year}</td>
            <td>${book.genre}</td>
            <td>${book.price}</td>
            <td>
                <a href="/edit/${book.id}">edit</a>
                <a href="/delete/${book.id}">delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

<c:forEach begin="1" end = "${pagesCount}" step="1" varStatus="i">
    <c:url value="/books" var="url">
        <c:param name="page" value="${i.index}">
        </c:param>
    </c:url>
    <a href="${url}">${i.index}</a>
</c:forEach>

<h2>Add</h2>
<c:url value="/add" var="add"/>
<a href="${add}">Add new book</a>
</body>
</html>
<%--
<table> — тег для создания таблицы.
<tr> — строка таблицы
<th> — заголовок столбца
<td> — ячейка таблицы--%>
