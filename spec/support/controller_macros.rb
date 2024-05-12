# frozen_string_literal: true

module ControllerMacros
  def it_renders_404(*actions)
    before { sign_in create(:user) }
    actions.each do |a|
      it "action #{a} renders 404 page when item is not found" do
        verb = if a == :update
                 'PUT'
               elsif a == :destroy
                 'DELETE'
               else
                 'GET'
               end
        process a, method: verb, params: { id: 0 }
        expect(response.status).to eq 404
      end
    end
  end
end
