require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.username) }
		it { should have_title(user.username) }
	end

	describe "signup page" do
		before { visit signup_path }

		it { should have_content('Yeni Kullanıcı') }
		it { should have_title(full_title('Yeni Kullanıcı')) }
	end

	describe "signup" do

		before { visit signup_path }

		let(:submit) { "Kullanıcı oluştur" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Ad Soyad",			with: "Example User"
				fill_in "Email",			with: "user@example.com"
				fill_in "Kullanıcı Adı", 	with: "exuser"
				fill_in "Şifre",			with: "foobar"
				fill_in "Tekrar",			with: "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end
	end
end