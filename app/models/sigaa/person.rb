module SIGAA
  class Person < ActiveRecord::Base
    include DatabaseHelper::SIGAA
    self.table_name = 'comum.pessoa'
    self.primary_key = :id_pessoa
  end
end
