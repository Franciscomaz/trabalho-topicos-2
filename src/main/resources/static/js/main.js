function sendTo(href) {
    location.href = href
}

function deletarProduto(id) {
    $.ajax({
        url: "/produtos/" + id,
        method: "DELETE"
    }).done(() => {
        sendTo("/produtos");
    });
}

function deletarRevenda(id) {
    $.ajax({
        url: "/revendas/" + id,
        method: "DELETE"
    }).done(() => {
        sendTo("/revendas");
    });
}