require 'spec_helper'

describe "Authentication" do

	subject { page }

	describe "signin page" do
		before { visit signin_path }

		it { should have_content('Giriş') }
		it { should have_title('Giriş') }
	end

	describe "signin" do
		before { visit signin_path }

		describe "with invalid information" do
			before { click_button "Giriş" }

			it { should have_title('Giriş') }
			it { should have_selector('div.alert.alert-error', text: 'Hatalı') }

			describe "after visiting another page" do
				before { click_link "Ana Sayfa" }
				it { should_not have_selector('div.alert.alert-error') }
			end
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Kullanıcı Adı",	with: user.username
				fill_in "Şifre",			with: user.password
				click_button "Giriş"
			end

			it { should have_title(user.username) }
			it { should have_link('Profil', 	href: user_path(user)) }
			it { should have_link('Çıkış',		href: signout_path) }
			it { should_not have_link('Giriş', 	href: signin_path) }

			describe "followed by signout" do
				before { click_link "Çıkış" }
				it { should have_link('Giriş') }
			end
		end
	end
end