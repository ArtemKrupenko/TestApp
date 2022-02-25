import UIKit

// MARK: - TableView
extension QuestionsAnswersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isFiltering {
            return filteredModels.count 
        } else {
            return models.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderCellView()
        if isFiltering {
            headerView.update(text: filteredModels[section].name)
        } else {
            headerView.update(text: models[section].name)
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredModels[section].items.count
        } else {
            return models[section].items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataString.Identifier.cell, for: indexPath) as? QuestionsAnswersCell else { return UITableViewCell() }
        if isFiltering {
            let item = filteredModels[indexPath.section].items[indexPath.row]
            cell.update(questions: item.question, answers: item.answer ?? "")
        } else {
            let item = models[indexPath.section].items[indexPath.row]
            cell.update(questions: item.question, answers: item.answer ?? "")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            self.customView.tableView.performBatchUpdates(nil)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = self.customView.tableView.cellForRow(at: indexPath) as? QuestionsAnswersCell {
            cell.hideAnswerLabel()
        }
    }
}

// MARK: - SearchController
extension QuestionsAnswersViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredModels = models.map { name in
            var newName = name
            newName.items = name.items.filter({$0.question.lowercased().contains(searchText.lowercased())})
            return newName
        }.filter({ !$0.items.isEmpty })
        customView.tableView.reloadData()
    }
}
