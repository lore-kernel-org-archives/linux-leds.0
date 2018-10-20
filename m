From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/3] mfd: upboard: Add UP2 platform controller driver
Date: Sat, 20 Oct 2018 14:49:33 +0300
Message-ID: <CAHp75VdkwfcPdSmB0dYBF_xwwXMqkrLOa1tL0xkOJ4DVcx8h8g@mail.gmail.com>
References: <20180421085009.28773-1-javier@emutex.com> <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1539969334-24577-2-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539969334-24577-2-git-send-email-dan@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, carlos.iglesias@emutex.com, Javier Arteaga <javier@emutex.com>
List-Id: linux-leds@vger.kernel.org

On Fri, Oct 19, 2018 at 8:26 PM Dan O'Donovan <dan@emutex.com> wrote:
>
> From: Javier Arteaga <javier@emutex.com>
>
> UP Squared (UP2) is a x86 SBC from AAEON based on Intel Apollo Lake. It
> features a MAX 10 FPGA that routes lines from both SoC and on-board
> devices to two I/O headers:
>
>                                 +------------------------+
>                                 | 40-pin RPi-like header |
>                          +------|         (HAT)          |
>                          |      +------------------------+
>     +-------+    +--------+
>     |       |    |        |     +------------------------+
>     |  SoC  |----|  FPGA  |-----|  Custom UP2 pin header |
>     |       |    |        |     |        (EXHAT)         |
>     +-------+    +--------+     +------------------------+
>                          |
>                          +------* On-board devices: LED, VLS...
>
> This is intended to enable vendor-specific applications to customize I/O
> header pinout, as well as include low-latency functionality. It also
> performs voltage level translation between the SoC (1.8V) and HAT header
> (3.3V).
>
> Out of the box, this block implements a platform controller with a
> GPIO-bitbanged control interface. It's enumerated by ACPI and provides
> registers to control:
>
> - Configuration of all FPGA-routed header lines. These can be driven
>   SoC-to-header, header-to-SoC or set in high impedance.
>
> - On-board LEDs and enable lines for other platform devices.
>
> Add core support for this platform controller as a MFD device, exposing
> these registers as a regmap.

Can we see a link to or an excerpt of ACPI table for this device?

> +#define set_clear(u, x) gpiod_set_value((u)->clear_gpio, (x))
> +#define set_strobe(u, x) gpiod_set_value((u)->strobe_gpio, (x))
> +#define set_datain(u, x) gpiod_set_value((u)->datain_gpio, (x))
> +#define get_dataout(u) gpiod_get_value((u)->dataout_gpio)

I think these macros don't bring much value. (Up to you and Lee to decide)


> +static void __reg_io_write(const struct upboard_ddata * const ddata,
> +                          unsigned int size, unsigned int val)
> +{
> +       int i;
> +
> +       /*
> +        * DATAIN is latched on each rising edge of the STROBE signal.
> +        * Data (register address or value) is sent MSb first.
> +        */

> +       for (i = size - 1; i >= 0; i--) {

while (size--)

> +               set_strobe(ddata, 0);
> +               set_datain(ddata, (val >> i) & 0x1);
> +               set_strobe(ddata, 1);
> +       }
> +}
> +
> +static void __reg_io_read(const struct upboard_ddata * const ddata,
> +                         unsigned int size, unsigned int *val)
> +{
> +       int i;
> +
> +       /*
> +        * DATAOUT is latched on on each rising edge of the STROBE signal.
> +        * Data (register value) is received MSb first.
> +        */
> +       *val = 0;

> +       for (i = size - 1; i >= 0; i--) {

Ditto.

> +               set_strobe(ddata, 0);
> +               set_strobe(ddata, 1);
> +               *val |= get_dataout(ddata) << i;
> +       }
> +}

> +static int upboard_check_supported(struct device *dev, struct regmap *regmap)
> +{
> +       uint8_t manufacturer_id, build, major, minor, patch;
> +       unsigned int platform_id, firmware_id;
> +       int ret;

> +       manufacturer_id = platform_id & 0xff;

Redundant & 0xff part.

> +       if (manufacturer_id != AAEON_MANUFACTURER_ID) {
> +               dev_err(dev,
> +                       "unsupported FPGA firmware from manufacturer 0x%02x",
> +                       manufacturer_id);
> +               return -ENODEV;
> +       }

> +static int upboard_match_device(struct device *dev)
> +{
> +       struct upboard_ddata *ddata = dev_get_drvdata(dev);
> +       const struct acpi_device_id *id;
> +

> +       id = acpi_match_device(upboard_acpi_match, dev);
> +       if (!id)
> +               return -ENODEV;
> +
> +       switch (id->driver_data) {

device_get_match_data() IIRC the name of the call.

> +       case UPBOARD_ID_UP2:
> +               ddata->regmapconf = &upboard_up2_regmap_config;
> +               ddata->cells = upboard_up2_mfd_cells;
> +               ddata->ncells = ARRAY_SIZE(upboard_up2_mfd_cells);
> +               break;
> +       default:
> +               dev_err(dev, "unsupported ID %lu\n", id->driver_data);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}

> +       ret = upboard_init_gpio(dev);
> +       if (ret) {
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(dev, "failed to init GPIOs: %d", ret);
> +               return ret;
> +       }

I don't know if probe_err() helper is going to be a part of v4.21
(which this series targets), it would be good to use it.

> +}

-- 
With Best Regards,
Andy Shevchenko
