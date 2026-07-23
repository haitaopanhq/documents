SUBDIRS = \
    Personal \
    LandingZone \
    Keycloak \
    TechExploration \
    Observability/CN \
    Linux-K8S-OPS/CN \
    interview-qa/CN \
    interview-qa/EN \
    The-IndieDeveloper-Fullstack-Roadmap/EN \
    The-IndieDeveloper-Fullstack-Roadmap/CN \
    Solutions/CN \
    Solutions/EN \
    AI-Platform/CN \
    AI-Platform/EN


.PHONY: all $(SUBDIRS)

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@
