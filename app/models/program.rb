class Program < ActiveRecord::Base
  STATUSES = [:import, :ok, :ng]
  acts_as_taggable

  def self.import
    keywords = %w(イリュージョン ナポレオンズ マジシャン マジック マリック 奇術 マギー審司 山上兄弟 手品 前田知洋 超能力 魔術 マギー司郎 ふじいあきら トリックTV)
    keywords.each do |keyword|
      uri = "http://tv.so-net.ne.jp/rss/schedulesBySearch.action?stationPlatformId=0&condition.keyword=#{URI::encode(keyword)}"
      posts = FeedNormalizer::FeedNormalizer.parse open uri
      posts.entries.each do |post|
        uid = post.url
        next if Program.find_by_uid(uid)
        e = Program.new(
          uid: uid,
          name: post.title.force_encoding('utf-8'),
          start_at: post.date_published,
          description: post.content.force_encoding('utf-8'),
          url: post.url,
          status: :import
        )
        e.tag_list = keyword
        e.save!
      end
    end
  end
end
