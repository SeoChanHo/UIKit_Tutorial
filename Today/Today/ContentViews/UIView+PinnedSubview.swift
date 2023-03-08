//
//  UIView+PinnedSubview.swift
//  Today
//
//  Created by 서찬호 on 2023/03/09.
//

import UIKit

extension UIView {
    func addPinnedSubview(_ subview: UIView, height: CGFloat? = nil, insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)) {
        // addSubview : 뷰 위에 서브뷰 추가
        addSubview(subview)
        // 자동 제약 조건 생성 여부
        subview.translatesAutoresizingMaskIntoConstraints = false
        // 상단 앵커 제약 조건을 추가하고 활성화하여 하외 뷰를 상위 뷰 상단에 고정합니다
        // isActive 에 true를 할당하면 뷰 계층 구조의 공통 조상에 제약 조건이 추가된 다음 활성화 됩니다
        subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top).isActive = true
        subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left).isActive = true
        subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1.0 * insets.right).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1.0 * insets.bottom).isActive = true
        /// equalTo : 매개변수로 들어오는 부분과 맞닿게 constraint를 잡아요.
        /// equalTo, constant : 매개변수로 들어오는 부분과 constant만큼 떨어진 곳에 constraint를 잡아요.
        /// equalToConstant : 매개변수에 숫자를 넣어서 크기를 정해요.(height, width)
        /// 해당 매개변수말고도 lessThan, GreaterThan 등이 있어서 다양하게 설정할 수 있어요.
        
        // 하위뷰는 상위뷰의 상단과 하단에 고정되어 있기 때문에 하위 뷰의 높이를 조정하면 상위뷰도 높이를 조정해야 한다
        // 그래서 명시적으로 함수에 높이를 제공하는 경우 하위뷰를 해당 높이로 제한한다
        if let height {
            subview.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
}
