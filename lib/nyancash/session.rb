module NyanCash
  class Session
    attr_reader :db
    attr_reader :models

    def initialize(db, hostname, pid)
      @db = db
      @lock = Lock.new(db, hostname, pid)
      @models = Object.new

      Models::All.each do |model|
        model.create(@models, @db)
      end
      Models::All.each do |model|
        model.config(@models)
      end

      @lock.acquire
    end

    def close
      @lock.release
    end

    class Lock
      class AlreadyLocked < Exception
      end

      def initialize(db, hostname, pid, break_existing: false)
        @db = db
        @hostname = hostname.to_s
        @pid = pid.to_i
        @break_existing = break_existing

        @locks = db[:gnclock]
      end

      def acquire
        @db.transaction(isolation: :serializable) do
          if (locked = @locks.first)
            if locked[:Hostname] == @hostname && locked[:PID] == @pid
              return # this process owns lock
            end

            unless @break_existing
              raise AlreadyLocked, "Database is locked by #{locked[:PID]}@#{locked[:Hostname]}"
            end
          end

          @locks.insert(Hostname: @hostname, PID: @pid)
        end
      end

      def release
        @locks.where(Hostname: @hostname, PID: @pid).delete
      end
    end
  end
end
