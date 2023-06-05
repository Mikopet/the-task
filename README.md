# The Task

This repository contains two simple tasks, to evaluate the candidate's expertise in the operational field, especially in AWS and Terraform.

## Method

There is no time limit, though, probably there will be some deadline when it will be sent.
The first task is a quick jump-in. In that case, if you felt it was hard to solve, perhaps you could stop there... but feel free to continue if you enjoy it. Up to you!

You could use any tools you want, but please take some notes and references in your solution on how did you come to the solution.
Part of the goal is to get familiar with and understand your working style.

### 1) Find the leak

In this repository, you could find a very simple EC2/ALB setup. Although it is working, it is less than optimal. And having some security issues as well.

**The task**: Point out the problems with this setup and give some advice on how to improve/fix it.

Any comments are welcome!

### 2) Rearchitect the infrastructure

The second task is a little bit more detail-hungry.

Let's say, we anticipate an increase in concurrent users by a factor of 100. We could easily scale with EC2s, but the whole architecture just feels wrong.

**The task**: Give a plan, of how the current setup could be enhanced to have better sustainability, reliability, security, performance, and cost-effectiveness.

### 3) Refact

This part is the coding part.

If you don't have that amount of time, don't go into details... but comment on the code for good, and leave comments as well for skipped implementations (which were too obvious to deal with)

**The task**: Create terraform code for a better approach (what probably you did cover in step 2) using the given code, or just start it from scratch.
