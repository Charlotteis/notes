# Questions

## Unanswered

- **What is HAProxy and what is an example of why you would use it?**
- **What is BOSH and what is an example of why you would use it?**
- **What is (a) Cloud Foundry**
- **What is a container?**
- **What is an outbound service proxy (OSP)?**
- **What is the 'ambassador pattern'?
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
