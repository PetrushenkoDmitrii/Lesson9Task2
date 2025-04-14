//
//  ViewController.swift
//  lesson9 HW task2
//
//  Created by Дмитрий Петрушенко on 31/03/2025.
//
/*
 - На экране кружок по центру. Четыре кнопки - вверх, вниз, вправо,
влево. При нажатии кнопки кружок перемещается на фиксированное
расстояние. За края экрана не выходит, на кнопки не налезает. Используем фреймы, для перемещения кружочка, не констрейнты.
*/

import UIKit

class ViewController: UIViewController {

    private let circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 75
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private let buttonUP: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("↑", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private let buttonCenter: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private let buttonDown: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("↓", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private let buttonLeft: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("←", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private let buttonRight: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("→", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupActions()
    }

func setupUI() {
    view.addSubview(circleView)
    view.addSubview(buttonUP)
    view.addSubview(buttonCenter)
    view.addSubview(buttonDown)
    view.addSubview(buttonLeft)
    view.addSubview(buttonRight)
    
    NSLayoutConstraint.activate([
        circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        circleView.widthAnchor.constraint(equalToConstant: 150),
        circleView.heightAnchor.constraint(equalToConstant: 150)])
    
    
    NSLayoutConstraint.activate([
        buttonUP.widthAnchor.constraint(equalToConstant: 50),
        buttonUP.heightAnchor.constraint(equalToConstant: 50),
        buttonUP.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        buttonUP.bottomAnchor.constraint(equalTo: buttonCenter.topAnchor, constant: -5),])
    
    NSLayoutConstraint.activate([
        buttonCenter.widthAnchor.constraint(equalToConstant: 50),
        buttonCenter.heightAnchor.constraint(equalToConstant: 50),
        buttonCenter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        buttonCenter.bottomAnchor.constraint(equalTo: buttonDown.topAnchor, constant: -5),])
    
    NSLayoutConstraint.activate([
        buttonDown.widthAnchor.constraint(equalToConstant: 50),
        buttonDown.heightAnchor.constraint(equalToConstant: 50),
        buttonDown.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        buttonDown.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),])
    
    NSLayoutConstraint.activate([
        buttonLeft.widthAnchor.constraint(equalToConstant: 50),
        buttonLeft.heightAnchor.constraint(equalToConstant: 50),
        buttonLeft.topAnchor.constraint(equalTo: buttonCenter.topAnchor),
        buttonLeft.trailingAnchor.constraint(equalTo: buttonCenter.leadingAnchor, constant: -5),])
    
    NSLayoutConstraint.activate([
        buttonRight.widthAnchor.constraint(equalToConstant: 50),
        buttonRight.heightAnchor.constraint(equalToConstant: 50),
        buttonRight.topAnchor.constraint(equalTo: buttonCenter.topAnchor),
        buttonRight.leadingAnchor.constraint(equalTo: buttonCenter.trailingAnchor, constant: +5),])
    
    
    }
    func setupActions() {
        buttonUP.addTarget(self, action: #selector(handleButtonUP), for: .touchUpInside)
        
        buttonCenter.addTarget(self, action: #selector(handleButtonCenter), for: .touchUpInside)
        
        buttonDown.addTarget(self, action: #selector(handleButtonDown), for: .touchUpInside)
        
        buttonLeft.addTarget(self, action: #selector(handleButtonLeft), for: .touchUpInside)
        buttonRight.addTarget(self, action: #selector(handleButtonRight), for: .touchUpInside)
    }
    
    
   @objc
    private func handleButtonUP() {
        let screenHeight = UIScreen.main.bounds.height
        let Y = (screenHeight - circleView.frame.height)
        circleView.frame.origin.y -= 50
       if circleView.frame.minY < 0 || circleView.frame.minY > Y {
           circleView.frame.origin.y = 0
        }
    }
     
    @objc
     private func handleButtonCenter() {
         circleView.frame.origin.y = 300
         circleView.frame.origin.x = 130
         }
    
    @objc
    private func handleButtonDown() {
        let screenHeight = UIScreen.main.bounds.height
        let Y = (screenHeight - circleView.frame.height - buttonUP.frame.height - buttonDown.frame.height - buttonCenter.frame.height)
        circleView.frame.origin.y += 50
        if circleView.frame.minY < 0 || circleView.frame.minY > Y {
            circleView.frame.origin.y = 0
        }
    }
    
    @objc
    private func handleButtonLeft() {
        let screenWeight = UIScreen.main.bounds.width
        let X = (screenWeight - circleView.frame.width)
        circleView.frame.origin.x -= 50
        if circleView.frame.minX < 0 || circleView.frame.minX > X {
            circleView.frame.origin.x = 0
        }
    }
    
    @objc
    private func handleButtonRight() {
        let screenWeight = UIScreen.main.bounds.width
        let X = (screenWeight - circleView.frame.width)
        circleView.frame.origin.x += 50
        if circleView.frame.minX < 0 || circleView.frame.minX > X {
            circleView.frame.origin.x = 0
        }
    }
    
    }

#Preview(traits: .portrait) {
    ViewController()
    
}

