From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] leds: lp3952: Remove ACPI support for lp3952
Date: Wed, 22 Mar 2017 16:20:31 +0200
Message-ID: <1490192431.19767.169.camel@linux.intel.com>
References: <20170321193315.33238-1-andriy.shevchenko@linux.intel.com>
         <20170321201739.GA20824@amd> <1490188512.19767.166.camel@linux.intel.com>
         <LO1P123MB0674648ED2956816983DC0C8C33C0@LO1P123MB0674.GBRP123.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:49158 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759921AbdCVOUr (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 22 Mar 2017 10:20:47 -0400
In-Reply-To: <LO1P123MB0674648ED2956816983DC0C8C33C0@LO1P123MB0674.GBRP123.PROD.OUTLOOK.COM>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: tony makkiel <tonysonney@hotmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Wed, 2017-03-22 at 14:08 +0000, tony makkiel wrote:
> 
> On 22/03/17 13:15, Andy Shevchenko wrote:
> > On Tue, 2017-03-21 at 21:17 +0100, Pavel Machek wrote:
> > > On Tue 2017-03-21 21:33:15, Andy Shevchenko wrote:
> > > > In ACPI world any ID should be carefully chosen and registered
> > > > officially. The discussion as I read it gets to wilful
> > > > assignment an
> > > > ID
> > > > for non-existing real DSDT example.
> > > > 
> > > > Rafael already told [2] how this device would be enumerated
> > > > using
> > > > compatible string.
> > > > 
> > > > Based on above, remove non-official ACPI IDs and enumeration
> > > > from
> > > > the
> > > > driver.
> > > 
> > > Hmm. Do any "real users" have hardware with TXNW3952 ACPI ID?
> > 
> > I googled for it and found only discussions I put links to (besides
> > few
> > mention of the driver code itself). So, it makes me to be confident
> > there is quite unlikely existing one in the wild (esp. TI answers).
> > 
> 
> [3] https://www.spinics.net/lists/linux-acpi/msg67125.html
> [4] http://www.uefi.org/ACPI_ID_List?search=texas
> [5] http://www.spinics.net/lists/linux-leds/msg06353.html
> 
> Following 2 links, copied from previous post
> 
> 
> [1] https://e2e.ti.com/support/power_management/led_driver/f/192/t/524
> 926
> [2] http://article.gmane.org/gmane.linux.acpi.devel/85252
> 
> 
>   For some reason cant open link [2].

Doesn't matter, it's the same as [3].

> 
> [3] lead to [1]. The name was chosen based on 5th post on [1]. I
> tried 
> to use 'PRP0001'. But was told not to use it [5].

No, you didn't just get how it's supposed to work.

You may read [6] as example how PRP0001 would be used if needed.

http://marc.info/?l=linux-i2c&m=149012370204924&w=2


Rafael is right there, you can't add PRP0001 *explicitly* in the list.

Moreover, Rafael explicitly told you what to do:

"So the entire ACPI block can be dropped for now.
And the driver doesn't have to depend on CONFIG_ACPI any more, does it?"

By some unknown reason you decide on your own how to proceed.

> 
> I can confirm, the driver gets probed, and works if ACPI string
> match. 
> [Was tested on Minnowboard with SSDT overlay].
> 
> > > 
> > > 									
> > > Pavel
> > > 
> > > > -static const struct acpi_device_id lp3952_acpi_match[] = {
> > > > -	{"TXNW3952", 0},
> > > > -	{}
> > > > -};
> > > > -
> > > > -MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
> > > > -#endif
> > > > -
> > > >  static struct i2c_driver lp3952_i2c_driver = {
> > > >  	.driver = {
> > > >  			.name = LP3952_NAME,
> > > > -			.acpi_match_table =
> > > > ACPI_PTR(lp3952_acpi_match),
> > > >  	},
> > > >  	.probe = lp3952_probe,
> > > >  	.remove = lp3952_remove,
> > > 
> > > 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
