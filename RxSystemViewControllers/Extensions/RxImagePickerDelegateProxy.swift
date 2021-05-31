//
//  RxImagePickerDelegateProxy.swift
//  SystemViewControllers
//
//  Created by Jonatan Eduardo de Araujo on 07/04/21.
//

#if os(iOS)

import RxSwift
import RxCocoa
import UIKit

open class RxImagePickerDelegateProxy
    : RxNavigationControllerDelegateProxy, UIImagePickerControllerDelegate {

    public init(imagePicker: UIImagePickerController) {
        super.init(navigationController: imagePicker)
    }

}

#endif
