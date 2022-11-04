SHELL := /bin/bash

.PHONY: deploy

STORAGE_CLASS ?= default

deploy: daemonset.yaml pvc.yaml
	kapp deploy --app rwx-test \
		--file daemonset.yaml \
		--file <(ytt --file pvc.yaml --data-value storageClass=$(STORAGE_CLASS))
