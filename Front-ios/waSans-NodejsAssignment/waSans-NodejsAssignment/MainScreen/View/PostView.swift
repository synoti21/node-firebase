//
//  PostViewController.swift
//  waSans-NodejsAssignment
//
//  Created by 안지완 on 2023/01/19.
//

import UIKit
import SnapKit

class PostViewController: UIViewController {
    
    var targetPost: PostModel?
    var targetPostTagArr: Array<String>?
    
    let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    let contentView = UIView()
    
    let postTitle: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 32.0)
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        
        return label
    }()
    
    let writerLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18.0)
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13.0)
        label.textColor = .secondaryColor
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        
        return label
    }()
    
    let postTag: UICollectionView = { //음식 해쉬태그 콜렉션 뷰
        let viewLayout = LeftAlignedCollectionViewFlowLayout() ///왼쪽으로 해쉬태그 버튼 정렬하기 위한 레이아웃
        viewLayout.minimumLineSpacing = 12
        viewLayout.minimumInteritemSpacing = 12 //버튼 간 간격
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: viewLayout)
        collectionView.isScrollEnabled = false
        collectionView.collectionViewLayout = viewLayout
        collectionView.backgroundColor = .white
        collectionView.allowsMultipleSelection = true

        let items = collectionView.indexPathsForSelectedItems ///선택한 아이템을 가져오기 위한 용도
        
        return collectionView
    }()
    
    let postContextField: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = .boldSystemFont(ofSize: 15.0)
        textView.textAlignment = .left
        textView.adjustsFontForContentSizeCategory = true
        
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadContext()
        addview()
        setLayout()
        setAttributes()

        // Do any additional setup after loading the view.
    }
    
    private func loadContext(){
        guard let postData = targetPost else {return}
        print(postData)
        
        guard let postDate = String(describing: postData.date).toDate() else {return}
        

        
       
       
        
        postTitle.text = postData.title
        writerLabel.text = postData.writer
        targetPostTagArr = postData.tag
        postContextField.text = postData.context
        
        
        dateLabel.text = "Updated on : \(postDate)"
        
    }
    
    private func addview(){
        [postTitle, writerLabel, postTag, dateLabel, postContextField].forEach{
            view.addSubview($0)
        }
       
    }
    
    private func setLayout(){
        
        postTitle.snp.makeConstraints{
            $0.top.equalToSuperview().inset(102)
            $0.leading.equalToSuperview().inset(20)
        }
        
        writerLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(postTitle.snp.bottom).offset(12)
        }
        
        postTag.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(writerLabel.snp.bottom).offset(18)
        }
        postTag.heightAnchor.constraint(equalTo: postTag.widthAnchor, multiplier: 21/350).isActive = true
        
        dateLabel.snp.makeConstraints{
            $0.top.equalTo(postTag.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(20)
        }
        
        postContextField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(dateLabel.snp.bottom).offset(20)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func adjustUITextViewHeight(arg : UITextView) {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
    
    private func setAttributes(){
        view.backgroundColor = .white
    }

}

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    let attributes = super.layoutAttributesForElements(in: rect)
    
    var leftMargin = sectionInset.left
    var maxY: CGFloat = -1.0
    attributes?.forEach { layoutAttribute in
      if layoutAttribute.representedElementCategory == .cell {
        if layoutAttribute.frame.origin.y >= maxY {
          leftMargin = sectionInset.left
        }
        layoutAttribute.frame.origin.x = leftMargin
        leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
        maxY = max(layoutAttribute.frame.maxY, maxY)
      }
    }
    return attributes
  }
}

extension String {
    func toDate() -> Date? { //"yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
}


extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: self)
    }
}
