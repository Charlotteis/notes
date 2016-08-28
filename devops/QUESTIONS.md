# Questions

## Unanswered

- **What is BOSH and what is an example of why you would use it?**
- **What is (a) Cloud Foundry**
- **What is a container?**
- **What is an outbound service proxy (OSP)?**
- **What is the 'ambassador pattern'?**
- **What is the difference between Diego & DEA?**

## Answered

- **What is `/dev/null`?**

  _Answered by @charlotteis_

  `/dev` is where you mount devices (like a mouse, keyboard, CPU), so
  `/dev/null` is where you can put any input you don't care about. `null`
  discards any information that is written to it.

- **What is virtualisation?**

  _Answered by @LewisCowper_

  Virtualisation is (most often in our cases) a way of running one, or many, self contained instances of a full operating system + associated software, on one physical host. We often use it in web development because one physical computer has the power to run multiple web servers (as a for example), so you can pay for one whole computer, and use virtualisation to achieve self contained instances that can power many different web sites.

  They are also (about 99% of the time) portable to another environment. As an example, if you paid for the use of one server, from Amazon, or Digital Ocean, or whatever, and ran 10 websites on that one server, in 10 virtual machines. If one of those websites suddenly started getting a lot of traffic, you could create new virtual machines on other servers that just ran that website, and you could scale that way.
  
- **What is HAProxy and what is an example of why you would use it?**

  _Answered by @sysadmin1139_

  HAProxy is used for many things. It is the open-source equivalent of such off the shelf load-balancers as the F5 Big IP, or the Citrix NetSaler. There are two primary roles HAProxy inhabits:
  
  #### Load-balancing
  If you have a group of stateless webservers, but need to serve them on a single IP address, HAProxy is your tool. As with its for-profit cousins, it's capable of getting really fancy about exactly how it balances load. Simple round-robin is entirely doable, as are more complex methods like fastest-response or weighted response.
  
  Weighted response is interesting, in that it allows you to, for example, deploy a new version of code to only 5% of your hits. You do this by setting one node to get 5% of traffic, and updating it with the new code. This is a useful technique for smoke-testing new code. This is sometimes called a [Canary Release pattern](http://martinfowler.com/bliki/CanaryRelease.html), though there are other methods of accomplishing this.
  
  Unlike Amazon's Elastic Load Balancer, HAProxy supports UDP. This is not that useful for public services, but some internal services (such as [Etsy's StatsD](https://github.com/etsy/statsd)) do use UDP for sound reasons. Due to the nature of UDP, there is less you can do beyond weighted or round-robin for balancing. But, it can do it.
  
  #### Application Routing
  
  Application routing is the act of serving different paths of a site by different machine. Take this example layout of URL paths:
  
  * /products - Served by static web-servers with no dynamic content
  * /app - Served by the application's front-end web-servers, with lots of dynamic content
  * /admin - Served by a separate set of web-servers that run the internal admin pages

  HAProxy allows each of these paths to be served by a different pool of servers. This is one way you might stitch together a double handful of microservices into a single DNS name and path-space.
  
  Application-routing can also be used for something called [Blue/Green Deploys](https://docs.cloudfoundry.org/devguide/deploy-apps/blue-green.html). In this, you have two application clusters; one is live to the users, the other is standby. You then deploy updates to your code by updating the standby cluster, and then changing the route in HAProxy to make the standby cluster live, and the live cluster standby. If you have to roll back, just update the route.
