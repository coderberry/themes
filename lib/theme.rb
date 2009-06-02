module Theme
  module ThemeHelper
    include ActionView::Helpers::AssetTagHelper
    def use_theme(theme_name)
      stylesheet_link_tag "/themes/base.css", "/themes/#{theme_name}/css/style.css"
    end
  end
end