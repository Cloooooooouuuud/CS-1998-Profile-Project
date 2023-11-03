//
//  EditProfileVC.swift
//  A2
//
//  Created by Vin Bui on 6/4/23.
//

import UIKit

class EditProfileVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let image = UIImageView()
    private let name = UILabel()
    private let bio = UILabel()
    private let hometownTitle = UILabel()
    private let hometown = UITextField()
    private let hometownText = UILabel()
    private let majorTitle = UILabel()
    private let major = UITextField()
    private let majorText = UILabel()
    private let saveButton = UIButton()
    
    // MARK: - Properties (data)
    
    private var hometown1 : String = ""
    private var major1 : String = ""
    private weak var delegate : updatePage?
    
    init(hometown1 : String, major1 : String, delegate : updatePage){
        self.hometown1 = hometown1
        self.major1 = major1
        self.delegate = delegate
        super.init(nibName: nil, bundle :nil)
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - viewDidLoad and init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Profile"
        view.backgroundColor = UIColor.a2.white
        
        setupImage()
        setupName()
        setupBio()
        setupHomeTitle()
        setupMajorTitle()
        //setupHometownText()
        setupHomeField()
        //setupMajorText()
        setupMajorField()
        setupSaveButton()
        
    }
    
    // MARK: - Set Up Views
    
    func setupSaveButton(){
    
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(UIColor.a2.white, for: .normal)
        saveButton.backgroundColor = UIColor.a2.ruby
        saveButton.layer.cornerRadius = 16
        
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            saveButton.heightAnchor.constraint(equalToConstant: 56),
            saveButton.bottomAnchor.constraint(equalTo: major.bottomAnchor, constant: 367),
            saveButton.widthAnchor.constraint(equalToConstant: 329)
        ])
        
        saveButton.addTarget(self, action: #selector(popVC), for: .touchUpInside)
    }
    
    
    @objc private func popVC(){
    
        navigationController?.popViewController(animated: true)
        delegate?.update(newHometown: hometown.text ?? "", newMajor: major.text ?? "")
    
    }
    
    func setupImage(){
        image.image = UIImage(named: "16229.pic")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.layer.cornerRadius = 48
        image.layer.masksToBounds = true
        view.addSubview(image)
        
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 128),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            image.heightAnchor.constraint(equalToConstant: 96),
            image.widthAnchor.constraint(equalToConstant: 96)

        ])
    }
    
    
    func setupName() {
        name.text = "Tianyi"
        name.textColor = UIColor.a2.black
        name.font = .systemFont(ofSize: 24, weight: .semibold)
        
        view.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 144)
        ])
    }
    
    
    func setupBio() {
        bio.text = "I love Cornell"
        bio.textColor = UIColor.a2.black
        
       // bio.font = .systemFont(ofSize: 14, weight: .normal)
        bio.font = .italicSystemFont(ofSize: 16)
        
        view.addSubview(bio)
        bio.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bio.topAnchor.constraint(equalTo: view.topAnchor, constant: 184),
            bio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 144)
        ])
    }
    
    
    func setupHomeTitle() {
        hometownTitle.text = "Hometown"
        hometownTitle.textColor = UIColor.a2.black
        hometownTitle.font = .systemFont(ofSize: 13, weight: .semibold)
        
        view.addSubview(hometownTitle)
        hometownTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hometownTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 264),
            hometownTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
        ])
    }
    
    
    func setupMajorTitle() {
        majorTitle.text = "Major"
        majorTitle.textColor = UIColor.a2.black
        majorTitle.font = .systemFont(ofSize: 13, weight: .semibold)
        
        view.addSubview(majorTitle)
        majorTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            majorTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 370),
            majorTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
        ])
    }
    
    
    func setupHomeField() {
        //hometown.placeholder = "   \(hometown1)"
        hometown.text = "   \(hometown1)"
        hometown.textColor = UIColor.a2.black
        hometown.font = .systemFont(ofSize: 14, weight: .regular)
        hometown.layer.borderWidth = 2
        hometown.layer.borderColor = UIColor.a2.silver.cgColor
        //hometown.layer.backgroundColor = UIColor.a2.white.cgColor
        hometown.layer.cornerRadius = 8
        
        view.addSubview(hometown)
        hometown.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hometown.topAnchor.constraint(equalTo: view.topAnchor, constant: 284),
            hometown.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            hometown.heightAnchor.constraint(equalToConstant: 40),
            //hometown.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 32)
            hometown.widthAnchor.constraint(equalToConstant: 329)
        ])
    }
    
    
//    func setupHometownText() {
//        hometownText.text = "   \(hometown1)"
//        hometownText.textColor = UIColor.a2.black
//
//        view.addSubview(hometownText)
//        hometownText.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            hometownText.topAnchor.constraint(equalTo: view.topAnchor, constant: 310),
//            hometownText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
//            //hometownText.heightAnchor.constraint(equalToConstant: 40),
//            //hometownText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 32)
//            //hometownText.widthAnchor.constraint(equalToConstant: 329)
//        ])
//    }
    
    func setupMajorField() {
        //major.placeholder = "   \(major1)"
        major.text = "   \(major1)"
        major.textColor = UIColor.a2.black
        major.font = .systemFont(ofSize: 14, weight: .regular)
        major.layer.borderWidth = 2
        major.layer.borderColor = UIColor.a2.silver.cgColor
        //major.layer.backgroundColor = UIColor.a2.white.cgColor
        major.layer.cornerRadius = 8
        
        view.addSubview(major)
        major.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            major.topAnchor.constraint(equalTo: view.topAnchor, constant: 410),
            major.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            major.heightAnchor.constraint(equalToConstant: 40),
            //major.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 32)
            major.widthAnchor.constraint(equalToConstant: 329)
        ])
    }
    
    
//    func setupMajorText(){
//        majorText.text = "   \(major1)"
//        majorText.textColor = UIColor.a2.black
//
//        view.addSubview(majorText)
//        majorText.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            majorText.topAnchor.constraint(equalTo: view.topAnchor, constant: 310),
//            majorText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
//            //hometownText.heightAnchor.constraint(equalToConstant: 40),
//            //hometownText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 32)
//            //hometownText.widthAnchor.constraint(equalToConstant: 329)
//        ])
//    }
    
    
}
