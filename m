From: Jacek Anaszewski <j.anaszewski81@gmail.com>
Subject: Re: [PATCH v3 3/3] leds/powernv: Add driver for PowerNV platform
Date: Wed, 22 Apr 2015 23:45:24 +0200
Message-ID: <20150422234524.305b5324@ja.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:32942 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756377AbbDVVpb (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 22 Apr 2015 17:45:31 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: stewart@linux.vnet.ibm.com, linux-leds@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, linuxppc-dev@lists.ozlabs.org, khandual@linux.vnet.ibm.com, benh@kernel.crashing.org, mpe@ellerman.id.au, devicetree@vger.kernel.org

> On 21.04.2015 07:50, Vasant Hegde wrote:
> On 04/20/2015 08:57 PM, Jacek Anaszewski wrote:
>> Hi Vasant,
>>
> 
> Jacek,
> 
> Thanks for the review.

You are welcome.

>> Thanks for the update.
>>
>> On 04/20/2015 10:01 AM, Vasant Hegde wrote:
>>> This patch implements LED driver for PowerNV platform using the
>>> existing generic LED class framework.
>>>
>>> PowerNV platform has below type of LEDs:
>>>     - System attention
>>>         Indicates there is a problem with the system that needs
>>> attention.
>>>     - Identify
>>>         Helps the user locate/identify a particular FRU or resource
>>> in the system.
>>>     - Fault
>>>         Indicates there is a problem with the FRU or resource at the
>>>         location with which the indicator is associated.
>>>
>>> We registers classdev structures for all individual LEDs detected
>>> on the
>>
>> s/registers/register
> 
> Fixed.
> 
>>
>>> system through LED specific device tree nodes. Device tree nodes
>>> specify what  all kind of LEDs present on the same location code.It
>>> registers LED classdev structure for each of them.
>>>
>>> All the system LEDs can be found in the same regular
>>> path /sys/class/leds/. We don't use LED colors. Hence our LEDs have
>>> names in this format.
>>>
>>>           <location_code>:<ATTENTION|IDENT|FAULT>
>>
>> I think that powernv prefix should be also present in the beginning.
>> What would be the format of <location_code> ? Does it identify a LED
>> uniquely.
> 
> Location code is unique and its guaranteed that we don't clash here.
> Also this is platform specific LEDs and I don't see any value by
> prefixing "powernv". Hence I think its fine with current format.
> 
> Sample location code : U78C9.001.RST0027-P1-C1
>    Here "U78C9.001.RST0027" represents the system model
>               P1 - Planar 1
>               C1 - Card 1

I consulted ePAPR standard and all the characters used for location code
are allowed. Nonetheless AFAIK no existing bindings use uppercase for
node name.


We will need DT maintainer's ack here too, so cc DT list.
Please CC devicetree@vger.kernel.org next time, especially for
DT documentation patch.

> .../...
> 
>>> +led {
>>> +    compatible = "ibm,opal-v3-led";
>>> +    phandle = <0x1000006b>;
>>> +    linux,phandle = <0x1000006b>;
>>> +    led-mode = "lightpath";
>>> +
>>> +    U78C9.001.RST0027-P1-C1 {
>>
>> DT node names should be in lowercase form.
>> Is U78C9.001.RST0027-P1-C1 a location code?
> 
> Yes ... Node presents the location code.. Platform provides these
> location code in upper case. Hence our OPAL firmware exposes them in
> upper case.
> 
>>
>>> +        led-types = "identify", "fault";
>>> +        led-loc = "descendent";
>>> +        phandle = <0x1000006f>;
>>> +        linux,phandle = <0x1000006f>;

I think that all these properties will not be needed.

>>> +    };
>>> +    ...
>>> +    ...
>>> +};
>>> +
>>> +
>>> +'compatible' property describes LEDs compatibility.
>>
>> compatible doesn't need to be mentioned here.
> 
> Removed.
> 
>>
>>> +'led-mode' property describes service indicator mode
>>> (lightpath/guidinglight).
>>
>> You don't parse this in the driver? What is its purpose?
> 
> As mentioned in other thread, currently our driver doesn't parse
> this. (As mode is provided by platform and its static).
> 
> Do you want me to elaborate this property here?

I don't think so. At least for now :)

> .../...
> 
>>> +
>>> +/*
>>> + * By default unload path resets all the LEDs. But on PowerNV
>>> platform
>>> + * we want to retain LED state across reboot as these are
>>> controlled by
>>> + * firmware. Also service processor can modify the LEDs
>>> independent of
>>> + * OS. Hence avoid resetting LEDs in unload path.
>>> + */
>>> +static bool led_disabled;
>>
>> I think that we have to make it configurable from the Device Tree
>> level. There could be a 'retain-state-removed' property introduced.
> 
> Hmmm.. In my case, LED behavior is not going to change. Hence I don't
> think we need this property.

Can you guarantee that the next version of the platform will have also
the same requirements? What if it would be made available to choose
that the LEDs are software-only controlled?

If these are unjustified doubts, I'm ok with leaving the static
variable.

>>
>> There is also another implication - you define LED_CORE_SUSPENDRESUME
>> flag. With current approach it wouldn't turn the led off on suspend.
>> Please either drop the flag or assure correct behaviour on suspend.
> 
> I will drop this.
> 
>> You can also make this configurable like retain-state-suspended
>> property in Documentation/devicetree/bindings/leds/leds-gpio.txt.
>>
> 
> .../...
> 
>>> +
>>> +    if (powernv_get_loc_code(led_type, loc_code) != 0)
>>> +        goto out_loc;
>>> +
>>> +    /* Prepare for the OPAL call */
>>> +    max_led_type = cpu_to_be64(OPAL_SLOT_LED_TYPE_MAX);
>>> +    led_mask = OPAL_SLOT_LED_STATE_ON << led_type;
>>> +    if (value)
>>> +        led_value = OPAL_SLOT_LED_STATE_ON << led_type;
>>
>>          led_value = led_mask;
> 
> Fixed.
> 
> .../...
> 
>>> +
>>> +/* Schedule work to update LED state */
>>> +static void powernv_led_set_queue(struct led_classdev *led_cdev,
>>> +                  enum led_brightness value, u64 led_type)
>>
>> It doesn't set any queue. It should be powernv_brightness_set.
> 
> Make sense. Fixed.
> 
> .../...
> 
>>> +    /* Create the name for classdev */
>>> +    switch (led_type) {
>>> +    case OPAL_SLOT_LED_TYPE_ATTN:
>>> +        powernv_led->cdev.name = kasprintf(GFP_KERNEL,
>>> +                           "%s%s", node->name,
>>> +                           POWERNV_LED_ATTN);
>>
>> LED name should be taken from of_node name or label property
>> directly. Please refer to the other LED class drivers.
> 
> Hmmm.. Our  current FW provides led-types property which tells
> available type for given location code..
> like
>    led-types = "identify" "fault"..
> 
> Can I use this ? So the names will be
>     <location_code>:<identify|fault|attention>

I adressed this in the other message.

> And if this approach fine,  I can fix (assuming maintainer agrees :-)
> ) firmware side to change identify -> ident.

Let's leave it. It seems to be platform specific.


-- 
Best Regards,
Jacek Anaszewski
