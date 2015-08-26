module NyanCash
  class Session
    attr_reader :db

    def initialize(db)
      @db = db

      Models::All.each do |model|
        model.create(self)
      end
      Models::All.each do |model|
        model.config(self)
      end
    end
  end
end
