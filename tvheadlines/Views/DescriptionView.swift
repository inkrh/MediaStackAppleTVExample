import SwiftUI

//Abstracting out to this view which leverages the excellent marquee controller (no need to re-invent the wheel).

struct DescriptionView: View {
    let newsItemDescription: String
    let marqueeController: MarqueeController

    init(newsItemDescription: String) {
        self.newsItemDescription = newsItemDescription
        self.marqueeController = MarqueeController(message: newsItemDescription, foregroundColor: Color.white, backgroundColor: Color.black.opacity(0.2))
    }

    var body: some View {
        MarqueeView(controller: marqueeController)
    }
}

#Preview {
    DescriptionView(newsItemDescription: TestData.data.first!.description)
}
