<%@page  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">
        <div class="hero-body is-content-centered">
            <div class="panel has-round-corners has-background-white-bis">
                <p class="panel-heading">
                    Pedidos
                </p>
                <div class="panel-block">
                    <table class="table is-bordered pricing__table">
                        <thead>
                        <tr>
                            <th>Travellers</th>
                            <th>Standard</th>
                            <th>Delux</th>
                            <th>Premium</th>
                            <th>Luxury</th>
                        </tr>
                        </thead>

                        <tbody>
                        <tr>
                            <td>Per Person Cost</td>
                            <td>? 70,523.90</td>
                            <td>? 70,523.90</td>
                            <td>? 70,523.90</td>
                            <td>? 70,523.90</td>
                        </tr>
                        <tr>
                            <td>
                                Extra Person <br>
                                (> 12 yrs)
                            </td>
                            <td>? 70,523.90</td>
                            <td>? 70,523.90</td>
                            <td>? 70,523.90</td>
                            <td>? 70,523.90</td>
                        </tr>
                        <tr>
                            <td>
                                Extra Child <br>
                                (> 12 yrs)
                            </td>
                            <td>? 70,523.90</td>
                            <td>? 70,523.90</td>
                            <td>? 70,523.90</td>
                            <td>? 70,523.90</td>
                        </tr>
                        <tr>
                            <td>Total Cost</td>
                            <td>? 70,523.90</td>
                            <td>? 70,523.90</td>
                            <td>? 70,523.90</td>
                            <td>? 70,523.90</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="panel-block">
                    <button class="button is-link" data-target="pedidoDetailModal">
                        Novo
                    </button>
                </div>
            </div>
        </div>
    </layout:put>
</layout:extends>
