<%--
  Created by IntelliJ IDEA.
  User: Cao Minh Quan
  Date: 7/31/2023
  Time: 7:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Phone Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
        <div>
            <a href="https://www.javaguides.net" class="navbar-brand"> Phone Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Phone</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
                <form action="insert" method="post">
                    <caption>
                        <h2>
                            Add New Phone
                        </h2>
                    </caption>

                    <c:if test="${phone != null}">
                        <input type="hidden" name="id" value="<c:out value='${phone.id}' />" />
                    </c:if>

                    <fieldset class="form-group">
                        <label>Phone Name</label> <input type="text" value="<c:out value='${phone.name}' />" class="form-control" name="name" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Phone Brand</label>
                        <select class="form-control" name="brand" required="required">
                            <option value="Apple">Apple</option>
                            <option value="Samsung">Samsung</option>
                            <option value="Nokia">Nokia</option>
                            <option value="Others">Others</option>
                        </select>
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Phone Price</label> <input type="number" value="<c:out value='${phone.price}' />" class="form-control" name="price" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Phone Description</label> <input type="text" value="<c:out value='${phone.description}' />" class="form-control" name="description" required="required">
                    </fieldset>

                    <button type="submit" class="btn btn-success">Save</button>
                    <button type="reset" class="btn btn-success">Reset</button>
                </form>
        </div>
    </div>
</div>
</body>

</html>

