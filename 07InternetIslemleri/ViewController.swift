//
//  ViewController.swift
//  07InternetIslemleri
//
//  Created by maytemur on 20.03.2023.
//

//web servisleri işlenmeyecek kaba ca web servisleri 2 ye ayrılıyor xml ve json
//biz burada codable kullanarak json ve nesneyi birbirine dönüştürme işlemini göreceğiz

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var k = Kisi(Ad: "Ad 1", Soyad: "Soyad 1")
        let encoder = JSONEncoder()
        let json = try! encoder.encode(k) //exception fırlatmayacak dedik try-catch yapmadık
        //normalde try-catch yapmak gerekir
        let strJson = String(data: json, encoding: .utf8)
        print(strJson)
        
        //Json'ın nesneye döndürülme işleminede decode işlemi deniyor
        
//        let decoder = JSONDecoder()
//        let d = try! decoder.decode(Kisi.self, from: json)
//
//        print(d.Ad)
    }


}

//struct  Kisi : Codable { //sadece decode veya encode yapmak da isteyebiliriz bu durumda Codable yerine Decodable veya Encodable veya 2 sinide yazabiliriz
struct Kisi : Decodable,Encodable {
    var Ad : String
    var Soyad : String
    
    //bazı durumlarda Json formatı içindeki parametre data değeri ile nesnemizdeki parametre değerleri aynı olmayabilir böyle durumlarda bir Codingkeys enum oluşturabiliriz
    
    enum CodingKeys : String,CodingKey {
    case Ad = "Name"
    case Soyad = "Surname"
    }
}
