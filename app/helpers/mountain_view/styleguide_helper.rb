module MountainView
  require 'dss_parser'

  module StyleguideHelper
    def mv_components
      Dir.glob(Rails.root.join("app", "components", "*")).map do |component_dir|
        MountainView::Component.new File.basename(component_dir)
      end
    end

    def mv_style_sections
      styles = []

      parser = DssParser.new("#{Rails.root}/app/assets/stylesheets")
      styleguide = parser.get_dss

      styleguide.each do |style|
        puts styles.inspect
        styles << style.section unless styles.include?(style.section)
      end

      return styles
    end
  end
end
