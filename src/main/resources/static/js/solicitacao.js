function deletarSolicitacao(id) {
    $.ajax({
        url: "/solicitacoes/" + id,
        method: "DELETE"
    }).done(() => {
        sendTo("/solicitacoes");
    });
}

function addTableRow() {
    let row = $('tbody>tr:last').clone();
    let rowCount = $('#table-pedidos-produtos tbody').find('tr').length;

    let cellId = 'cell-produto-solicitacao-';

    console.log(cellId + (rowCount - 1));
    console.log(cellId + rowCount);

    let replacedHtml = row.html().replace(/\[(\d*)]/g, '[' + rowCount + ']');
    replacedHtml = replacedHtml.replace(cellId + (rowCount - 1), cellId + rowCount);
    replacedHtml = replacedHtml.replace('removeTableRow(' + (rowCount - 1) + ')', 'removeTableRow(' + rowCount + ')');

    row.html(replacedHtml).insertAfter('tbody>tr:last');
}

function removeTableRow(id) {
    $('#cell-produto-solicitacao-' + id).remove()
}

function updateRows() {

}