require 'open-uri'
class Issue < ActiveRecord::Base

  belongs_to :series

  REGEX = {:publisher => /^(([A-Z\s])*)$/, :issue => /^([A-Z]{3}\d{6})\t([\w\s#\d\(\)\/\&\-]*)\t(\$?.*)$/, :issue_name => /^([\w\s\(\)\/\&\-]*)(#?\d*)(.*)$/}

  def self.load_releases
    lines = open('http://www.previewsworld.com/public/shipping/newreleases.txt').lines.to_a
    2.times {
      lines.delete_at(0)
    }
    date = lines[0].gsub(/([a-z]\s?)*/i, '')
    @release_date = Date.strptime(date, '%m/%d/%Y')
    5.times {
      lines.delete_at(0)
    }

    lines.map { |line|
      unless line.scan(Issue::REGEX[:publisher]).empty?
        publisher = line.scan(Issue::REGEX[:publisher])[0][0].to_s.strip
        @publisher = Publisher.find_or_create_by_name(publisher) unless publisher.blank?
      end
      unless line.scan(Issue::REGEX[:issue]).empty?
        data = line.scan(Issue::REGEX[:issue])[0]
        issue_data = {:code => data[0], :price => data[2].gsub('$', '').to_d}
        data = data[1].scan(Issue::REGEX[:issue_name])[0]
        series_name = data[0].strip
        issue_data[:number] = data[1].gsub('#', '').to_i
        #extra = data[2].strip

        series = Series.find_or_create_by_name(:name => series_name, :publisher_id => @publisher.id)
        issue_data[:series_id] = series.id
        issue_data[:release_date] = @release_date
        Issue.create(issue_data)
      end
    }

  end

end
