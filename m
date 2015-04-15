From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 2/2] leds/powernv: Add driver for PowerNV platform
Date: Wed, 15 Apr 2015 15:12:50 +0200
Message-ID: <552E63D2.4070209@samsung.com>
References: <20150320105921.14866.83209.stgit@localhost.localdomain>
 <20150320110328.14866.98225.stgit@localhost.localdomain>
 <552D303A.5080506@samsung.com> <552E049D.2030604@linux.vnet.ibm.com>
 <552E2480.9060102@samsung.com> <552E3A56.8030300@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55123 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751424AbbDONND (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 15 Apr 2015 09:13:03 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NMU007LANK1W0B0@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 15 Apr 2015 14:16:49 +0100 (BST)
In-reply-to: <552E3A56.8030300@linux.vnet.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, stewart@linux.vnet.ibm.com, mpe@ellerman.id.au, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com

On 04/15/2015 12:15 PM, Vasant Hegde wrote:
> On 04/15/2015 02:12 PM, Jacek Anaszewski wrote:
>> Hi Vasant,
>>
>> On 04/15/2015 08:26 AM, Vasant Hegde wrote:
>>> On 04/14/2015 08:50 PM, Jacek Anaszewski wrote:
>>>> Hi Vasant,
>>>
>>> Hi Jacek,
>>>
>>>>>
>>>>> This patch implements LED driver for PowerNV platform using the existing
>>>>> generic LED class framework. It registers classdev structures for all
>>>>> individual LEDs detected on the system through LED specific device tree
>>>>> nodes. Device tree nodes specify what all kind of LEDs present on the
>>>>> same location code. It registers LED classdev structure for each of them.
>>>>>
>>>>> The platform level implementation of LED get and set state has been
>>>>> achieved through OPAL calls. These calls are made available for the
>>>>> driver by exporting from architecture specific codes.
>>>>>
>>>>> As per the LED class framework, the 'brightness_set' function should not
>>>>> sleep. Hence these functions have been implemented through global work
>>>>> queue tasks which might sleep on OPAL async call completion.
>>>>
>>>> Wouldn't it be easier to implement synchronization on the OPAL side?
>>>
>>> We had thought about this.. But OPAL intern depends on service processor to
>>> enable/disable indicator. So we can't make this as synchronous one.
>>
>> I've revised this one more time and I think that use of spin locks is an
>> overkill in this case. It would suffice to define three work queues -
>> one per led and one common mutex.
>
> Will try work queue option/
>
>>
>> powernv_led_set and powernv_led_get would have to be called under the
>> mutex. Please refer to the existing LED class drivers of the LED
>> controllers with many sub-LEDs to control: e.g.:
>> drivers/leds/leds-lm355x.c
>
> Ok. Will look into it. Thanks!
>
> .../...
>
>>>
>>>>
>>>>> +
>>>>> +#include <asm/opal.h>
>>>>> +
>>>>> +#define LED_STR_ATTENTION    ":ATTENTION"
>>>>> +#define LED_STR_IDENT        ":IDENTIFY"
>>>>> +#define LED_STR_FAULT        ":FAULT"
>>>>
>>>> Namespacing prefix is required here. LED is reserved for
>>>> LED subsystem global macros. How about POWERNV_LED_* ?
>>>
>>> Yep... Its my fault.. Makes sense to have POWERNV_*.
>>
>> You could also skip STR segment and have e.g. POWERNV_LED_ATTENTION.
>
> Agree. Fixed.
>
>>
>>>>
>>>>> +
>>>>> +/*
>>>>> + * LED operation state
>>>>> + *
>>>>> + * led_classdev_unregister resets the brightness values. However
>>>>> + * we want to retain the LED state across boot.
>>>>
>>>> What boot are you thinking of here?
>>>>
>>>>> Hence disable
>>>>> + * LED operation before calling led_classdev_unregister.
>>>>> + */
>>>>
>>>> This comment is unclear for me, as this is static initialization,
>>>> unrelated to to any function call.
>>>>
>>>
>>> I mean, we have to retain the state of LED across system reboot.
>>
>> Static variables are reinitialized on system reboot, aren't they?
>
> Sorry. I think comment was confusing..
>
> As I understood, classdev_unregister call resets all LEDs state. However in our
> case, we don't
> want to change the LED state during system shutdown/reboot.
>
> Hence I have introduced state variable here. So during register call, I just
> disable LEDs so that any further call will just return. That way we retain LED
> state even after unloading module.
>
> Please let me know if there is any better way to achieve this.

Since this is not a feature of the device, but rather a use case, then
it cannot be hard coded in the driver this way. The solution I see is
introducing a sysfs attribute that would determine if we want the
LED to be turned off on unregistration or not.

You can refer to the following driver to find out how to add the
sysfs attribute:

drivers/leds/leds-lm3533.c

The attribute will also have to be documented, similarly to these:

Documentation/ABI/testing/sysfs-class-led-driver-lm3533

Currently I don't have a good candidate for attribute
name, so feel free to propose one.

>
>>
>>>>> +static bool led_disabled = false;
>>>>
>>>> Static variables are initialized to 0 by default.
>>>
>>> Fixed.
>>>
>>> .../...
>>>
>>>>> +/*
>>>>> + * powernv_led_compact_work_list
>>>>> + *
>>>>> + * This function goes through the entire list of scheduled powernv_led_work
>>>>> + * nodes and removes the nodes which have already processed one set LED
>>>>> + * state request from request list and has been marked for deletion. This is
>>>>> + * essential for cleaning the list before adding new elements into it. This
>>>>> + * also tracks the total number of pending tasks. Once it reaches the
>>>>> + * threshold the function will throttle till all the scheduled tasks completes
>>>>> + * execution during which the user space thread will block and will be
>>>>> + * prevented from queuing up more LED state change requests.
>>>>> + */
>>>>
>>>> Did you test the driver with led-triggers?
>>>
>>> I have tested set/reset LEDs .. not triggers as our user space dont' use that.
>>
>> At this moment it doesn't, but it can use them in the future. Besides,
>> I think that you wouldn't like to see someone testing your driver with
>> led-triggers and having it crashed? :)
>
> Yep. I will test this before posting next version.
>
>>
>> Testing LED subsystem drivers with led-triggers is useful also because
>> some triggers (e.g. timer) call brightness_set op from the interrupt
>> context. It allows to detect some non-obvious issues.
>>
>>>>> +
>>>>> +    switch (led_type) {
>>>>> +    case OPAL_SLOT_LED_TYPE_ATTN:
>>>>> +        loc_code[strlen(loc_code) - strlen(LED_STR_ATTENTION)] = '\0';
>>>>> +        break;
>>>>> +    case OPAL_SLOT_LED_TYPE_ID:
>>>>> +        loc_code[strlen(loc_code) - strlen(LED_STR_IDENT)] = '\0';
>>>>> +        break;
>>>>> +    case OPAL_SLOT_LED_TYPE_FAULT:
>>>>> +        loc_code[strlen(loc_code) - strlen(LED_STR_FAULT)] = '\0';
>>>>> +        break;
>>>>> +    default:    /* Unknown LED type */
>>>>> +        goto out_loc;
>>>>> +    }
>>>>
>>>> Above sequence is repeated in the function below - it could be wrapped
>>>> with a new function.
>>>
>>> Agree. Will fix.
>>>
>>> .../...
>>>
>>>>> +
>>>>> +/*
>>>>> + * power_led_classdev
>>>>> + *
>>>>> + * This function registers classdev structure for any given type of LED on
>>>>> + * a given child LED device node.
>>>>> + */
>>>>> +static int power_led_classdev(struct platform_device *pdev,
>>>>> +                  struct device_node *cled, u64 led_type)
>>>>> +{
>>>>> +    int rc;
>>>>> +    unsigned long flags;
>>>>> +    struct powernv_led *cpled;
>>>>> +
>>>>> +    cpled = kzalloc(sizeof(struct powernv_led), GFP_KERNEL);
>>>>> +    if (!cpled) {
>>>>> +        pr_err("Memory allocation failed at %s\n", __func__);
>>>>> +        return -ENOMEM;
>>>>> +    }
>>>>> +
>>>>> +    /* Create the name for classdev */
>>>>> +    switch (led_type) {
>>>>> +    case OPAL_SLOT_LED_TYPE_ATTN:
>>>>> +        cpled->cdev.name = kasprintf(GFP_KERNEL, "%s%s",
>>>>> +                         cled->name, LED_STR_ATTENTION);
>>>>
>>>> We have a 'label' DT property for naming LED Flash class devices.
>>>> Please refer to Documentation/devicetree/bindings/leds/common.txt.
>>>>
>>>
>>> In Power Systems LEDs are overloaded (meaning same LED is used for identify and
>>> fault depending on their state  ---  blinking = identify and solid = fault).
>>> Hence here append LED type info.
>>
>> The label could be composed of segments and an ordinal number as
>> labels have to be unique, e.g. attn_ident_0, attn_ident_1.
>> The segments would have to be parsed by the driver to discover
>> all the LED's available modes.
>>
>> nitpicking: identify is a verb and is not a proper name for the LED.
>> Could you describe the purpose of this mode, so that we could come
>> up with a better name?
>
> Each component (Field Replacement Unit) will have service indicator (LEDS) which
> can have below states :
>    - OFF 	: no action
>    - Identify: blinking state (user can use this state to identify particular
> component).
>         In Power Systems world we call it as "identify" indicator.. Hence I
> retained same name here.
>         How about just "ident" ?

Sounds good.

>    - fault : solid state (when component goes bad, LED goes to solid state)
>       Note that our FW is capable of isolating some of the issues and it can turn
> on LEDs without OS
>        interference.

Does it mean that the LED can be controlled from hardware?
If so, what would be software use cases then? The same question is
related to the attn and indent states.

> We have one more System level LED (System Attention Indicator).. This LED has
> two states:
>    - OFF : Everything is fine
>    - ON : Some component has issues and needs attention.
>
>>
>>
>>>
>>> .../...
>>>
>>>>> +
>>>>> +static struct platform_driver powernv_led_driver = {
>>>>> +    .probe    = powernv_led_probe,
>>>>> +    .remove = powernv_led_remove,
>>>>> +    .driver = {
>>>>> +        .name = "powernv-led-driver",
>>>>> +        .owner = THIS_MODULE,
>>>>> +        .of_match_table = powernv_led_match,
>>>>
>>>> Is somewhere DT documentation available for these leds?
>>>
>>> These are PowerNV platform specific properties. I don't think its
>>> specified/documented in kernel side.
>>> These are documented in OPAL (firmware) side.
>>
>> Every driver using DT bindings needs DT documentation.
>> Moreover the one exists for powerenv platform:
>>
>> Documentation/devicetree/bindings/hwmon/ibmpowernv.txt
>
> Right.  I missed to add binding for LEDs.
>
> I will add Documentation/devicetree/bindings/leds/leds-powernv.txt.

Thanks.

-- 
Best Regards,
Jacek Anaszewski
