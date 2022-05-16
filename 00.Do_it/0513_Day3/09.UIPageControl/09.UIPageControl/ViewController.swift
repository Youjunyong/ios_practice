//
//  ViewController.swift
//  09.UIPageControl
//
//  Created by 유준용 on 2022/05/13.
//

import UIKit

class ViewController: UIViewController {

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
        pageControl.addTarget(self, action: #selector(pageChanged(_:)), for: .valueCshanged)
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }

    @objc func pageChanged(_ sender: UIPageControl){
        self.imageView.image = UIImage(named: "0\(sender.currentPage)")
    }
    private func configureUI(){
        [imageView, pageControl].forEach {
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            pageControl.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])
    }

}

