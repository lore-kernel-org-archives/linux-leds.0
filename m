From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: Add Chrome OS keyboard backlight LEDs driver
Date: Fri, 04 Mar 2016 10:38:40 +0100
Message-ID: <56D957A0.7070300@samsung.com>
References: <20160303234646.GA17641@dtor-ws>
 <1457080729.18482.6.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:30327 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758357AbcCDJio (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Mar 2016 04:38:44 -0500
In-reply-to: <1457080729.18482.6.camel@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Evan McClain <aeroevan@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Bryan Wu <cooloney@gmail.com>, Simon Que <sque@chromium.org>, Olof Johansson <olofj@chromium.org>, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Evan,

On 03/04/2016 09:38 AM, Evan McClain wrote:
> On Thu, 2016-03-03 at 15:46 -0800, Dmitry Torokhov wrote:
>> From: Simon Que <sque@chromium.org>
>>
>> This is a driver for ACPI-based keyboard backlight LEDs found on
>> Chromebooks. The driver locates \\_SB.KBLT ACPI device and exports
>> backlight as "chromeos::kbd_backlight" LED class device in sysfs.
>
> Was it ever decided where this driver should live? I was planning on
> submitting to platform/chrome since most keyboard backlights seem to
> live over there but I don't think I got a response.
>

It hasn't been decided yet. I can take it, but could you submit one more
version, without

'owner	= THIS_MODULE' in struct platform_driver keyboard_led_driver ?

It is redundant, because the core will do it.

Also the line with devm_kzalloc has over 80 characters.

-- 
Best regards,
Jacek Anaszewski
