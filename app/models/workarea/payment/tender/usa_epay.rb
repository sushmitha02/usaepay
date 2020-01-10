module Workarea
  class Payment::Tender::UsaEpay < Payment::Tender
    field :token, type: String
    field :payer_id, type: String
    field :details, type: Hash

    def slug
      :usa_epay
    end
  end
end
