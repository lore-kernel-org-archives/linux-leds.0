From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v5 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Mon, 27 Jun 2016 10:53:22 +0300
Message-ID: <20160627075322.GR1718@lahna.fi.intel.com>
References: <1465815119-7511-1-git-send-email-tony.makkiel@daqri.com>
 <1833687.53qtq4DcBM@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:52862 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751749AbcF0Hya (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 27 Jun 2016 03:54:30 -0400
Content-Disposition: inline
In-Reply-To: <1833687.53qtq4DcBM@vostro.rjw.lan>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Tony Makkiel <tony.makkiel@daqri.com>, linux-leds@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net

On Fri, Jun 24, 2016 at 03:51:14PM +0200, Rafael J. Wysocki wrote:
> > +#ifdef CONFIG_ACPI
> > +static const struct acpi_device_id lp3952_acpi_match[] = {
> > +	{LP3952_NAME, 0},
> 
> The above line is not necessary AFAICS.  Mika?

Indeed, it should not be there.

> > +	{LP3952_ACPI_NAME, 0},
> > +	{}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
> > +#endif
> > +
> > +static struct i2c_driver lp3952_i2c_driver = {
> > +	.driver = {
> > +		   .name = LP3952_NAME,
> > +		   .owner = THIS_MODULE,
> > +#ifdef CONFIG_ACPI
> > +		   .acpi_match_table = ACPI_PTR(lp3952_acpi_match),
> > +#endif

Also this #ifdeffery is not needed either.

> > +		   },
> > +	.probe = lp3952_probe,
> > +	.remove = lp3952_remove,
> > +	.id_table = lp3952_id,
> > +};
