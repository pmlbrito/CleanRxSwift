# Podfile
platform :ios, '10.0'
use_frameworks!

def cleanrxswift_pods
	pod 'RxSwift',    '~> 3.0'
    pod 'RxCocoa',    '~> 3.0'
    pod 'QuickShotUtils', :git => 'https://github.com/pmlbrito/QuickShotUtils.git'
    pod 'SnapKit'
    pod 'SwiftyUserDefaults'
    pod 'Locksmith'
    pod 'Kingfisher'
    pod "AsyncSwift"
    pod 'SwiftEventBus', :tag => '2.1.2', :git => 'https://github.com/cesarferreira/SwiftEventBus.git'
    pod 'Swinject', '2.0.0-beta.2'
    pod 'RxAlamofire'
    pod 'CryptoSwift'
    pod 'AlamofireObjectMapper', '~> 4.0'
end

target 'CleanRxSwift' do
    cleanrxswift_pods
end

# RxTests and RxBlocking make the most sense in the context of unit/integration tests
target 'CleanRxSwiftTests' do
    cleanrxswift_pods
end