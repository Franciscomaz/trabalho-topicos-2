<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<div id="produto-detail-modal" class="modal">
    <div class="modal-background"></div>
    <div class="modal-card">
        <header class="modal-card-head">
            <p class="modal-card-title">Cadastrando produto</p>
            <button class="delete" aria-label="close"></button>
        </header>
        <div class="modal-card-body">

            <div class="field">
                <label class="label">Descrição</label>
                <div class="control">
                    <input class="input" type="text" placeholder="Descrição" value="descricao">
                </div>
            </div>

            <div class="field">
                <label class="label">Valor</label>
                <div class="control has-icons-left">
                    <input class="input" type="number" placeholder="Valor" value="valor">

                    <span class="icon is-small is-left">
                        <i class="fa fa-money"></i>
                    </span>
                </div>
            </div>

            <div class="field">
                <label class="label">Dimensões</label>
                <div class="control">
                    <input class="input" type="text" placeholder="Dimensões" value="dimensoes">
                </div>
            </div>

            <div class="field">
                <label class="label">Referência</label>
                <div class="control">
                    <textarea class="textarea" placeholder="Referência" value="referencia"></textarea>
                </div>
            </div>
        </div>

        <footer class="modal-card-foot">
            <button class="button is-success" type="submit">Salvar</button>
            <button class="button">Cancelar</button>
        </footer>
    </div>
</div>