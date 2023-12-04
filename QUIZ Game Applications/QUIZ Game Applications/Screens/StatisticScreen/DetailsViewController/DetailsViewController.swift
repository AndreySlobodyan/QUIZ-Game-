//
//  DetailsViewController.swift
//  QUIZ Game Applications
//
//  Created by mac on 24.11.2023.
//

import UIKit

protocol DetailsDisplayLogic: AnyObject {
    
    func dispaly(data: DeatailsModel)
}

class DetailsViewController: UIViewController {
    
    var dataView: DeatailsModel?
    private(set) var router: (DetailsRoutingLogic & DetailsDtaPassing)?
    private var interactor: (DetailsBusinesLogic & StatisticStoreProtocol)?
    var stackView = UIStackView()
    let questionLable: UILabel = {
        let label = UILabel()
        return label
    }()
    let answerLable: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = DetailsInteractor()
        let preenter = DetailsPresenter()
        let router = DetailsRouter()
        interactor.presenter = preenter
        preenter.viewController = viewController
        viewController.interactor = interactor
        router.dataStore = interactor
        router.viewController = viewController
        viewController.router = router
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getData()
        navigationItem.title = "Details"
        view.addSubview(stackView)
        configureStackView()
    }
    
    func configureStackView() {
        
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        addDetailsstackView()
        setStackViewConstrains()
    }
    
    func addDetailsstackView() {
        
        guard let questions = dataView?.question, let answers = dataView?.answer else {
            return
        }
        
        for (question, answer) in zip(questions, answers) {
            let containerView = UIView()
            containerView.backgroundColor = .white
            containerView.layer.cornerRadius = 20
            let questionLabel = UILabel()
            questionLabel.text = "Вопрос: \(question)"
            questionLabel.textAlignment = .center
            questionLabel.numberOfLines = 0
            containerView.addSubview(questionLabel)
            let answerLabel = UILabel()
            answerLabel.text = "Ответ: \(answer)"
            containerView.addSubview(answerLabel)
            stackView.addArrangedSubview(containerView)
            questionLabel.translatesAutoresizingMaskIntoConstraints = false
            questionLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4).isActive = true
            questionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
            questionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
            answerLabel.translatesAutoresizingMaskIntoConstraints = false
            answerLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 8).isActive = true
            answerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
            
        }
    }
    
    func setStackViewConstrains() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
    }
}

extension DetailsViewController: DetailsDisplayLogic {
    
    func dispaly(data: DeatailsModel) {
        
        dataView = data
    }
}
