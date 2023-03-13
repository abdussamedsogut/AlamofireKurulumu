//
//  ViewController.swift
//  AlamofireKurulumu
//
//  Created by Abdüssamed Söğüt on 13.03.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // kisiEkle()
       // kisiSil()
       // kisiGuncelle()
       // tumKisiler()
        aramaYap()
    }
    
    
    func kisiEkle()  {
        let params:Parameters = ["kisi_ad":"TESTALAMOFIRE","kisi_tel":"999999"]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php", method: .post, parameters: params).response { response in
            
            if let data = response.data {
                
                do {
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    
    func kisiSil()  {
        let params:Parameters = ["kisi_id":14563]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php", method: .post, parameters: params).response { response in
            
            if let data = response.data {
                
                do {
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    func kisiGuncelle()  {
        let params:Parameters = ["kisi_id":14562 ,"kisi_ad":"XXXXXX","kisi_tel":"X8X8X8X8"]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php", method: .post, parameters: params).response { response in
            
            if let data = response.data {
                
                do {
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    func tumKisiler()  {

        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php", method: .get).response { response in
            
            if let data = response.data {
                
                do {
                    
                    let cevap = try JSONDecoder().decode(KisiResponse.self, from: data)
                    
                    if let kisiListesi = cevap.kisiler {
                        
                        for kisi in kisiListesi {
                            print("kisi id : \(kisi.kisi_id!)")
                            print("kisi ad : \(kisi.kisi_ad!)")
                            print("kisi tel : \(kisi.kisi_tel!)")
                            
                        }
                    }
                    
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
        
    }

    
    func aramaYap()  {

        let params:Parameters = ["kisi_ad":"X"]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php", method: .post, parameters: params).response { response in
            
            if let data = response.data {
                
                do {
                    let cevap = try JSONDecoder().decode(KisiResponse.self, from: data)
                    
                    if let kisiListesi = cevap.kisiler {
                        
                        for kisi in kisiListesi {
                            print("kisi id : \(kisi.kisi_id!)")
                            print("kisi ad : \(kisi.kisi_ad!)")
                            print("kisi tel : \(kisi.kisi_tel!)")
                            
                        }
                    }
                    
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
}

