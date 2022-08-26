import SwiftUI

struct Search_Bar: View {
    @Binding var searchText: String
    @State var hintText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 7)
            
            TextField(hintText, text: $searchText)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(.black)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
            
        }
        .font(.headline)
        .padding(.leading, 5)
        .frame(maxWidth: .infinity)
        .frame(height: 43)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.white.opacity(0.9))
                .shadow(radius: 22)
        )
        .padding(.trailing, 6)
    }
}
