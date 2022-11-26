# README

Ruby on Rails app for hosting student portfolios! Developed in CS 3300 — Intro to Software Engineering

# Need To Know

Remember to migrate database on Heroku with pushes: `heroku rake db:migrate`
Creating integration tests for features: `bundle exec rails g rspec:feature projects`

# Known Issues

CircleCI will always report, "Coverage report generated for RSpec to /root/project/coverage. 0 / X LOC (0.0%) covered." I've tried 7 times with different methods. This is a bug to know (I suspect version conflicts or misconfiguration). [29af7fa](https://github.com/STARKBOND/ProjectPortfolio/commit/29af7fa50b72f641984226a5474242b465ba0d58) [ab3cecb](https://github.com/STARKBOND/ProjectPortfolio/commit/ab3cecb563e82acbc3520add0587f4843425139f) [daf5279](https://github.com/STARKBOND/ProjectPortfolio/commit/daf5279cb79ed46cdba71f2a7b1055a12fb3683b) [c564000](https://github.com/STARKBOND/ProjectPortfolio/commit/c564000a1a0f3a107339ab1e5283fb02eb1a1d8e) [f3d04be](https://github.com/STARKBOND/ProjectPortfolio/commit/f3d04be22cce20b0c48d4c8d6b62bad7916982ce) [78d7754](https://github.com/STARKBOND/ProjectPortfolio/commit/78d775468c567771d8544da5ae813f5d0d9fe859) [8d30d4d](https://github.com/STARKBOND/ProjectPortfolio/commit/8d30d4dbaf40eedef4b5fbaae3475c6ad568c059)

<!--This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...-->
