From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: leds-gpio on x86
Date: Sat, 8 Aug 2015 14:06:56 +0200
Message-ID: <20150808140656.6b81d3b9@x2>
References: <20150805220948.3984f19c@x2>
	<20150806165924.GY1540@lahna.fi.intel.com>
	<20150806191727.0bf87a3a@x2>
	<20150806173558.GZ1540@lahna.fi.intel.com>
	<20150806201820.5ca0764d@x2>
	<20150807105745.GB1540@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:34853 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932495AbbHHMHA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 8 Aug 2015 08:07:00 -0400
In-Reply-To: <20150807105745.GB1540@lahna.fi.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org

On Fri, 7 Aug 2015 13:57:45 +0300, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Ah, this is different GPIO controller that is listed in the DSDT (the
> Baytrail GPIO host controller).
> 
> In order to get ACPI GPIO stuff work here you would need to first add
> the GPIO device to the ACPI namespace and then modify gpio-f7188x.c to
> probe it from there. You would also need to invent a _HID to the device
> in order to get it matched. Unfortunately using random _HID will make
> upstreaming the changes difficult.

I gave a shot at writing a module. I got to the point where it builds
and loads, but it does not appear to do anything (no error
returned modprobe, nothing in dmesg).

I have no idea if the ~4 lines of "actual" code (ie, not just data
definition) are even in the good direction actually. I took
  http://www.armadeus.com/wiki/index.php?title=GPIO_LEDS
as an example. This is for a platform definition for a devboard
(arm ?), so it may be a wrong example. I took a look at other led
drivers, and their complexity varies a lot.

Would you mind taking a look ?
  https://github.com/vpelletier/linux/commits/ts651

For example, I have no idea how to explicitly depend on gpio-f7188x
and leds-gpio.
-- 
Vincent Pelletier
