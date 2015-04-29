From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Wed, 29 Apr 2015 17:06:32 +0200
Message-ID: <5540F378.9010106@samsung.com>
References: <553E6CF5.4030601@list.ru> <553F4B60.20204@samsung.com>
 <553F5CFF.9090601@list.ru> <553F83DC.8080701@samsung.com>
 <553F8A7F.7040700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37822 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423038AbbD2PGg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 29 Apr 2015 11:06:36 -0400
In-reply-to: <553F8A7F.7040700@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>

On 04/28/2015 03:26 PM, Stas Sergeev wrote:
> 28.04.2015 15:58, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 04/28/2015 12:12 PM, Stas Sergeev wrote:
>>> 28.04.2015 11:57, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Hi Stas,
>>>>
>>>> Have you tested it?
>>> Of course I did.
>>> Works with gpio driver and provides up to 10usec precision on
>>> armada-xp board.
>>> This is 1000 times better than without my patch - the precision
>>> was 10ms (jiffy).
>> Please take into account that this could work reliably only for gpio
>> LEDs. For the LEDs driven though a bus (e.g. I2C) delays below 1ms
>> might be hard to achieve. The minimum available delay would vary fro=
m
>> driver to driver.
>>
>> We could think of adding the hr_timer mode to the led-class.
>> The mode could be turned on with use of a new led_set_high_res_timer
>> API. The API would be called by drivers/leds/leds-gpio.c driver when
>> a dedicated sysfs attribute was set adequately.
>> The other drivers could also set this mode if they controlled device
>> with a suitable LED switching rate. The minimum delay value could
>> be made configurable by the driver and readable through sysfs
>> when in hr_timer mode.
> Why such a complexity?
> Wouldn't it be enough if the driver can set the minimum delay
> value, yet to always use the hrtimer?

Hr timers would be advantageous only for leds-gpio AFAICS. There is no
reason for making them default for all LED class drivers. I assume that
they provide higher resolution at a cost of consuming more CPU/system
resources.

> Please note that 10ms (jiffy) is an inadequate minimum delay
> pretty much for any driver, I guess. At least 1ms should be possible,
> because, well, you can write 1ms to sysfs attribute even without
> my patch. So even the existing options need hrtimer to work right.

As I mentioned before even with hr timer it wouldn't be possible
to assure that 1ms is achievable due to locking and bus latency
reasons.

>>>> I tried it with Samsung M0 board and
>>>> my leds-aat1290 driver. It didn't work well. And for small delay
>>>> intervals it will not have a chance to work reliably with all driv=
ers,
>>>> especially the ones which use mutex in their brightness_set op,
>>>> since mutex can sleep.
>>> OK, I can remove the nsec resolution.
>> usec also didn't work, please look at my use case and warning:
>>
>> echo "timer" > trigger
>> echo 1 > delay_on
>> echo 1 > delay_off
>> echo usec > delay_unit
>> [  178.584433] hrtimer: interrupt took 300747 ns
> I think I should try a tasklet then.
>
>> Only some time later I realized that for AAT1290 brightness is set
>> through ASCwire pulse protocol, which takes few ms.
>>
>> Please note that with this approach users would have to wonder why
>> they are getting the warnings and why they can't get their LEDs to w=
ork
>> with given settings.
> OK, so we need a tasklet and the ability for the driver to set the
> minimal delay. I think I can implement the former and hope someone
> else will later implement the later. :)
> Lets just solve the problem step-by-step. I can't solve all the
> problems at once, but you can't deny the fact that the problem
> exists and needs to be solved.
>

This seems not to be an urgent issue. Therefore it is better to
provide complex solution in one patch set.


--=20
Best Regards,
Jacek Anaszewski
