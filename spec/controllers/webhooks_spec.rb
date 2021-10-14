require 'spec_helper'
RSpec.describe WebhooksController, type: :request do
    context '#webhookCallback' do
        let!(:url) { '/webhooks/telegram_4urh34ruwurhewufhweru4ruwruwhruwrwhruw' }
        let!(:text) { 'this is my message to you.' }
        let!(:id) { '7563457645' }
        let!(:first_name) { 'Mostafa' }
        let!(:last_name) { 'Ayad' }

        let!(:description) { 'Notebook1 does all the work' }
        let!(:params) do
        {
            webhook: {
            message: {
                from:{
                    id: id,
                    first_name: first_name,
                    last_name: last_name
                },
                text: text,
            },
            description: description
            }
        }
        end


        context 'When message is created and sent to telegram and saved to DB' do

            it 'should return a 200 status code' do
                post url, params: params
            
                expect(response.status).to eq 200

            end
        end
    end    

end