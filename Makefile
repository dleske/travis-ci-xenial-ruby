IMAGE   := dleskecc/travis
SOURCES := Dockerfile

vers :=
release := .release

all: $(release)

$(release): $(SOURCES)
	docker build $(build_args) -t $(IMAGE)$(vers) .
	#docker push $(IMAGE)
	touch $(release)
