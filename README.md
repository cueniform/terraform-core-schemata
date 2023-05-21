# Terraform Core Configuration Schema

This repository contains CUE schemata representing
the structure of the core Terraform configuration language,
manually curated from the
[Terraform language documentation](https://developer.hashicorp.com/terraform/language).

Currently,
only the fields permitted by
the latest language version (v1.4) are present.
PRs that improve or expand the schemata selection
[are extremely welcome](https://github.com/cueniform/terraform-registry-schema-cuelang/pulls)!

## Using this repo

These schemata are primarily designed for use inside the Cueniform ecosystem,
and will change and adapt along with that project's aim of
advocating the maintenance of Terraform configurations in CUE (not HCL or JSON).
However, nothing stops them being used separately, in isolation, and
this README briefly describes how to do that.

These schemata can be used to validate
the structure of Terraform configurations
expressed in
[Terraform's JSON syntax](https://developer.hashicorp.com/terraform/language/syntax/json).
Direct validation of
[Terraform's HCL variant](https://developer.hashicorp.com/terraform/language/syntax/configuration)
is not possible.
Converting from HCL to the JSON format is therefore required,
but is outside the scope of this repo.

### Requirements

1. CUE version `0.6.0-alpha.1`, or later
   [[Releases](https://github.com/cue-lang/cue/releases)]
   - Required Fields are used, which is a v0.6 feature

#### Usage

1. Initialise a CUE module directory with `cue mod init`

1. Clone this repo into `cue.mod/pkg/cueniform.com/x/terraform-core`:

       git clone \
           https://github.com/cueniform/terraform-core-schema \
           cue.mod/pkg/cueniform.com/x/terraform-core

1. Choose a Terraform version and schema flavour
   - Versions:
     - `1.4.x`: for Terraform versions 1.4.0 and above
       (1.5.0 at your own risk!)
   - Flavours:
     - `full`: includes (at least minimal) support for language structures,
       at the cost of CUE performance

1. From a working directory inside your CUE module directory, run `cue`:

       cue vet -c -d '#Configuration' \
           cueniform.com/x/terraform-core/<VERSION>:<FLAVOUR>
           /path/to/*.tf.json

Missing fields and malformed structs will be pointed out by CUE.
If you notice things that it misses or gets wrong
**please do
[tell us by opening an Issue](https://github.com/cueniform/terraform-core-schema/issues/new)!**

Do be aware that this repository only contains schemata that
validate core Terraform configuration structures,
and not the individual requirements of specific
providers,
resources,
data-sources,
etc.

Integrating the schemata for *those* components,
on top of these core language schemata,
is what the
[Cueniform project](https://cueniform.com)
was created to do
... and that's still a work in progress!
