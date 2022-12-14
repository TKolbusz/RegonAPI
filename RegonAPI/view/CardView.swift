
//
//  CardView.swift
//  Scrumdinger
//
//  Created by Guest User on 11/10/2022.
//

import SwiftUI

struct CardView: View {
    let company : Company
    var body: some View {
        VStack(alignment: .leading) {
                    Text(company.name)
                        .font(.headline)
                        .accessibilityAddTraits(.isHeader)
                    Spacer()
                    .font(.caption)
                }
    }
}

struct CardView_Previews: PreviewProvider {
    static var company = Company.sampleData[0]
    static var previews: some View {
        CardView(company: company)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
