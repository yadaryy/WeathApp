
import SwiftUI

extension Date {
    var dateFormat : String {
        self.formatted(
            .dateTime.weekday().day().month()
        )
    }
    
    var timeFormat : String {
        self.formatted(
            .dateTime.hour()
        )
    }
    
    static func fromUnixTimestamp(_ unixTimestamp: Int) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
    }
    
    func format(with dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
    
    func formatTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        formatter.locale = Locale.current
        return formatter.string(from: self)
    }
    
    func formatFullDate() -> String {
        return format(with: "EEEE, d MMM")
    }
    
    func convertToMonthYearFormat() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, d MMM"
            return dateFormatter.string(from: self)
        }
    
    func convertToTimeFormat() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "h:mm a"
            return dateFormatter.string(from: self)
        }

    func convertToDayFormat() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE h:mm"
            return dateFormatter.string(from: self)
        }
    
    
}

extension View {
    func hideKeyboardWhenTappedAround() -> some View {
        self.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Color {
    func statusColor(_ status : String) -> Color {
        switch status {
        case "Good" :
            return Color("Level1")
        case "Moderate" :
            return Color("Level2")
        case "Unhealthy for Sensitive Groups" :
            return Color("Level3")
        case "Unhealthy" :
            return Color("Level4")
        case "Very Unhealthy" :
            return Color("Level5")
        case "Hazardous" :
            return Color("Level6")
        case "N/A" :
            return Color.blue
        default:
            return Color.gray
        }
    }
}


extension String {

    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: self)
    }
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A" }
        return date.convertToMonthYearFormat()
    }
    
    func convertToDisplayTimeFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A" }
        return date.convertToTimeFormat()
    }
    
    func convertToDisplayDayFormat()-> String {
        guard let date = self.convertToDate() else { return "N/A" }
        return date.convertToDayFormat()
    }
    
}
