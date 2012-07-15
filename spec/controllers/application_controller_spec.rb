require 'spec_helper'

describe ApplicationController do

  describe '#set_admin_locale' do
    context 'when using default locale' do
      it 'should use en' do
        I18n.should_receive(:locale=).with(:en)
        controller.send(:set_admin_locale)
      end
    end

    context 'when using a custom locale' do
      before do
        controller.stub params: {locale: :ru}
      end

      it 'should use the locale param' do
        I18n.should_receive(:locale=).with(:ru)
        controller.send(:set_admin_locale)
      end
    end
  end

end
