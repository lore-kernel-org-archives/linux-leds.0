From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: Add user LED driver for NIC78bx device
Date: Sun, 23 Oct 2016 16:12:04 +0200
Message-ID: <5bd2fac9-0fe7-4445-e0a6-0342b08f7e33@gmail.com>
References: <CGME20161021063441eucas1p221cdc9bd704f03ad367df8cf59fa35e6@eucas1p2.samsung.com>
 <1477031633-70909-1-git-send-email-hui.chun.ong@ni.com>
 <335a9cd9-2af7-2d7c-12ab-1000dddbd0d6@samsung.com>
 <20161021213347.GA15895@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35983 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752327AbcJWOMm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 23 Oct 2016 10:12:42 -0400
Received: by mail-wm0-f66.google.com with SMTP id f193so5936302wmg.3
        for <linux-leds@vger.kernel.org>; Sun, 23 Oct 2016 07:12:42 -0700 (PDT)
In-Reply-To: <20161021213347.GA15895@jcartwri.amer.corp.natinst.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Julia Cartwright <julia@ni.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Hui Chun Ong <hui.chun.ong@ni.com>, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jonathan.hearn@ni.com, Brad Mouring <brad.mouring@ni.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

Hi Julia,

On 10/21/2016 11:33 PM, Julia Cartwright wrote:
> On Fri, Oct 21, 2016 at 02:56:15PM +0200, Jacek Anaszewski wrote:
>> Hi Hui,
>>
>> Thanks for the patch. I have few comments in the code below.
>>
>> On 10/21/2016 08:33 AM, Hui Chun Ong wrote:
>>> Add the driver to support User LEDs on PXI Embedded Controller.
>>>
>>> Signed-off-by: Hui Chun Ong <hui.chun.ong@ni.com>
>>> Signed-off-by: Brad Mouring <brad.mouring@ni.com>
> [..]
>>
>>> +
>>> +struct ni78bx_led {
>>> +	u8 bit;
>>> +	u8 mask;
>>> +	struct led_classdev cdev;
>>> +};
>>> +
>>> +static inline struct ni78bx_led *to_ni78bx_led(struct led_classdev *cdev)
>>> +{
>>> +	return container_of(cdev, struct ni78bx_led, cdev);
>>> +}
>>> +
>>> +static void ni78bx_brightness_set(struct led_classdev *cdev,
>>> +				  enum led_brightness brightness)
>>> +{
>>> +	struct ni78bx_led *nled = to_ni78bx_led(cdev);
>>> +	u8 value;
>>> +
>>> +	mutex_lock(&led_lock);
>>
>> You can use spin_lock_irqsave() instead, since we are not going to sleep
>> while accessing memory mapped registers.
>
> Could you explain why spin_lock_irqsave() is appropriate here?  This
> device doesn't have an interrupt to be synchronized with.  I could
> understand spin_lock()/spin_unlock(), maybe, but why disable interrupts?

brightness_set op can be called from atomic context e.g. in case of
timer trigger. The code that runs in the interrupt context cannot sleep
due to reasons explained in [0], whereas mutex can sleep on contention.

spin_lock() is appropriate only in a hard irq handler.

> Is what you're saying that the set/get brightness calls can be re-entered
> by LED consumers in hardirq context?
>
> The systems this driver is deployed to is much more sensitive to RT
> execution latency than anything else, which is why I take pause to
> unnecessary interrupt mask twiddling/preemption disabling :).

[0] http://www.makelinux.net/ldd3/chp-5-sect-5

-- 
Best regards,
Jacek Anaszewski
