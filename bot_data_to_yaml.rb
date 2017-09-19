require 'yaml'

bot_data = {
  presubs: [
    ['dont', "don't"],
    ["don't", 'do not'],
    ['youre', "you're"],
    ['love', 'like'],
    ['apologize', 'are sorry'],
    ['dislike', 'hate'],
    ['despise', 'hate'],
    ['yeah', 'yes'],
    ['mom', 'family']
  ],

    responses: {
      default: [
                "I don't understand.",
                "What?",
                "huh?",
                "Tell me about something else.",
                "I'm tired of this change the subject."
              ],
      greeting: ["Hi, I'm [name]. Want to chat?",
                 "What's on your mind today?",
                 "Hi. What would you like to talk about?"
                ],
      farewell: ["Good bye!", "Au revoir!"],
      'hello' => [
                  "How's it going?",
                  "How do you do?",
                  "Enough of the pleasantries"
                ],
      'i like *' => [
                      "What do you like?",
                      "Wow, I like * too!"
                    ]
  }
}

# show the user the YAML data fot the bot structure
puts bot_data.to_yaml

# write the YAML file

f = File.open(ARGV.first || 'bot_data', 'w')
f.puts bot_data.to_yaml
f.close
