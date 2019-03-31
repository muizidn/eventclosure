Pod::Spec.new do |spec|

  spec.name         = "EventClosure"
  spec.version      = "0.0.2"
  spec.summary      = "A closure way to handle UIControl.Event"

  spec.description  = <<-DESC
Make your UIControl.Event handling #selector to be a closure
                   DESC

  spec.homepage     = "https://github.com/muizidn/eventclosure"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Muhammad Muizzsuddin" => "muiz.idn@gmail.com" }

  spec.ios.deployment_target = "9.0"
  spec.swift_version = "4.2"

  spec.source        = { :git => "https://github.com/muizidn/eventclosure.git", :tag => "#{spec.version}" }
  spec.source_files  = "EventClosure/**/*.{h,m,swift}"

end