# frozen_string_literal: true

module ZestuiLucideRails
  module RailsHelper
    def zui_lucide_icon(named, **options)
      content_tag(:svg,
                  IconProvider.icon(named).html_safe,
                  ZestuiLucideRails.default_options.merge(**options))
    end
  end
end
