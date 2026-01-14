TEX     := doc/manual.tex
PDF     := manual.pdf
AUX_DIR := $(BUILD_DIR)/manual

manual:
	@mkdir -p $(AUX_DIR)
	@pdflatex -output-directory=$(AUX_DIR) $(TEX)
	@pdflatex -output-directory=$(AUX_DIR) $(TEX)
	@pdflatex -output-directory=$(AUX_DIR) $(TEX)
	@mv $(AUX_DIR)/$(PDF) $(BUILD_DIR)

clean-manual:
	-rm -rf $(BUILD_DIR)/$(PDF) $(AUX_DIR)

.PHONY: manual clean-manual
