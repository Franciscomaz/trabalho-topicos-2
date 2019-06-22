<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">

        <%--@elvariable id="solicitacao" type="com.edu.expedicao.domain.solicitacao.Solicitacao"--%>
        <div class="container">
            <div class="columns is-multiline">
                <div class="column is-4">
                    <div class="box">
                        <div class="heading">Valor total</div>
                        <div class="title">${solicitacao.valorTotal}</div>
                    </div>
                </div>
            </div>
        </div>

    </layout:put>
</layout:extends>