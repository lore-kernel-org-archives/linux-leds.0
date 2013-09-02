From: Ian Pilcher <arequipeno@gmail.com>
Subject: Re: device_create_file returns 0 but doesn't work
Date: Sun, 01 Sep 2013 23:48:34 -0500
Message-ID: <522418A2.8030909@gmail.com>
References: <l00j5e$8b0$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:61822 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752266Ab3IBEsg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 2 Sep 2013 00:48:36 -0400
In-Reply-To: <l00j5e$8b0$1@ger.gmane.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, kernelnewbies@kernelnewbies.org, linux-kernel@vger.kernel.org

On 09/01/2013 06:38 PM, Ian Pilcher wrote:
> I am trying to add an additional sysfs attribute to a device (LED) that
> is created by another driver.  (My ultimate goal is to provide a way for
> a userspace application to use the functionality provided by
> led_blink_set, which doesn't currently seem to be possible.)

Turns out it is possible, with the LED timer trigger, so this issue is
now moot.

> 
> The kernel module code that sets up all the GPIOs & LEDs in my NAS is
> at:
> 
>   http://pastebin.com/TJZGww8T
> 
> The call to device_create_file is at line 373.
> 
> device_create_file is returning 0, but the "foo" attribute is not being
> created.  ("find /sys -name '*foo*'" doesn't find anything, so I'm not
> just looking in the wrong place.)

Still rather odd that it doesn't work, however, since ledtrig-timer.c
seems to do pretty much the same thing.  Oh well.

-- 
========================================================================
Ian Pilcher                                         arequipeno@gmail.com
Sometimes there's nothing left to do but crash and burn...or die trying.
========================================================================
