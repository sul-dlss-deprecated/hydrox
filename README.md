# Hydrox Project

[![Build Status](https://travis-ci.org/sul-dlss/hydrox.svg?branch=master)](https://travis-ci.org/sul-dlss/hydrox)
[![Maintainability](https://api.codeclimate.com/v1/badges/c5f334ba892cf3ac32c5/maintainability)](https://codeclimate.com/github/sul-dlss/hydrox/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/c5f334ba892cf3ac32c5/test_coverage)](https://codeclimate.com/github/sul-dlss/hydrox/test_coverage)

Hydrox is a project of DLSS to implement Hyrax, available at [https://hydrox-dev.sul.stanford.edu/].  

The name is a cross between “Hydrus”, the legacy self-deposit application in production at sdr.stanford.edu since 2013, and “Hybox”, the informal name of the Hydra-in-a-Box project. Hydrox will replace Hydrus as the web-based deposit interface to the Stanford Digital Repository.

# Purpose of this Repository

Please be aware that the initial use of Hyrax in this repository is not a determination of platform decision related to Hyku/Hyrax, but is being used to capture initial work related to authentication and integration with existing SUL-DLSS projects.

The state of the `master` branch of this repository should generally stay at the post `generate hyrax:install` step but pre `db:migrate` step.

# Work Types

*Note:* when generating new work types in this application, it is required to add

```
include Suri::Druid
```

to the model in order to mint the ID as a DRUID instead of a Fedora UUID.
