class ChangeColReportStatus < ActiveRecord::Migration[7.0]
  def change
    change_column_default :reports, :status, from: nil, to: "En attente de réponse"
  end
end
