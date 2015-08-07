From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: leds-gpio on x86
Date: Fri, 7 Aug 2015 13:57:45 +0300
Message-ID: <20150807105745.GB1540@lahna.fi.intel.com>
References: <20150805220948.3984f19c@x2>
 <20150806165924.GY1540@lahna.fi.intel.com>
 <20150806191727.0bf87a3a@x2>
 <20150806173558.GZ1540@lahna.fi.intel.com>
 <20150806201820.5ca0764d@x2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:8766 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752126AbbHGK5s (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 7 Aug 2015 06:57:48 -0400
Content-Disposition: inline
In-Reply-To: <20150806201820.5ca0764d@x2>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vincent Pelletier <plr.vincent@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org

On Thu, Aug 06, 2015 at 08:18:20PM +0200, Vincent Pelletier wrote:
> On Thu, 6 Aug 2015 20:35:58 +0300, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > Do you know which GPIOs are used for leds?
> > 
> > Since the GPIO host controller is listed in the DSDT, I think patching
> > the leds device should be pretty simple.
> 
> That would be fantastic.
> 
> Green status: 62, green, active low
> Red status: 63, red, active low
> HDD racks: 70 to 75, red, active low
> USB: 17, blue, active low
> 
> I tested all via sysfs with gpio-f7188x driver loaded (numbers above
> are the values I wrote to /sys/class/gpio/register).

Ah, this is different GPIO controller that is listed in the DSDT (the
Baytrail GPIO host controller).

In order to get ACPI GPIO stuff work here you would need to first add
the GPIO device to the ACPI namespace and then modify gpio-f7188x.c to
probe it from there. You would also need to invent a _HID to the device
in order to get it matched. Unfortunately using random _HID will make
upstreaming the changes difficult.
