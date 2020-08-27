# frozen_string_literal: true

require 'victor'
require 'repo_small_badge/configuration'

module RepoSmallBadge
  # Class that creates the Badge SVG image.
  # Behaviour is defined by the configuration hash.
  # For the different configurables see RepoSmallBadge::Configuration.
  class Image < Victor::SVGBase
    # Create new instance.
    # @config is a Hash of configurables. Keys are symbols.
    def initialize(config = {})
      @config = Configuration.new(config)
      super(template: :html, contentScriptType: 'text/ecmascript',
            contentStyleType: 'text/css', preserveAspectRatio: 'xMidYMid meet',
            version: '1.0',
            height: @config.badge_height, width: @config.badge_width)
    end

    # Creates the badge.
    # @name the suffix for the filename (badge_#{name})
    # @title the title of the badge.
    # @value is the overall value to be written to the right side of the badge.
    def badge(name, title, value)
      svg_header
      svg_rounded_box
      svg_boxes
      svg_title(title)
      svg_value(value)
      save(@config.filename(name))
    end

    # Updates the configuration settings and overwrites existing ones.
    # @config the hash that has to be merged.
    def config_merge(config)
      @config.merge!(config)
    end

    private

    def svg_header
      element :linearGradient, id: 'smooth', x2: '0', y2: @config.badge_width do
        element :stop, offset: '0', 'stop-color': '#bbb', 'stop-opacity': '.1'
        element :stop, offset: '1', 'stop-opacity': '.1'
      end
    end

    # rubocop:disable Metrics/MethodLength
    def svg_boxes
      element :g, 'clip-path' => 'url(#round)' do
        element :rect, height: @config.badge_height,
                       width: @config.badge_middle,
                       fill: @config.title_background
        element :rect, x: @config.badge_middle,
                       height: @config.badge_height,
                       width: @config.badge_middle,
                       fill: @config.value_background
        element :rect, height: @config.badge_height,
                       width: @config.badge_width, fill: 'url(#smooth)'
      end
      # rubocop:enable Metrics/MethodLength
    end

    def svg_rounded_box
      element :clipPath, id: 'round' do
        element :rect, height: @config.badge_height, width: @config.badge_width,
                       rx: @config.rounded_edge_radius, fill: @config.background
      end
    end

    # rubocop:disable Metrics/AbcSize
    def svg_title(title)
      element :g, fill: @config.title_color, 'text-anchor': 'middle',
                  'font-family': @config.title_font,
                  'font-size': @config.title_font_size do |_svg|
        element :text, @config.title(title),
                x: @config.badge_middle / 2, y: @config.badge_height - 5,
                fill: '#010101', 'fill-opacity': '0.3'
        element :text, @config.title(title),
                x: @config.badge_middle / 2, y: @config.badge_height - 6
      end
    end

    # rubocop:disable Metrics/MethodLength
    def svg_value(value)
      element :g, fill: @config.value_color, 'text-anchor': 'middle',
                  'font-family': @config.value_font,
                  'font-size': @config.value_font_size do |_svg|
        element :text, value,
                x: @config.badge_middle / 2 + @config.badge_middle,
                y: @config.badge_height - 5,
                fill: '#010101', 'fill-opacity': '0.3'
        element :text, value,
                x: @config.badge_middle / 2 + @config.badge_middle,
                y: @config.badge_height - 6
      end
    end
    # rubocop:enable Metrics/MethodLength
    # rubocop:enable Metrics/AbcSize
  end
end
