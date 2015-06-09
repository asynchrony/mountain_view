module ApplicationHelper
  def styled_markup(name, markup)
    if name.starts_with?('.')
      return markup.gsub(/\$modifier/, name.gsub(/^\./, ''))
    elsif name.starts_with?(':')
      return markup.gsub(/\$modifier/, "pseudo-class-#{name.gsub(/^\:/, '')}")
    end
  end
end
