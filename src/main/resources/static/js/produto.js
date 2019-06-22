function deletarProduto(id) {
    $.ajax({
        url: "/produtos/" + id,
        method: "DELETE"
    }).done(() => {
        sendTo("/produtos");
    });
}