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
            case .cancelBarButton:
                return "Cancelar"
            case .saveBarButton:
                return "Salvar"
            case .basicInformation:
                return "INFORMAÇÕES BÁSICAS"
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
            case .successResponseTitle:
                return "Produto criado com sucesso"
            case .successResponseMessage:
                return "Você deseja adiciona um produto agora?"
            case .alertOkAction:
                return "Ok"
			case .alertCancelAction:
				return "Mais tarde"
			case .alertAddProductItemAction:
				return "Sim"
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
            case .cancelBarButton:
                return "Cancelar"
            case .saveBarButton:
                return "Salvar"
            case .alertActionTitle:
                return "Ok"
            case .basicInformation:
                return "INFORMAÇÕES BÁSICAS"
            case .quantity:
                return "Quantidade"
            case .quantityPlaceholder:
                return "0 "
            case .price:
                return "Preço"
            case .pricePlaceholder:
                return "R$ 0,00"
            case .complementaryInformation:
                return "INFORMAÇÕES COMPLEMENTARES (OPCIONAL)"
            case .expirationDate:
                return "Validade"
            case .expirationDatePlaceholder:
                return "Toque para inserir a validade"
            case .errorFormAlertTitle:
                return "Erro"
            case .errorFormActionAlertTitle:
                return "Ok"
            case .errorFormQuantityAlertMessage:
                return "O campo quantidade só aceita números."
            case .errorFormPriceAlertMessage:
                return "O campo preço só aceita números."
            case .errorFormExpirationAlertMessage:
                return "O campo data de validade deve ser preenchido com dia/mês/ano."
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
        case .createAccountScene(let options):
            switch options {
            case .headerTitle:
                return "Não possui uma conta?"
            case .headerSubtitle:
                return "Sem problemas. Você pode criar uma rapidinho."
            case .nameCellTitle:
                return "Nome"
            case .nameCellPlaceholder:
                return "Toque para digitar seu nome"
            case .emailCellTitle:
                return "Email"
            case .emailCellPlaceholder:
                return "Toque para digitar seu email"
            case .passwordCellTitle:
                return "Senha"
            case .passwordCellPlaceholder:
                return "Toque para digitar sua senha"
            case .confirmPasswordCellTitle:
                return "Confirme a senha"
            case .confirmPasswordCellPlaceholder:
                return "Toque para digitar sua senha novamente"
            case .createAccountButtonTitlle:
                return "Criar conta"
            case .errorFormAlertTitle:
                return "Erro"
            case .errorFormActionTitle:
                return "Ok"
            case .errorFormNameMessage:
                return "O campo nome é obrigatório!"
            case .errorFormEmailMessage:
                return "O campo Email é obrigatório!"
            case .errorFormInvalidEmail:
                return "Insera um Email válido!"
            case .errorFormPasswordMessage:
                return "O campo senha é obrigatório!"
            case .errorFormConfirmPasswordMessage:
                return "O campo confirmar senha é obrigatório"
            case .errorFormPasswordsDontMatchMessage:
                return "As senhas devem ser iguais!"
            case .errorFormPasswordSize:
                return "A senha deve conter pelo menos 6 caracteres!"
            case .errorSignUpTitle:
                return "Falha ao cadastrar"
            case .errorSignUpMessage:
                return "Ocorreu algum erro durante o seu cadastro, tente novamente!"
            }
        }
    }
}
