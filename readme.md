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

# Flashing firmware
This keyboard is designed for the [FAK-firmware](https://github.com/semickolon/fak).
I've provided some example configuration files in [my fork](https://github.com/ThePurox/fak-config) of the fak-config repository with the keyboard name `hexapoda`.
