The Open Policy Agent is an open source, general-purpose policy engine that unifies policy enforcement across the stack. OPA provides a high-level declarative language that lets you specify policy as code and simple APIs to offload policy decision-making from your software.

OPA decouples policy decision-making from policy enforcement. When your software needs to make policy decisions it queries OPA and supplies structured data (e.g., JSON) as input. OPA accepts arbitrary structured data as input.
OPA generates policy decisions by evaluating the query input and against policies and data. OPA and Rego are domain-agnostic so you can describe almost any kind of invariant in your policies.

This repository contains working example of how rego works with certain use cases.

##
The use cases that this repo covers are:
##### Protocol-level authorization : 
 where decision making is based on where to allow/deny user to access service based on authz
 ###
#####  RBAC support :
 The policy implements a classic Role-based Access Control model where users are assigned to roles and roles are granted the ability to perform some action(s) on some type of resource.
 ###
#####  Data filteration :
Policy decisions are not limited to simple yes/no or allow/deny answers. Like query inputs, your policies can generate arbitrary structured data as output by performing partial evaluation

##
Contents:
- A policy file written in rego
- A input file which provides attributes to OPA passed through API call
- A data file which acts as a data store for decision making process
