//
//  ContentView.swift
//  CountryApp3
//
//  Created by Khushboo on 16/09/22.
//

import SwiftUI
import Combine

struct ContentView: View {
 @Environment(\.managedObjectContext) var moc
   // @FetchRequest(entity: Model.entity(), sortDescriptors:  [NSSortDescriptor(keyPath: \Model.name, ascending: true)]) var models: FetchedResults<Model>
    @Environment(\.presentationMode) var presentationMode
    @State var country1: String = ""
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State  private var errorMessage: String = ""
   
    //@Binding var isShowing: Bool
    @State private var showNewItem: Bool = false
    @State private var showingShowName: Bool = false
    private var isButtonDisabled: Bool{
        country1.isEmpty
    }
    
    //Function
func addItem() {
      withAnimation{
      countryStore.name.append(countries(id: String(countryStore.name.count + 1), country: country1))
      //presentationMode.wrappedValue.dismiss()
         
        //  isShowing = false
      //let _ = print(country1)
      }
       /*  withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timeStamp = Date()
            newItem.task = task {
                newItem.completion = false
                newItem.id  = UUID()
                do{
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("unsolved error\(nsError),\(nsError.userInfo)")
                }
                country = ""
                hideKeyboard()
            }
        }*/
    }
   @ObservedObject var countryStore = CountryStore()
    var body: some View {
        
        NavigationView{
        
            ZStack{
                Color((UIColor.systemGray4))
                    .edgesIgnoringSafeArea(.all)
                VStack {
                VStack{
                TextField("Add Country", text: $country1)
                    .padding(.all)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    //action
                    Button(action: {
                        if self.country1 != ""{
                            //value local store
                           // addItem()
                            MyLocalStorage.myValue = self.country1
                            print(MyLocalStorage.myValue)
                            
                            
                            // core data
                            let conName = Model(context: self.moc)
                        conName.name = self.country1
                        
                        do{
                            try self.moc.save()
                           // try self.managedObjectContext.save()
                            print("country name : \(conName.name ?? "")")
                        } catch {
                            print(error)
                        }
                        } else {
                            self.errorShowing = true
                            self.errorTitle = "invalid name"
                            self.errorMessage = "Make sure to enter something"
                            return
                        }
                    }
                 , label: {
                    Spacer()
                    
                        Text("Add Country")
                    Spacer()
                }).disabled(isButtonDisabled)
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(isButtonDisabled ? Color.blue: Color.pink).cornerRadius(10)
                   
                    Button(action: {
                        self.showingShowName.toggle()
                    }
                       , label: {
                        Spacer()
                        NavigationLink("Show All Country", destination: ShowName())
                        
                        Spacer()
                        
                    }).disabled(isButtonDisabled)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(isButtonDisabled ? Color.blue: Color.pink).cornerRadius(10)
                        .sheet(isPresented: $showingShowName){
                            ShowName().environment(\.managedObjectContext, self.moc)
                        }
                    }
                        .navigationBarTitle("Country App")
                }.cornerRadius(16)
                    .shadow(color: Color(red: 0, green: 0, blue: 0 , opacity: 0.65), radius: 24)
                    .frame(maxWidth: 640)
            }
            

        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
