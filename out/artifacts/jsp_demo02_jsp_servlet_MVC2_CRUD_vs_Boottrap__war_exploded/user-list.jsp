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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
          crossorigin="anonymous">
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
<br/>
<div class="row">
    <div class="container">
        <h3 class="text-center">List of User</h3>
        <hr>
        <div class="container text-left">
            <a href="<%=request.getContextPath() %>/new" class="btn btn-success"> Add new user</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>EMAIL</th>
                <th>COUNTRY</th>
                <th>ACTIONS</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${listUser}">
                <tr>
                    <td>
                        <c:out value="${user.id}"/>
                    </td>
                    <td>
                        <c:out value="${user.name}"/>
                    </td>
                    <td>
                        <c:out value="${user.email}"/>
                    </td>
                    <td>
                        <c:out value="${user.country}"/>
                    </td>
                    <td>
                        <a href="edit?id=<c:out value='${user.id}' /> ">Edit</a>
                        <a href="delete?id=<c:out value='${user.id}' /> ">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>

</div>
</body>
</html>
