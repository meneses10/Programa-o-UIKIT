//
//  HomeViewController.swift
//  UIKIT
//
//  Created by Carlos Eduardo de Sousa Meneses on 12/11/26.
//

import UIKit
import SwiftData

class HomeViewController: UIViewController {
    private let colocarTexto: UILabel = {
        let label = UILabel()
        label.text = "Nenhuma viagem registrada"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let acaoBotao: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Adicione suas viagens", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let tableView = UITableView()
    private let context = DataController.shared.context
    private var trips: [InfoTrip] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(showSheet)
        )

        acaoBotao.addTarget(self, action: #selector(showSheet), for: .touchUpInside)

        setupTableView()
        setupLayout()
        loadTrips()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTrips()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.insertSubview(tableView, at: 0)
    }

    private func setupLayout() {
        view.addSubview(colocarTexto)
        view.addSubview(acaoBotao)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            colocarTexto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colocarTexto.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            colocarTexto.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 24),
            colocarTexto.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -24),

            acaoBotao.topAnchor.constraint(equalTo: colocarTexto.bottomAnchor, constant: 16),
            acaoBotao.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func loadTrips() {
        let descriptor = FetchDescriptor<InfoTrip>(
            sortBy: [SortDescriptor(\.DataIda, order: .forward)]
        )

        do {
            trips = try context.fetch(descriptor)
        } catch {
            trips = []
            print("Erro ao buscar viagens: \(error)")
        }

        tableView.reloadData()

        let isEmpty = trips.isEmpty
        colocarTexto.isHidden = !isEmpty
        acaoBotao.isHidden = !isEmpty
        tableView.isHidden = isEmpty
    }

    @objc private func showSheet() {
        let sheet = AddTripController()

        sheet.onSave = { [weak self] in
            self?.loadTrips()
        }

        sheet.modalPresentationStyle = .pageSheet

        if let sheetController = sheet.sheetPresentationController {
            sheetController.detents = [.medium(), .large()]
            sheetController.prefersGrabberVisible = true
            sheetController.preferredCornerRadius = 20
        }

        present(sheet, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trips.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let trip = trips[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = trip.place

        let departure = trip.DataIda.formatted(date: .abbreviated, time: .omitted)
        let returnDate = trip.DataVotla.formatted(date: .abbreviated, time: .omitted)
        content.secondaryText = "\(departure) → \(returnDate) • \(trip.Duration) dias"

        content.image = UIImage(systemName: trip.IsFavorite ? "star.fill" : "airplane")
        content.imageProperties.tintColor = trip.IsFavorite ? .systemYellow : .systemBlue

        cell.contentConfiguration = content

        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

#Preview {
    UINavigationController(rootViewController: HomeViewController())
}
