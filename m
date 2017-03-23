From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 1/2] leds: lp3952: Remove ACPI support for lp3952
Date: Thu, 23 Mar 2017 20:49:34 +0100
Message-ID: <de44a986-abd9-da16-5fdb-2d50dded320c@gmail.com>
References: <20170323191749.26469-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36102 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753892AbdCWTue (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2017 15:50:34 -0400
Received: by mail-wm0-f65.google.com with SMTP id x124so1330812wmf.3
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2017 12:50:32 -0700 (PDT)
In-Reply-To: <20170323191749.26469-1-andriy.shevchenko@linux.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc: Tony Makkiel <tony.makkiel@daqri.com>

On 03/23/2017 08:17 PM, Andy Shevchenko wrote:
> In ACPI world any ID should be carefully chosen and registered
> officially. The discussion [1] as I read it gets to wilful assignment
> an ID for non-existing real DSDT example.
> 
> Rafael already told [2] how this device would be enumerated using
> compatible string. To be more precise look at the possible DSDT excerpt
> below:
> 
> 	Device (LDX0) {
> 		Name (_HID, "PRP0001")
> 		Name (_DDN, "TI LP3952 compatible led driver")
> 		...
> 	})
> 
> 	Name (_DSD, Package () {
> 		ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> 		Package () {
> 			Package () {"compatible", "ti,lp3952"},
> 			...
> 		}
> 	})
> 
> Based on above, remove non-official ACPI IDs and enumeration from the
> driver.
> 
> Note: currently driver has no compatible strings at all, to make above
> working one should add at least one.
> 
> [1] https://e2e.ti.com/support/power_management/led_driver/f/192/t/524926
> [2] https://www.spinics.net/lists/linux-acpi/msg67125.html
> 
> Cc: Tony Makkiel <tony.makkiel@daqri.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/Kconfig       |  1 -
>  drivers/leds/leds-lp3952.c | 11 -----------
>  2 files changed, 12 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index e9ba04dcb7cf..8075d2ebccff 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -249,7 +249,6 @@ config LEDS_LP3952
>  	tristate "LED Support for TI LP3952 2 channel LED driver"
>  	depends on LEDS_CLASS
>  	depends on I2C
> -	depends on ACPI
>  	depends on GPIOLIB
>  	select REGMAP_I2C
>  	help
> diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
> index 4847e89883a7..5184436b8905 100644
> --- a/drivers/leds/leds-lp3952.c
> +++ b/drivers/leds/leds-lp3952.c
> @@ -10,7 +10,6 @@
>   *
>   */
>  
> -#include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/gpio.h>
>  #include <linux/i2c.h>
> @@ -276,19 +275,9 @@ static const struct i2c_device_id lp3952_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, lp3952_id);
>  
> -#ifdef CONFIG_ACPI
> -static const struct acpi_device_id lp3952_acpi_match[] = {
> -	{"TXNW3952", 0},
> -	{}
> -};
> -
> -MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
> -#endif
> -
>  static struct i2c_driver lp3952_i2c_driver = {
>  	.driver = {
>  			.name = LP3952_NAME,
> -			.acpi_match_table = ACPI_PTR(lp3952_acpi_match),
>  	},
>  	.probe = lp3952_probe,
>  	.remove = lp3952_remove,
> 

Both patches 1/2 and 2/2 applied. Thanks.

-- 
Best regards,
Jacek Anaszewski
