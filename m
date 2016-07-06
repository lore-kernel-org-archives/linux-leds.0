From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v8 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Wed, 6 Jul 2016 11:23:40 +0300
Message-ID: <20160706082340.GV23527@lahna.fi.intel.com>
References: <1467732628-2025-1-git-send-email-tony.makkiel@daqri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467732628-2025-1-git-send-email-tony.makkiel@daqri.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Tony Makkiel <tony.makkiel@daqri.com>
Cc: linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net, rjw@rjwysocki.net, lenb@kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, Jul 05, 2016 at 04:30:28PM +0100, Tony Makkiel wrote:
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id lp3952_acpi_match[] = {
> +	{LP3952_ACPI_NAME, 0},

I would just drop the silly macro and use

	{ "TXNW3952" },

instead.

> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
> +#endif
> +
> +static struct i2c_driver lp3952_i2c_driver = {
> +	.driver = {
> +			.name = LP3952_NAME,
> +			.acpi_match_table = ACPI_PTR(lp3952_acpi_match),
> +	},
> +	.probe = lp3952_probe,
> +	.remove = lp3952_remove,
> +	.id_table = lp3952_id,
> +};
> +

Anyway ACPI parts look good enough,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
