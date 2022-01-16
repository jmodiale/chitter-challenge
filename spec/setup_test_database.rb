require 'pg'

def setup_test_database
  connectdb = PG.connect(dbname: 'chitter_test')
  connectdb.exec("TRUNCATE posts;")
end