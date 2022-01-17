require 'pg'

class Chit
    attr_reader :id, :message, :time

    def initialize(id:, message:, time:)
      @id = id
      @message = message
      @time = time
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connectdb = PG.connect(dbname: 'chitter_test')
          else
            connectdb = PG.connect(dbname: 'chitter')
        end
        result = connectdb.exec('SELECT * FROM posts ORDER BY time DESC;')
        result.map { |post| Chit.new(id: post['id'], message: post['message'], time: post['time'])}
    end

    def self.create(message:)
        if ENV['ENVIRONMENT'] == 'test'
          connectdb = PG.connect(dbname: 'chitter_test')
        else
          connectdb = PG.connect(dbname: 'chitter')
        end
    
        result = connectdb.exec_params("INSERT INTO posts (message) VALUES ($1) RETURNING id, message, time", [message])
        Chit.new(id: result[0]['id'], message: result[0]['message'], time: result[0]['time'])
    end
end




