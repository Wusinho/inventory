require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:admin) { create(:admin) }
  let(:provider) { create(:provider)}
  let(:categories) { create_list(:category, 10) }

  context 'when admin is logged in' do
    let(:product_params) do
      {
        product: {
          name: 'New Product',
          description: 'A new product',
          provider_id: provider.id,
          product_categories_attributes: categories.sample([1,2,3].sample),
          inventory_purchases_attributes: {
            '0': {
              purchase_price: 100,
              stock_quantity: 10,
              selling_price: 150
            }
          }
        }
      }
    end

    before { sign_in admin }

    it 'creates a new product' do
      expect do
        post products_path, params: product_params
      end.to change(Product, :count).by(1)
    end

    it 'creates many products' do
      expect do
        10.times {
          post products_path, params: product_params
        }
      end.to change(Product, :count).by(10)
    end


  end

end

#
# require 'rails_helper'
#
# RSpec.describe ProductsController, type: :controller do
#   describe 'POST create' do
#     let(:admin) { FactoryBot.create(:admin) }
#     let(:valid_attributes) do
#       {
#         product: {
#           name: 'New Product',
#           description: 'A new product',
#           provider_id: FactoryBot.create(:provider).id,
#           inventory_purchases_attributes: {
#             '0': {
#               purchase_price: 100,
#               stock_quantity: 10,
#               selling_price: 150
#             }
#           }
#         }
#       }
#     end
#
#     before do
#       sign_in(admin)
#     end
#
#     context 'with valid parameters' do
#       it 'creates a new product' do
#         expect do
#           post :create, params: valid_attributes
#         end.to change(Product, :count).by(1)
#       end
#
#       it 'redirects to the created product' do
#         post :create, params: valid_attributes
#         expect(response).to redirect_to(product_path(Product.last))
#       end
#     end
#
#     context 'with invalid parameters' do
#       let(:invalid_attributes) do
#         {
#           product: {
#             name: '',
#             description: 'A new product',
#             provider_id: FactoryBot.create(:provider).id,
#             inventory_purchases_attributes: {
#               '0': {
#                 purchase_price: 100,
#                 stock_quantity: 10,
#                 selling_price: 150
#               }
#             }
#           }
#         }
#       end
#
#       it 'does not create a new product' do
#         expect do
#           post :create, params: invalid_attributes
#         end.to_not change(Product, :count)
#       end
#
#       it 'renders the new template' do
#         post :create, params: invalid_attributes
#         expect(response).to render_template(:new)
#       end
#     end
#   end
# end
#
#
