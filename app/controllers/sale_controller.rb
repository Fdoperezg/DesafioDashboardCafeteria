class SaleController < ApplicationController
    def dashboard
        @data_12_months = Sale.last_months(12);
        @data_6_months = @data_12_months.last_months(6);
        @data_3_months = @data_6_months.last_months(3);
        @data_last_month = @data_3_months.last_months(1);
    end
end