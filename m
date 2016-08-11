From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: Possible Sysfs for led class drivers
Date: Thu, 11 Aug 2016 22:38:34 +0200
Message-ID: <57ACE24A.6080609@gmail.com>
References: <CAEwN+MBZqpKT5U+K93SdDQe4mCno3qULHy6=OZfjGcnTuUuKpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:36556 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751932AbcHKUjL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 11 Aug 2016 16:39:11 -0400
Received: by mail-wm0-f44.google.com with SMTP id q128so13197498wma.1
        for <linux-leds@vger.kernel.org>; Thu, 11 Aug 2016 13:39:11 -0700 (PDT)
In-Reply-To: <CAEwN+MBZqpKT5U+K93SdDQe4mCno3qULHy6=OZfjGcnTuUuKpg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Raul Piper <raulpblooper@gmail.com>, linux-leds@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

Hi Raul,

On 08/11/2016 03:27 PM, Raul Piper wrote:
> Hi,
> I have scanned through some of the led sysfs interfaces of my hardware
> boards inside the /sys/class/leds and found these
> brightness,
> max_brightness
> trigger
> uevent
> invert
> sata
>
> I want to know can we add our own custom sysfs interface ?
> Does there exists a default list of interfaces provided by the led
> class subsystem? like brightness, max_brightness,trigger,uevent ,etc??

You can add custom sysfs attributes by initializing "groups" property
of struct led_classdev.

-- 
Best regards,
Jacek Anaszewski
