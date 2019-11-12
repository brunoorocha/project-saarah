//
//  AppStrings+pt_BR.swift
//  project-saarah
//
//  Created by Thiago Valente on 14/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

extension AppStrings {
    var pt_BR: String {
        switch self {
        case .seeAll:
            return "Ver todos"
        case .buttonTableViewCell(let options):
            switch options {
            case .title:
                return "Adicionar mais itens nesse produto"
            }
        case .labeledTableViewCell(let options):
            switch options {
            case .productLabel:
                return "Produto"
            }
        case .productItemTableViewCell(let options):
            switch options {
            case .amountLabel:
                return "Quantidade"
            case .validityLabel:
                return "Validade"
            case .priceLabel:
                return "Valor"
            case .addedOnDayLabel:
                return "Adicionado no dia"
            }
        case .homeMenuOptionTitle(let options):
            switch options {
            case .inventory:
                return "Estoque"
            case .menu:
                return "Cardápio"
            case .measurers:
                return "Medidores"
            case .settings:
                return "Configurações"
            }
        case .listInventoryScene(let options):
            switch options {
            case .title:
                return "Estoque"
            case .productInStock:
                return "Produtos no estoque"
            case .addAlertController(let alertOptions):
                switch alertOptions {
                case .title:
                    return "Adicionar novo produto"
                case .addWithBarCode:
                    return "Ler código de barras"
                case .addWithoutBarCode:
                    return "Adicionar sem código de barras"
                case .cancel:
                    return "Cancelar"
                }
            }
        case .homeScene(let options):
            switch options {
            case .notification:
                return "Notificações"
            case .title:
                return "eStorage"
            }
        case .productDetailScene(let options):
            switch options {
            case .title:
                return "Detalhes do produto"
            case .basicInformation:
                return "Informações básicas"
            case .activity:
                return "Atividade"
            case .productName:
                return "Nome do produto"
            case .quantityInStock:
                return "Quantidade em estoque"
            case .seeAllFromThisProduct:
                return "Ver todos os itens desse produto"
            }
        case .selectProductMeasurement(let options):
            switch options {
            case .title:
                return "Escolher unidade de medida"
            }
        case .addNewProductScene(let options):
            switch (options) {
            case .title:
                return "Criar novo produto"
            case .basicInformation:
                return "Informações Básicas"
            case .barButton(let buttons):
                switch buttons {
                case .save:
                    return "Salvar"
                case .cancel:
                    return "Cancelar"
                }
            case .alert(let alerts):
                switch alerts {
                case .okAction:
                    return "Ok"
                case .cancelAction:
                    return "Mais tarde"
                case .addProductItemAction:
                    return "Agora"
                case .form(let form):
                    switch form {
                    case .title:
                        return "Erro"
                    case .name:
                        return "Insira o nome do produto."
                    case .barCode:
                        return "O código de barra deve conter apenas números."
                    case .meausre:
                        return "Selecione uma unidade de medida."
                    }
                }
            case .response(let responses):
                switch responses {
                case .success(let successes):
                    switch successes {
                    case .title:
                        return "Produto criado com sucesso"
                    case .message:
                        return "Você deseja adiciona um item do produto agora?"
                    }
                }
            case .field(let fields):
                switch fields {
                case .productName:
                    return "Nome do produto"
                case .productNamePlaceholder:
                    return "Toque para digitar o nome do produto"
                case .barCode:
                    return "Código de barras (opcional)"
                case .barCodePlacehoder:
                    return "Toque para inserir o código de barras"
                case .measure:
                    return "Unidade de medida"
                case .measurePlaceholder:
                    return "Quilos, gramas, litros"
                }
            }
        case .productItemScene(let options):
            switch options {
            case .title:
                return "Itens do produto"
            case .notInformed:
                return "Não informado"
            }
        case .addProductItemScene(let options):
            switch options {
            case .title:
                return "Adicionar item do produto"
            case .alertActionTitle:
                return "Ok"
            case .basicInformation:
                return "INFORMAÇÕES BÁSICAS"
            case .complementaryInformation:
                return "INFORMAÇÕES COMPLEMENTARES (OPCIONAL)"
            case .barButton(let button):
                switch button {
                case .save:
                    return "Salvar"
                case .cancel:
                    return "Cancelar"
                }
            case .field(let fields):
                switch fields {
                case .quantity:
                    return "Quantidade"
                case .quantityPlaceholder:
                    return "0 "
                case .price:
                    return "Preço"
                case .pricePlaceholder:
                    return "R$ 0,00"
                case .expirationDate:
                    return "Validade"
                case .expirationDatePlaceholder:
                    return "Toque para inserir a validade"
                }
            case .errorForm(let errors):
                switch errors {
                case .alertTitle:
                    return "Erro"
                case .action:
                    return "Ok"
                case .quantityAlertMessage:
                    return "O campo quantidade só aceita números."
                case .priceAlertMessage:
                    return "O campo preço só aceita números."
                case .expirationAlertMessage:
                    return "O campo data de validade deve ser preenchido com dia/mês/ano."
                }
            case .response(let options):
                switch (options) {
                case .successTitle:
                    return "Sucesso"
                case .suceessMessage:
                    return "Item foi salvo com sucesso."
                case .inputErrorTitle:
                    return "Erro ao preencher campos"
                case .expirationDateMessage:
                    return "A data de validade não foi preenchida corretamente."
                }
            }
        case .registerSectionFooterView(let options):
            switch options {
            case .title:
                return "Ainda não possui uma conta?"
            case .registerButton:
                return "Registre-se aqui."
            }
        case .underConstruction(let options):
            switch options {
            case .title:
                return "Sentimos muito"
            case .paragraph:
                return "mas nós ainda estamos em \nconstrução"
            }
        case .settingsScene(let options):
            switch options {
            case .logoutText:
                return "Sair"
            case .myAccountText:
                return "Minha conta"
            case .logoutConfirmation(let options):
                switch options {
                case .logout:
                    return "Sair"
                case .cancel:
                    return "Cancelar"
                case .title:
                    return "Confirmação"
                case .message:
                    return "Você deseja realmente sair da aplicação?"
                }
            }
        case .loginScene(let options):
            switch options {
            case .title:
                return "Entrar"
            case .field(let fields):
                switch fields {
                case .mail:
                    return "Email"
                case .mailPlaceholder:
                    return "Toque para digitar seu email"
                case .password:
                    return "Senha"
                case .passwordPlaceholder:
                    return "Toque para digitar sua senha"
                }
            case .greeting(let greetings):
                switch greetings {
                case .title:
                    return "Olá de novo!"
                case .description:
                    return "Entre na sua conta para poder continuar."
                }
            case .errorFormValidation(let error):
                switch error {
                case .alertTitle:
                    return "Ocorreu um erro ao tentar realizar o login"
                case .action:
                    return "Fechar"
                case .email:
                    return "Preencha o seu campo de email"
                case .password:
                    return "Preencha o seu campo de senha"
                case .undefined:
                    return ""
                }
            }
        case .createAccountScene(let options):
            switch options {
            case .createAccountButtonTitle:
                return "Criar conta"
            case .header(let header):
                switch header {
                case .title:
                    return "Não possui uma conta?"
                case .subtitle:
                    return "Sem problemas. Você pode criar uma rapidinho."
                }
            case .field(let fields):
                switch fields {
                case .name:
                    return "Nome"
                case .namePlaceholder:
                    return "Toque para digitar seu nome"
                case .email:
                    return "Email"
                case .emailPlaceholder:
                    return "Toque para digitar seu email"
                case .password:
                    return "Senha"
                case .passwordPlaceholder:
                    return "Toque para digitar sua senha"
                case .confirmPassword:
                    return "Confirme a senha"
                case .confirmPasswordPlaceholder:
                    return "Toque para digitar sua senha novamente"
                }
            case .errorForm(let errors):
                switch errors {
                case .alertTitle:
                    return "Erro"
                case .action:
                    return "Ok"
                case .nameMessage:
                    return "O campo nome é obrigatório!"
                case .emailMessage:
                    return "O campo Email é obrigatório!"
                case .invalidEmail:
                    return "Insera um Email válido!"
                case .passwordMessage:
                    return "O campo senha é obrigatório!"
                case .confirmPasswordMessage:
                    return "O campo confirmar senha é obrigatório"
                case .passwordsDontMatchMessage:
                    return "As senhas devem ser iguais!"
                case .passwordSize:
                    return "A senha deve conter pelo menos 6 caracteres!"
                case .signUpTitle:
                    return "Falha ao cadastrar"
                case .signUpMessage:
                    return "Ocorreu algum erro durante o seu cadastro, tente novamente!"
                }
            }
        case .onboarding(let options):
            switch options {
            case .previous:
                return "Anterior"
            case .next:
                return "Próximo"
            case .close:
                return "Fechar"
            case .description(let descriptions):
                switch descriptions {
                case .first:
                    return "Mantenha o controle sobre os produtos do seu Restaurante ou Lanchonete."
                case .second:
                    return "Monte o seu cardápio baseado nos produtos do estoque."
                case .third:
                    return "Acompanhe as entradas e saídas de produtos e pratos do seu negócio."
                }
            }
        }
    }
}
