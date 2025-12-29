import SwiftUI

//TODO: This will be a scrolling feed at the bottom of the page.
struct DescriptionView: View {
    let newsItemDescription: String
    var body: some View {
        Text(newsItemDescription)
    }
}

#Preview {
    DescriptionView(newsItemDescription: "Some long text.Some long text.Some long text.Some long text.Some long text.Some long text.Some long text.Some long text.Some long text.Some long text.Some long text.Some long text.Some long text.Some long text.Some long text.Some long text.Some long text.Some long text.Some long text.")
}
