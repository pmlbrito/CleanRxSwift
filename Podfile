# Podfile
platform :ios, '8.0'
use_frameworks!

def cleanrxswift_pods
	pod 'RxSwift',    '~> 2.0'
    pod 'RxCocoa',    '~> 2.0'
    pod 'QuickShotUtils', :git => 'https://github.com/pmlbrito/QuickShotUtils.git'
    pod 'SnapKit'
    pod 'SwiftyUserDefaults'
    pod 'Locksmith'
    pod 'Kingfisher'
    pod "AsyncSwift"
    pod 'SwiftEventBus', :git => 'https://github.com/cesarferreira/SwiftEventBus.git'
    pod 'Swinject', '~> 1.1.0'
end

target 'CleanRxSwift' do
    cleanrxswift_pods
end

# RxTests and RxBlocking make the most sense in the context of unit/integration tests
target 'CleanRxSwiftTests' do
    cleanrxswift_pods
end