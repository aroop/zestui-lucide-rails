# frozen_string_literal: true

module ZestuiLucideRails
  class Railtie < Rails::Railtie
    initializer "zestui-lucide-rails.helper" do
      ActionView::Base.include ZestuiLucideRails::RailsHelper
    end
  end
end
