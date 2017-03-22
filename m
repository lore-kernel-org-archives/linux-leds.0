From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] leds: lp3952: Remove ACPI support for lp3952
Date: Wed, 22 Mar 2017 15:15:12 +0200
Message-ID: <1490188512.19767.166.camel@linux.intel.com>
References: <20170321193315.33238-1-andriy.shevchenko@linux.intel.com>
         <20170321201739.GA20824@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:2239 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758473AbdCVNQq (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 22 Mar 2017 09:16:46 -0400
In-Reply-To: <20170321201739.GA20824@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, Tony Makkiel <tony.makkiel@daqri.com>

On Tue, 2017-03-21 at 21:17 +0100, Pavel Machek wrote:
> On Tue 2017-03-21 21:33:15, Andy Shevchenko wrote:
> > In ACPI world any ID should be carefully chosen and registered
> > officially. The discussion as I read it gets to wilful assignment an
> > ID
> > for non-existing real DSDT example.
> > 
> > Rafael already told [2] how this device would be enumerated using
> > compatible string.
> > 
> > Based on above, remove non-official ACPI IDs and enumeration from
> > the
> > driver.
> 
> Hmm. Do any "real users" have hardware with TXNW3952 ACPI ID?

I googled for it and found only discussions I put links to (besides few
mention of the driver code itself). So, it makes me to be confident
there is quite unlikely existing one in the wild (esp. TI answers).

> 
> 									
> Pavel
> 
> > -static const struct acpi_device_id lp3952_acpi_match[] = {
> > -	{"TXNW3952", 0},
> > -	{}
> > -};
> > -
> > -MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
> > -#endif
> > -
> >  static struct i2c_driver lp3952_i2c_driver = {
> >  	.driver = {
> >  			.name = LP3952_NAME,
> > -			.acpi_match_table =
> > ACPI_PTR(lp3952_acpi_match),
> >  	},
> >  	.probe = lp3952_probe,
> >  	.remove = lp3952_remove,
> 
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
