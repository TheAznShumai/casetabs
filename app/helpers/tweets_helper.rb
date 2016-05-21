module TweetsHelper
  def tweet_inject_hyperlink_popups_for(text)
    words = text.split(' ')
    words = words.map do |word|
      text = word
      if (word.start_with? '@') && (word.size > 1)
        name = word[1..-1]
        text = link_to(word, tweet_path(URI.encode(name)), class: 'twitter-popup-ajax',
                                                           data: { name: name })
      end
      text
    end
    words.join(' ').html_safe
  end
end
