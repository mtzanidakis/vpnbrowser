REGISTRY = hub.mtzanidakis.com
IMAGE = vpnbrowser

.PHONY: container
container:
	docker build -t $(REGISTRY)/$(IMAGE) .


.PHONY: container-push
container-push: container
	docker push $(REGISTRY)/$(IMAGE)
