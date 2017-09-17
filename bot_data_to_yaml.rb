require 'yaml'

bot_data = {
  presubs: [
    ['dont', "don't"],
    ['youre', "you're"],
    ['love', 'like']
  ],

    responses: {
      default: [
                "I don't understand.",
                "What?",
                "huh?"
              ],
      greeting: ["Hi, I'm [name]. Want to chat?"],
      farewell: ["Good bye!"],
      'hello' => [
                  "How's it going?",
                  "How do you do?"
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
