# HAProxy: High Availability Proxy

- A TCP/HTTP Load Balancer, runs on Linux
- Improving the performance and reliability of a server env by distributing
workload across multiple servers
- ACL: Access Control List. Test a condition, perform an action.
- Backend: the set of servers that receive the forwarded requests
- Frontend: defines how requests should be forwarded to the backends

## Types of Load Balancing

- None: if the single server goes down, no-one can access your content
  - If multiple requests made at once, it can bring down the server
- Layer 4 (transport layer) Load Balancing: forward traffic based on IP Range
and port. If wanting `site.com/butts`, traffic forwarded to the backend that
deals with those requests.
- Layer 7 (application layer) load balancing: the load balancer can forward
requests to different backends based on what the request is. Allows you to
run multiple web application servers on the same domain and port. If your
request is for `/blog`, the request will be sent to the backend that deals
with that. If `/butts`, it can be sent to the butts backend. All other
traffic could go to the default web backend.

## Load Balancing Algorithms

- Determines which server in a backend should be used.
- Round Robin: selects servers in turns (the default algorithm)
- Leastconn: selects the server that currently has the least connections
- Source: selects the server based on a hash of the source IP, this ensures
that a user continues to connect to the same server

---
- If a server becomes unavailable you don't have to remove it from the
server list in the backends. HAProxy does health checks and wont forward
connections to the server if it is unhealthy.
- Load balancer is a single point of failure, you need multiple redundancies
for a high availability setup.
