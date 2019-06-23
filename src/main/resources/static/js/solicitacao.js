function deletarSolicitacao(id) {
    $.ajax({
        url: "/solicitacoes/" + id,
        method: "DELETE"
    }).done(() => {
        sendTo("/solicitacoes");
    });
}

function alterarStatus() {
    console.log("Tsete")
}

function onChangeProduto(valor) {
    $("#input-produto-pedido-valor").val(valor);
}