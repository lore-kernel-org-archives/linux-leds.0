From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] leds: Add Chrome OS keyboard backlight LEDs driver
Date: Fri, 4 Mar 2016 12:59:55 -0800
Message-ID: <20160304205955.GG17145@dtor-ws>
References: <20160303234646.GA17641@dtor-ws>
 <1457080729.18482.6.camel@gmail.com>
 <56D957A0.7070300@samsung.com>
 <20160304191322.GA17145@dtor-ws>
 <56D9F63C.5030608@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:33236 "EHLO
	mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758765AbcCDU77 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Mar 2016 15:59:59 -0500
Content-Disposition: inline
In-Reply-To: <56D9F63C.5030608@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Evan McClain <aeroevan@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Bryan Wu <cooloney@gmail.com>, Simon Que <sque@chromium.org>, Olof Johansson <olofj@chromium.org>, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Fri, Mar 04, 2016 at 09:55:24PM +0100, Jacek Anaszewski wrote:
> On 03/04/2016 08:13 PM, Dmitry Torokhov wrote:
> >On Fri, Mar 04, 2016 at 10:38:40AM +0100, Jacek Anaszewski wrote:
> >>Hi Evan,
> >>
> >>On 03/04/2016 09:38 AM, Evan McClain wrote:
> >>>On Thu, 2016-03-03 at 15:46 -0800, Dmitry Torokhov wrote:
> >>>>From: Simon Que <sque@chromium.org>
> >>>>
> >>>>This is a driver for ACPI-based keyboard backlight LEDs found on
> >>>>Chromebooks. The driver locates \\_SB.KBLT ACPI device and exports
> >>>>backlight as "chromeos::kbd_backlight" LED class device in sysfs.
> >>>
> >>>Was it ever decided where this driver should live? I was planning on
> >>>submitting to platform/chrome since most keyboard backlights seem to
> >>>live over there but I don't think I got a response.
> >>>
> >>
> >>It hasn't been decided yet. I can take it, but could you submit one more
> >>version, without
> >>
> >>'owner	= THIS_MODULE' in struct platform_driver keyboard_led_driver ?
> >>
> >>It is redundant, because the core will do it.
> >>
> >>Also the line with devm_kzalloc has over 80 characters.
> >
> >Also:
> >
> >- preferably use sizeof(*cdev) instead of sizeof(struct ...)
> >- do not check cdev->flags & LED_SUSPENDED in
> >   keyboard_led_set_brightness() as it is not going to be called when led
> >   device is suspended anyway
> >- change the MODULE_LICENSE from "GPL v2" to "GPL" as to match the
> 
> I can see "either version 2 of the License" in the license notice.

>From module.h:

 *	"GPL"				[GNU Public License v2 or later]
 *	"GPL v2"			[GNU Public License v2]

leds-chromeos-keyboard is GPL v2+ so module license should be "GPL".

Thanks.

-- 
Dmitry
