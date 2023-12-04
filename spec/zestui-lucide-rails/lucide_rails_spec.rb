# frozen_string_literal: true

RSpec.describe ZestuiLucideRails do
  it "has a version number" do
    expect(ZestuiLucideRails::VERSION).not_to be nil
  end

  context "provider" do
    after { ZestuiLucideRails.provider = nil }

    %i[filesystem memory].each do |kind|
      it "accepts #{kind} as a provider" do
        expect { ZestuiLucideRails.provider = kind }.not_to raise_error
      end
    end

    it "accepts nil as a provider" do
      expect { ZestuiLucideRails.provider = nil }.not_to raise_error
    end

    it "rejects unknown providers" do
      expect { ZestuiLucideRails.provider = :foo }.to raise_error(ArgumentError)
    end
  end

  context "default options" do
    around do |example|
      ZestuiLucideRails.default_options = nil
      example.run
      ZestuiLucideRails.default_options = nil
    end

    it "returns builtin default options" do
      expect(ZestuiLucideRails.default_options).to eq ZestuiLucideRails::DEFAULT_OPTIONS
    end

    it "returns custom default options" do
      opts = { "bla" => true }
      ZestuiLucideRails.default_options = opts.dup
      expect(ZestuiLucideRails.default_options).to eq opts
    end
  end
end
