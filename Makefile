SHELL := /bin/bash

.PHONY: deploy

STORAGE_CLASS ?= default

deploy: deployment.yaml pvc.yaml
	kapp deploy --app rwx-test \
		--file deployment.yaml \
		--file <(ytt --file pvc.yaml --data-value storageClass=$(STORAGE_CLASS))
