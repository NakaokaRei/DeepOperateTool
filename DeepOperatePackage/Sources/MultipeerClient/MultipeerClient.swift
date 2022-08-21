//
//  MultipeerClient.swift
//  
//
//  Created by NakaokaRei on 2022/08/20.
//

import Foundation
import MultipeerConnectivity

class MultipeerClient {
    
    private let serviceType = "DeepOperateTool"
    private let myPeerID = MCPeerID(displayName: UIDevice.current.name)
    private var session: MCSession!
    private var serviceAdvertiser: MCNearbyServiceAdvertiser!
    private var serviceBrowser: MCNearbyServiceBrowser!
    private var connectedPeers: [MCPeerID] {
        return session.connectedPeers
    }
    
    init() {
        session = MCSession(peer: myPeerID, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self

        serviceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerID, discoveryInfo: nil, serviceType: MultipeerSession.serviceType)
        serviceAdvertiser.delegate = self
        serviceAdvertiser.startAdvertisingPeer() // サービスへの参加意思を周りに伝えることを開始
        

        serviceBrowser = MCNearbyServiceBrowser(peer: myPeerID, serviceType: MultipeerSession.serviceType)
        serviceBrowser.delegate = self
        serviceBrowser.startBrowsingForPeers() // 近くのピアの検索を開始
    }

}
