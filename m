From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH V1] leds: pca955x: Add ACPI support for pca955x
Date: Wed, 23 Nov 2016 12:22:36 +0200
Message-ID: <20161123102236.GO1446@lahna.fi.intel.com>
References: <CGME20161123084915epcas2p4fc418350e07d2c4746333a0da733f40a@epcas2p4.samsung.com>
 <1479890546-22644-1-git-send-email-tnhuynh@apm.com>
 <adf97c74-45c1-91b8-a70b-481ae90a2194@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <adf97c74-45c1-91b8-a70b-481ae90a2194@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: tnhuynh@apm.com, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Loc Ho <lho@apm.com>, Thang Nguyen <tqnguyen@apm.com>, Phong Vo <pvo@apm.com>, patches@apm.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: linux-leds@vger.kernel.org

On Wed, Nov 23, 2016 at 11:19:21AM +0100, Jacek Anaszewski wrote:
> Hi Tin,
> 
> Thanks for the patch. While adding ACPI support please
> always add ACPI maintainers on CC.
> 
> Adding Rafael and Mika.
> 
> Thanks,
> Jacek Anaszewski
> 
> On 11/23/2016 09:42 AM, tnhuynh@apm.com wrote:
> > From: Tin Huynh <tnhuynh@apm.com>
> > 
> > This patch enables ACPI support for leds-pca955x driver.
> > 
> > Signed-off-by: Tin Huynh <tnhuynh@apm.com>
> > ---
> >  drivers/leds/leds-pca955x.c |   26 +++++++++++++++++++++++++-
> >  1 files changed, 25 insertions(+), 1 deletions(-)
> > 
> > diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> > index 840401a..8770090 100644
> > --- a/drivers/leds/leds-pca955x.c
> > +++ b/drivers/leds/leds-pca955x.c
> > @@ -40,6 +40,7 @@
> >   *  bits the chip supports.
> >   */
> > 
> > +#include <linux/acpi.h>
> >  #include <linux/module.h>
> >  #include <linux/delay.h>
> >  #include <linux/string.h>
> > @@ -100,6 +101,17 @@ struct pca955x_chipdef {
> >  };
> >  MODULE_DEVICE_TABLE(i2c, pca955x_id);
> > 
> > +#ifdef CONFIG_ACPI
> > +static const struct acpi_device_id pca955x_acpi_ids[] = {
> > +	{ .id = "PCA9550", .driver_data = pca9550 },
> > +	{ .id = "PCA9551", .driver_data = pca9551 },
> > +	{ .id = "PCA9552", .driver_data = pca9552 },
> > +	{ .id = "PCA9553", .driver_data = pca9553 },

Some like to write this

	{ "PCA9553", pca9553 },

instead but both work.

> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, pca955x_acpi_ids);
> > +#endif
> > +
> >  struct pca955x {
> >  	struct mutex lock;
> >  	struct pca955x_led *leds;
> > @@ -250,7 +262,18 @@ static int pca955x_probe(struct i2c_client *client,
> >  	struct led_platform_data *pdata;
> >  	int i, err;
> > 
> > -	chip = &pca955x_chipdefs[id->driver_data];
> > +	if (id)
> > +		chip = &pca955x_chipdefs[id->driver_data];
> > +#ifdef CONFIG_ACPI

You should not need these #ifdefs as acpi_match_device() should be
stubbed out when !CONFIG_ACPI.

Otherwise look good to me.

> > +	else {
> > +		const struct acpi_device_id *acpi_id;
> > +
> > +		acpi_id = acpi_match_device(pca955x_acpi_ids, &client->dev);
> > +		if (!acpi_id)
> > +			return -ENODEV;
> > +		chip = &pca955x_chipdefs[acpi_id->driver_data];
> > +	}
> > +#endif
> >  	adapter = to_i2c_adapter(client->dev.parent);
> >  	pdata = dev_get_platdata(&client->dev);
> > 
> > @@ -358,6 +381,7 @@ static int pca955x_remove(struct i2c_client *client)
> >  static struct i2c_driver pca955x_driver = {
> >  	.driver = {
> >  		.name	= "leds-pca955x",
> > +		.acpi_match_table = ACPI_PTR(pca955x_acpi_ids),
> >  	},
> >  	.probe	= pca955x_probe,
> >  	.remove	= pca955x_remove,
> > 
> 
> 
> -- 
> Best regards,
> Jacek Anaszewski
