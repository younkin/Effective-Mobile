//
//  CustomBasketTable.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 11.12.2022.
//

import Foundation
import UIKit
import SnapKit

final class CustomBasketTable: UIView {
    
    private(set) lazy var basketTableView: UITableView = {
       var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = AppColors.darkBlue
        table.register(BasketTableViewCell.self, forCellReuseIdentifier: "BasketCell")
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        return table
    }()
    //Separator Images
    private lazy var separatorImage1: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "BusketLine1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var separatorImage2: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "BusketLine1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //Labels
    private lazy var totalLabel: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total"
        label.font = AppFont.montserratFont(ofSize: 15, weight: .medium)
        label.textColor = AppColors.white
        return label
    }()
    
    private lazy var delivaryLabel: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Delivary"
        label.font = AppFont.montserratFont(ofSize: 15, weight: .medium)
        label.textColor = AppColors.white
        return label
    }()
    
    private lazy var totalCostLbl: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$6,000 us"
        label.font = AppFont.montserratFont(ofSize: 15, weight: .bold)
        label.textColor = AppColors.white
        return label
    }()
    
    private lazy var delivaryCostLbl: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Free"
        label.font = AppFont.montserratFont(ofSize: 15, weight: .bold)
        label.textColor = AppColors.white
        return label
    }()
    
    private(set) lazy var deliveryBtn: UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Checkout", for: .normal)
        button.titleLabel?.textColor = AppColors.white
        button.backgroundColor = AppColors.orange
        button.titleLabel?.font = AppFont.montserratFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        basketTableView.dataSource = self
        basketTableView.delegate = self
        
        backgroundColor = AppColors.darkBlue
        setupUI()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 15
        deliveryBtn.layer.cornerRadius = deliveryBtn.frame.width / 17
    }
    
    private func setupUI() {
        addSubview(basketTableView)
        addSubview(separatorImage1)
        addSubview(totalLabel)
        addSubview(delivaryLabel)
        addSubview(totalCostLbl)
        addSubview(delivaryCostLbl)
        addSubview(separatorImage2)
        addSubview(deliveryBtn)
        
        basketTableView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(25)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(360)
        }
        
        separatorImage1.snp.makeConstraints {
            $0.top.equalTo(basketTableView.snp.bottom)
            $0.leading.equalTo(self).offset(4)
            $0.trailing.equalTo(self).inset(4)
        }
        
        totalLabel.snp.makeConstraints {
            $0.top.equalTo(separatorImage1.snp.bottom).offset(15)
            $0.leading.equalTo(self).offset(55)
        }
        
        delivaryLabel.snp.makeConstraints {
            $0.top.equalTo(totalLabel.snp.bottom).offset(12)
            $0.leading.equalTo(self).offset(55)
        }
        
        totalCostLbl.snp.makeConstraints {
            $0.centerY.equalTo(totalLabel.snp.centerY)
            $0.leading.equalTo(self).offset(300)
        }
        
        delivaryCostLbl.snp.makeConstraints {
            $0.centerY.equalTo(delivaryLabel.snp.centerY)
            $0.leading.equalTo(self).offset(300)
        }
        
        separatorImage2.snp.makeConstraints {
            $0.top.equalTo(delivaryCostLbl.snp.bottom).offset(26)
            $0.leading.equalTo(self).offset(4)
            $0.trailing.equalTo(self).inset(4)
        }
        
        deliveryBtn.snp.makeConstraints {
            $0.top.equalTo(separatorImage2.snp.bottom).offset(25)
            $0.leading.equalTo(self).offset(44)
            $0.trailing.equalTo(self).inset(44)
            $0.height.equalTo(54)
        }
    }
}

extension CustomBasketTable: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  124
    }
  
}

extension CustomBasketTable: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: BasketTableViewCell  = tableView.dequeueReusableCell(withIdentifier: "BasketCell", for: indexPath) as? BasketTableViewCell else { return UITableViewCell() }
        return cell
    }

    
    

}