//
//  ShowName.swift
//  CountryApp3
//
//  Created by Khushboo on 16/09/22.
//

import SwiftUI
import Combine

struct ShowName: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var countryStore = CountryStore()
  //  @FetchRequest(entity: Model.entity(), sortDescriptors:  [NSSortDescriptor(keyPath: \Model.name, ascending: true)]) var models: FetchedResults<Model>
    
      @State private var showNewItem: Bool = false
     // @State var userArr1 : Array = []
    @Environment(\.presentationMode) var presentationMode
      
      var body: some View {
          NavigationView{
          List{
             
              Text(MyLocalStorage.myValue)
              //fetching data
         /*   ForEach(self.models, id: \.self) { items in
                  HStack{
                      Text(items.name ?? "unknown")
                  }
              }
          */
           
            /*  ForEach(countryStore.name) {
                  countries in
                  Text(countries.country)
              } */
                /*  .onAppear(){
                 //     append.(countries.init(id: countryStore.$name, //country: countryStore.name))
                     // Text(countries.country).append(MyLocalStorage.myValue)
                      MyLocalStorage.myValue.append(MyLocalStorage.myValue )
                  }*/
              
                 
          }
          .navigationBarTitle("List Of Country", displayMode: .inline)
        }
         // List(self.countryStore.name){ countries in
       /*   NavigationView{
          ZStack  {
              VStack{// Text(countries.country)
          List{
             
              List(self.countryStore.name) { countries in
                  
                  Text(MyLocalStorage.myValue).font(.headline).fontWeight(.bold)

                      //.onDelete(perform: deleteItems)
              }
          }.listStyle(InsetGroupedListStyle()).background(.gray)
                  .shadow(color: Color (red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                  .padding(.vertical,0)
                  .frame(maxWidth: 640)
             // ContentView(isShowing: .constant($countryStore))
            
      }
          if showNewItem {
              ContentView(isShowing: $showNewItem)
          }
          }
          .onAppear() {
              UITableView.appearance().backgroundColor = UIColor.clear
          }
          }
        */
  }

}

struct ShowName_Previews: PreviewProvider {
    static var previews: some View {
       // let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //    return  ShowName().environment(\.managedObjectContext, context)
        ShowName()
       
    }
}
