class Sale < ApplicationRecord

    def self.last_months(n)
        if n > 1
            final = (n-1).months.ago
        else
            final = Time.new(Time.now.year, Time.now.month, 1)
        end
        where("date_time <= ? AND date_time >= ?", Time.now, final)
    end

    scope :totalize_sales, -> {group("strftime('%m-%Y', date_time)").order(date_time: :asc).sum(:amount)}
    scope :totalize_counts, -> {group("strftime('%m-%Y', date_time)").order(date_time: :asc).count}
    scope :totalize_average, -> { group("strftime('%m-%Y', date_time)").order(date_time: :asc).average(:amount)}

    scope :get_origins, -> {group(:origin).count}
    scope :get_coffees, -> {group(:coffee).count}

end
