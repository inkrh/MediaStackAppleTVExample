import SwiftUI
internal import Combine

struct ContentView: View {
    @State private var model: MediaStackModel?
    @State private var errorMessage: String?
    @State private var counter: Int = 0
    @State private var showConfig = false

    // Observe the shared config for changes
    @Bindable private var config = Config.shared

    let timer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
    // 6 hours = 21600 seconds
    let sixHourTimer = Timer.publish(every: 21600, on: .main, in: .common).autoconnect()

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
            await fetchData()
        }
        .onChange(of: config.categories) { _ in
            Task { await fetchData() }
        }
        .onChange(of: config.countries) { _ in
            Task { await fetchData() }
        }
        .onChange(of: config.languages) { _ in
            Task { await fetchData() }
        }
        .onReceive(timer) { _ in
            if let model = model, !model.data.isEmpty {
                counter = (counter + 1) % model.data.count
            }
        }
        .onReceive(sixHourTimer) { _ in
            Task { await fetchData() }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showConfig = true
                }) {
                    Image(systemName: "gear")
                        .imageScale(.large)
                }
            }
        }
        .sheet(isPresented: $showConfig) {
            ConfigView()
        }
    }

    // Refactored fetch logic for reuse
    private func fetchData() async {
        do {
            let result = try await MediaStackController().fetchMSModel()
            await MainActor.run {
                model = result
                errorMessage = nil
                counter = 0
            }
        } catch {
            await MainActor.run {
                errorMessage = error.localizedDescription
            }
        }
    }
}

#Preview {
    ContentView()
}
