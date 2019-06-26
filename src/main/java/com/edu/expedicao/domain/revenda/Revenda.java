package com.edu.expedicao.domain.revenda;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.swing.text.MaskFormatter;
import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.text.ParseException;

@Entity
public class Revenda {

    @Id
    @GeneratedValue
    private Long id;

    @NotNull(message = "É necessário informar o CNPJ")
    @NotEmpty(message = "É necessário informar o CNPJ")
    @Length(min = 14, max = 14, message = "É necessário informar um CNPJ válido")
    private String cnpj;

    @NotNull(message = "É necessário informar o nome")
    @NotEmpty(message = "É necessário informar o nome")
    @Length(message = "Não é permitido revendas com nome maior que 60 caracteres")
    private String nome;

    @Valid
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "endereco_id")
    @NotNull(message = "É necessário informar o endereço")
    private Endereco endereco;

    public Revenda() {
    }

    public Revenda(Long id, String cnpj, String nome, Endereco endereco) {
        this.id = id;
        this.cnpj = cnpj;
        this.nome = nome;
        this.endereco = endereco;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public String getCnpjFormatado() {
        try {
            final MaskFormatter mask = new MaskFormatter("###.###.###/####-##");

            mask.setValueContainsLiteralCharacters(false);

            return mask.valueToString(getCnpj());
        } catch (ParseException ex) {
            return getCnpj();
        }
    }
}
