//
//  GifModel.swift
//  GifForYou
//
//  Created by Macbook Air 13 on 05.02.2021.
//

import Foundation

class GifModel {
    
    struct DataArray: Codable {
        var data : [DataModel]
    }
 
    struct DataModel: Codable {
        var title: String?
        var images: ImageModel
        
    }
    
    struct ImageModel: Codable {
        var original: OriginImage?
        var original_still: StillModel?
    }
    struct StillModel: Codable {
        var url : String?
    }
    
    struct OriginImage: Codable {
        var url: String?
        
    }
    
    var resultRequest: GifModel.DataArray?
    let urlString = "https://api.giphy.com/v1/gifs/trending?api_key=dc6zaTOxFJmzC"
    
    func getData(completed: @escaping ()-> ()){
        guard let url = URL(string: urlString) else {
           print("ERROR: URL is not correct")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print("Error: \(error.localizedDescription)")
            }
            do {
                let returned = try JSONDecoder().decode(DataArray.self, from: data!)
                
                self.resultRequest = returned
                print(returned)
            } catch {
                print("JSON ERROR \(error)")
            }
            completed()
        }
        task.resume()
    }
    
}
