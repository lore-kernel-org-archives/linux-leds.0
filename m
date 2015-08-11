From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: leds-gpio on x86
Date: Tue, 11 Aug 2015 15:00:38 +0300
Message-ID: <20150811120038.GF1541@lahna.fi.intel.com>
References: <20150805220948.3984f19c@x2>
 <20150806165924.GY1540@lahna.fi.intel.com>
 <20150806191727.0bf87a3a@x2>
 <20150806173558.GZ1540@lahna.fi.intel.com>
 <20150806201820.5ca0764d@x2>
 <20150807105745.GB1540@lahna.fi.intel.com>
 <20150808140656.6b81d3b9@x2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:4311 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933911AbbHKMBA (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 11 Aug 2015 08:01:00 -0400
Content-Disposition: inline
In-Reply-To: <20150808140656.6b81d3b9@x2>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vincent Pelletier <plr.vincent@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org

On Sat, Aug 08, 2015 at 02:06:56PM +0200, Vincent Pelletier wrote:
> On Fri, 7 Aug 2015 13:57:45 +0300, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > Ah, this is different GPIO controller that is listed in the DSDT (the
> > Baytrail GPIO host controller).
> > 
> > In order to get ACPI GPIO stuff work here you would need to first add
> > the GPIO device to the ACPI namespace and then modify gpio-f7188x.c to
> > probe it from there. You would also need to invent a _HID to the device
> > in order to get it matched. Unfortunately using random _HID will make
> > upstreaming the changes difficult.
> 
> I gave a shot at writing a module. I got to the point where it builds
> and loads, but it does not appear to do anything (no error
> returned modprobe, nothing in dmesg).
> 
> I have no idea if the ~4 lines of "actual" code (ie, not just data
> definition) are even in the good direction actually. I took
>   http://www.armadeus.com/wiki/index.php?title=GPIO_LEDS
> as an example. This is for a platform definition for a devboard
> (arm ?), so it may be a wrong example. I took a look at other led
> drivers, and their complexity varies a lot.
> 
> Would you mind taking a look ?
>   https://github.com/vpelletier/linux/commits/ts651

One thing I noticed:

	qnap_tsx51_leds_platform_device = platform_device_register_resndata(NULL, "led-gpio", -1, NULL, 0,
		&qnap_tsx51_led_data, sizeof(qnap_tsx51_led_data));

The driver expects "leds-gpio" not "led-gpio".
