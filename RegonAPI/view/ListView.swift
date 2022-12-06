import SwiftUI

struct ListView : View {
    @ObservedObject var presenter: CompanyListViewPresenter
    @State private var searchText=""
    var body: some View{
        List(presenter.companies)
        { company in
            NavigationLink(destination:DetailView(presenter:CompanyViewPresenter(company: company))){
                    CardView(company:company)
                }
        }
        .searchable(text:$searchText)
        .disableAutocorrection(true)
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
