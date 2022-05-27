//
//  ViewController.swift
//  09.UIPageControl
//
//  Created by 유준용 on 2022/05/13.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - UI Components
    let pageLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.text = "1"
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "01")
        return imageView
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.backgroundStyle = .automatic
        pageControl.currentPage = 1
        pageControl.numberOfPages = 6
        pageControl.pageIndicatorTintColor = .darkGray
        pageControl.currentPageIndicatorTintColor = .green
        pageControl.addTarget(self, action: #selector(pageChanged(_:)), for: .valueChanged)
        return pageControl
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }

    //MARK: - Page Control Method
    @objc func pageChanged(_ sender: UIPageControl){
        self.imageView.image = UIImage(named: "0\(sender.currentPage + 1)")
        self.pageLabel.text = "\(sender.currentPage + 1)"
    }
    // MARK: - Configure UI
    private func configureUI(){
        [imageView, pageControl, pageLabel].forEach {
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            pageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            pageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            pageControl.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])
    }

}

