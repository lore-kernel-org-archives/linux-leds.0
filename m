From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: leds-gpio on x86
Date: Thu, 6 Aug 2015 20:18:20 +0200
Message-ID: <20150806201820.5ca0764d@x2>
References: <20150805220948.3984f19c@x2>
	<20150806165924.GY1540@lahna.fi.intel.com>
	<20150806191727.0bf87a3a@x2>
	<20150806173558.GZ1540@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:34301 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753324AbbHFSSC (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 6 Aug 2015 14:18:02 -0400
In-Reply-To: <20150806173558.GZ1540@lahna.fi.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org

On Thu, 6 Aug 2015 20:35:58 +0300, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Do you know which GPIOs are used for leds?
> 
> Since the GPIO host controller is listed in the DSDT, I think patching
> the leds device should be pretty simple.

That would be fantastic.

Green status: 62, green, active low
Red status: 63, red, active low
HDD racks: 70 to 75, red, active low
USB: 17, blue, active low

I tested all via sysfs with gpio-f7188x driver loaded (numbers above
are the values I wrote to /sys/class/gpio/register).

"green status" led works minimally out of the box: static-on when the
box is on, off otherwise (I would make it blink on S3, for example).

Regards,
-- 
Vincent Pelletier
