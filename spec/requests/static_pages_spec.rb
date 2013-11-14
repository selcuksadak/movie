require 'spec_helper'

describe "StaticPages" do

	subject { page }

	describe "Home page" do
		before { visit root_path }

		it { should have_content('Ana Sayfa') }
		it { should have_title(full_title('')) }
		it { should_not have_title('| Ana Sayfa') }
	end

	describe "Help page" do
		before { visit help_path }

		it { should have_content('Yardım') }
		it { should have_title(full_title('Yardım')) }
	end

	describe "About page" do
		before { visit about_path }

		it { should have_content('Hakkında') }
		it { should have_title(full_title('Hakkında')) }
	end

	describe "Contact page" do
		before { visit contact_path }

		it { should have_content('İletişim') }
		it { should have_title(full_title('İletişim')) }
	end

end