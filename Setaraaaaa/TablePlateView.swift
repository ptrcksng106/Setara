//
//  TablePlateView.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 04/04/23.
//

import SwiftUI


struct TablePlateView: View {
    
    @State var listNameTable: [ListName]
    
    @State private var navigated = false
    
    @State private var showingSheet = false
    
    var body: some View {
        
        
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
                    
                    
                    Button(
                        action: {
                            
                            showingSheet.toggle()
                            
                            
                        }, label: {
                            Image("kue")
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 150, height: 150)
                        }
                    
                    ) .sheet(isPresented: $showingSheet) {
                        
                        TreatView()
                        
                    }
                    
                    
                    
                    Text("Treat")
                        .font(.system(size: 18, weight: .medium))
                        .frame(alignment: .trailing)
                    
                }
                
            }
            .padding(.bottom, 50)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 25) {
                    
                    
                    ForEach(0..<listNameTable.count) { i in
                        if listNameTable[i].isChecked {
                            
                            let totalSum = SharedPreferences.shared.getParitcipant(name: listNameTable[i].name)
                            
                            ZStack(alignment: .bottom) {
                                
                                Color(.gray)
                                    .frame(height: 400 / 3)
                                    .cornerRadius(20)
                                    .opacity(0.6)
                                
                                VStack(alignment: .center) {
                                    NavigationLink (destination: ItemView(participant: listNameTable[i])) {
                                        
                                        Image("Piring")
                                            .resizable()
                                            .frame(width: 300, height: 300)
                                            .scaledToFit()
                                        
                                        
                                    }
                                    
                                    Text(listNameTable[i].name)
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                    
                                    Text("Rp \(totalSum!.total)")
                                    
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 25)
                                
                            }
                        }
                        
                    }
                    
                }
            }
            
            
            NavigationLink (destination: SpendingView(listNameTable: listNameTable), isActive: $navigated) {
                
                
                Button(
                    action: {
                        self.navigated = true
                        
                        

                        
                    }, label: {
                        Text("Continue")
                    }
                )
            }
            .frame(width: 200, height: 50)
            .background(CustomColor.myColor)
            .foregroundColor(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            
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
        TablePlateView(listNameTable: [ListName(name: "Me", isChecked: false, food: [FoodList(itemName: "Tarempa", itemPrice: 10000)], total: 0)])
    }
}


