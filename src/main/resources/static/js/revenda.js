function deletarRevenda(id) {
    $.ajax({
        url: "/revendas/" + id,
        method: "DELETE"
    }).done(() => {
        sendTo("/revendas");
    });
}