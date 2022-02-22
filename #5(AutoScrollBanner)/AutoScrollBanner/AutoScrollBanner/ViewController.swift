//
//  ViewController.swift
//  AutoScrollBanner
//
//  Created by 유준용 on 2022/02/02.
//

import UIKit

class ViewController: UIViewController {
    var nowPage = 0
    
    @IBOutlet weak var BannerCollectionView: UICollectionView!

    @IBAction func onePage(_ sender: Any) {
        
        self.nowPage += 1
        print("nowPage: ",nowPage)
        self.BannerCollectionView.scrollToItem(at: IndexPath(item: nowPage, section: 0), at: .right, animated: true)

//        DispatchQueue.main.async {
//            self.BannerCollectionView.scrollToItem(at: IndexPath(item: nowPage, section: 0), at: .right, animated: true)
//        }

  
    }
    @IBAction func zeroPage(_ sender: Any) {
        
        self.nowPage -= 1
        print("nowPage: ",nowPage)

        self.BannerCollectionView.scrollToItem(at: IndexPath(item: nowPage, section: 0), at: .right, animated: true)

//        DispatchQueue.main.async {
//            self.BannerCollectionView.scrollToItem(at: IndexPath(item: nowPage, section: 0), at: .right, animated: true)
//        }

    }
    lazy var data = dataSet()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureBannerColectionView()
    }
    override func loadView() {
        print("##")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        BannerCollectionView.scrollToItem(at: IndexPath(item: 3, section: 0), at: .right, animated: true)
    }
    private func configureBannerColectionView() {
//        BannerCollectionView.delegate = self
        BannerCollectionView.dataSource = self
        BannerCollectionView.isScrollEnabled = true
        BannerCollectionView.isPagingEnabled = true
        let nib = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
        self.BannerCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let idx = indexPath.row
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? BannerCollectionViewCell else{return UICollectionViewCell()}
        cell.cellUIView.backgroundColor = data.color[idx]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height:  collectionView.frame.height)
    }
    
    
    
}

extension ViewController{
    struct dataSet{
        let color = [UIColor.red , UIColor.blue, UIColor.green, UIColor.brown]
    }
}
