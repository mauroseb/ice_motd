# ice_motd Cookbook
![CI](https://github.com/mauroseb/ice_motd/actions/workflows/ci-base.yml/badge.svg)
![GitHub](https://img.shields.io/github/license/mauroseb/ice_motd)

## DESCRIPTION

Cookbook to set Linux Message of the Day file (/etc/motd) based on the system.

## USAGE

Add the recipe ```recipe[ice_motd]``` to the run_list.

## ATTRIBUTES

* __footer:__ set the footer of the /etc/motd file.

```ruby

   default['ice_motd']['footer'] = [
     'Footer sample line'
   ]

```

## TODO

* Add Kitchen YAML for Azure and GCP.

* Finalize CI/CD pipelines
