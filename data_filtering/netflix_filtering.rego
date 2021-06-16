package netflix_filtering

import data_filtering.netflix.tickets

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

allow = true {
    is_user_admin
}

is_user_admin {
    data.netflix.tickets[input.subject.user][_].role == "admin"
}

allow {
    input.method = "GET"
    input.subject.user = user_name
    details[user]
}

details[user] {
	data.netflix.tickets[user]
    data.netflix.tickets[user][_].assignee = input.subject.user
}