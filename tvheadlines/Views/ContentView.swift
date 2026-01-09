import SwiftUI
internal import Combine

//TODO: if no image - filter out? display stock image - AI lookup for a theme would be great here (e.g. if about Apple and focussed on business then show Apple campus? if about Apple and focussed on iPhone then show iOS device? etc.

//TODO: presentation in general - change headline to base of page above description
// Image tucks behind below
// Headline
// Scrolling description

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
        VStack {
            if let model = model, !model.data.isEmpty {
                let newsItem = model.data[counter]
                if let urlString = newsItem.image, let url = URL(string: urlString) {

                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .ignoresSafeArea().containerRelativeFrame(.vertical) { height, _ in
                                height * 0.8
                            }
                    } placeholder: {
                        Image(systemName: "globe").containerRelativeFrame(.vertical) { height, _ in
                            height * 0.8
                        }
                    }
                } else {
                    Image(systemName: "globe").imageScale(.large).aspectRatio(contentMode: .fill).ignoresSafeArea().containerRelativeFrame(.vertical) { height, _ in
                        height * 0.8
                    }
                }
                Spacer()
                VStack {
                    Text("\(newsItem.title)").font(.largeTitle).background(Color.black.opacity(0.2)).foregroundColor(Color.white).padding(48)
                    DescriptionView(newsItemDescription: newsItem.description).background(Color.black.opacity(0.2)).padding(48)
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
        }.background(Color.black)
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
