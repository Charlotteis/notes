# Questions

## Unanswered

- **What is HAProxy and what is an example of why you would use it?**
- **What is BOSH and what is an example of why you would use it?**
- **What is (a) Cloud Foundry**
- **What is a container?**
- **What is an outbound service proxy (OSP)?**
- **What is the 'ambassador pattern'?**
- **What is the difference between Diego & DEA?**

## Answered

- **What is a container?**

  _Answered by @johnd_
  
  There's two ways to look at this question: the technical implementation of containers and a more philosophical description of what they should be used as/for. The first approach has some clear answers, the DevOps community is still working on the second (DevOps Weekly mailing list even just today linked an article discussing different 'meanings' for containers: https://glyph.twistedmatrix.com/2016/08/defcontainer.html).
  
  Containerisation have been popularised by Docker, but the core concepts have been around in [Solaris Zones](https://en.wikipedia.org/wiki/Solaris_Containers) and [FreeBSD Jails](https://en.wikipedia.org/wiki/FreeBSD_jail) for years. Linux's implementation is known as '[LXC](https://en.wikipedia.org/wiki/LXC)'.
  
  Containers are conceptually similar to Virutal Machines, in that they partion a single host machine into multiple isolated units. Unlike 'full' virtualisation, containers are more 'lightweight', sharing the host's kernel and filesystem. This makes them much quicker to start (closer to running a normal program than starting a full VM) and each container uses less resources than a VM would. The down side is that there's less isolation between containers than there is/should be between VMs. You wouldn't want to run your containers alongside other people's on an untrusted host, since they only have the Linux kernel to separate containers. (In theory this should be sufficient, but it's a larger attack surface versus a VM hypervisor and it's possible to leak data between containers through poor configuration.)
  
  While a VM provides an entire virtualised CPU, disks, memory, etc, containers rely on the process you're running being restricted to a subset of the host machine using kernel features. On Linux this is the 'cgroups' kernel function, alongside old features such as 'chroot', which limits the filesystem access a process has. This means that containers cannot let you run a different operating system, or even a different kernel version, where VMs can.
  
  There is no Mac OS X implementation of containers. Docker's Mac application runs a Linux VM in order to use the Linux container implementation.

- **What is `/dev/null`?**

  _Answered by @charlotteis_

  `/dev` is where you mount devices (like a mouse, keyboard, CPU), so
  `/dev/null` is where you can put any input you don't care about. `null`
  discards any information that is written to it.

- **What is virtualisation?**

  _Answered by @LewisCowper_

  Virtualisation is (most often in our cases) a way of running one, or many, self contained instances of a full operating system + associated software, on one physical host. We often use it in web development because one physical computer has the power to run multiple web servers (as a for example), so you can pay for one whole computer, and use virtualisation to achieve self contained instances that can power many different web sites.

  They are also (about 99% of the time) portable to another environment. As an example, if you paid for the use of one server, from Amazon, or Digital Ocean, or whatever, and ran 10 websites on that one server, in 10 virtual machines. If one of those websites suddenly started getting a lot of traffic, you could create new virtual machines on other servers that just ran that website, and you could scale that way.
