import SwiftUI

struct ListView : View {
    @ObjectBinding var presenter: ProductionPostsPresenter
    var body: some View{
        List {
            ForEach(presenter.companies){ company in
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
