package com.edu.expedicao.domain.revenda;

import org.hibernate.validator.constraints.Length;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity
public class Endereco {

    @Id
    @GeneratedValue
    private Long id;

    @NotNull(message = "É necessário informar o logradouro")
    @NotEmpty(message = "É necessário informar o logradouro")
    @Length(max = 60, message = "O logradouro não pode ultrapassar 60 caracteres")
    private String logradouro;

    @NotNull(message = "É necessário informar o bairro")
    @NotEmpty(message = "É necessário informar o bairro")
    @Length(max = 60, message = "O bairro não pode ultrapassar 60 caracteres")
    private String bairro;

    @NotNull(message = "É necessário informar a cidade")
    @NotEmpty(message = "É necessário informar a cidade")
    @Length(max = 60, message = "A cidade não pode ultrapassar 60 caracteres")
    private String cidade;

    @NotNull(message = "É necessário informar o estado")
    @NotEmpty(message = "É necessário informar o estado")
    @Length(max = 60, message = "O estado não pode ultrapassar 60 caracteres")
    private String estado;

    @NotNull(message = "É necessário informar o CEP")
    @NotEmpty(message = "É necessário informar o CEP")
    @Length(max = 8, message = "O CEP não pode ultrapassar 8 caracteres")
    private String cep;

    @Length(max = 60, message = "O complemento não pode ultrapassar 60 caracteres")
    private String complemento;

    public Endereco() {
    }

    public Endereco(String logradouro, final String bairro,
                    final String cidade,
                    final String estado,
                    final String cep,
                    final String complemento) {
        this.logradouro = logradouro;
        this.bairro = bairro;
        this.cidade = cidade;
        this.estado = estado;
        this.cep = cep;
        this.complemento = complemento;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String formatar() {
        return getLogradouro() + ", " +
                getBairro() + ", " +
                getCidade() + " - " +
                getEstado() + ", " +
                getCep();
    }
}
