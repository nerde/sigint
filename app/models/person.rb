class Person < ActiveRecord::Base
  include DatabaseHelper::Pingifes
  self.table_name = 'PESSOA'
  self.primary_key = :CodPessoa
  include ColumnCorrector
end
