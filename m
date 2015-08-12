From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: leds-gpio on x86
Date: Wed, 12 Aug 2015 15:53:14 +0300
Message-ID: <20150812125314.GS1541@lahna.fi.intel.com>
References: <20150805220948.3984f19c@x2>
 <20150806165924.GY1540@lahna.fi.intel.com>
 <20150806191727.0bf87a3a@x2>
 <20150806173558.GZ1540@lahna.fi.intel.com>
 <20150806201820.5ca0764d@x2>
 <20150807105745.GB1540@lahna.fi.intel.com>
 <20150808140656.6b81d3b9@x2>
 <20150811120038.GF1541@lahna.fi.intel.com>
 <20150811194256.08816c63@x2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150811194256.08816c63@x2>
Sender: linux-acpi-owner@vger.kernel.org
To: Vincent Pelletier <plr.vincent@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, Aug 11, 2015 at 07:42:56PM +0200, Vincent Pelletier wrote:
> On Tue, 11 Aug 2015 15:00:38 +0300, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > One thing I noticed:
> > 
> > 	qnap_tsx51_leds_platform_device = platform_device_register_resndata(NULL, "led-gpio", -1, NULL, 0,
> > 		&qnap_tsx51_led_data, sizeof(qnap_tsx51_led_data));
> > 
> > The driver expects "leds-gpio" not "led-gpio".
> 
> And indeed, this is what was preventing proper detection.
> Very nice catch, thanks a lot.
> 
> Now, I see two more things I need to do and for which I have no idea:
> - Somehow depend on gpio-f7188x and cause leds-gpio to get loaded (is it
>   a dependence too ?).
>   Module writing documentation mention soft dependencies, but it feels
>   wrong here.

Once your module gets loaded, it creates the "leds-gpio" platform device
which in turn makes the leds-gpio driver to load.

For gpio-f7188x you need to load it manually because it does not have
any module strings modprobe can match with a device. You can create
platform device for this in your qnap board file as well and then add
MODULE_ALIAS() to the driver to get it loaded automatically.

> - Somehow detect that it is actually a qnap of expected model (and, by
>   extension, actually implement led count substraction).
>   I tried (and failed so far) to understand what the original firmware
>   does. dmidecode does not bring something relevant. I have no idea
>   what is typically done in this area.

Typically we get necessary information from ACPI or similar device
description ;-)

You may check DMI strings in _init() of your board file and only create
the platform devices if they match qnap. /sys/class/dmi/id/* should have
something to differentiate it from others.
