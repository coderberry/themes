module FlashHelper
  
  def display_flash(flash)
    ret = []
    flash.each do |name, msg|
      ret << content_tag(:div, msg, :id => "flash_#{name}")
    end
    ret
  end
  
end