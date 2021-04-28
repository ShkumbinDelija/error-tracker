class ErrorTracker::AutomaticTracker
  class << self
    def capture(env, error, occurred_at, user, extra_arguments)
      event_hash = filtered_error_hash(env, user, extra_arguments)
      ErrorTracker::Persistence::persist_error_relations(error, event_hash, occurred_at)
    end

    def filtered_error_hash(env, user, extra_arguments)
      filtered_hash = {}
      ErrorTracker::Utils::permitted_keys.each do |permitted_key|
        filtered_hash.merge!("#{ErrorTracker::Utils::filter_hash_key(permitted_key)}": env[permitted_key])
      end
      filtered_hash.merge(user: user, extra_args: extra_arguments)
    end
  end
end