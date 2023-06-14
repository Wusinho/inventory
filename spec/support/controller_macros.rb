module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      user = FactoryBot.create(:admin)
      sign_in user
    end
  end
end
