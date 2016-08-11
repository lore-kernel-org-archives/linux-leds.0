From: Raul Piper <raulpblooper@gmail.com>
Subject: Possible Sysfs for led class drivers
Date: Thu, 11 Aug 2016 18:57:58 +0530
Message-ID: <CAEwN+MBZqpKT5U+K93SdDQe4mCno3qULHy6=OZfjGcnTuUuKpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:35120 "EHLO
	mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932222AbcHKN2F (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 11 Aug 2016 09:28:05 -0400
Received: by mail-io0-f181.google.com with SMTP id m101so5851977ioi.2
        for <linux-leds@vger.kernel.org>; Thu, 11 Aug 2016 06:28:04 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

Hi,
I have scanned through some of the led sysfs interfaces of my hardware
boards inside the /sys/class/leds and found these
brightness,
max_brightness
trigger
uevent
invert
sata

I want to know can we add our own custom sysfs interface ?
Does there exists a default list of interfaces provided by the led
class subsystem? like brightness, max_brightness,trigger,uevent ,etc??

Thanks in advance !
Rgds
Rp
