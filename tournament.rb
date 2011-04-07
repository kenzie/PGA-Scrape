class Tournament

  LEADERBOARD_URL = 'http://ca.sports.yahoo.com/golf/pga/leaderboard/'

  attr_reader :year, :id

  def initialize(year,id)
    @year = year
    @id = id
    @cache_file = "cache/#{year}-#{id}.html"
    @cahce_life_in_seconds = 60
    @html = (cache_exist?) ? File.read(@cache_file) : download_html
  end

  def title
    @title ||= @html.match(/<title>\d{4}\s(.*)\s-\sPGA\sTour.*<\/title>/)[1] # TODO add default
  end

  def location
    @location ||= @html.match(/<a href=".*" class="loc">(.*)<\/a>/)[1] # TODO add default
  end

  def status
    @status ||= @html.match(/<span class=".*">Status: <strong>(.*)<\/strong><\/span>/)[1] # TODO add default
  end

  def par
    @par ||= @html.match(/<li class="par"><em>Par:&nbsp;<\/em><span>(\d*)<\/span><\/li>/)[1] # TODO add default
  end

  def course
    @course ||= @html.match(/<li class=".* course"><em>Course:&nbsp;<\/em><span>(.*)<\/span><\/li>/)[1] # TODO add default
  end

  def cache_exist?
    File.exist?(@cache_file)
  end

  def cache_expired?
    return true unless cache_exist?
    File.new(@cache_file).mtime < Time::now - (@cahce_life_in_seconds.to_i)
    # TODO check html rendered date
  end

  def download_html
    true # TODO download and save html
    # mech = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari' }
    # page = mech.get("#{LEADERBOARD_URL}/#{@year}/#{@id}")
    # # TODO handle http errors, e.g.: Mechanize::ResponseCodeError: 500 => Net::HTTPInternalServerError
    # File.open(@cache_file, 'w') { |f| f.write(page) }
  end

end