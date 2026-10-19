# ES8311 Product Reference build

The UNIT I2S ES8311 Codec with Amplifier Module Product Reference is maintained
in `chapters/`. `book.yml` fixes the chapter order and document metadata. The
sources are the local UE0097 schematic revision 2.0, the ES8311 User Guide, and
the board images identified as V1.1.0. Component specifications are
separated from module specifications; unsupported values remain empty table
cells.

## Build

Requires Pandoc, Python 3 with Pillow, and WeasyPrint, XeLaTeX, or Chromium.

    ./tools/product-reference/build.sh /tmp/es8311-product-reference

The build creates Markdown, DOCX, HTML, and PDF files named
`unit_product_reference_v_0_1_0_i2s_es8311_codec_with_amplifier_module.*`.
The Markdown chapters are the editable source. The generated documents can be
copied to `docs/hardware/` for publication after review.

The schematic title block reports sheet 1 of 2, although the supplied PDF has
one page. An absent second sheet is not treated as available documentation.
