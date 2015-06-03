module MountainView
  require 'redcarpet'

  class Component
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def title
      @name.humanize
    end

    def styleguide_stubs
      YAML.load_file stubs_file
    end

    def styleguide_description
      if File.exists? description_file
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
        markdown.render(IO.read(description_file))
      end
    end

    def stubs_file
      Rails.root.join("app/components/#{name}/#{name}.yml")
    end

    def description_file
      Rails.root.join("app/components/#{name}/#{name}.md")
    end

    def stubs?
      styleguide_stubs.is_a?(Array) && styleguide_stubs.any?
    rescue Errno::ENOENT
      false
    end
  end
end
