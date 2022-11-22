import SwiftUI

struct ListView : View {
    @ObservedObject var presenter: ProductionViewPresenter
    @State private var searchText=""
    var body: some View{
        List(presenter.companies)
        { company in
                NavigationLink(destination:DetailView(company:company)){
                    CardView(company:company)
                }
        }
        .searchable(text:$searchText)
        .onSubmit(of:.search,doSearch)
        .navigationTitle("Companies")
    }
    
    func doSearch(){
        presenter.find(search:searchText)
    }
}
/*struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView(companies:Company.sampleData)
        }
    
    }
}
*/
