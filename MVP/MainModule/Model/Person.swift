//
//  Person.swift
//  MVP
//
//  Created by Dmitriy Eni on 23.09.2022.
//

import Foundation

struct Person: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
//    let gender: String
//    let origin:String
//    let location: String
    let image: String?
//    let episode: Array<String>
//    let url: String
//    let created: String
}

// (1) Определили объект Photo только с необходимыми к извлечению свойствами.
//struct Photo: Decodable {
//    let id: String
//    let secret: String
//    let owner: String
//}

// (2) Определяем JSONContainer, то есть описываем куда нужно идти парсеру и что забирать.
struct JSONContainer: Decodable {
    // (3) photos совпадает c именем ключа "photos" в JSON, но теперь мы написали, что хранить этот ключ будет не весь контейнер, а только его часть - массив, который является значением ключа photo!
    let photos: [Person]
}

extension JSONContainer {
    // (4) Описываем CodingKeys для парсера.
    enum CodingKeys: String, CodingKey {
        case photos
        // (5) Здесь определяем только те имена ключей, которые будут нужны нам внутри контейнера photos.
        // (6) Здесь необязательно соблюдать какие-то правила именования, но название PhotosKeys - дает представление о том, что мы рассматриваем ключи внутри значения ключа photos
        enum PhotosKeys: String, CodingKey {
            // (7) Описываем конкретно интересующий нас ключ "photo"
            case photoKey = "results"
        }
    }
    // (8) Дальше переопределяем инициализатор
    init(from decoder: Decoder) throws {
        // (9) Заходим внутрь JSON, который определяется контейнером из двух ключей, но нам из них нужно только одно - photos
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // (10) Заходим в контейнер (nested - вложенный) ключа photos и говорим какие именно ключи смы будем там рассматривать
        let photosContainer = try container.nestedContainer(keyedBy: CodingKeys.PhotosKeys.self, forKey: .photos)
        // (11) Декодируем уже стандартным методом
        // (12) Дословно здесь написано следующее положи в свойство photos объект-массив, который определен своим типом и лежит .photoKey (.photoKey.rawValue == "photo")
        photos = try photosContainer.decode([Person].self, forKey: .photoKey)
    }
}
