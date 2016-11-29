From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH V2] leds: pca963x: Add ACPI support
Date: Tue, 29 Nov 2016 11:55:47 +0100
Message-ID: <676881f2-07e1-9c77-3559-3cf9832852a6@samsung.com>
References: <CGME20161129102236epcas1p36ba8b4160c78cfd62d5748538174ca05@epcas1p3.samsung.com>
 <1480414910-16691-1-git-send-email-tnhuynh@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-reply-to: <1480414910-16691-1-git-send-email-tnhuynh@apm.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Tin Huynh <tnhuynh@apm.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Loc Ho <lho@apm.com>, Thang Nguyen <tqnguyen@apm.com>, Phong Vo <pvo@apm.com>, patches@apm.com
List-Id: linux-leds@vger.kernel.org

On 11/29/2016 11:21 AM, Tin Huynh wrote:
> This patch enables ACPI support for leds-pca963x driver.
>
> Signed-off-by: Tin Huynh <tnhuynh@apm.com>
> ---
>  drivers/leds/leds-pca963x.c |   25 ++++++++++++++++++++++++-
>  1 files changed, 24 insertions(+), 1 deletions(-)
>
> Change from V1:
>   -Add CONFIG_ACPI.
>
> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> index 407eba1..57f11e3 100644
> --- a/drivers/leds/leds-pca963x.c
> +++ b/drivers/leds/leds-pca963x.c
> @@ -25,6 +25,7 @@
>   * or by adding the 'nxp,hw-blink' property to the DTS.
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/module.h>
>  #include <linux/delay.h>
>  #include <linux/string.h>
> @@ -95,6 +96,17 @@ struct pca963x_chipdef {
>  };
>  MODULE_DEVICE_TABLE(i2c, pca963x_id);
>
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id pca963x_acpi_ids[] = {
> +	{ "PCA9632", pca9633 },
> +	{ "PCA9633", pca9633 },
> +	{ "PCA9634", pca9634 },
> +	{ "PCA9635", pca9635 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, pca963x_acpi_ids);
> +#endif
> +
>  struct pca963x_led;
>
>  struct pca963x {
> @@ -322,7 +334,17 @@ static int pca963x_probe(struct i2c_client *client,
>  	struct pca963x_chipdef *chip;
>  	int i, err;
>
> -	chip = &pca963x_chipdefs[id->driver_data];
> +	if (id) {
> +		chip = &pca963x_chipdefs[id->driver_data];
> +	} else {
> +		const struct acpi_device_id *acpi_id;
> +
> +		acpi_id = acpi_match_device(ACPI_PTR(pca963x_acpi_ids),
> +						&client->dev);

What kind of problem did you get while compiling without ACPI_PTR here,
when CONFIG_ACPI is disabled? I also tried this configuration but
nothing wrong happened. Also at first glance I don't see why lack of
ACPI_PTR macro could cause problems.

Grep also doesn't show any call to acpi_match_device
with ACPI_PTR as the first argument in the existing drivers.

> +		if (!acpi_id)
> +			return -ENODEV;
> +		chip = &pca963x_chipdefs[acpi_id->driver_data];
> +	}
>  	pdata = dev_get_platdata(&client->dev);
>
>  	if (!pdata) {
> @@ -426,6 +448,7 @@ static int pca963x_remove(struct i2c_client *client)
>  	.driver = {
>  		.name	= "leds-pca963x",
>  		.of_match_table = of_match_ptr(of_pca963x_match),
> +		.acpi_match_table = ACPI_PTR(pca963x_acpi_ids),
>  	},
>  	.probe	= pca963x_probe,
>  	.remove	= pca963x_remove,
>


-- 
Best regards,
Jacek Anaszewski
