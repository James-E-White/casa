# Calculate values when using case contact parameters
class CaseContactParameters < SimpleDelegator
  def initialize(params)

#DP_Edit_Here

    params =
      params.require(:case_contact).permit(
        :duration_minutes,
        :occurred_at,
        :contact_made,
        :medium_type,
        :miles_driven,
        :want_driving_reimbursement,
        :other_expense_amount,
        :notes,
        case_contact_contact_type_attributes: [:contact_type_id]
      )

    super(params)
  end

  def with_creator(creator)
    params[:creator] = creator
    self
  end

  def with_converted_duration_minutes(duration_hours)
    converted_duration_hours = duration_hours * 60
    duration_minutes = params[:duration_minutes].to_i
    params[:duration_minutes] = converted_duration_hours + duration_minutes
    self
  end

  private

  def params
    __getobj__
  end
end
