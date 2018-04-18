import Foundation

// MARK: - LogDateFormatter
private class LogDateFormatter {
    
    private static let formatter: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss.SSSS dd/MM/yyyy"
        return dateFormatter
    }()
    
    static func stringDate() -> String {
        return formatter.string(from: Date())
    }
    
}

// MARK: - log

public func log(_ message: String? = nil, function: String = #function, line: Int = #line) {
    print("[\(LogDateFormatter.stringDate())] \(function) [L \(line)] \(message ?? "")")
}
