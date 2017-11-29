# Generated via
#  `rails generate hyrax:work Work`
require 'rails_helper'
include Warden::Test::Helpers

# NOTE: If you generated more than one work, you have to set "js: true"
RSpec.feature 'Create a Work', js: false do
  context 'a logged in user' do
    let(:user_attributes) do
      { email: 'test@example.com' }
    end
    let(:user) do
      User.new(user_attributes) { |u| u.save(validate: false) }
    end

    before do
      admin_set_id = AdminSet.find_or_create_default_admin_set_id
      permission_template = Hyrax::PermissionTemplate.find_or_create_by!(admin_set_id: admin_set_id)
      permission_template_access = Hyrax::PermissionTemplateAccess.create!(permission_template_id: permission_template.id, agent_type: 'user', agent_id: user.user_key, access: 'deposit')
      login_as user
    end

    scenario do
      visit '/dashboard'
      click_link "Works"
      click_link "Add new work"

      # If you generate more than one work uncomment these lines
      # choose "payload_concern", option: "Work"
      # click_button "Create work"

      expect(page).to have_content "Add New Work"
    end
  end
end
