import SwiftUI

enum TemperatureConversion {
    case Celsius, Fahrenheit, Kelvin
}

enum LengthConversion: String, Equatable, CaseIterable {
    case meters = "M"
    case kilometers = "KM"
    case feet = "FT"
    case yards = "YD"
    case miles = "MI"
}

enum TimeConversion {
    case seconds, minutes, hours, days
}

enum VolumeConversion {
    case milliliters, liters, cups, pints, gallons
}

struct ContentView: View {
    @State var inputSelection: LengthConversion = .meters
    @State var outputSelection: LengthConversion = .kilometers
    @State var numberToConvert: Double = 0.0
    var result: Double {
        switch (inputSelection, outputSelection) {
        case (.meters, .feet):
            let numberInMeters = Measurement(value: numberToConvert, unit: UnitLength.meters)
            return numberInMeters.converted(to: UnitLength.feet).value
        default:
            return numberToConvert
        }
    }
    var body: some View {
        Form {
            Section {
                Picker("LenghtConversion", selection: $inputSelection) {
                    ForEach(LengthConversion.allCases, id: \.self) { value in
                        Text(value.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Input Length Conversion")
            }
            Section {
                Picker("LenghtConversion", selection: $outputSelection) {
                    ForEach(LengthConversion.allCases, id: \.self) { value in
                        Text(value.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Output Length Conversion")
            }
            Section {
                TextField("Number to convert",
                          value: $numberToConvert,
                          format: .number)
            } header: {
                Text("What number do you want to convert?")
            }
            Section {
                Text(result, format: .number)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
