class Mark < ApplicationRecord
  belongs_to :store
  has_many :daily_marks

  validates :name,
            :start_date,
            :end_date,
            :month,
            :value, presence: true

  validate :period_must_be_inside_month,
           :start_date_must_be_smaller_than_end_date,
           :end_date_must_be_greater_than_start_date,
           :period_must_be_unique_in_same_store

  after_create :create_daily_marks

  def period
    self.start_date..end_date
  end

  private

    def period_must_be_inside_month
      return unless fields_dates_fully?
      start_date_must_be_inside_month? && end_date_must_be_inside_month?
    end

    def start_date_must_be_inside_month?
      if self.start_date.month != self.month.month
        errors[:start_date] << "Data de início deve estar dentro do mês de referência"
        return false
      end
      return true
    end

    def end_date_must_be_inside_month?
      if self.end_date.month != self.month.month
        errors[:end_date] << "Data final deve estar dentro do mês de referência"
        return false
      end
      return true
    end

    def fields_dates_fully?
      self.month.present? && self.start_date.present? && self.end_date.present?
    end

    def start_date_must_be_smaller_than_end_date
      return unless fields_dates_fully?
      if self.start_date > self.end_date
        errors[:start_date] << "Data de início não pode ser maior que a data final"
        return false
      end
      return true
    end

    def end_date_must_be_greater_than_start_date
      return unless fields_dates_fully?
      if self.end_date < self.start_date
        errors[:end_date] << "Data final não pode ser menor que a data de início"
        return false
      end
      return true
    end

    def period_must_be_unique_in_same_store
      return unless store.present? && fields_dates_fully?
      if(is_period_conflict_with_another_store_period?)
        errors[:period] << "Período entre a data de início e data final já sendo utlizada por outra meta"
        return false
      end
      return true
    end

    def is_period_conflict_with_another_store_period?
      sql = <<-SQL
              store_id = :store_id
              AND (
                    (start_date BETWEEN :start_date AND :end_date)
                    OR
                    (end_date BETWEEN :start_date AND :end_date)
                  )
            SQL

      params = {
                store_id:   self.store.id,
                start_date: self.start_date,
                end_date:   self.end_date
               }

      if self.persisted?
        sql << " AND id != :id"
        params[:id] = self.id
      end

      Mark.where(sql, params).take
    end

    def create_daily_marks
      value_average = value / period.to_a.size
      period.each do |date|
        daily_marks.create(date: date, value: value_average)
      end
    end

end
