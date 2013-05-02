class Program < ActiveRecord::Base
  STATUSES = [:draft, :ok, :ng]
  acts_as_taggable

  validates_presence_of :name, :start_at

  def self.import
    draft_count = Program.where(status: :draft).count
    keywords = YAML.load_file(Rails.root.join("db/keywords.yml"))
    keywords.each do |keyword, query|
      query ||= keyword
      uri = "http://tv.so-net.ne.jp/rss/schedulesBySearch.action?stationPlatformId=0&condition.keyword=#{URI::encode(query)}"
      posts = FeedNormalizer::FeedNormalizer.parse open uri
      posts.entries.each do |post|
        uid = post.url
        e = Program.find_or_initialize_by_uid(uid) do |e|
          parsed = post.content.force_encoding('utf-8').match(/.+ (.+)～(.+) \[(.+)\]/)
          e.assign_attributes(
            name: post.title.force_encoding('utf-8'),
            start_at: post.date_published,
            end_at: nil, #todo
            channel: parsed[3],
            url: post.url,
            status: :draft
          )
          draft_count += 1
        end
        e.tag_list << keyword
        e.save!
        return if draft_count > 200
      end
    end
  end
end
