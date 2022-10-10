<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./includes/header.inc" %>        

<div class="container">
     
    <h2>ENVIRONMENT VARIABLES</h2>
    <ul>
        <c:forEach items="${env}" var="item1">
        <li>${item1.key}: ${item1.value}</li>
        </c:forEach>
    </ul>
            
</div>

<%@include file="./includes/footer.inc" %>      

