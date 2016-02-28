Pod::Spec.new do |s|
    s.name = 'NFIFramework'
    s.version = '0.0.1'
    s.license = 'Apache V2'
    s.summary = 'Clean Code Architecture Framework for iOS written in Objective-C'
    s.homepage = 'https://github.com/pedro-lopez/NFIFramework'
    s.authors = {'Pedro Lopez' => 'pedrodavidlopez@icloud.com' }
    s.ios.deployment_target = '8.0'
    s.source = { :git => 'https://github.com/pedro-lopez/NFIFramework.git', :tag => s.version }
    s.source_files = 'NFIFramework/*.*'
    s.requires_arc = true
end
