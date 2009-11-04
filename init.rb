require File.join(File.dirname(__FILE__), "lib", "theme")
require File.join(File.dirname(__FILE__), "lib", "flash_helper")
ActionView::Base.send(:include, Theme::ThemeHelper)
ActionView::Base.send(:include, FlashHelper)