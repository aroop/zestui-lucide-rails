# frozen_string_literal: true

require "active_support/gzip"
require_relative "zestui-lucide-rails/version"
require_relative "zestui-lucide-rails/icon_provider"
if defined?(Rails)
  require_relative "zestui-lucide-rails/rails_helper"
  require_relative "zestui-lucide-rails/railtie"
end

module ZestuiLucideRails
  # Extracted from options contained in svg tags from original/*.svg
  DEFAULT_OPTIONS = {
    "aria-hidden" => "true",
    "width" => "24",
    "height" => "24",
    "viewBox" => "0 0 24 24",
    "fill" => "none",
    "stroke" => "currentColor",
    "stroke-width" => "2",
    "stroke-linecap" => "round",
    "stroke-linejoin" => "round"
  }.freeze

  module_function

  # Public: Defines the default provider for icons. The library can either load
  # icons from the filesystem as required, or use a memory cache for all icons,
  # avoiding filesystem accesses for each required icon on the cost of a
  # slightly extra memory usage.
  #
  # type - Type of provider to use. Accepts either :memory (default), or
  #        :filesystem
  #
  # Returns nothing.
  def provider=(type)
    unless [:memory, :filesystem, nil].include? type
      raise ArgumentError, "Unknown provider #{type}, valid options are :memory, :filesystem"
    end

    @provider = type
  end

  # Internal: Returns either the set provider, falling back to the default one.
  def provider
    @provider || :memory
  end

  # Public: Overrides default options for every svg generated by the library.
  # See ZestuiLucideRails::DEFAULT_OPTIONS for reference.
  def default_options=(value)
    @default_options = value
  end

  # Internal: Returns the overriden default options, or the builtin one in case
  # no override occurred.
  def default_options
    @default_options || DEFAULT_OPTIONS
  end

  GEM_ROOT = Pathname.new(File.dirname(__FILE__)).join("..")
end
