//
//  TextFieldContentView.swift
//  Today
//
//  Created by 서찬호 on 2023/03/09.
//

import UIKit

class TextFieldContentView: UIView, UIContentView {
    struct Configuration: UIContentConfiguration {
        var text: String? = ""
        
        func makeContentView() -> UIView & UIContentView {
            return TextFieldContentView(self)
        }
    }
    let textField = UITextField()
    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration: configuration)
        }
    }
    
    // intrinsicContentSize : 본질적인 내용의 크기 (대부분의 View들은 기본적으로 컨텐츠의 크기만큼의 size를 가짐)
    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }
    
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        // 텍스트 필드는 슈퍼뷰의 상단에 고정되며 상단 및 하단 인세트가 0이면 텍스트 필드가 슈퍼뷰의 전체 높이에 걸쳐 있도록 합니다
        addPinnedSubview(textField, insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        // 이 속성은 텍스트 필드에 콘텐츠가 있을 때 후행 쪽에 텍스트 지우기 버튼을 표시
        textField.clearButtonMode = .whileEditing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        textField.text = configuration.text
    }
}

extension UICollectionViewListCell {
    func textFieldConfiguration() -> TextFieldContentView.Configuration {
        TextFieldContentView.Configuration()
    }
}
