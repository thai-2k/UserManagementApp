<%--
  Created by IntelliJ IDEA.
  User: ngqth
  Date: 6/10/2020
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <head>
        <title>Title</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
              crossorigin="anonymous">
    </head>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="">
        <div>
            <a href="" class="navbar-brand">User Manager App</a>
        </div>
        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath() %>/list" class="nav-link">Users</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <c:if test="${user != null}">
            <form action="update" method="post">
                </c:if>
                <c:if test="${user == null}">
                <form action="insert" method="post">
                    </c:if>
                    <caption>
                        <h2>
                            <c:if test="${user != null}">
                                Edit User
                            </c:if>
                            <c:if test="${user == null}">
                                Add new user
                            </c:if>
                        </h2>
                    </caption>
                    <c:if test="${user != null}">
                        <input type="hidden" name="id" value="<c:out value='${user.id}' />">
                    </c:if>
                    <fieldset class="form-group">
                        <label>UserName</label>
                        <input type="text" value="<c:out value="${user.name}"/>" class="form-control" name="name" required="required">
                    </fieldset>                            <fieldset class="form-group">
                    <label>Email</label>
                    <input type="text" value="<c:out value="${user.email}"/>" class="form-control" name="email" required="required">
                </fieldset>                            <fieldset class="form-group">
                    <label>Country</label>
                    <input type="text" value="<c:out value="${user.country}"/>" class="form-control" name="country" required="required">
                </fieldset>
                    <button type="submit" class="btn btn-success">Save</button>
                </form>
        </div>
    </div>
</div>

</body>
</html>

