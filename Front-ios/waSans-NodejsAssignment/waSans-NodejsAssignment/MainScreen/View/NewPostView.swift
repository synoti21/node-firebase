//
//  NewPostViewController.swift
//  waSans-NodejsAssignment
//
//  Created by 안지완 on 2023/01/20.
//

import UIKit
import SnapKit

class NewPostViewController: UIViewController {
    
    let pageTitle: UILabel = {
        let label = UILabel()
        label.text = "새 게시글 작성"
        label.font = .boldSystemFont(ofSize: 30.0)
        label.textColor = .black
        
        return label
    }()
    
    let titleField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목"
        textField.font = .systemFont(ofSize: 18.0)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.adjustsFontForContentSizeCategory = true
        
        return textField
    }()
    
    let titleFieldLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lineColor
        
        return view
    }()
    
    let writerField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "작성자"
        textField.font = .systemFont(ofSize: 18.0)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.adjustsFontForContentSizeCategory = true
        
        return textField
    }()
    
    let writerFieldLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lineColor
        
        return view
    }()
    
    let contextField: UITextView = { ///textfield는 여러 줄 처리가 불가능하므로 textView로 대체
        let textView = UITextView()
        
        textView.isEditable = true
        textView.layer.borderColor = UIColor.lineColor.cgColor
        textView.font = UIFont.systemFont(ofSize: 18.0)
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 20.0
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 12, bottom: 16, right: 12);

        
        return textView
    }()
    
    let dateField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "날짜 (ex. 20201020)"
        textField.font = .systemFont(ofSize: 18.0)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.adjustsFontForContentSizeCategory = true
        
        return textField
    }()
    
    let dateFieldLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lineColor
        
        return view
    }()
    
    let tagField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "태그 (쉼표로 구분)"
        textField.font = .systemFont(ofSize: 18.0)
        textField.textColor = .lineColor
        textField.textAlignment = .left
        textField.adjustsFontForContentSizeCategory = true
        
        return textField
    }()
    
    let tagFieldLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lineColor
        
        return view
    }()
    
    let uploadButton: UIButton = {
        let button = UIButton()
        button.setTitle("새 게시글 등록하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 20.0
        button.backgroundColor = .primaryColor
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
        setAttributes()

        // Do any additional setup after loading the view.
    }
    
    private func addView(){
        [pageTitle, titleField, titleFieldLine, writerField, writerFieldLine, contextField, dateField, dateFieldLine, tagField, tagFieldLine, uploadButton].forEach({
            view.addSubview($0)
        })
    }
    
    private func setLayout(){
        pageTitle.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(20)
        }
        
        titleField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(pageTitle.snp.bottom).offset(43)
        }
        
        titleField.heightAnchor.constraint(equalTo: titleField.widthAnchor, multiplier: 22/350).isActive = true
        
        titleFieldLine.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(titleField.snp.bottom).offset(7)
            $0.height.equalTo(1)
        }
        
        writerField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(titleFieldLine.snp.bottom).offset(21)
        }
        
        writerField.heightAnchor.constraint(equalTo: writerField.widthAnchor, multiplier: 22/350).isActive = true
        
        writerFieldLine.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(writerField.snp.bottom).offset(7)
            $0.height.equalTo(1)
        }
        
        contextField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(writerFieldLine.snp.bottom).offset(21)
        }
        contextField.heightAnchor.constraint(equalTo: contextField.widthAnchor, multiplier: 197/350).isActive = true
        
        dateField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(contextField.snp.bottom).offset(21)
        }
        
        dateField.heightAnchor.constraint(equalTo: dateField.widthAnchor, multiplier: 22/350).isActive = true
        
        dateFieldLine.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(dateField.snp.bottom).offset(7)
            $0.height.equalTo(1)
        }
        
        tagField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(dateFieldLine.snp.bottom).offset(21)
        }
        
        tagField.heightAnchor.constraint(equalTo: tagField.widthAnchor, multiplier: 22/350).isActive = true
        
        tagFieldLine.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(tagField.snp.bottom).offset(7)
            $0.height.equalTo(1)
        }
        
        uploadButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(30)
        }
        uploadButton.heightAnchor.constraint(equalTo: uploadButton.widthAnchor, multiplier: 60/350).isActive = true
        
        contextField.text = "내용 입력"
        contextField.textColor = .lineColor
        
        
    }
    
    private func setAttributes(){
        view.backgroundColor = .white
    }
    
    func textViewDidBeginEditing (_ textView: UITextView) {
        if contextField.textColor == .lineColor && contextField.isFirstResponder {
            contextField.text = nil
            contextField.textColor = .black
        }
    }
    
    func textViewDidEndEditing (_ textView: UITextView) {
        if contextField.text.isEmpty || contextField.text == "" {
            contextField.textColor = .lineColor
            contextField.text = "내용 입력"
        }
    }

    

}
