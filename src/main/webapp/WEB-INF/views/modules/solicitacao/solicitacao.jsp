<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">
        <div class="hero-body is-content-centered">
            <div class="container has-text-centered">
                <p class="title">
                    Title
                </p>
                <p class="subtitle">
                    Subtitle
                </p>
            </div>
        </div>
    </layout:put>
</layout:extends>