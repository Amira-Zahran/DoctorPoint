//
//  OnboardingVC.swift
//  DR
//
//  Created by Amira Zahran on 01/06/2022.
//

import UIKit

extension UIButton{
    @IBInspectable var cornerRadius:CGFloat{
        get{
            return 0
        }
        set(value){
            self.layer.cornerRadius = value
        }
    }
}
extension UIViewController{
    func go_screens(_ story:String = "Main", id:String){
        let story = UIStoryboard(name: story, bundle: nil)
        let screen = story.instantiateViewController(identifier: id)
        navigationController?.pushViewController(screen, animated: true)
    }
    func finish(){
        navigationController?.popViewController(animated: true)
    }
}


class OnboardingVC: UIViewController {
    @IBOutlet weak var start_btn: UIButton!
    @IBOutlet weak var pageC: UIPageControl!
    @IBOutlet weak var collectionV: UICollectionView!
    
    var slides: [OnboardingSlid] = []
    var currentPage = 0 {
        didSet{
            pageC.currentPage = currentPage
            if currentPage == slides.count - 1 {
                start_btn.setTitle("Get started", for: .normal)
            } else {
                start_btn.setTitle("Nextt", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlid.init(title: "Thousands of doctors", description: "Access thousands of Doctors instantly.                                        You can easily contact with the doctors and contact for your needs.", image: "imgone"),
            
            OnboardingSlid(title: "Live talk with doctor", description: "Easily connect with doctor and start video chat for your better treatment & Prescription.", image: "imgtwo"),
        
            OnboardingSlid(title: "Chat with doctors", description: "Book an appointment with doctor. Chat with doctor via appointment letter. Get consultent.", image: "imgth")
            ]

    }
    
    @IBAction func btn(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            print("go to the next page")
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
        
    
}


extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardCollectionViewCell.identifier, for: indexPath)
            as! OnboardCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionV.frame.width, height: collectionV.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
