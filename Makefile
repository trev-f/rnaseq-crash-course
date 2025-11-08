site_source := $(wildcard \
	*.qmd \
	_quarto*.yml \
	computing/*.qmd \
	pipeline/*.qmd \
)
site_sentinel := .cache/sentinels/.render-site
publish_sentinel := .cache/sentinels/.publish-site

.PHONY: all
all: render

.PHONY: render
render: $(site_sentinel)
	@echo "Finished rendering site"

$(site_sentinel): src/bash/render_site.sh $(site_source)
	@echo "Render site"
	@bash src/bash/render_site.sh
	@mkdir -p $(@D)
	@touch $@

.PHONY: publish
publish: $(publish_sentinel)
	@echo "Finished publishing site"

$(publish_sentinel): src/bash/publish_site.sh $(site_sentinel)
	@echo "Publish quarto report to gh-pages"
	@bash src/bash/publish_site.sh
	@mkdir -p $(@D)
	@touch $@

