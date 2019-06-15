<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
    <title>Home Page</title>
    <%@ include file="../../common/header.jsp" %>
</head>
<body>
<section class="hero has-background-white-ter is-fullheight">
    <%@ include file="../../common/head.jsp" %>

    <div class="hero-body is-content-centered">
        <nav class="panel has-round-corners has-background-white-bis">
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
            </nav>
    </div>

    <%@ include file="../../common/footer.jsp" %>
</section>
</body>
</html>