<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@include file="./includes/header.inc" %>        

<div class="container">
     
    <h2>Database Connection</h2>
    <div class="container">
            <h2>Configuration</span></h2>
            <form action="${pageContext.request.contextPath}/db_consultar.action" method="POST">
                <div class="mb-3">
                    <label for="url" class="form-label">URL</label>
                    <input type="text" class="form-control" id="url" name="url" value="${env['DATASOURCE_URL']}" readonly="">
                    <div id="urlHelp" class="form-text">DATASOURCE_URL</div>
                </div>
                <div class="mb-3">
                    <label for="usuario" class="form-label">Usuario</label>
                    <input type="text" maxlength="300" class="form-control" id="usuario" name="usuario" aria-describedby="usuarioHelp" value="${env['DATASOURCE_USR']}" readonly>
                    <div id="usuarioHelp" class="form-text">DATASOURCE_USR</div>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="${env['DATASOURCE_PWD']!=null?'password':'text'}" maxlength="500" class="form-control" id="password" aria-describedby="passwordHelp" name="password" value="${env['DATASOURCE_PWD']!=null?env['DATASOURCE_PWD']:'no existe'}" readonly>
                    <div id="passwordHelp" class="form-text">DATASOURCE_PWD</div>
                </div>
                <div class="mb-3">
                    <label for="query" class="form-label">Query</label>
                    <input type="text" maxlength="500" class="form-control" id="query" aria-describedby="queryHelp" name="query" required>
                    <div id="queryHelp" class="form-text">
                            <br /> select 1
                            <br /> SELECT boot_val FROM pg_settings WHERE name='listen_addresses'</div>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
                
        <c:if test="${accion=='resultados'}">
            <h3>Result:</h3> ${resultado}
        </c:if>
            
</div>

<%@include file="./includes/footer.inc" %>      

