require 'spec_helper'

describe "Static pages" do

	subject { page }

	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_title(full_title(page_title)) }
	end

	describe "Home page" do
		before { visit root_path }
		let(:heading)		{'Ana Sayfa'}
		let(:page_title)	{''}

		it_should_behave_like "all static pages"
		it { should_not have_title('| Ana Sayfa') }
	end

	describe "Help page" do
		before { visit help_path }
		let(:heading)		{'Yardım'}
		let(:page_title)	{'Yardım'}

		it_should_behave_like "all static pages"
	end

	describe "About page" do
		before { visit about_path }
		let(:heading)		{'Hakkında'}
		let(:page_title)	{'Hakkında'}

		it_should_behave_like "all static pages"
	end

	describe "Contact page" do
		before { visit contact_path }
		let(:heading)		{'İletişim'}
		let(:page_title)	{'İletişim'}

		it_should_behave_like "all static pages"
	end

	it "should have the right links on the layout" do
		visit root_path
		click_link "Hakkında"
		expect(page).to have_title(full_title('Hakkında'))
		click_link "Yardım"
		expect(page).to have_title(full_title('Yardım'))
		click_link "İletişim"
		expect(page).to have_title(full_title('İletişim'))
		click_link "Ana Sayfa"
		click_link "Yeni Kullanıcı"
		expect(page).to have_title(full_title('Yeni Kullanıcı'))
		click_link "film uygulaması"
		expect(page).to have_title(full_title(''))
	end
end