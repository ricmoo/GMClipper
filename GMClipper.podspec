#
# Be sure to run `pod lib lint GMClipper.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GMClipper"
  s.version          = "0.1.0"
  s.summary          = "A simple Objective-C wrapper for Clipper, a polygon clipping and offsetting library."
  s.description      = <<-DESC
                       The Clipper Library performs clipping, and offsetting of both lines and polygons.

                       Features:
                         - it accepts all types of polygons including self-intersecting ones
                         - supports multiple polygon filling rules (EvenOdd, NonZero, Positive, Negative)
                         - very fast relative to other libraries
                         - numerically robust
                         - performs line and polygon offsetting
                         - free to use in both freeware and commercial applications

                       DESC
  s.homepage         = "https://github.com/ricmoo/GMClipper"
  s.license          = 'Boost Software License'
  s.author           = { "Richard Moore" => "me@ricmoo.com" }
  s.source           = { :git => "https://github.com/ricmoo/GMClipper.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  #s.resource_bundles = {
  #  'GMClipper' => ['Pod/Assets/*.png']
  #}

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
