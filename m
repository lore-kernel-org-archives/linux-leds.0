From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [RFC PATCH RESEND 1/3] mfd: upboard: Add UP2 platform controller
 driver
Date: Wed, 25 Apr 2018 12:51:41 +0300
Message-ID: <20180425095141.GL2173@lahna.fi.intel.com>
References: <20180421085009.28773-1-javier@emutex.com>
 <20180421085009.28773-2-javier@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180421085009.28773-2-javier@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Arteaga <javier@emutex.com>
Cc: Lee Jones <lee.jones@linaro.org>, Dan O'Donovan <dan@emutex.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Sat, Apr 21, 2018 at 09:50:07AM +0100, Javier Arteaga wrote:
> +static const struct acpi_device_id upboard_acpi_match[] = {
> +	{ "AANT0F01", (kernel_ulong_t) &upboard_up2_data },

No space after cast so write it like,

	{ "AANT0F01", (kernel_ulong_t)&upboard_up2_data },


> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, upboard_acpi_match);
> +
> +static int upboard_probe(struct platform_device *pdev)
> +{
> +	struct upboard *upboard;
> +	const struct acpi_device_id *id;
> +	const struct upboard_data *upboard_data;
> +	int ret;
> +
> +	id = acpi_match_device(upboard_acpi_match, &pdev->dev);
> +	if (!id)
> +		return -ENODEV;
> +
> +	upboard_data = (const struct upboard_data *) id->driver_data;

Ditto and to other places.

Otherwise looks good to me.
