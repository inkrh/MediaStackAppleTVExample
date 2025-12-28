import SwiftUI
internal import Combine

struct ContentView: View {
    @State private var model: MediaStackModel?
    @State private var errorMessage: String?
    @State private var counter: Int = 0
    
    let timer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        ZStack {
            if let model = model, !model.data.isEmpty {
                let newsItem = model.data[counter]
                if let urlString = newsItem.image, let url = URL(string: urlString) {
                    
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .ignoresSafeArea()
                    } placeholder: {
                       Image(systemName: "loading")
                    }
                } else {
                    Image(systemName: "globe").imageScale(.large).aspectRatio(contentMode: .fill).ignoresSafeArea()
                }
                VStack {
                    Spacer()
                    Text("\(newsItem.title)").font(.largeTitle).background(Color.black.opacity(0.2)).padding(64)
                }
            } else if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                Text("Loading...")
            }
        }
        .task {
            do {
                let result = try await MediaStackController().fetchMSModel()
                model = result
                print(result)
            } catch {
                errorMessage = error.localizedDescription
            }
        }
        .onReceive(timer) { _ in
            if let model = model, !model.data.isEmpty {
                counter = (counter + 1) % model.data.count
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
