# Hexapoda
The Hexapoda is a [hummingbird](https://github.com/PJE66/hummingbird) style 30 key keyboard designed around [hexagonal keycaps](https://hw.s-ol.nu/HEX-keycaps/), which require Choc v1 switches.
It uses the CH552T controller and [FAK firmware](https://github.com/semickolon/fak).
![front view of keyboard](front.jpg)
![back view of keyboard](back.jpg)

The electronic design is inspired by the [MIAO MCU board](https://github.com/kilipan/miao).

# Buildguide
Soldering should be straight forward with the help of the [interactive bill of materials](bom/ibom.html)
The orientation of `U1` and `U2` are indicated by small arrows on the PCB.
The orientaion `D16` is such that its white line is on the side where the footprint on the silkscreen also has a white line.
For all other components, the orientation does not matter, or their form-factor allows only one orientation (`D1-D15`).
Make sure to also solder the metal legs on the side, as they will give stability to the jack.
Do **not** plug in a USB-cabel without soldering the metal legs on the side of the USB-jack! You will most likely rip off the USB-jack when unplugging the USB-cable!

# Flashing firmware
This keyboard is designed for the [FAK-firmware](https://github.com/semickolon/fak).
I've provided some example configuration files in [my fork](https://github.com/ThePurox/fak-config) of the fak-config repository with the keyboard name `hexapoda`.
The push-button closer to the USB-jack is the `BOOT` button. The one closer to the thumb keys is the `RESET` button.

# BOM
| Part             | LCSC-Part Nr | amount |
|------------------|--------------|--------|
| USB-C            | C2765186     | 1      |
| CH552T           | C111367      | 1      |
| BAV70 Diodes     | C727123      | 15     |
| USBLC6-2SC6      | C6807798     | 1      |
| PMEG2010EA       | C193668      | 1      |
| Push buttons     | C115357      | 2      |
| Fuse             | C311055      | 1      |
| 5.1k-Resistor    | C23186       | 2      |
| 10k-Resistor     | C25804       | 1      |
| 1uF-Capacitor    | C2991434     | 2      |
| Hot-Swap-Sockets |              | 30     |
| Choc V1 Switches |              | 30     |
