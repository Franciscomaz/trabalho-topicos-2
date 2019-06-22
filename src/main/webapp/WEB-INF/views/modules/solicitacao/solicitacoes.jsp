<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%--@elvariable id="solicitacoes" type="java.util.List<com.edu.expedicao.domain.solicitacao.Solicitacao>"--%>
<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">
        <div class="is-flex is-content-centered">
            <div class="card">

                <div class="card-header">
                    <div class="card-header-title">Solicitações</div>

                    <div class="card-header-icon">
                        <form class="control has-icons-left">
                            <input id="input-search-solicitacao"
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
                        <button class="button is-text" onclick="sendTo('solicitacoes/details')">
                            <span class="icon has-text-link">
                              <i class="fas fa-plus"></i>
                            </span>
                        </button>
                    </div>
                </div>

                <div class="card-content">
                    <c:set var="solicitacoes" value="${solicitacoes}"/>
                    <jsp:include page="solicitacao-table.jsp"/>
                </div>
            </div>
        </div>
    </layout:put>
</layout:extends>