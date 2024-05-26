//
//  ContentView.swift
//  WBizzReal
//
//  Created by Mac on 5/25/24.
//

import SwiftUI
struct ContentView: View{
    private var listOfStores = storesList
    @State var searchText = ""
    var body:some View{
        NavigationView{
            List{
                ForEach(stores, id: \.self) {store in
                    HStack{
                        Text(store.capitalized)
                        Spacer()
                        
                    }
                    .padding()
                }
            }
            .searchable(text:$searchText)
            .navigationTitle("WBizz")
        }
    }
    
    
    var stores : [String]{
        let lcStores = listOfStores.map{$0.lowercased()}
        
        return searchText == "" ? lcStores : lcStores.filter{$0.contains(searchText.lowercased())
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
