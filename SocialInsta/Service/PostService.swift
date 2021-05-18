//
//  PostService.swift
//  SocialInsta
//
//  Created by Thiago Franca Sousa on 16/05/21.
//

import UIKit

class PostService{
    static func getPosts(result: @escaping ([Post]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {	data, response, error in
            if let data = data, let items = try? JSONDecoder().decode([Post].self, from: data) {
                DispatchQueue.main.async {
                    result(items)
                }
            }
        }.resume()
    }
    
    static func getThumb(result: @escaping (UIImage) -> Void) {
        DispatchQueue.global().async {
            guard let url = URL(string: "https://picsum.photos/400/400") else { return }
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.sync {
                    result(image)
                }
            }
        }
    }
}
	
