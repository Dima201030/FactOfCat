//
//  APIFactOfCat.swift
//  FactOfCat
//
//  Created by Дима Кожемякин on 16.02.2024.
//

import Foundation

class FactOfCat: ObservableObject {
    @Published var fact = ""
    @Published var urlImage = ""
    private var middleCountFact = 0
    private var a = 0
    private var middleCountFactList: [Int] = []
    @Published var sum = 0
    var countList: Int {
        self.middleCountFactList.count
    }
    init() {
        loadFact()
        
    }
    func loadFact(){
        let request = URLRequest(url: URL(string: "https://catfact.ninja/fact")!)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let factDataModel = try? JSONDecoder().decode(FactDataModel.self, from: data) {
                print(factDataModel.fact)
                self.fact = factDataModel.fact
                self.logicImage(fact: self.fact)
            }
        }
        task.resume()
    }
    func logicImage(fact: String) {
        print(fact.count)
        switch fact.count {
        case 0...10:
            urlImage = "https://catherineasquithgallery.com/uploads/posts/2021-02/1613069622_93-p-fon-rizhii-kot-143.jpg"
        case 10...19:
            urlImage = "https://proprikol.ru/wp-content/uploads/2020/08/krasivye-kartinki-kotikov-47.jpg"
        case 20...29:
            urlImage = "https://mykaleidoscope.ru/x/uploads/posts/2022-10/1666151651_42-mykaleidoscope-ru-p-ispugannii-kot-vkontakte-47.jpg"
        case 30...39:
            urlImage = "https://i.sunhome.ru/magic/118/narodnie-poverya-o-kotah.orig.jpg"
        case 40...49:
            urlImage = "https://proprikol.ru/wp-content/uploads/2020/08/krasivye-kartinki-kotov-57.jpg"
        case 50...54:
            urlImage = "https://cdn.akamai.steamstatic.com/steamcommunity/public/images/clans/30297037/46db5ab0b1643199f65eef34933fba16c022b0d5.jpg"
        case 55...59:
            urlImage = "https://gas-kvas.com/grafic/uploads/posts/2023-09/1695931388_gas-kvas-com-p-kartinki-s-kotami-23.jpg"
        case 60...64:
            urlImage = "http://tapeciarnia.pl/tapety/normalne/245584_kot_spojrzenie_poduszka.jpg"
        case 65...69:
            urlImage = "https://vplate.ru/images/article/orig/2019/04/interesnye-fakty-o-koshkah-i-kotah-40.jpg"
        case 70...74:
            urlImage = "https://i.artfile.ru/2560x1707_1271176_[www.ArtFile.ru].jpg"
        case 75...79:
            urlImage = "https://w.forfun.com/fetch/98/98a9415b30f3f7cf83f6b2ce6b8e8638.jpeg"
        default:
            urlImage = "https://i.ytimg.com/vi/3vJnIdNs_lM/maxresdefault.jpg"
            self.fact = "IDK"
        }
        middleCountFactList.append(fact.count)
        middleNumer()
    }
    func middleNumer() {
        self.sum = middleCountFactList.reduce(0) { result, number in
            (result + number)
        }
        print("sum: \(sum)")
        sum = sum / countList
        print("middleCountFactList: \(middleCountFactList)")
        print("middleNumberis: ", sum)
        print("countList is \(countList)")
    }
}

struct FactDataModel: Codable {
    let fact: String
    let length: Int
}
