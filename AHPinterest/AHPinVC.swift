//
//  ViewController.swift
//  AHPinterest
//
//  Created by Andy Hurricane on 3/26/17.
//  Copyright © 2017 AndyHurricane. All rights reserved.
//

import UIKit

class AHPinVC: AHCollectionVC {
    let pinContentLayout = AHPinContentLayout()
    let pinLayout = AHPinLayout()
    let refreshLayout = AHRefreshLayout()
    
    let pinDataSource = AHPinDataSource()
    
    
    let optionsHandler = AHOptionsHandler()

}


// MARK:- VC Cycles
extension AHPinVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.contentInset = AHCollectionViewInset
        collectionView?.register(AHRefreshHeader.self, forSupplementaryViewOfKind: AHHeaderKind, withReuseIdentifier: AHHeaderKind)
        
        collectionView?.register(AHRefreshFooter.self, forSupplementaryViewOfKind: AHFooterKind, withReuseIdentifier: AHFooterKind)
        
        
        
        setupPinContent()
        setupPinLayout()
        setupRefreshLayout()
        setupOptionsHandler()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AHRefershUI.show()
        pinDataSource.loadNewData(completion: { (success) in
            AHRefershUI.dismiss()
            if success {
                // dismiss refresh control
            }else{
                // do something about it and dismiss refresh control too
            }
        })
    }
}

// MARK:- Setups
extension AHPinVC {
    func setupPinContent() {
        let contentHanlder = AHPinContentHandler()
        pinContentLayout.delegate = contentHanlder
        addLayout(layout: pinContentLayout, delegate: contentHanlder, dataSource: contentHanlder)
    }
    
    func setupRefreshLayout() {
        let layoutHanlder = AHRefreshLayoutHandler()
        layoutHanlder.pinVC = self
        refreshLayout.delegate = layoutHanlder
        refreshLayout.enableFooterRefresh = true
        refreshLayout.enableHeaderRefresh = true
        addGlobelSupplement(layout: refreshLayout, delegate: layoutHanlder, dataSource: layoutHanlder)
    }
    
    func setupPinLayout() {
        pinDataSource.pinVC = self
        
        let pinDelegate = AHPinDelegate()
        
        let layoutHanlder = AHLayoutHandler()
        layoutHanlder.pinVC = self
        pinLayout.delegate = layoutHanlder
        
        addLayout(layout: pinLayout, delegate: pinDelegate, dataSource: pinDataSource)
    }
    
    func setupOptionsHandler() {
        optionsHandler.pinVC = self
        optionsHandler.collectionView = collectionView
    }
    
}




