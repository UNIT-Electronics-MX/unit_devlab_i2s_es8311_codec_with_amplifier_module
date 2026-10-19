# ES8311 hardware file names

The product identifier used in file names is
`i2s_es8311_codec_with_amplifier_module` (SKU UE0097). Hardware assets use
lowercase letters, digits, and underscores. The pattern is
`unit_<asset>_v_<major>_<minor>_<patch>_<product>.<extension>`.

| Asset | File |
| --- | --- |
| Top view | [PNG](../img/unit_top_v_1_1_0_i2s_es8311_codec_with_amplifier_module.png) |
| Bottom view | [PNG](../img/unit_bottom_v_1_1_0_i2s_es8311_codec_with_amplifier_module.png) |
| Schematic | [PDF](../resources/unit_sch_v_2_0_0_i2s_es8311_codec_with_amplifier_module.pdf) |
| ES8311 user guide | [PDF](../resources/es8311_user_guide.pdf) |

The top and bottom image source files contained `v1_1_0`. The schematic source
file was named `unit_sch_ue0097_v1_0_0_es8311.pdf`, but its title block states
`REV: 2.0`; the new schematic file name follows the revision printed in the
document. The ES8311 user guide is a third-party document, so its original
content and version are unchanged.

Add future pinout files under `hardware/pinout/` and 3D models under
`hardware/mechanics/` only when the corresponding source assets are available.
