# encoding: utf-8

require 'spec_helper'

describe ApplicationHelper do

  describe '#page_title' do
    describe 'when default title is used' do
      it 'should show the defined page title' do
        helper.page_title.should ==
              'FutAmericano.com: resultados e información sobre la NFL y el Futbol Americano.'
      end
    end

    describe 'when a defined title is used' do
      before do
        @page_title = 'DEFINED'
      end

      it 'should show the custom page title' do
        helper.page_title.should == 'FutAmericano.com: DEFINED'
      end
    end
  end

  describe '#google_font_tag' do
    context 'when using production Rails environment' do
      before do
        Rails.env.should_receive('production?').and_return(true)
      end

      it 'should return the Google Font tag' do
        helper.google_font_tag.should match /^<link/
      end
    end

    context 'when using development (or test) Rails environment' do
      before do
        Rails.env.should_receive('production?').and_return(false)
      end

      it 'should return the Google Font tag' do
        helper.google_font_tag.should be_nil
      end
    end
  end

  describe '#sprite_link_to' do
    let(:result) { helper.sprite_link_to('text', 'uri', {}) }

    it 'should be a link to the given URI' do
      result.should match /^<a href=\"uri\">/
    end

    it 'should have a span tag hidden' do
      result.should match /<span class=\"hide\">/
    end

    it 'should contain the text in the hidden span and link' do
      result.should match /text<\/span><\/a>/
    end
  end

end
