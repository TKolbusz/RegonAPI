import SwiftUI

struct ListView : View {
    let companies: [Company]
    var body: some View{
        List {
            ForEach(companies){ company in
                NavigationLink(destination:DetailView(company:company)){
                    CardView(company:company)
                }
            }
        }
        .navigationTitle("Companies")
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView(companies:Company.sampleData)
        }
        
    }
}
