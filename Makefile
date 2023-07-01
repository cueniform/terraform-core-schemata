default:
	false

test:
	cue vet -c=false ./1.4/core/
	cue vet -c=false ./1.4/providers/builtin/
