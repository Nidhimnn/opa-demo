package netflix_rbac

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

allow = true {
    is_user_admin
}

is_user_admin{
    data.netflix.users[input.subject.user][_] = "admin"
}

allow = true {
    user_is_granted[grant]
    input.action == grant.action
    input.service == grant.service
}

user_is_granted[grant]{
    role = data.netflix.users[input.user][_]
    grant = data.netflix.role_permissions[role][_]
}