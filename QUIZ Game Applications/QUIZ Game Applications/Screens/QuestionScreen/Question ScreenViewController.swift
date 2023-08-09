//
//  MathematicsViewController.swift
//  QUIZ Game Applications
//
//  Created by mac on 20.07.2023.
//

import UIKit

protocol QuestionDisplayLogic: AnyObject {
    func display(data: QuizzDataModel)
}

class QuestionScreenViewController: UIViewController {
    
    //MARK: - External vars
    
    private(set) var router: (QuestionRoutingLogic & QuestionDataPassing)?
    
    
    //MARK: - Internal vars
    
    
    private  var dataTodisplayQuestion = [QuestionModel]()
    private var category: QuizzModell?
    private var interactor: (QuestionBusinessLogic & QuestionStoreProtocol)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        let viewController = self
        let interactor = QuestionInteractor()
        let router = QuestionRouter()
        let presenter = QuestionPresenter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dataStore = interactor
        viewController.interactor = interactor
        viewController.router = router
        
    }
    
    
    
    //MARK: - quest
    
    
    var questionLabel: UILabel!
    var answer1Button: UIButton!
    var answer2Button: UIButton!
    var answer3Button: UIButton!
    var answer4Button: UIButton!
    
    var question: String = ""
    var correctAnswer: String = ""
    var wrongAnswers: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        interactor?.request()
        
        view.backgroundColor = .white
        
        setupQuestionLabel()
        setupAnswerButtons()
        
        setupQuestion(data: dataTodisplayQuestion[IndexPath.Element()])
        setupAnswers(data: dataTodisplayQuestion[IndexPath.Element()])
    }
    //MARK: - SETUP Question
    
    func setupQuestionLabel() {
        questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.textAlignment = .center
        questionLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(questionLabel)
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupAnswerButtons() {
        answer1Button = UIButton(type: .system)
        answer1Button.translatesAutoresizingMaskIntoConstraints = false
        answer1Button.setTitleColor(.black, for: .normal)
        answer1Button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        view.addSubview(answer1Button)
        
        answer2Button = UIButton(type: .system)
        answer2Button.translatesAutoresizingMaskIntoConstraints = false
        answer2Button.setTitleColor(.black, for: .normal)
        answer2Button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        view.addSubview(answer2Button)
        
        answer3Button = UIButton(type: .system)
        answer3Button.translatesAutoresizingMaskIntoConstraints = false
        answer3Button.setTitleColor(.black, for: .normal)
        answer3Button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        view.addSubview(answer3Button)
        
        answer4Button = UIButton(type: .system)
        answer4Button.translatesAutoresizingMaskIntoConstraints = false
        answer4Button.setTitleColor(.black, for: .normal)
        answer4Button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        view.addSubview(answer4Button)
        
        NSLayoutConstraint.activate([
            answer1Button.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
            answer1Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            answer1Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            answer2Button.topAnchor.constraint(equalTo: answer1Button.bottomAnchor, constant: 10),
            answer2Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            answer2Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            answer3Button.topAnchor.constraint(equalTo: answer2Button.bottomAnchor, constant: 10),
            answer3Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            answer3Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            answer4Button.topAnchor.constraint(equalTo: answer3Button.bottomAnchor, constant: 10),
            answer4Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            answer4Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    func setupQuestion(data: QuestionModel) {
        
        questionLabel.text = data.question
        
    }
    
    func setupAnswers(data: QuestionModel) {
        // Здесь вы можете создать случайные ответы, один из которых будет правильным, а остальные неправильными
        correctAnswer = data.correctAnswer
        wrongAnswers = data.wrongAnswers
        
        // Mix answers randomly
        let allAnswers = [correctAnswer] + wrongAnswers
        let shuffledAnswers = allAnswers.shuffled()
        
        answer1Button.setTitle(shuffledAnswers[0], for: .normal)
        answer2Button.setTitle(shuffledAnswers[1], for: .normal)
        answer3Button.setTitle(shuffledAnswers[2], for: .normal)
        answer4Button.setTitle(shuffledAnswers[3], for: .normal)
    }
    
    @objc func answerButtonTapped(_ sender: UIButton) {
        let selectedAnswer = sender.currentTitle ?? ""
        if selectedAnswer == correctAnswer {
            // Responsible, according to everyday reading with confirmation
            let alertController = UIAlertController(title: "Правильный ответ!", message: "Вы ответили верно.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}
        
    
        
        //MARK: - DisplayLogic
extension QuestionScreenViewController: QuestionDisplayLogic{
   
    func display(data: QuizzDataModel) {
        dataTodisplayQuestion = data.questionModel
        category = data.quizzModel
                
    }
    
   
    
          
}
    
    

