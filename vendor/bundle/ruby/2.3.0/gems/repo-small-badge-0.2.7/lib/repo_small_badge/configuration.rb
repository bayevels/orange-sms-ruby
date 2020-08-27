# frozen_string_literal: true

module RepoSmallBadge
  # Hidden class to handle the interface to configuration
  class Configuration
    def initialize(config_hash)
      @config = config_hash
    end

    def merge!(new_config)
      @config.merge!(new_config)
    end

    def value_background
      @config.fetch(:value_background, '#4c1')
    end

    def value_color
      @config.fetch(:value_color, title_color)
    end

    def value_font
      @config.fetch(:value_font, font)
    end

    def value_font_size
      @config.fetch(:value_font_size, font_size)
    end

    def title_background
      @config.fetch(:title_background, '#555')
    end

    def background
      @config.fetch(:background, '#fff')
    end

    def title_font
      @config.fetch(:title_font, font)
    end

    def title_font_size
      @config.fetch(:title_font_size, font_size)
    end

    def title_color
      @config.fetch(:title_color, '#fff')
    end

    def font
      @config.fetch(:font, 'Verdana,sans-serif')
    end

    def font_size
      @config.fetch(:font_size, 11).to_s
    end

    def rounded_edge_radius
      if @config.fetch(:rounded_border, true)
        @config.fetch(:rounded_edge_radius, '3')
      else
        0
      end
    end

    def badge_width
      @config.fetch(:badge_width, 120).to_i
    end

    def badge_height
      @config.fetch(:badge_height, 20).to_i
    end

    def badge_middle
      badge_width / 2
    end

    def filename(suffix = '')
      prefix = @config.fetch(:filename_prefix, 'badge')
      format = @config.fetch(:format, 'svg')
      "#{output_path}/#{prefix}_#{suffix}.#{format}"
    end

    def title(suffix)
      prefix = @config.fetch(:title_prefix, '')
      if prefix.to_s.empty?
        suffix
      else
        "#{@config.fetch(:title_prefix, '')} #{suffix}"
      end
    end

    def output_path
      @config.fetch(:output_path, '.')
    end
  end
end
