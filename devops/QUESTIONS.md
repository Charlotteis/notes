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

  _Answered by @janl_

  HAProxy is so coalled “proxy server” that usually is deployed “in front” of the rest of your web serving infrastructure. “In front” means that whenever a user-agent connects to your backend infrastructure, HAProxy is the first to see that connection, and based on things like hostname, url, or any number of things as part of the connection, can decide how to pass on that connection to other services in your infrastructure, like a webserver (Apache httpd or nginx e.g.), or an application server (Ruby on Rails, Node.js etc.). It can be used in a number of scenarios, here are a few examples:
  
  1. _TLS Termination:_ With HAProxy, you can set up a single service that you have to manage TLS (SSL/HTTPS) certificates. All connections (or requests) go through that service and are guaranteed to to secure against eavesdropping and other shenanigans between the user-agent and HAProxy. When passing the connection along to other services, the subsequent connections to e.g. the webserver are made without TLS and are usually done over private networking. This comes in handy in the next scenario.
  2. _Separating incoming connections:_ Imagine you have a website including static assets and an API server written in Node.js. All website data is served from `/` and all API connections are handled at `/_api`. The webserver runs on a dedicated [virtual] machine `A` and the API server as well `B`. With HAProxy you can now set up a rule that all connections that don’t start with `/_api` are sent to the API server on machine `B`, while all other requests go to webserver `B`.
  3. _Load balanding:_ Now imagine a larger infrastructure where you don’t just have a single webserver `A` but a number `A1`, `A2`, `A3` and a number of API servers `B1`, `B2`, `B3`. With HAProxy you can set things up like in example `2.`, but instead of sending all requests that start with `/_api` to `B1`, we can tell HAProxy to use any of the `B*` servers, usually using another one for each connection coming in, to spread the incoming load. The same is done for the webserver connections.
  4. _Fault tolerance / High Availability:_ This is similar to `3.`, but the goal is different. Imagine the possibility of one of the webservers becoming offline, either through a hardware, software, or networking error. With the setup in `3.`, HAProxy will notice when e.g. server `A2` is no longer available and will no longer send any requests there (that then would subsequently fail). So end-users don’t notice any (or just very little) service interuptions.
  While `3.` and `4.` appear to be very similar, it is important to understand that they serve orthogonal goals: `3.` allows you to server more connections than a single server can handle. `4.` allows you to make sure you stay online, even if one or two machines fail. If you need three servers to handle all connections (`3.`), then you will need six server (`4.`) to make sure these three servers are higly available. At larger numbers this becomes a probability game and you don’t always have to have as many failover servers as you have live servers, just enough so you can survive likely outages.
  And one more thing: Of course, a single server with HAProxy is not fault-folerant either. While HAProxy is very stable, and if run on a single machine without any other services on it doubly so, but networking can still fail, so there are even more strategies to get high-availability at that level, but I’ll leave this out for now.

  Recommendation: I can’t recommend Theo Schlossnagle’s book [“Scalable Internet Architectures”](https://www.amazon.co.uk/Scalable-Internet-Architectures-Developers-Library-ebook/dp/B001M60BLE/ref=sr_1_1?ie=UTF8&qid=1472402382&sr=8-1&keywords=theo+schlossnagle) enough about topics like these. Despite being 10 years old and having read it when it was new, I still use the knowledge from this book almost every day.
