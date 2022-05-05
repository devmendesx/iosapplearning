import Foundation
import Alamofire

struct WeatherManager {
    var WEATHER_URL: String = "https://api.openweathermap.org/data/2.5/weather"
    var APP_ID: String = "dd0f6e94e8d8dc954941a7ef958d124d"
    var delegate: WeatherManagerDelegate?
    
    public func fetchWeather(with cityName: String){
        AF.request(WEATHER_URL, method: .get, parameters: ["APPID": APP_ID, "units": "metric", "q": cityName]).response {
            response in
            switch response.result {
                case .success(let value):
                    let weatherViewModel = self.parsingJSON(with: value!)
                    delegate?.didUpdateViewUI(weatherViewModel: weatherViewModel!)
                case .failure(let error):
                    self.delegate?.didFailWithError(with: error)
            }
        }
    }
    
    private func parsingJSON(with data: Data) -> WeatherViewModel? {
        do {
            let weather = try JSONDecoder().decode(WeatherInformationModel.self, from: data)
            return WeatherViewModel(weatherInformationModel: weather)
        }catch {
            self.delegate?.didFailWithError(with: error)
            return nil
        }
    }
    
}

protocol WeatherManagerDelegate {
    func didUpdateViewUI(weatherViewModel: WeatherViewModel)
    func didFailWithError(with error: Error)
}
