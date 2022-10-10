<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="./includes/header.inc" %>        

<div class="container">
     
    <h2>Choose an option:</h2>
    <ul>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/index.action">Home</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/entorno.action">Environment Variables</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/db.action">DB access</a></li>
    </ul>
            
</div>

<%@include file="./includes/footer.inc" %>      

