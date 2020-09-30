class PortalController < ApplicationController
    def index
    end

    def simulate
        interest = params[:interest]
        start = params[:start_date]
        pv = params[:present_value]
        number_of_installments = params[:installments]

        #TODO move to model/business layer
        #TODO if number_of_installments == 0
        #TODO "principal" is probably the wrong term

        installment_principal_value = (pv / number_of_installments).round(2)
        pending_principal_value = pv
        pending_updated_value = pv
        for i in 1..number_of_installments do
            compound_interest = (1 + interest) ^ (i - 1) - 1
            installment_updated_value = compound_interest * installment_principal_value
            pending_principal_value -= installment_principal_value
        end
    end
end