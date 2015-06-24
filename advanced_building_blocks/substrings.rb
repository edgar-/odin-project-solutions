=begin Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.
=end

def substrings(str, dict)
   dict.each.with_object(Hash.new(0)) do |word, hash|
       
       s, wrd, wrd_len = str.downcase, word.downcase, word.length
       
       while (s.include?(wrd))
            hash[word] += 1
            s = s.slice(s.index(wrd) + wrd_len..-1)
      end
   end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("Howdy partner, sit down! How's it going?", dictionary)
#=> {"down"=>1, "go"=>1, "going"=>1, "how"=>2, "howdy"=>1, "it"=>2, "i"=>3, "own"=>1, "part"=>1, "partner"=>1, "sit"=>1} 
