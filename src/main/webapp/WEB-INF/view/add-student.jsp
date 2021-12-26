<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
    <title>Student Management System for College Fest :- Add/Update Student</title>
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/add-student-style.css"/>
</head>
<body>

<div id="wrapper">
    <div id="header">
        <h2>Student Management System for College Fest :- Add/Update Student</h2>
    </div>

</div>

<form:form action="${pageContext.request.contextPath}/logout" method="post">
    <div>
        <p style="align-items: center">
            <input type="submit" value="Logout" class="add-button" style="float:left"/>
        </p>
    </div>
</form:form>
<br/><br/>

<div id="container">
    <form:form action="saveStudent" modelAttribute="student" method="post">
        <form:hidden path="id"></form:hidden>
        <table>
            <tbody>
            <tr>
                <td>Name</td>
                <td><form:input path="name"></form:input></td>
            </tr>
            <tr>
                <td>Department</td>
                <td><form:input path="department"></form:input></td>
            </tr>
            <tr>
                <td>Country</td>
                <td><form:input path="country"></form:input></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Save" class="save"></td>
            </tr>
            </tbody>
        </table>
    </form:form>

    <div style="clear:both;"></div>

    <p>
        <a href="list">Back to List</a>
    </p>
</div>
</body>
</html>