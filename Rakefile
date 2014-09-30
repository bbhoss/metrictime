# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/osx'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'metrictime'
  app.info_plist['LSUIElement'] = true
  app.identifier = "metrictime"
  app.codesign_certificate = '3rd Party Mac Developer Application: Preston Marshall (XS2N5VD7TF)'
  app.info_plist["CFIconBundleFile"] = "AppIcon.icns"
  app.icon = "AppIcon.icns"
  app.entitlements['com.apple.security.app-sandbox'] = true
end
