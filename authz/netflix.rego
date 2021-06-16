package netflix

import data.netflix.tickets

default allow = false

# Allow user (customer) to access their own accounts
allow = true {
    input.method = "GET"
    input.path = ["accounts", user_name]
    input.subject.user = user_name
}

# Allow support members to access accounts of customer assigned to them
allow = true {
    input.method = "GET"
    input.path = ["accounts", user_name]
    input.subject.user = tickets[user_name][_].assignee
    input.subject.groups[_] = "customer-service"
}
