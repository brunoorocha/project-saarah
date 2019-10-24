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
                return "Sucesso"
            case .successResponseMessage:
                return "Seu novo produto foi salvo na nuvem!"
            case .alertAction:
                return "Ok"
            }
        case .productItemScene(let options):
            switch options {
            case .title:
                return "Itens do produto"
            case .notInformed:
                return "Não informado"
            }
        case .underConstruction(let options):
            switch options {
            case .title:
                return "Sentimos muito"
            case .paragraph:
                return "mas nós ainda estamos em \nconstrução"
            }
        }
    }
}
