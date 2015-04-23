From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/2] leds/powernv: Add driver for PowerNV platform
Date: Thu, 23 Apr 2015 10:55:40 +0530
Message-ID: <55388254.4000606@linux.vnet.ibm.com>
References: <20150422234509.626d9dc7@ja.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e23smtp01.au.ibm.com ([202.81.31.143]:45012 "EHLO
	e23smtp01.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751980AbbDWF0g (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 23 Apr 2015 01:26:36 -0400
Received: from /spool/local
	by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Thu, 23 Apr 2015 15:26:34 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id D4F6C2BB0051
	for <linux-leds@vger.kernel.org>; Thu, 23 Apr 2015 15:26:31 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t3N5QNuE22151346
	for <linux-leds@vger.kernel.org>; Thu, 23 Apr 2015 15:26:31 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t3N5Pv3D025218
	for <linux-leds@vger.kernel.org>; Thu, 23 Apr 2015 15:25:58 +1000
In-Reply-To: <20150422234509.626d9dc7@ja.home>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski81@gmail.com>
Cc: stewart@linux.vnet.ibm.com, linux-leds@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, linuxppc-dev@lists.ozlabs.org, khandual@linux.vnet.ibm.com

On 04/23/2015 03:15 AM, Jacek Anaszewski wrote:
> Hi Vasant,
> 

Hi Jacek,


.../...

>>
>>>
>>>  From what I can see from the driver code the LEDs are set with:
>>>
>>> opal_leds_set_ind(token, loc_code, led_mask, led_value,
>>> &max_led_type);
>>>
>>> and their state can be read with:
>>>
>>> opal_leds_get_ind(loc_code, &led_mask, &led_value, &max_led_type)
>>>
>>>  From the kernel point of view these are very simple operations.
>>>
>>> All the logic you described should be handled by user space.
>>> If you need to be able to specify the LED mode you want to set/read,
>>> then additional 'mode' sysfs attribute should be added by the driver.
>>> There would have to be also additional sysfs attribute
>>> 'available_modes" provided. The ABI documentation should inform how
>>> the mode identifiers map to the modes. I already explained how to
>>> add it, when we were discussing about retaining led state on remove.
>>
>> Sorry..My fault.. I should have elaborated mode operation...
> 
> What I was thinking about here was actually LED type, not mode in terms
> of Guiding Light/Light Path. However, please look at the newest
> approach in the end of this message.
> 

No problem.

>> I forgot to mention that LED mode is static... meaning platform
>> provides this information, but we cannot change during runtime..
>>
>> Presently we have this information in Device Tree. Since this is
>> static one (and also LED Mode is system wide.. nothing to do
>> individual LED),  I didn't add it in LED driver code.. .Do you think
>> we should add that property ?
> 
> The property shouldn't be documented at all if it isn't to be used.

Ok . I will remove this.

> 
>>>
>>>
>>> I'd see following use cases.
>>>
>>> (let's assume that modes are defined as follows:
>>> 0: ident, 1: attn, 2: fault)
>>
>> Modes are : Guiding Light / Light Path ... which is static and
>> platform provides this information.
>>
>> LED types : IDENT, FAULT and ATTN .... which can be get/set/reset by
>> OS (kernel/userspace)
>>
>> Also only 1 LED can be ATTN ...
>>
>>> #cat available_modes
>>> #0 1 2
>>> #echo 0 > mode  //set ident mode
>>> #echo 1 > brightness //set ident state
>>> #echo 2 > mode  //set fault mode
>>> #cat brightness //read fault state
>>> #0
>>> #echo 1 > attn //set attn mode
>>> #echo 1 > brightness
>>>
>>> This would set the LED in blinking mode, so I am wondering if we
>>> shouldn't employ timer trigger for this to keep the LED API
>>> consistent.
>>>
>>> Can a single LED support other mode than 'attention'? I'd like to
>>> know if a LED in attention mode (blinking), can be set to some solid
>>> mode?
>>
>> No.. Its always single attention LED/system ... which can be Set
>> (Solid) / reset state.
> 
> I confused it with ident.

No problem. We have many hardware specific jargon's which is enough to confuse
anyone :-)

> 
>>>
>>> Please let me know if such an approach would still not fit for your
>>> requirements.
>>>
>>
>> Given above conditions, I think current approach (my v3 patchset) is
>> simple and works better. What you say?
> 
> Yes, but we still have naming and blinking issues to solve.
> 
> Please look at this draft design of device tree node:
> 
> opal-leds {
>         compatible = "ibm,opal-v3-led";
> 
>         U78C9.001.RST0027-P1-C1:attn {
>         };
> 
>         U78C9.001.RST0027-P2-C1:identify:fault 
>         };
> 
>         U78C9.001.RST0027-P3-C2:identify:fault {
>         };
>     };
> };
> 
> The LED nodes could be empty as the name would convey all the
> required information. The implications would be as follows:
> 

These device tree comes from out firmware ... which is immutable .
We can use LED node name + led-type property for naming...which is what I do
currently (v4.. which I haven't posted)


> 1. Each LED would have one corresponding LED class device.
> 
> 2. Operations on attn and fault LED types:
> 	turn on:
> 		echo 255 > brightness
> 	turn off:
> 		echo 0 > brightness
> 	get status
> 		cat brightness
> 	
> 3. Operations on identify LED:
> 	turn on:
> 		echo "timer" > trigger
> 		(blink_set op would have to be implemented in the
> 		driver)
> 	turn off:
> 		echo 0 > brightness
> 	get status:
> 		support for this would have to be added to the LED
> 		subsystem core

I see few issues here.
  - Overloading same LED device with multiple opeartion complicates things .. as
these operations can be done independently (say user is allowed to enable both
identify and fault simultaneously)
  - point 3: IIUC after duration value expires identify indicator reverts.. we
don't want to revert until user asks .
  - point 3: if I use brightness for both identify/fault, how to disable these
LEDs independently?
  - Also how to use trigger property for each LED (if at all we want to use them
later)?


> 
> 4. Since 'identify' is the platform specific name it could be preserved
> 

Ok sure.

> 
> Does it work for you?
> 

Thanks
Vasant
