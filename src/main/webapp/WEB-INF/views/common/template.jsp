<%@page contentType="text/html; charset=ISO-8859-1" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<!DOCTYPE html>
<html>
<%@ include file="head.jsp" %>
<body>

<section class="hero has-background-white-ter is-fullheight">
    <%@ include file="navbar.jsp" %>

    <div class="hero-body">
        <layout:block name="body">
        </layout:block>
    </div>

    <%@ include file="footer.jsp" %>
</section>

</body>
</html>