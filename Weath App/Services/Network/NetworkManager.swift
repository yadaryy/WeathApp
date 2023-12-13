
import Foundation

final class NetworkManager {
    // The generic function that fetches data from the provided URL and decodes it into the specified Codable type.
    static func fetch<T: Codable>(for url: URL, completion: @escaping (Result<T, HTTPError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(String(describing: error))
                completion(.failure(.error(error: error.localizedDescription)))
                return
            }

            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let error {
                print(String(describing: error))
                completion(.failure(.decodingError(err: error.localizedDescription)))
            }
        }.resume()
    }
    
    // This function fetches data from two URLs concurrently and decodes the responses into the specified Codable types.
    static func fetch<T: Codable, U: Codable>(for url1: URL, for url2: URL, completion: @escaping (Result<(T, U), HTTPError>) -> Void) {
        let group = DispatchGroup()
        var result1: Result<T, HTTPError>?
        var result2: Result<U, HTTPError>?
        
        group.enter()
        fetch(for: url1) { (result: Result<T, HTTPError>) in
            result1 = result
            group.leave()
        }
        
        group.enter()
        fetch(for: url2) { (result: Result<U, HTTPError>) in
            result2 = result
            group.leave()
        }
        
        // Process the results
        group.notify(queue: .main) {
            if let result1 = result1, let result2 = result2 {
                switch (result1, result2) {
                case (.success(let data1), .success(let data2)):
                    completion(.success((data1, data2)))
                case (.failure(let error), _), (_, .failure(let error)):
                    completion(.failure(error))
                }
            } else {
                completion(.failure(.invalidResponse))
            }
        }
    }
}
