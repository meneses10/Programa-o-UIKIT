//
//  FavoriteViewController.swift
//  UIKIT
//
//  Created by Carlos Eduardo de Sousa Meneses on 12/11/26.
//

import UIKit
import SwiftData

class FavoriteViewController: UIViewController {
    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Seus favoritos"
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Nenhum favorito encontrado"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let context = DataController.shared.context
    private var favoriteTrips: [InfoTrip] = []
    private var filteredTrips: [InfoTrip] = []
    private var currentQuery = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        title = "Favoritos"
        navigationController?.navigationBar.prefersLargeTitles = true

        setupNavigationBarAppearance()
        setupSearchController()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        setupLayout()
        loadFavorites()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavorites()
    }

    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = .clear

        if let descriptor = UIFontDescriptor
            .preferredFontDescriptor(withTextStyle: .title1)
            .withSymbolicTraits(.traitBold) {

            let font = UIFont(descriptor: descriptor, size: 0)
            appearance.titleTextAttributes = [.font: font]
        }

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }
    //Local para fazer as buscas(nav bar)
    private func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Buscar"

        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.preferredSearchBarPlacement = .stacked
        searchController.searchBar.delegate = self
    }

    private func setupLayout() {
        view.addSubview(sectionLabel)
        view.addSubview(tableView)
        view.addSubview(emptyLabel)

        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            sectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sectionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            tableView.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            emptyLabel.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            emptyLabel.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 40),
            emptyLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 24),
            emptyLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -24)
        ])
    }

    private func loadFavorites() {
        let descriptor = FetchDescriptor<InfoTrip>(
            predicate: #Predicate<InfoTrip> { trip in
                trip.IsFavorite
            },
            sortBy: [SortDescriptor(\.DataIda, order: .forward)]
        )

        do {
            favoriteTrips = try context.fetch(descriptor)
        } catch {
            favoriteTrips = []
            print("Erro ao buscar favoritos: \(error)")
        }

        filterFavorites(matching: currentQuery)
    }

    private func filterFavorites(matching consulta: String) {
        currentQuery = consulta

        let query = consulta.trimmingCharacters(in: .whitespacesAndNewlines)

        if query.isEmpty {
            filteredTrips = favoriteTrips
        } else {
            filteredTrips = favoriteTrips.filter { trip in
                trip.place.localizedCaseInsensitiveContains(query)
            }
        }

        emptyLabel.isHidden = !filteredTrips.isEmpty
        tableView.reloadData()
    }
}

extension FavoriteViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterFavorites(matching: searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filterFavorites(matching: "")
    }
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredTrips.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let trip = filteredTrips[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = trip.place

        let departure = trip.DataIda.formatted(date: .abbreviated, time: .omitted)
        let returnDate = trip.DataVotla.formatted(date: .abbreviated, time: .omitted)
        content.secondaryText = "\(departure) → \(returnDate) • \(trip.Duration) dias"

        content.image = UIImage(systemName: "star.fill")
        content.imageProperties.tintColor = .systemYellow

        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

#Preview {
    UINavigationController(rootViewController: FavoriteViewController())
}
