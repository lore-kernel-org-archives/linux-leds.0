From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH V2] leds: pca955x: Add ACPI support for pca955x
Date: Tue, 29 Nov 2016 11:08:04 +0200
Message-ID: <20161129090804.GN1459@lahna.fi.intel.com>
References: <1480389527-12005-1-git-send-email-tnhuynh@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1480389527-12005-1-git-send-email-tnhuynh@apm.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Tin Huynh <tnhuynh@apm.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Loc Ho <lho@apm.com>, Thang Nguyen <tqnguyen@apm.com>, Phong Vo <pvo@apm.com>, patches@apm.com
List-Id: linux-leds@vger.kernel.org

On Tue, Nov 29, 2016 at 10:18:47AM +0700, Tin Huynh wrote:
> This patch enables ACPI support for leds-pca955x driver.
> 
> Signed-off-by: Tin Huynh <tnhuynh@apm.com>
> ---
>  drivers/leds/leds-pca955x.c |   22 +++++++++++++++++++++-
>  1 files changed, 21 insertions(+), 1 deletions(-)
> 
> Change from V1:
>  -Remove CONFIG_ACPI.
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 840401a..9ac3d53 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -40,6 +40,7 @@
>   *  bits the chip supports.
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/module.h>
>  #include <linux/delay.h>
>  #include <linux/string.h>
> @@ -100,6 +101,15 @@ struct pca955x_chipdef {
>  };
>  MODULE_DEVICE_TABLE(i2c, pca955x_id);
>  
> +static const struct acpi_device_id pca955x_acpi_ids[] = {
> +	{ .id = "PCA9550", .driver_data = pca9550 },
> +	{ .id = "PCA9551", .driver_data = pca9551 },
> +	{ .id = "PCA9552", .driver_data = pca9552 },
> +	{ .id = "PCA9553", .driver_data = pca9553 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, pca955x_acpi_ids);
> +
>  struct pca955x {
>  	struct mutex lock;
>  	struct pca955x_led *leds;
> @@ -250,7 +260,16 @@ static int pca955x_probe(struct i2c_client *client,
>  	struct led_platform_data *pdata;
>  	int i, err;
>  
> -	chip = &pca955x_chipdefs[id->driver_data];
> +	if (id)
> +		chip = &pca955x_chipdefs[id->driver_data];
> +	else {

You need to use {} in both branches. See Documentation/CodingStyle.

Otherwise looks good to me.

> +		const struct acpi_device_id *acpi_id;
> +
> +		acpi_id = acpi_match_device(pca955x_acpi_ids, &client->dev);
> +		if (!acpi_id)
> +			return -ENODEV;
> +		chip = &pca955x_chipdefs[acpi_id->driver_data];
> +	}
>  	adapter = to_i2c_adapter(client->dev.parent);
>  	pdata = dev_get_platdata(&client->dev);
>  
> @@ -358,6 +377,7 @@ static int pca955x_remove(struct i2c_client *client)
>  static struct i2c_driver pca955x_driver = {
>  	.driver = {
>  		.name	= "leds-pca955x",
> +		.acpi_match_table = ACPI_PTR(pca955x_acpi_ids),
>  	},
>  	.probe	= pca955x_probe,
>  	.remove	= pca955x_remove,
> -- 
> 1.7.1
