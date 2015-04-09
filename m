From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v5] DT: leds: Improve description of flash LEDs
 related properties
Date: Fri, 10 Apr 2015 02:25:08 +0300
Message-ID: <55270A54.1000409@linux.intel.com>
References: <1428503487-4912-1-git-send-email-j.anaszewski@samsung.com> <552545FF.2030208@samsung.com> <552628E4.50003@samsung.com> <55263247.5070009@linux.intel.com> <55264E6D.40801@samsung.com> <55268F27.70409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:22794 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753284AbbDIX0D (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 9 Apr 2015 19:26:03 -0400
In-Reply-To: <55268F27.70409@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>

Hi Jacek,

Jacek Anaszewski wrote:
> Hi Sylwester, Sakari,
>
> On 04/09/2015 12:03 PM, Sylwester Nawrocki wrote:
>> On 09/04/15 10:03, Sakari Ailus wrote:
>>> Jacek Anaszewski wrote:
>>>> On 04/08/2015 05:15 PM, Sylwester Nawrocki wrote:
>>>>> On 08/04/15 16:31, Jacek Anaszewski wrote:
>>>>>> Properties defining maximum values for LED currents and timeout
>>>>>> should
>>>>>> be mandatory to avoid the risk of hardware damage. This patch fixes
>>>>>> the issue.
>>
>>>>>> --- a/Documentation/devicetree/bindings/leds/common.txt
>>>>>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>>>>>> @@ -10,6 +10,17 @@ can influence the way of the LED device
>>>>>> initialization, the LED components
>>>>>>    have to be tightly coupled with the LED device binding. They are
>>>>>> represented
>>>>>>    by child nodes of the parent LED device binding.
>>>>>>
>>>>>> +Required properties for child nodes:
>>>>>
>>>>> These properties are mandatory only for LEDs with Flash/Torch
>>>>> capabilities, aren't they?
>>>>
>>>> flash-max-microamp and flash-timeout-us properties description mention
>>>> that they refer to flash LEDs. Perhaps this should be made indeed more
>>>> explicit.
>>>
>>> Sounds good to me, after all these shouldn't be defined for devices they
>>> don't make sense for. Alternatively, you could add another section for
>>> "required properties for flash LEDs".
>>
>> Sounds good to me.
>>
>>>>> Requiring those properties for all led nodes would make all
>>>>> current dtses not compliant with the DT binding specification AFAICT.
>>>
>>> Some drivers also define these explicitly as optional, the behaviour for
>>> those obviously can't be changed.  This should apply to new drivers
>>> only, and I think documenting the matter in this file would be the best
>>> way to do that.
>>
>> Unfortunately this file is not a proper place for information regarding
>> Linux drivers.
>> I can't see any drivers in -next using those DT properties. Could you
>> point to any examples?
>> Perhaps we should stay with the below properties specified as optional
>> in general and add a note they can be mandatory for some LEDs
>> (controllers)?
>
> I've analyzed existing led bindings. Four bindings define brightness
> related properties:
>
> leds-lp55xx.txt
> Each child has own specific current settings
> - led-cur: Current setting at each led channel (mA x10, 0 if led is not
> connected)
> - max-cur: Maximun current at each led channel.
>
> leds-netxbig.txt
> Required sub-node properties:
> - bright-max: Maximum brightness value
>
> leds-pwm
> LED sub-node properties:
> - max-brightness : Maximum brightness possible for the LED
>
> leds-pm8941-wled.txt
> Optional properties:
> - qcom,current-limit: mA; per-string current limit; value from 0 to 25
>          default: 20mA
>
>
> We can summarize this as follows:
> - only four devices define max brightness
> - one of them defines also default current setting
> - some of them define current in mA, some in brightness levels
>
> It has to be stressed that LED subsystem operates on brightness levels,
> not microamperes. max-microamp property was expressed in microamperes,
> because it was initially designed only for flash LEDs.

The DT should describe the hardware, not reflect particular choices made 
in the interfaces the Linux kernel offers to the user space.

I don't think we can change existing bindings, but new bindings should 
respect what has been discussed in this thread and others previously. 
The driver should be responsible for converting the current to 
brightness levels if the hardware deals with current.

>
> I think that if we want to add generic property for limiting maximum
> brightness for non-flash LEDs, then it should be called brightness-max
> and expressed in brightness levels. It should apply only to non-flash
> devices. We could have also brightness-default.

I personally don't know of any device for which brightness level would 
make sense from hardware point of view.

> For flash devices we would have torch-max-microamp and
> flash-max-microamp properties. We could also have their counterparts:
> torch-default-microamp, flash-default-microamp.
>
> Should we also need
>
> - flash-timeout-max-us

We have "flash-timeout-us". The documentation isn't very clear on this; 
it should be the maximum obviously.

> - flash-timeout-default-us ?

The default is hardly a property of the hardware. Drivers could default 
to maximum but this could be driver dependent.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
