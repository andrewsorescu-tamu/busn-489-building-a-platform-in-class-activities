//
//  animal.swift
//  catsAndDogs
//
//  Created by Sorescu, Andrew on 4/8/24.
//

import Foundation

class Animal {
    //url for the image
    var imageUrl: String
    //placeholder for image data
    var imageData: Data?
    
    init() {
        self.imageUrl = ""
        self.imageData = nil
    }
    
    init?(json:[String: Any]) {
        //check for url
        guard let imageUrl = json["url"] as? String
        else {
            return nil
        }
        //set image information
        
        self.imageUrl = imageUrl
        self.imageData = nil
        
        //download the image data
        getImage()
        
    
    }
    
    func getImage() {
        //1. Create the url object
        let url = URL(string: imageUrl)

        //2. Check the url is not nil
        guard url != nil else
        {
            print("Couldn't create the url object")
            return
        }
        
        //3. get a url session
        let session = URLSession.shared

        
        //4. create the data task
        let dataTask = session.dataTask(with: url!)
        {(data, response, error) in
            //check for error
            if error == nil && data != nil {
                self.imageData = data
            }
        }
        
        //5. Start the data task
        dataTask.resume()
    }
    
}
