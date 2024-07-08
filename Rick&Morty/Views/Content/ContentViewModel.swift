//
//  ContentViewModel.swift
//  Rick&Morty
//
//  Created by Yessimkhan Zhumash on 08.07.2024.
//

import Foundation
import FirebaseRemoteConfigInternal

final class ContentViewModel: ObservableObject {
    
    var remoteConfig = RemoteConfig.remoteConfig()
    @Published var needForceUpdate: Bool = false
    
    init() {
        let setting = RemoteConfigSettings()
        setting.minimumFetchInterval = 0
        remoteConfig.configSettings = setting
        remoteConfig.fetchAndActivate { status, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                if status != .error {
                    self.needForceUpdate = self.remoteConfig["needForceUpdate"].boolValue
                    print("needForceUpdate: \(self.needForceUpdate)")
                }
            }
        }
    }
    
}
