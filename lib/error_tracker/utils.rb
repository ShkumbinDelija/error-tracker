class ErrorTracker::Utils
  class << self
    def fetch_line_from_backtrace(backtrace)
      backtrace.first.match(/^(.+?):(\d+)(|:in `(.+)')$/)
      [$1, $2, $3]
    end

    def permitted_keys
      %w[HTTP_HOST HTTP_USER_AGENT REQUEST_METHOD server_name server_port REMOTE_ADDR]
    end

    def filter_hash_key(original_key)
      return original_key if keys_to_delegate.exclude?(original_key)

      key_delegations(original_key).presence || original_key
    end

    def key_delegations(original_key)
      {
        HTTP_HOST: 'host',
        HTTP_USER_AGENT: 'user_agent',
        REQUEST_METHOD: 'http_method',
        REMOTE_ADDR: 'remote_address'
      }.with_indifferent_access[original_key]
    end

    def keys_to_delegate
      %w[HTTP_HOST HTTP_USER_AGENT REQUEST_METHOD REMOTE_ADDR]
    end
  end
end