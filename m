From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH/RFC v2 1/5] leds: Use set_brightness_work for
 brightness_set ops that can sleep
Date: Fri, 03 Jul 2015 15:16:19 +0200
Message-ID: <55968B23.6000109@samsung.com>
References: <1435672770-4261-1-git-send-email-j.anaszewski@samsung.com>
 <20150630222450.GR5904@valkosipuli.retiisi.org.uk>
 <5593B84B.7030806@samsung.com> <5593D6B2.4030808@samsung.com>
 <20150701214456.GU5904@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:12914 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932275AbbGCNQ0 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 3 Jul 2015 09:16:26 -0400
In-reply-to: <20150701214456.GU5904@valkosipuli.retiisi.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, phil

Hi Sakari,

On 07/01/2015 11:44 PM, Sakari Ailus wrote:
> Hi Jacek,
>
> On Wed, Jul 01, 2015 at 02:01:54PM +0200, Jacek Anaszewski wrote:
>> On 07/01/2015 11:52 AM, Jacek Anaszewski wrote:
>>> Hi Sakari,
>>>
>>> On 07/01/2015 12:24 AM, Sakari Ailus wrote:
>>>> Hi Jacek,
>>>>
>>>> On Tue, Jun 30, 2015 at 03:59:26PM +0200, Jacek Anaszewski wrote:
>>>>> This patch rearranges the core LED subsystem code, so that it
>>>>> now shifts the responsibility for using work queues from drivers,
>>>>> in case their brightness_set ops can sleep, onto the LED core
>>>>> Addition of two flags: LED_BRIGHTNESS_FAST and LED_BLINK_DISABLE
>>>>> as well as new_brightness_value property to the struct led_classdev
>>>>> allows for employing existing set_brightness_work to do the job.
>>>>> The modifications allows also to get rid of brightness_set_sync op,
>>>>> as flash LED devices can now be handled properly only basing on the
>>>>> SET_BRIGHTNESS_SYNC flag.
>>>>
>>>> Nice patch! Thanks!
>>>>
>>>> Looks like this is the favourite topic nowadays. ;-)
>>>
>>> Yeah, this allows to believe that we will manage to tackle the issue
>>> finally :)
>>>
>>>> The documentation should be improved to tell how the API is expected
>>>> to be
>>>> have, e.g. which functions may block. I think this is out of scope for
>>>> this
>>>> patch though.
>>>
>>> Yes, I planned to cover this after the patch is accepted.
>>>
>>>> I think all the existing drivers that implement the set_brightness()
>>>> callback have a fast (and non-blocking) implementation, and some of these
>>>> drivers use a work queue. In order to avoid modifying those drivers right
>>>> now, how about adding a flag for slow devices instead? "Slow" handlers
>>>> should be those that do at least one of the following: 1) sleep and 2)
>>>> take
>>>> excessive amount of time to run.
>>>
>>> As Andrew Lunn mentioned, he was also working on this issue and he did
>>> the vast majority of work [1] needed to remove work queues from existing
>>> drivers. Only new flags would have to be added.
>>>
>>>> How about splitting the patch as follows:
>>>>
>>>> - set_brightness()/set_brightness_sync() -> set_brightness() +
>>>>    LED_BRIGHTNESS_FAST + slow handlers in a work queue,
>>>> - add LED_BLINK_DISABLE flag,
>>>> - fix the heartbeat trigger (it's sleeping in a timer if
>>>> LED_BRIGHTNESS_SYNC
>>>>    is set).
>>>
>>> With my solution heartbeat trigger is not sleeping even if
>>> LED_BRIGHTNESS_SYNC is set as all triggers use the new function -
>>> led_set_brightness_nosleep.
>>>
>>>> I'd propose to drop led_set_brightness_async() and just make
>>>> led_set_brightness() asynchronous (or non-blocking if you wish) as it was
>>>> before the LED flash class patches. Considering the nature and
>>>> tradition of
>>>> the framework, that's probably how most users want it to be. One can
>>>> always
>>>> use led_set_brightness_sync() if needed.
>>
>> led_set_brightness called brightness_set op in a synchronous way
>> before LED flash class patches. It was up to driver how it implemented
>> the op - blocking or non-blocking. API was not async by default then.
>
> The framework did not implement it but the drivers did.

Roughly half of the total number of drivers use work queues.
The rest of them set the brightness synchronously.

When I run following command:

find drivers/leds -name "*.c" | xargs grep INIT_WORK | awk '{print $1}' 
| uniq | wc -l

it shows 31.

> Quite a few drivers
> actually change the LED state asynchronously, while the set_brightness()
> callback does not block.
 >
>>
>> Adding public API led_set_brightness_sync would introduce ambiguity, as
>> led_set_brightness also can be synchronous.
>
> Well, it could be synchronous, indeed. But synchronous operation is not
> guaranteed. The essence of this is that led_set_brightness() does not sleep.
> Whether the LED state is changed synchronously or not is not important.

I agree. I changed the approach in the new version of the patch set.

>>
>>>> The caller should indeed decide whether the operation is synchronous
>>>> or not,
>>>> that's not really a property of the LED. I requested that for the V4L2
>>>> framework due to the very different use cases that are typical for the
>>>> LED
>>>> class devices.
>>
>> I agree that caller should decide, but we would have to have unambiguous
>> API for this. I am wondering if renaming led_set_brightness to
>> led_set_brightness_async and making it always scheduling the work queue
>> would be harmless solution. This would modify only kernel internal API.
>
> We don't want to queue work if we just want to write to a register. The work
> queue should only be used for slow handlers that are better not called e.g.
> from interrupt context.

Right. Ignore this.

>> We could introduce led_set_brightness_sync API then, which would call
>> brightness_set op in a synchronous way.
>
> Considering the pre-flash LED use cases and what the V4L2 flash API
> requirements are, my understanding is that we should do with two LED class
> API functions for setting LED brightness:
>
> - led_set_brightness (which will not block and is very fast, but the LED
>    brightness change may happen asynchronously) and
>
> - led_set_brightness_sync (which is always synchronous).
>

Exactly.

-- 
Best Regards,
Jacek Anaszewski
