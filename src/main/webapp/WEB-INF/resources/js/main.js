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
