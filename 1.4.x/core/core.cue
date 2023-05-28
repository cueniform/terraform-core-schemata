package core

// https://developer.hashicorp.com/terraform/language/v1.4.x/syntax/json

// https://developer.hashicorp.com/terraform/language/v1.4.x/syntax/configuration
#Configuration: {
	terraform?: #Terraform
	provider?: [string]: #Provider
	variable?: [string]: #Variable
	resource?: [string]: [string]: #Resource
	data?: [string]: [string]:     #DataSource
	locals?: #Locals
	module?: [string]: #Module & {
		source!: _
	}
	output?: [string]: #Output & {
		value!: _
	}
}

// https://developer.hashicorp.com/terraform/language/v1.4.x/settings
#Terraform: {
	// https://developer.hashicorp.com/terraform/cli/v1.4.x/cloud/settings
	cloud?: {
		organization!: string
		hostname?:     string
		token?:        string
		workspaces?:   {tags!: [...string]} | {name!: string}
	}
	// https://developer.hashicorp.com/terraform/language/v1.4.x/providers/requirements#requiring-providers
	required_providers?: [string]: {
		source?:  string
		version?: string
	}
	// https://developer.hashicorp.com/terraform/language/v1.4.x/settings#specifying-a-required-terraform-version
	required_version?: string
}

// https://developer.hashicorp.com/terraform/language/v1.4.x/providers/configuration
#Provider: {
	alias?: string
	...
}

// https://developer.hashicorp.com/terraform/language/v1.4.x/values/variables
#Variable: {
	default?:     _
	type?:        string
	description?: string
	validation?:  _
	sensitive?:   bool
	nullable?:    bool
}

// https://developer.hashicorp.com/terraform/language/v1.4.x/resources/syntax
#Resource: {
	// https://developer.hashicorp.com/terraform/language/v1.4.x/resources/syntax#meta-arguments
	#MetaArguments

	// https://developer.hashicorp.com/terraform/language/v1.4.x/resources/syntax#resource-syntax 
	...
}

// https://developer.hashicorp.com/terraform/language/v1.4.x/data-sources
#DataSource: {
	// https://developer.hashicorp.com/terraform/language/v1.4.x/data-sources#meta-arguments
	#MetaArguments

	// https://developer.hashicorp.com/terraform/language/v1.4.x/data-sources#lifecycle-customizations
	lifecycle?: close({
		precondition?:  _
		postcondition?: _
	})
	...
}

// https://developer.hashicorp.com/terraform/language/v1.4.x/resources/syntax#meta-arguments
#MetaArguments: {
	// https://developer.hashicorp.com/terraform/language/v1.4.x/meta-arguments/for_each
	for_each?: string
	// https://developer.hashicorp.com/terraform/language/v1.4.x/meta-arguments/count
	count?: int
	// https://developer.hashicorp.com/terraform/language/v1.4.x/meta-arguments/resource-provider
	provider?: string
	// https://developer.hashicorp.com/terraform/language/v1.4.x/meta-arguments/depends_on
	depends_on?: [...string]
	// https://developer.hashicorp.com/terraform/language/v1.4.x/resources/provisioners/syntax	#resource_meta_arguments
	provisioner?: [string]: {...}
	// https://developer.hashicorp.com/terraform/language/v1.4.x/meta-arguments/lifecycle
	lifecycle?: {
		create_before_destroy?: bool
		prevent_destroy?:       bool
		ignore_changes?: [...string]
		replace_triggered_by?: [...string]
		// https://developer.hashicorp.com/terraform/language/v1.4.x/expressions/custom-conditions
		{
			precondition?: {
				condition!:     string
				error_message!: string
			}
			postcondition?: {
				condition!:     string
				error_message!: string
			}
		}
	}
}

// https://developer.hashicorp.com/terraform/language/v1.4.x/values/locals
#Locals: {
	[string]: _
}

// https://developer.hashicorp.com/terraform/language/v1.4.x/modules/syntax
#Module: {
	source?:   string
	version?:  string
	count?:    #MetaArguments.count
	for_each?: #MetaArguments.for_each
	providers?: [string]: string
	depends_on?: #MetaArguments.depends_on
	...
}

// https://developer.hashicorp.com/terraform/language/v1.4.x/values/outputs
#Output: {
	value?:        string
	description?:  string
	sensitive?:    bool
	depends_on?:   #MetaArguments.depends_on
	precondition?: #MetaArguments.precondition
}
