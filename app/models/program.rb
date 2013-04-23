class Program < ActiveRecord::Base
  STATUSES = [:draft, :ok, :ng]
  acts_as_taggable

  validates_presence_of :name, :start_at

  def self.import
    keywords = {}
    %w(イリュージョン ナポレオンズ マジシャン マリック 奇術 マギー審司 山上兄弟 手品 前田知洋 超能力 魔術 マギー司郎 ふじいあきら トリックTV).each do |word|
      keywords[word] = word
    end
    keywords.merge!(
      "超能力" => "超能力 -エスパー魔美 -涼宮ハルヒ",
      "マジック" => "マジック -マジックミラー号"
    )
    keywords.each do |keyword, query|
      uri = "http://tv.so-net.ne.jp/rss/schedulesBySearch.action?stationPlatformId=0&condition.keyword=#{URI::encode(query)}"
      posts = FeedNormalizer::FeedNormalizer.parse open uri
      posts.entries.each do |post|
        uid = post.url
        e = Program.find_or_initialize_by_uid(uid) do |e|
          parsed = post.content.force_encoding('utf-8').match(/.+ (.+)～(.+) \[(.+)\]/)
          e.update_attributes(
            name: post.title.force_encoding('utf-8'),
            start_at: post.date_published,
            end_at: nil,
            channel: parsed[3],
            url: post.url,
            status: :draft
          )
        end
        e.tag_list << keyword
        e.save!
      end
    end
  end
end
