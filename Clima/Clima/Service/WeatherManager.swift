import Foundation
import Alamofire

struct WeatherManager {
    var WEATHER_URL: String = "https://api.openweathermap.org/data/2.5/weather"
    var APP_ID: String = "dd0f6e94e8d8dc954941a7ef958d124d"
    var delegate: WeatherManagerDelegate?
    
    public func fetchWeather(cityName: String){
        AF.request(WEATHER_URL, method: .get, parameters: ["APPID": APP_ID, "units": "metric", "q": cityName]).response { response in
            do {
                let weather = try JSONDecoder().decode(WeatherInformationModel.self, from: response.data!)
                let weatherViewModel = WeatherViewModel(weatherInformationModel: weather)
                delegate?.didUpdateViewUI(weatherViewModel: weatherViewModel)
            }catch {
                print(error)
            }
        }
    }
}

protocol WeatherManagerDelegate {
    func didUpdateViewUI(weatherViewModel: WeatherViewModel)
}
