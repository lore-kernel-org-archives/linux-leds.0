From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 01/12] leds: core: Use EXPORT_SYMBOL_GPL consistently
Date: Fri, 09 Oct 2015 10:19:48 +0200
Message-ID: <561778A4.3020006@samsung.com>
References: <1443445641-9529-1-git-send-email-j.anaszewski@samsung.com>
 <1443445641-9529-2-git-send-email-j.anaszewski@samsung.com>
 <56095923.7090600@samsung.com> <20151008155107.GJ11776@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20151008155107.GJ11776@xo-6d-61-c0.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, andrew@lunn.ch, rpurdie@rpsys.net
List-Id: linux-leds@vger.kernel.org

On 10/08/2015 05:51 PM, Pavel Machek wrote:
> On Mon 2015-09-28 17:13:39, Jacek Anaszewski wrote:
>> This patch isn't going to be applied since it can cause
>> legal implications for existing users.
>>
>
> Are there any? Best do this ASAP :-).

Current non-GPL users of led_set_brightness would be affected if we
changed this. I am not however certain if there are any, having in mind
that led_classdev_register is exported with EXPORT_SYMBOL_GPL.
Theoretically it is possible to use led_set_brightness without
registering LED class device, but it would be partially broken then
due to not initialized set_brightness_work.
I think that it would be safe to apply this patch.
I need acks, though :)

-- 
Best Regards,
Jacek Anaszewski
