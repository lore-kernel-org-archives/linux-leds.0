From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC PATCH RESEND 3/3] pinctrl: upboard: Add UP2 pinctrl and
 gpio driver
Date: Thu, 26 Apr 2018 07:50:28 +0100
Message-ID: <20180426065028.fvdf7ke5va2kacmv@dell>
References: <20180421085009.28773-1-javier@emutex.com>
 <20180421085009.28773-4-javier@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180421085009.28773-4-javier@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Arteaga <javier@emutex.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dan O'Donovan <dan@emutex.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Sat, 21 Apr 2018, Javier Arteaga wrote:

> The UP2 board features a Raspberry Pi compatible pin header (HAT) and a
> board-specific expansion connector (EXHAT). Both expose assorted
> functions from either the SoC (such as GPIO, I2C, SPI, UART...) or other
> on-board devices (ADC, FPGA IP blocks...).
> 
> These lines are routed through an on-board FPGA. The platform controller
> in its stock firmware provides register fields to change:
> 
> - Line enable (FPGA pins enabled / high impedance)
> - Line direction (SoC driven / FPGA driven)
> 
> To enable using SoC GPIOs on the pin header, this arrangement requires
> both configuring the platform controller, and updating the SoC pad
> registers in sync.
> 
> Add a frontend pinctrl/GPIO driver that registers a new set of GPIO
> lines for the header pins. When these are requested, the driver
> propagates this request to the backend SoC pinctrl/GPIO driver by
> grabbing a GPIO descriptor for the matching SoC GPIO line. The needed
> mapping for this is retrieved via ACPI properties.
> 
> Signed-off-by: Javier Arteaga <javier@emutex.com>
> ---

[...]
> 
>  drivers/mfd/upboard.c             |   1 +
>  drivers/pinctrl/Kconfig           |  13 +
>  drivers/pinctrl/Makefile          |   1 +
>  drivers/pinctrl/pinctrl-upboard.c | 523 ++++++++++++++++++++++++++++++
>  4 files changed, 538 insertions(+)
>  create mode 100644 drivers/pinctrl/pinctrl-upboard.c
> 
> diff --git a/drivers/mfd/upboard.c b/drivers/mfd/upboard.c
> index 6e4767e4dc41..35111981dfdf 100644
> --- a/drivers/mfd/upboard.c
> +++ b/drivers/mfd/upboard.c
> @@ -132,6 +132,7 @@ static struct upboard_led_data upboard_up2_led_data[] = {
>  };
>  
>  static const struct mfd_cell upboard_up2_mfd_cells[] = {
> +	{ .name = "upboard-pinctrl" },
>  	UPBOARD_LED_CELL(upboard_up2_led_data, 0),
>  	UPBOARD_LED_CELL(upboard_up2_led_data, 1),
>  	UPBOARD_LED_CELL(upboard_up2_led_data, 2),

Please made this a separate patch.

There aren't any build dependencies between the files.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
