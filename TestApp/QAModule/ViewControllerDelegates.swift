import UIKit

// MARK: - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isFiltering {
            return filteredSectionsFAQ.count 
        } else {
            return sectionsFAQ.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderCellView()
        if isFiltering {
            headerView.update(text: filteredSectionsFAQ[section].name)
        } else {
            headerView.update(text: sectionsFAQ[section].name)
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredSectionsFAQ[section].items.count
        } else {
            return sectionsFAQ[section].items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataString.Identifier.cell, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        if isFiltering {
            let item = filteredSectionsFAQ[indexPath.section].items[indexPath.row]
            cell.update(questions: item.question, answers: item.answer ?? "")
        } else {
            let item = sectionsFAQ[indexPath.section].items[indexPath.row]
            cell.update(questions: item.question, answers: item.answer ?? "")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            self.mainView.tableView.performBatchUpdates(nil)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = self.mainView.tableView.cellForRow(at: indexPath) as? TableViewCell {
            cell.hideAnswerLabel()
        }
    }
}

// MARK: - SearchController
extension ViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredSectionsFAQ = sectionsFAQ.map { name in
            var newName = name
            newName.items = name.items.filter({$0.question.lowercased().contains(searchText.lowercased())})
            return newName
        }.filter({ !$0.items.isEmpty })
        mainView.tableView.reloadData()
    }
}
