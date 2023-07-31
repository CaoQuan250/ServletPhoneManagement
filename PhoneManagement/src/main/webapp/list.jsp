<%--
  Created by IntelliJ IDEA.
  User: Cao Minh Quan
  Date: 7/31/2023
  Time: 7:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Product Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
        <div>
            <a href="https://www.javaguides.net" class="navbar-brand"> Phone
                Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Phone</a></li>
        </ul>
    </nav>
</header>
<br>

<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center">List of Phone</h3>
        <hr>
        <div class="container text-left">

            <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
                New Phone</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Brand</th>
                <th>Price</th>
                <th>Description</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="Phone" items="${listPhone}">

                <tr>
                    <td>
                        <c:out value="${Phone.id}" />
                    </td>
                    <td>
                        <c:out value="${Phone.name}" />
                    </td>
                    <td>
                        <c:out value="${Phone.brand}" />
                    </td>
                    <td>
                        <c:out value="${Phone.price}" />
                    </td>
                    <td>
                        <c:out value="${Phone.description}" />
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>
</div>
</body>

</html>

