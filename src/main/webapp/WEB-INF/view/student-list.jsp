<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Management System for College Fest</title>
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css"
    />
</head>
<body>


<div id="wrapper">
    <div id="header">
        <h2>Student Management System for College Fest</h2>
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
    <div id="content">
        <security:authorize access="hasRole('ADMIN')">
            <button type="button" value="Add Student" onclick="window.location.href = 'addStudent';
                    return false;" class="add-button" style="float: left">Add Student
            </button>
            <br/><br/>
        </security:authorize>
        <div>
            <p style="color: blue">
                <c:choose>
                    <c:when test="${not empty param.isSuccess}">
                        Student Added/Updated Successfully
                    </c:when>
                    <c:when test="${not empty param.isDeleteSuccess}">
                        Student Deleted Successfully
                    </c:when>
                </c:choose></p></div>
        <table>
            <tr>
                <th>Student Id</th>
                <th>Name</th>
                <th>Department</th>
                <th>Country</th>
                <th>Action</th>
            </tr>

            <c:forEach var="student" items="${students}">

                <c:url var="updateLink" value="/student/updateForm">
                    <c:param name="studentId" value="${student.id}"></c:param>
                </c:url>


                <c:url var="deleteLink" value="/student/deleteStudent">
                    <c:param name="studentId" value="${student.id}"></c:param>
                </c:url>


                <tr>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.department}</td>
                    <td>${student.country}</td>
                    <td><a href="${updateLink}">Update</a>
                        <security:authorize access="hasRole('ADMIN')">
                            |
                            <a href="${deleteLink}"
                               onclick="if(!(confirm('Are you sure to delete entry of ${student.name}'))) return false">Delete</a>
                        </security:authorize>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>
</div>
</body>
</html>