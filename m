From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [patch] leds: add driver for Mellanox systems leds
Date: Wed, 07 Sep 2016 14:49:00 +0200
Message-ID: <7c223316-4288-1a79-b8d5-67df583f1c0e@samsung.com>
References: <1473255323-191745-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:54219 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754337AbcIGMtG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Sep 2016 08:49:06 -0400
In-reply-to: <1473255323-191745-1-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: vadimp@mellanox.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com

Hi Vadim,

On 09/07/2016 03:35 PM, vadimp@mellanox.com wrote:
> From: Vadim Pasternak <vadimp@mellanox.com>
>
> This makes it possible to create a set of LEDs for Mellanox systems:
> "msx6710", "msx6720", "msb7700", "msn2700", "msx1410", "msn2410",
> "msb7800", "msn2740", "msn2100".
>
> Driver obtains led devices according to system configuration, provided
> through system DMI data, like fan1:green, fan1:red and creates devices in
> form: "devicename:colour:function".
>
> led setting is controlled through on board CPLD Lattice device.
> For setting particular led off, solid,
> blink (blink requires ledtrig-timer module):
> echo 0 > /sys/class/leds/status\:green/brightness
> echo 1 > /sys/class/leds/status\:green/brightness
> echo timer > /sys/class/leds/status\:green/trigger
>

Thanks for the update, will review it soon.

One important detail - please update patch version each time
you're sending a new one, like [PATCH v2].

-- 
Best regards,
Jacek Anaszewski
