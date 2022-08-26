//
//  Web_view2_link.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 19/07/2022.
//

import SwiftUI

struct Web_view2_link: View {
    var body: some View {
        WebViewe1(url_to_display: URL(string: "https://adleranewsnine.xyz/")!)
    }
}

struct Web_view2_link_Previews: PreviewProvider {
    static var previews: some View {
        Web_view2_link()
    }
}
