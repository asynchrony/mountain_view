module MountainView
  class StyleController < ::ApplicationController
    layout "mountain_view"
    helper StyleguideHelper

    def show
      @styles = []
      parser = DssParser.new("#{Rails.root}/app/assets/stylesheets")
      styleguide = parser.get_dss

      styleguide.each do |style|
        @styles << style if style.section == params[:id]
      end
    end
  end
end
