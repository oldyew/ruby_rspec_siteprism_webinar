# frozen_string_literal: true

RSpec.describe 'Contact Us page', type: :feature do
  let(:login_page) { LoginPage.new }
  let(:contact_us_page) { ContactUsPage.new }
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
    contact_us_page.load
  end

  context 'when open page', :smoke do
    it { expect(contact_us_page).to be_displayed }
    it { expect(contact_us_page).to be_all_there }
    it { expect(contact_us_page).to be_nav_bar_login_user_visible }
    it { expect(contact_us_page).to be_footer_visible }
  end
end
