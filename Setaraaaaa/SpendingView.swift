//
//  SpendingView.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 03/04/23.
//

import SwiftUI

struct SpendingView: View {
    @State private var showingAlert = false
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading)
            {
                Text("Expenses")
                    .padding(.top, 20.0)
                    .padding(.leading, 15.0)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                List {
                    ForEach(1...5, id: \.self) {_ in
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                                .padding(.trailing,10)
                            VStack(alignment: .leading) {
                                Text("Hengki")
                                Text("29 Maret 2023")
                                    .fontWeight(.light)
                                    .font(.system(size: 12))
                                    .padding(.trailing, 15)
                            }
                            Text("Rp 1.000.000")
                        }
                    }
                    .listRowBackground(Color.gray)
                }
                .scrollContentBackground(.hidden)
                .padding(.bottom, 40)
                .padding(.trailing, 0)
                .padding(.leading, 0)
                
            }
            .frame(width: 360, height: 470)
            .background(Color.gray)
            .cornerRadius(25)
            .padding(.bottom, 100)
        }
        Button{
            showingAlert = true
        } label: {
            Text("Finish")
                .fontWeight(.bold)
                .font(.system(.subheadline, design: .rounded))
                .frame(width: 200)
                .padding()
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(20)
                .shadow(radius: 5)
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                            title: Text("Are you sure ?"),
                            message: Text("After this the transaction will be deleted"),
                            primaryButton: .destructive(Text("OK")) {
                                print("Delete the whole transaction")
                            },
                            secondaryButton: .cancel()
                        )
        }
    }
}

struct SpendingView_Previews: PreviewProvider {
    static var previews: some View {
        SpendingView()
    }
}
