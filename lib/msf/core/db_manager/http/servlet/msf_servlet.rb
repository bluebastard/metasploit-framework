module MsfServlet

  def self.api_path
    '/api/v1/msf'
  end

  def self.api_version_path
    "#{MsfServlet.api_path}/version"
  end

  def self.registered(app)
    app.get MsfServlet.api_version_path, &get_msf_version
    app.get "#{MsfServlet.api_path}/online", &online
  end

  #######
  private
  #######

  def self.get_msf_version
    lambda {
      set_json_response({metasploit_version: Metasploit::Framework::VERSION})
    }
  end

  def self.online
    lambda {
      set_empty_response()
    }
  end
end