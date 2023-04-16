//
//  TreatView.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 13/04/23.
//

import SwiftUI

struct TreatView: View {
    
    @State var listNameTable: [ListName]
    @State private var treatNumber : String = ""
    @State private var selectedPerson = 0
    
    
    var body: some View {
        VStack {
            TextField("Enter the number here", text: $treatNumber)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding(.leading, 10)
                .keyboardType(.numberPad)
            
            Picker("Choose the person", selection: $selectedPerson,content: {
                
                ForEach(0..<listNameTable.count, id: \.self) { index in
                    if listNameTable[index].isChecked {
                        Text("\(listNameTable[index].name)")
                        
                    }
                }
            })
                
                
            .pickerStyle(WheelPickerStyle())
            
            Text("Your selected \(selectedPerson)")
            
            // logic calculate treat
            
            var tmpTotal = 0
            var treatPerson = SharedPreferences.shared.getParitcipant(name: listNameTable[selectedPerson].name) ?? ListName(name: "", isChecked: false, food: [FoodList(itemName: "", itemPrice: 0)], total: 0)
            
            
            
            Button("Done") {
                
                print(treatPerson)
                
                
                
                tmpTotal = treatPerson.total + (Int(treatNumber) ?? 0)
                
                treatPerson.total = tmpTotal
                
                SharedPreferences.shared.add(participant: treatPerson)
                
                
                
            }
            
            
        }
    }
}

struct TreatView_Previews: PreviewProvider {
    static var previews: some View {
        TreatView(listNameTable: [ListName(name: "Me", isChecked: true, food: [], total: 100)])
    }
}
