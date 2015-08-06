From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: leds-gpio on x86
Date: Thu, 6 Aug 2015 19:17:27 +0200
Message-ID: <20150806191727.0bf87a3a@x2>
References: <20150805220948.3984f19c@x2>
	<20150806165924.GY1540@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:33681 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754486AbbHFRRH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 6 Aug 2015 13:17:07 -0400
In-Reply-To: <20150806165924.GY1540@lahna.fi.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org

On Thu, 6 Aug 2015 19:59:24 +0300, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Does it list the GPIO controller itself in the DSDT? If it does not, you
> would need to patch that there as well.

I do see this in the dsdt:
  Name (_HID, "INT33FC" /* Intel Baytrail GPIO Controller */)  // _HID: Hardware ID
  Name (_CID, "INT33FC" /* Intel Baytrail GPIO Controller */)  // _CID: Compatible ID

I do not know the distinction between a gpio controller and the chip
which has the pins directly, though.

> Just in case, can you provide me the DSDT? I can take a look.

(sent off-list)

> I would just go for writing a custom board file that fills in platform
> data to leds-gpio.c driver.

Thanks, I'll go this way.

Regards,
-- 
Vincent Pelletier
