# frozen_string_literal: true

RSpec.describe 'About page' do
  let(:login_page) { LoginPage.new }
  let(:about_page) { AboutPage.new }
  let(:student) { create(:student) }

  let(:params_login_data) do
    {
      email: student.email,
      password: student.password
    }
  end

  before do
    login_page.load
    login_page.login_with(params_login_data)
    about_page.load
  end

  context 'when open page', :smoke do
    it { expect(about_page).to be_displayed }
    it { expect(about_page).to be_all_there }
    it { expect(about_page).to be_nav_bar_login_user_visible }
    it { expect(about_page).to be_footer_visible }
  end
end
