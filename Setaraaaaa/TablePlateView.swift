//
//  TablePlateView.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 04/04/23.
//

import SwiftUI


struct TablePlateView: View {
    
    @State var listNameTable: [ListName]
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack() {
                    
                    VStack(spacing: 10) {
                        Image("piggyBankAsset")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: 185, height: 150)
                        
                        Text("Deposit")
                            .font(.system(size: 18, weight: .medium))
                            .frame(alignment: .trailing)
                        
                    }
                    
                    VStack(spacing: 10) {
                        
                        
                        
                        Image("kue")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: 150, height: 150)
                        
                        Text("Treat")
                            .font(.system(size: 18, weight: .medium))
                            .frame(alignment: .trailing)
                        
                    }
                    
                }
                .padding(.top, 220)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 25) {
                        
                        ForEach(0..<listNameTable.count) { i in
                            
                            if listNameTable[i].isChecked {
                                
                                ZStack(alignment: .bottom) {
                                    
                                    
                                    
                                    Color(.gray)
                                        .frame(height: 400 / 3)
                                        .cornerRadius(20)
                                        .opacity(0.6)
                                    
                                    VStack(alignment: .center) {
                                        
                                        NavigationLink(value: listNameTable[i].name){
                                            Image("Piring")
                                                .resizable()
                                                .frame(width: 300, height: 300)
                                                .scaledToFit()
                                            
                                            Text(listNameTable[i].name)
                                                .fontWeight(.medium)
                                            
                                        }
                                        
                                        
                                        
                                        
                                    }
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 25)
                                    .navigationDestination(for: String.self){
                                        participantName in
                                        ItemView(participant: participantName)
                                }
                                
                                }
                            }
                            
                        }
                        
                    }
                }
                
                
                .padding(.bottom, 200)
                .padding(.top, 10)
                
                Button{}
            label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .font(.system(.title3, design: .rounded))
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.orange)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding(.bottom, 350)
            .frame(height: 200)
                
            }
            
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Plates")
                    .font(.title2.bold())
                    .accessibilityAddTraits(.isHeader)
            }
        }
    }
    
}

struct TablePlateView_Previews: PreviewProvider {
    static var previews: some View {
        TablePlateView(listNameTable: [ListName(name: "Me", isChecked: false)])
    }
}
