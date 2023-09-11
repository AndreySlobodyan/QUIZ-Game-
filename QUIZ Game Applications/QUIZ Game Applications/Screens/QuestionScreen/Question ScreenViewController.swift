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
    private var currentQuestionIndex: Int = 0
    private var wrongQuestionScore: Int = 0
    private var correctQuestionScore: Int = 0
    private var interactor: (QuestionBusinessLogic & QuestionStoreProtocol)?
    //MARK: - quest
    
    let buttonStackView = UIStackView()
    let questionLabel = UILabel()
    let answer1Button: UIButton = {
        let button1  = UIButton(type: .system)
        button1.setTitleColor(.black, for: .normal)
        return button1
    }()
    let answer2Button: UIButton = {
        let button2  = UIButton(type: .system)
        button2.setTitleColor(.black, for: .normal)
        return button2
    }()
    let answer3Button: UIButton = {
        let button3  = UIButton(type: .system)
        button3.setTitleColor(.black, for: .normal)
        return button3
    }()
    let answer4Button: UIButton = {
        let button4  = UIButton(type: .system)
        button4.setTitleColor(.black, for: .normal)
        return button4
    }()
    let question: String = ""
    var correctAnswer: String = ""
    var wrongAnswers: [String] = []
    
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
        router.viewController = viewController
        viewController.router = router
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(buttonStackView)
        view.backgroundColor = .lightGray
        interactor?.request()
        view.backgroundColor = .white
        setupQuestionLabel()
        setupAnswerButtons()
        setupQuestion(data: dataTodisplayQuestion[IndexPath.Element()])
        setupAnswers(data: dataTodisplayQuestion[IndexPath.Element()])
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - SETUP Question
    
    func setupQuestionLabel() {
        
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
        
        answer1Button.translatesAutoresizingMaskIntoConstraints = false
        answer1Button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        buttonStackView.addArrangedSubview(answer1Button)
        
        answer2Button.translatesAutoresizingMaskIntoConstraints = false
        answer2Button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        buttonStackView.addArrangedSubview(answer2Button)
        
        answer3Button.translatesAutoresizingMaskIntoConstraints = false
        answer3Button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        buttonStackView.addArrangedSubview(answer3Button)
        
        answer4Button.translatesAutoresizingMaskIntoConstraints = false
        answer4Button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        buttonStackView.addArrangedSubview(answer4Button)
        
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .fillEqually
        buttonStackView.alignment = .fill
        buttonStackView.spacing = 10
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 30),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -128)])
    }
    
    func setupQuestion(data: QuestionModel) {
        
        questionLabel.text = data.question
    }
    
    func setupAnswers(data: QuestionModel) {
        
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
    
    //display the next question
    private func displayNextQuestion() {
        
        guard currentQuestionIndex < dataTodisplayQuestion.count else {
            if presentationController != nil {
                dismiss(animated: false){
                    let alertController = UIAlertController(title: "Score:", message: "Correct: \(self.correctQuestionScore) Wrong: \(self.wrongQuestionScore)", preferredStyle: .alert)
                    let nextAction = UIAlertAction(title: "Сomplete", style: .default){ [weak self] _ in
                        self?.router?.navigateToQuizz()
                    }
                    alertController.addAction(nextAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            return }
        let currentQuestion = dataTodisplayQuestion[currentQuestionIndex]
        setupQuestion(data: currentQuestion)
        setupAnswers(data: currentQuestion)
    }
    // AlertController implementation
    @objc func answerButtonTapped(_ sender: UIButton) {
        
        let selectedAnswer = sender.currentTitle ?? ""
        if selectedAnswer == correctAnswer {
            let alertController = UIAlertController(title: "Правильный ответ!", message: "Вы ответили верно.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default){ (_) in
                self.currentQuestionIndex += 1
                self.displayNextQuestion()
            }
            alertController.addAction(okAction)
            present(alertController, animated: true)
            correctQuestionScore += 1
        } else {
            let alerttController = UIAlertController(title: "Ответ не правильный !", message: "Вы ответили не верно.", preferredStyle: .alert)
            let wrongAction = UIAlertAction(title: "OK", style: .default) { (_) in
                self.currentQuestionIndex += 1
                self.displayNextQuestion()
            }
            alerttController.addAction(wrongAction)
            present(alerttController, animated: true)
            wrongQuestionScore += 1
        }
    }
}
//MARK: - DisplayLogic

extension QuestionScreenViewController: QuestionDisplayLogic {
    
    func display(data: QuizzDataModel) {
        dataTodisplayQuestion = data.questionModel
        category = data.quizzModel
    }
}



