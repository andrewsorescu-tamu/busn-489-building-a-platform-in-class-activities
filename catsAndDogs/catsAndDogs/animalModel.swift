//
//  animalModel.swift
//  catsAndDogs
//
//  Created by Sorescu, Andrew on 4/8/24.
//

import Foundation
//this file is for requesting data from the network

class AnimalModel: ObservableObject{
    @Published var animal = Animal()
    
    func getAnimal() {
        
        let stringUrl = Bool.random() ?catUrl:dogUrl
        
        ///STEPS
        ///1. Create a url object
        let url = URL(string: stringUrl)
        
        ///2. Check if url is not nil
        guard url != nil else
        {
            print("Couldn't create the url object")
            return
        }
        
        ///3. Get the url session
        let session = URLSession.shared
        
        ///4. Create a data task
        let dataTask = session.dataTask(with: url!)
        {(data, response, error) in
            //cehck for error
            if error == nil && data != nil {
                do {
                    if let json = try
                        JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
                        
                        //if we have got so far, the json has been parsed
                        let item = json.isEmpty ? [:] : json[0]
                        //json[0] gives us the first response
                        
                        if let animal = Animal(json: item) {
                            DispatchQueue.main.async {
                                while animal.imageData == nil {
                                    self.animal = animal
                                }
        
                            }
                        }
                    }//end of try
                }
                catch {
                    print("Could not parse JSON")
                }
            }
        }
        
        
        ///5. Start the data task
        dataTask.resume()
        
    }
}
