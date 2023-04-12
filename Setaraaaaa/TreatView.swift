//
//  TreatView.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 13/04/23.
//

import SwiftUI

struct TreatView: View {
    
    @State private var nameItem : String = ""
    
    var body: some View {
        VStack {
            TextField("Rp ", text: $nameItem)
                .padding(.leading, 40)
                .frame(maxWidth: .infinity)
                .lineLimit(2)
                .padding(.leading, 130)
                .keyboardType(.numberPad)
            
            
        }
    }
}

struct TreatView_Previews: PreviewProvider {
    static var previews: some View {
        TreatView()
    }
}
