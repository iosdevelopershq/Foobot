import ChameleonKit

extension SlackBot {
    public func enableHello() -> SlackBot {
        listen(for: .message) { bot, message in
            let values: [Parser<String>] = ["heya", "hey", "hi", "hello", "gday", "howdy"]

            try message.matching(^.anyOf(values) <* " " && .user(bot.me)^) { greeting in
                try bot.perform(.respond(to: message, .inline, with: "well \(greeting) back at you \(message.user)"))
                try bot.perform(.react(to: message, with: .wave))
            }
        }
        return self
    }
}
