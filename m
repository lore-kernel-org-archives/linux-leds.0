From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: brightness units
Date: Tue, 01 Apr 2014 09:21:41 +0200
Message-ID: <533A6905.3010600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:42533 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751035AbaDAHVo (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 1 Apr 2014 03:21:44 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3C00IP4CG64M90@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 01 Apr 2014 08:21:42 +0100 (BST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Sakari Ailus <sakari.ailus@iki.fi>

I am currently integrating LED subsystem and V4L2 Flash API.
V4L2 Flash API defines units of torch and flash intensity
in milliampers. In the LED subsystem documentation I can't
find any reference to the brightness units. On the other
hand there is led_brightness enum defined in the <linux/leds.h>
header, with LED_FULL = 255, but not all leds drivers use it.
I am aware that there are LEDs that can be only turned on/off
without any possibility to set the current and in such cases
LED_FULL doesn't reflect the current set.

So far I've assumed that brightness is expressed in milliampers
and I don't stick to the LED_FULL limit. It allows for passing
flash/torch intensity from V4L2 controls to the leds API
without conversion. I am not sure if the units should be
fixed to milliampers in the LED subsystem or not. It would
clarify the situation, but if the existing LED drivers don't
stick to this unit then it would make a confusion.

In view of the above I'd like to ask for any advice on
how to proceed.

Thanks,
Jacek Anaszewski
