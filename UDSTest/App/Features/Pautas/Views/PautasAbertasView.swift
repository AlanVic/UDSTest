//
//  PautasAbertasView.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 06/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

enum TypePautas: String {
    case open = "Aberto"
    case finished = "Fechado"
}

class PautasAbertasView: UIView, ConfigurableView {
    lazy var viewModel = PautasAbertasViewModel(withTypePautas: self.typePautasView)
    
    lazy var tableView:UITableView = {
        let table = UITableView(frame: .zero, style: UITableView.Style.grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 50
        table.register(PautaTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        table.sectionHeaderHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 10
        table.register(PautaTableViewCell.self, forCellReuseIdentifier: "detailCell")
        return table
    }()
    
    var isExpandedIndexPath:IndexPath?
    
    var typePautasView: TypePautas

    override init(frame: CGRect) {
        typePautasView = .open
        super.init(frame: frame)
    }
    
    convenience init(typeView: TypePautas){
        self.init(frame: .zero)
        self.typePautasView = typeView
        buildViewHierarchy()
        setupConstraints()
        viewModel.updateList = {
            self.tableView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        let guide = layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
}

extension PautasAbertasView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? PautaTableViewHeader else {
            return UIView()
        }
        header.delegate = self
        header.disclosureButton.tag = section
        let vm = viewModel.cellViewModel(toSection: section)
        header.setupView(withViewModel: vm)
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !viewModel.isExpanded(inSection: section){
            return 0
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? PautaTableViewCell else {
            return UITableViewCell()
        }
        let vm = viewModel.cellViewModel(toSection: indexPath.section)
        cell.setupView(cellViewModel: vm)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 46
    }
    
}

extension PautasAbertasView: PautaTableViewHeaderDelegate {
    func didExpandButtonTap(button: UIButton) {
        let section = button.tag
        
        let isExpanded = viewModel.pautas[section].isExpanded
        viewModel.pautas[section].isExpanded = !isExpanded
        
        button.setImage(isExpanded ? UIImage(named: "expand") : UIImage(named: "hide"), for: .normal)
//        print(isExpandedIndexPath)
        if isExpanded {
            tableView.deleteRows(at: [IndexPath(row: 0, section: section)], with: .none)
            isExpandedIndexPath = nil
        }else {
            tableView.insertRows(at: [IndexPath(row: 0, section: section)], with: .none)
            collapseCell()
            isExpandedIndexPath = IndexPath(row: 0, section: section)
        }
        
//        colapseCell(withoutSection: section)
        
    }
    
    func collapseCell() {
        tableView.reloadData()
//        if let indexPath = isExpandedIndexPath {
//            tableView.beginUpdates()
//            tableView.deleteSections(IndexSet(integer: indexPath.section), with: .none)
//            tableView.insertSections(IndexSet(integer: indexPath.section), with: .none)
//            tableView.endUpdates()
//        }
    }
    
    
//    func colapseCell(withoutSection section: Int) {
//        if let indexPaths = tableView.indexPathsForVisibleRows {
//
//        }
//
//
//
////        if let indexPathExpanded = viewModel.indexPathIsExpanded() {
////            tableView.deleteRows(at: [indexPathExpanded], with: .none)
////        }
//    }
    
}
