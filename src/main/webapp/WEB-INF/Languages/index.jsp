<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title Here</title>
  <!-- Bootstrap -->
  <link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>
<body>
  <div id="container">
    <table class="table table-striped table-hover table-bordered tblbrd">
        <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Creator</th>
                <th scope="col">Version</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${languages}" var="lang">
            <tr>
                <td><a href="languages/<c:out value="${lang.id}"/>"><c:out value="${lang.name}"/></a></td>
                <td><c:out value="${lang.creator}"/></td>
                <td><c:out value="${lang.currentVersion}"/></td>
                <td><a href="/languages/delete/<c:out value="${lang.id}"/>">Delete</a> <a href="languages/edit/<c:out value="${lang.id}"/>">Edit</a></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    <div id="form">
      <form:form action="/languages" method="post" modelAttribute="addNew">     
          <p>
              <form:label cssClass="label" path="name">Name</form:label>
              <form:input cssClass="box" path="name"/>
              <form:errors cssClass="red" path="name"/>

          </p>
          <p>
              <form:label cssClass="label" path="creator">Creator</form:label>
              <form:input cssClass="box" path="creator"/>
            <form:errors cssClass="red" path="creator"/>
          </p>
          <p>
              <form:label cssClass="label" path="currentVersion">Version</form:label>
              <form:input cssClass="box" path="currentVersion"/>
            <form:errors cssClass="red" path="currentVersion"/>
          </p>
          <input id="btn" type="submit" value="Submit"/>   
      </form:form>
    </div>
  </div>
</body>
</html>
