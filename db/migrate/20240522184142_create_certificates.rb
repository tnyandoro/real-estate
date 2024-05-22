class CreateCertificates < ActiveRecord::Migration[7.0]
  def change
    create_table :certificates do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.string :certificate_number
      t.binary :pdf_certificate
      t.binary :png_certificate

      t.timestamps
    end
  end
end
