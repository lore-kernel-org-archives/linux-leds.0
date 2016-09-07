From: Jiri Pirko <jiri@resnulli.us>
Subject: Re: [patch] leds: add driver for Mellanox systems leds
Date: Wed, 7 Sep 2016 14:59:03 +0200
Message-ID: <20160907125903.GA8088@nanopsycho>
References: <1473255323-191745-1-git-send-email-vadimp@mellanox.com>
 <7c223316-4288-1a79-b8d5-67df583f1c0e@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7c223316-4288-1a79-b8d5-67df583f1c0e@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: vadimp@mellanox.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, michaelsh@mellanox.com
List-Id: linux-leds@vger.kernel.org

Wed, Sep 07, 2016 at 02:49:00PM CEST, j.anaszewski@samsung.com wrote:
>Hi Vadim,
>
>On 09/07/2016 03:35 PM, vadimp@mellanox.com wrote:
>> From: Vadim Pasternak <vadimp@mellanox.com>
>> 
>> This makes it possible to create a set of LEDs for Mellanox systems:
>> "msx6710", "msx6720", "msb7700", "msn2700", "msx1410", "msn2410",
>> "msb7800", "msn2740", "msn2100".
>> 
>> Driver obtains led devices according to system configuration, provided
>> through system DMI data, like fan1:green, fan1:red and creates devices in
>> form: "devicename:colour:function".
>> 
>> led setting is controlled through on board CPLD Lattice device.
>> For setting particular led off, solid,
>> blink (blink requires ledtrig-timer module):
>> echo 0 > /sys/class/leds/status\:green/brightness
>> echo 1 > /sys/class/leds/status\:green/brightness
>> echo timer > /sys/class/leds/status\:green/trigger
>> 
>
>Thanks for the update, will review it soon.
>
>One important detail - please update patch version each time
>you're sending a new one, like [PATCH v2].

Also a brief history of changes made would help.


>
>-- 
>Best regards,
>Jacek Anaszewski
