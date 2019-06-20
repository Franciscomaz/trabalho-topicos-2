<%@page  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<!DOCTYPE html>
<html>
<%@ include file="head.jsp" %>
<body>

<div id="app">
    <%@ include file="navbar.jsp" %>

    <div class="columns is-centered">
        <aside class="column is-2 is-narrow-mobile is-fullheight section is-hidden-mobile">
            <%@ include file="menu.jsp" %>
        </aside>

        <div class="column is-10">
            <div class="container">
                <div class="section">
                    <layout:block name="body">
                    </layout:block>
                </div>
            </div>
        </div>

    </div>

    <%@ include file="footer.jsp" %>
</div>

</body>
</html>