//
//  ProfileVC.swift
//  A2
//
//  Created by Vin Bui on 6/4/23.
//

import UIKit

protocol updatePage : AnyObject {
    func update(newHometown: String, newMajor: String)
}

class ProfileVC: UIViewController {
    
    // MARK: - Properties (view)
    private let title1 = UILabel();
    private let name = UILabel();
    private let bio = UILabel();
    private let hometownIcon = UIImageView();
    private let majorIcon = UIImageView();
    private let hometown = UILabel()
    private let major = UILabel()
    private let image = UIImageView()
    private let button = UIButton()
    
    
    // MARK: - Properties (data)
    private var hometown1 : String = "Mars"
    private var major1 : String = "Mars Development"



    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Profile"
        view.backgroundColor = UIColor.a2.white
        
        setupImage()
        setupName()
        setupBio()
        setuphomeicon()
        setupmajoricon()
        setuphome()
        setupmajor()
        setupEditBotton()
        
    }
    
    // MARK: - Set Up Views
    
    func setupEditBotton() {
    
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(UIColor.a2.white, for: .normal)
        button.backgroundColor = UIColor.a2.ruby
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
           
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            button.heightAnchor.constraint(equalToConstant: 56),
            button.bottomAnchor.constraint(equalTo: major.bottomAnchor, constant: 320),
            button.widthAnchor.constraint(equalToConstant: 329)
        ])
        
    }
    
    
    @objc private func pushVC() {
        let editPage = EditProfileVC(hometown1 : hometown1, major1 : major1, delegate : self)
        navigationController?.pushViewController(editPage, animated: true)
    }
    
    
    func setupImage(){
        image.image = UIImage(named: "16229.pic")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.layer.cornerRadius = 64
        image.layer.masksToBounds = true
        view.addSubview(image)
        
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 128),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 132),
            image.heightAnchor.constraint(equalToConstant: 128),
            image.widthAnchor.constraint(equalToConstant: 128)

        ])
    }
    
    
    func setupName() {
        name.text = "Tianyi"
        name.textColor = UIColor.a2.black
        name.font = .systemFont(ofSize: 32, weight: .semibold)
        
        view.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 32),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupBio() {
        bio.text = "I love Cornell"
        bio.textColor = UIColor.a2.black
        
       // bio.font = .systemFont(ofSize: 32, weight: .semibold)
        bio.font = .italicSystemFont(ofSize: 16)
        
        view.addSubview(bio)
        bio.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bio.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
            bio.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setuphomeicon() {
        hometownIcon.image = UIImage(named: "Home")
        hometownIcon.translatesAutoresizingMaskIntoConstraints = false
        hometownIcon.layer.masksToBounds = true
        
        view.addSubview(hometownIcon)
        
        NSLayoutConstraint.activate([
            hometownIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 340+83),
            hometownIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            hometownIcon.heightAnchor.constraint(equalToConstant: 24),
            hometownIcon.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func setupmajoricon() {
        majorIcon.image = UIImage(named: "Book And Pencil")
        majorIcon.translatesAutoresizingMaskIntoConstraints = false
        majorIcon.layer.masksToBounds = true
        
        view.addSubview(majorIcon)
        
        NSLayoutConstraint.activate([
            majorIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 388+83),
            majorIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            majorIcon.heightAnchor.constraint(equalToConstant: 24),
            majorIcon.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func setuphome() {
        hometown.text = hometown1
        hometown.textColor = UIColor.a2.black
        hometown.font = .systemFont(ofSize: 16, weight: .medium)
        
        view.addSubview(hometown)
        hometown.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hometown.topAnchor.constraint(equalTo: view.topAnchor, constant: 340+83),
            hometown.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 72)
        ])
    }
    
    func setupmajor() {
        major.text = major1
        major.textColor = UIColor.a2.black
        major.font = .systemFont(ofSize: 16, weight: .medium)
        
        view.addSubview(major)
        major.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            major.topAnchor.constraint(equalTo: view.topAnchor, constant: 388+83),
            major.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 72)
        ])
    }
    
}

extension ProfileVC: updatePage {

    func update(newHometown: String, newMajor: String){
        hometown1 = newHometown
        major1 = newMajor
        hometown.text = newHometown
        major.text = newMajor
    }

}

