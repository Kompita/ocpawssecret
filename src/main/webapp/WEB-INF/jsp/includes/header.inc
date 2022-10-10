<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OCP - AWS Secrets Manager with CSI Driver</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/includes/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/includes/css/bootstrap-icons.css" />
        <script src="${pageContext.request.contextPath}/includes/js/bootstrap.bundle.min.js" ></script>
    </head>
    <body>


        <div class="container">
            <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                    <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
                    <span class="fs-4">OCP AWS Secrets</span>
                </a>

                <ul class="nav nav-pills justify-content-end">
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/index.action" class="nav-link ${fn:contains(pageContext.request.servletPath, 'index') ? 'active' : ''}" aria-current="page">Home</a></li>
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/entorno.action" class="nav-link ${fn:contains(pageContext.request.servletPath, 'entorno') ? 'active' : ''}">Environment Variables</a></li>
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/db.action" class="nav-link ${fn:contains(pageContext.request.servletPath, 'db') ? 'active' : ''}">DB access</a></li>
                </ul>
            </header>
        </div>