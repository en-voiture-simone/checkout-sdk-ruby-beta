RSpec.describe CheckoutSdk::Payments do
  include PaymentsHelper

  describe '.capture_payment' do
    context 'when capture a payment' do
      it 'make full capture' do
        payment_response = make_card_payment
        request = CheckoutSdk::Payments::CaptureRequest.new
        request.reference = SecureRandom.uuid

        capture_response = default_sdk.payments_client.capture_payment(payment_response.id, request)
        assert_response(capture_response, %w[reference
                                     action_id
                                     _links])
      end

      it 'make partial capture card payment' do
        payment_response = make_card_payment
        request = CheckoutSdk::Payments::CaptureRequest.new
        request.reference = SecureRandom.uuid
        request.amount = 5

        capture_response = default_sdk.payments_client.capture_payment(payment_response.id, request)
        assert_response(capture_response, %w[reference
                                     action_id
                                     _links])
      end

      it 'make full capture idempotent' do
        payment_response = make_card_payment
        request = CheckoutSdk::Payments::CaptureRequest.new
        request.reference = SecureRandom.uuid
        request.amount = 2
        idempotency_key = new_idempotency_key

        capture_response_1 = default_sdk.payments_client.capture_payment(payment_response.id, request, idempotency_key)
        assert_response(capture_response_1, %w[reference
                                     action_id
                                     _links])

        capture_response_2 = default_sdk.payments_client.capture_payment(payment_response.id, request, idempotency_key)
        assert_response(capture_response_2, %w[reference
                                     action_id
                                     _links])
        expect(capture_response_1.action_id).to eq(capture_response_2.action_id)
      end
    end
  end

end
