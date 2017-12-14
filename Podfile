platform :ios, '11.0'
use_frameworks!

def common_pods
	pod 'Alamofire', '~> 4.5'
end

def mocking_pods
	pod 'Mockingjay', :git => 'https://github.com/feliperuzg/Mockingjay.git', :branch => 'noXCTests'
end

target 'CleanExample' do
	common_pods
	mocking_pods
end

target 'CleanExampleTests' do
	common_pods
	mocking_pods
end

target 'CleanExampleUITests' do
	common_pods
	mocking_pods
end
