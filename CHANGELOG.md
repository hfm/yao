## v0.2.11

* Some fixes by @hanazuki

## v0.2.9

* Fix a syntax error in sample.rb vy @hsbt
  * So added a simple syntax check loop by @udzura

## v0.2.8

* Introduction of `Yao.read_only` and `Yao.read_only!` by @Joe-noh (review by @hanazuki)
  * See also issue #27

## v0.2.7

* Fix `Yao::Keypair.list` is broken by @udzura

## v0.2.6

* Fix a regression in Ruby 2.1 syntax by @hsbt
* Supporting policy by @udzura

## v0.2.5

* Fix query cache condition on `Yao::OldSample.list`. by @hsbt
* Fix `Yao::Tenant#servers`. It returns always empty array. by @hsbt

## v0.2.4

* Fix syntax error by @hsbt
  * Then, v0.2.3 is yanked

## v0.2.3 (yanked)

* Enhance ceilometer resources #33 by @hsbt
* Add Tenant#servers #34 by @hsbt
* Now tested against Ruby 2.3.0-preview1 by @udzura

## v0.2.2

* Fix `resources_name_in_json` method caching again by @pyama86

## v0.2.1

* Fix `resources_name_in_json` is still remaining by @pyama86
* Add `Yao::Server.start` by @pyama86

See more: [v0.2.0...v0.2.1](https://github.com/yaocloud/yao/compare/v0.2.0...v0.2.1)
