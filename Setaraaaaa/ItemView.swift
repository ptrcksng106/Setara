//
//  ItemView.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 04/04/23.
//

import SwiftUI

struct ItemView: View {
    
    @State var checkState: Bool = false
    @State private var isToggle: [Bool] = [false,false,false]
    @State private var nameItem: String = ""
    @State private var basePrice: String = ""
    @State private var showingAlert = false
    @State var participant: ListName
    @State var nameItems: [String] = []
    @State var priceItems: [String] = []
    @State var counter: Int = 0
    @State var discount: String = ""
    @State private var feeIDR: String = ""
    @State private var taxPercent: String = ""
    @State private var taxIDR: String = ""
    @State var reload = false
    @State var totalPerson = 0
    @FocusState var isFocused: Bool
    
    var body: some View {
        
        
        VStack {
            
            VStack {
                List {
                    
                    if true {
                        if var participantss = SharedPreferences.shared.getParitcipant(name: participant.name) {
                            
                            ForEach(0..<participantss.food.count, id: \.self) {i in
                                
                                HStack() {
                                    Text("\(participantss.food[i].itemName)")
                                        .fontWeight(.regular)
                                        .font(.system(size: 16))
                                        .padding(.trailing, 120)
                                        .frame(alignment: .leading)
                                    
                                    
                                    Text("Rp \(participantss.food[i].itemPrice)")
                                        .fontWeight(.light)
                                        .font(.system(size: 16))
                                        .padding(.leading, 50)
                                        .frame(alignment: .leading)
                                    
                                }
                                
                                
                                .swipeActions(edge: .trailing, allowsFullSwipe: false, content: {
                                    
                                    Button {

                                        SharedPreferences.shared.deleteFood(name: participantss.name, index: i)
                                        
                                        self.isToggle[0] = true
                                        self.isToggle[0] = false
                                    
                                        
                                    } label: {
                                        Image(systemName: "trash")
                                    } .tint(.red)
                                    
                                })
                            }
                        }
                        
                    }
                }
                
                
                VStack(alignment: .center) {
                    
                    Text("Add Item")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    
                    
                    HStack {
                        Text("Name")
                            .padding(.leading, 15)
                        
                        TextField("Item", text: $nameItem)
                            .padding(.leading, 40)
                            .frame(maxWidth: .infinity)
                            .lineLimit(2)
                            .focused($isFocused)
                        
                    }
                    
                    HStack {
                        Text("Base Price")
                            .padding(.leading, 15)
                        
                        
                        TextField("Enter the number", text: $basePrice)
                            .padding(.leading, 5)
                            .keyboardType(.numberPad)
                            .focused($isFocused)
                        
                    }.padding(.top,5)
                    
                    
                    //View untuk discount, tax dan fee
                    
                    HStack() {
                        
                        Text("Disc")
                            .padding(.leading, 3)
                        
                        Toggle (isOn: $isToggle[0])  {
                            
                        }
                        .padding(.trailing,175)
                        
                        HStack {
                            
                            Button("%") {
                                
                                alertTF(title: "%", message: "", hintText: "Enter the percent of number", primaryTitle: "Cancel", secondaryTitle: "OK") { text in
                                    
                                    discount = text
                                    print("discount", discount)
                                    
                                    
                                } secondaryAction: {
                                    print("Cancelled")
                                }
                                
                            }
                            .foregroundColor(.white)
                            .padding(.trailing,10)
                            .frame(width: 70, height: 30, alignment: .center)
                            .background(CustomColor.myColor)
                            .disabled(!isToggle[0])
                            
                            
                        }
                        .padding(.trailing,10)
                        .cornerRadius(3)
                        
                    }
                    .padding(.leading, 10)
                    .padding(.top,60)
                    
                    HStack {
                        Text("Tax")
                        
                        Toggle (isOn: $isToggle[1]) {
                            
                        }
                        .padding(.trailing, 105)
                        
                        HStack {
                            
                            Button("%") {
                                
                                alertTF(title: "%", message: "", hintText: "Enter the percent of number", primaryTitle: "Cancel", secondaryTitle: "OK") { text in
                                    
                                    taxPercent = text
                                    print("discount", taxPercent)
                                    
                                    
                                } secondaryAction: {
                                    print("Cancelled")
                                }
                            }
                            .frame(width: 70, height: 30)
                            .foregroundColor(.white)
                            .background(CustomColor.myColor)
                            .padding(.leading,70)
                            .padding(.trailing, 10)
                            .disabled(!isToggle[1])
                        }
                    }
                    .padding(.leading, 10)
                    
                    
                    HStack {
                        Text("Fee")
                            .padding(.leading, 10)
                        
                        Toggle(isOn: $isToggle[2]) {
                            
                        }
                        .padding(.trailing,175)
                        
                        Button("IDR") {
                            
                            alertTF(title: "IDR", message: "", hintText: "Enter the number", primaryTitle: "Cancel", secondaryTitle: "OK") { text in
                                
                                feeIDR = text
                                print("discount", feeIDR)
                                
                                
                            } secondaryAction: {
                                print("Cancelled")
                            }
                        }
                        .frame(width: 70, height: 30)
                        .foregroundColor(.white)
                        .background(CustomColor.myColor)
                        
                        .padding(.trailing, 10)
                        .disabled(!isToggle[2])
    
                    }
                    
                    Button {
                        
                        if isToggle[0] {
                            print("discount integer", Int(discount) ?? 0)
                            let discountInt = Int(discount) ?? 0
                            let basePriceInt = Int(basePrice) ?? 0
                            
                            let totalDiscount = (basePriceInt * (100 - discountInt) ) / 100
                            
                            SharedPreferences.shared.addFood(name: participant.name, food: FoodList(itemName: nameItem, itemPrice: totalDiscount))
                        } else if isToggle[1] {
                            let taxInt = Int(taxPercent) ?? 0
                            let basePriceInt = Int(basePrice) ?? 0
                            
                            let totalDiscount = (basePriceInt * (100 + taxInt))  / 100
                            
                            SharedPreferences.shared.addFood(name: participant.name, food: FoodList(itemName: nameItem, itemPrice: totalDiscount))
                            
                        } else if isToggle[2] {
                            let taxInt = Int(feeIDR) ?? 0
                            let basePriceInt = Int(basePrice) ?? 0
                            
                            let totalDiscount = basePriceInt + taxInt
                            
                            SharedPreferences.shared.addFood(name: participant.name, food: FoodList(itemName: nameItem, itemPrice: totalDiscount))
                        
                        } else {
                            
                            SharedPreferences.shared.addFood(name: participant.name, food: FoodList(itemName: nameItem, itemPrice: Int(basePrice) ?? 0))
                            
                        }
                        
                        var tmpTotal = 0
                        var tmpParticipant = SharedPreferences.shared.getParitcipant(name: participant.name) ?? ListName(name: "", isChecked: false, food: [FoodList(itemName: "", itemPrice: 0)], total: 0)
                        
                        
                        for i in 0..<(tmpParticipant.food.count ) {
                            print("i: ", i)
                            tmpTotal += tmpParticipant.food[i].itemPrice
                            tmpParticipant.total = tmpTotal
                            print("Hasilnya: ", tmpParticipant)
                            
                            let countt = SharedPreferences.shared.getParitcipant(name: participant.name)
                            
                            print(countt?.total ?? 0)
                            SharedPreferences.shared.add(participant: tmpParticipant)
                            
                            
                        }
                        self.isToggle[0] = false
                        self.isToggle[1] = false
                        self.isToggle[2] = false
                        self.basePrice = ""
                        self.nameItem = ""
                        print("total: ", tmpParticipant.total)
                        
                        isFocused = false
                        
                        
                    }
                    
                label: {
                    
                    Text("Add")
                }
                .frame(width: 200)
                .frame(height: 60)
                .foregroundColor(.white)
                .background(CustomColor.myColor)
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding(.bottom, 100)
                .padding(.top, 20)
                    
                }
                .padding(.bottom, 10)
                .padding(.top, 30)
                
            }
        }
        .listStyle(.plain)
        .navigationTitle("\(participant.name)")
    }
    
    
    
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView( participant: ListName(name: "Hengky", isChecked: false, food: [FoodList(itemName: "", itemPrice: 0)], total: 0))
    }
}
