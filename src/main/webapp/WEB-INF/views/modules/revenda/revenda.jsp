<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">
        <div class="is-flex is-content-centered">
            <div class="card">

                <div class="card-header">
                    <p class="card-header-title">Revendas</p>

                    <div class="card-header-icon">
                        <form class="control has-icons-left">
                            <input id="input-search-revenda"
                                   class="input is-small"
                                   name="filter"
                                   type="text"
                                   placeholder="search">

                            <span class="icon is-small is-left">
                                <i class="fas fa-search" aria-hidden="true"></i>
                            </span>
                        </form>
                    </div>

                    <div class="card-header-icon">
                        <button class="button is-text" onclick="sendTo('revendas/details')">
                            <span class="icon has-text-link">
                              <i class="fas fa-plus"></i>
                            </span>
                        </button>
                    </div>
                </div>

                <div class="card-content">
                    <c:set var="revendas" value="${revendas}" scope="request"/>
                    <jsp:include page="revenda-table.jsp"/>
                </div>
            </div>
        </div>
    </layout:put>
</layout:extends>