From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Reading /sys with side effects (was Re: [PATCH 1/2] Documentation:
 leds: Add description of LED Flash class extension)
Date: Mon, 02 Feb 2015 10:07:02 +0100
Message-ID: <54CF3E36.9000108@samsung.com>
References: <1422346028-16739-1-git-send-email-j.anaszewski@samsung.com>
 <20150127221958.GA18993@amd> <54C8A130.8000807@samsung.com>
 <20150129211420.GA21140@amd> <54CB4702.1090508@samsung.com>
 <20150130164027.GA25830@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:36727 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932601AbbBBJHH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 2 Feb 2015 04:07:07 -0500
In-reply-to: <20150130164027.GA25830@kroah.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Pavel Machek <pavel@ucw.cz>, kernel list <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com

On 01/30/2015 05:40 PM, Greg KH wrote:
> On Fri, Jan 30, 2015 at 09:55:30AM +0100, Jacek Anaszewski wrote:
>> Hi Pavel,
>>
>> On 01/29/2015 10:14 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>>>>> +	- flash_fault - list of flash faults that may have occurred:
>>>>>> +		* led-over-voltage - flash controller voltage to the flash LED
>>>>>> +			has exceededthe limit specific to the flash controller
>>>>>> +		* flash-timeout-exceeded - the flash strobe was still on when
>>>>>> +			the timeout set by the user has expired; not all flash
>>>>>> +			controllers may set this in all such conditions
>>>>>> +		* controller-over-temperature - the flash controller has
>>>>>> +			overheated
>>>>>> +		* controller-short-circuit - the short circuit protection
>>>>>> +			of the flash controller has been triggered
>>>>>> +		* led-power-supply-over-current - current in the LED power
>>>>>> +			supply has exceeded the limit specific to the flash
>>>>>> +			controller
>>>>>> +		* indicator-led-fault - the flash controller has detected
>>>>>> +			a short or open circuit condition on the indicator LED
>>>>>> +		* led-under-voltage - flash controller voltage to the flash
>>>>>> +			LED has been below the minimum limit specific to
>>>>>> +			the flash
>>>>>> +		* controller-under-voltage - the input voltage of the flash
>>>>>> +			controller is below the limit under which strobing the
>>>>>> +			flash at full current will not be possible. The condition
>>>>>> +			persists until this flag is no longer set
>>>>>> +		* led-over-temperature - the temperature of the LED has exceeded
>>>>>> +			its allowed upper limit
>>>>>> +
>>>>>> +		Flash faults are cleared, if possible, by reading the attribute.
>>>>>
>>>>> That's bad. Now you can no longer present flash_fault file as readable
>>>>> to non-root users, and grep -ri foo /sys will interfere with your
>>>>> camera application.
>>>>>
>>>>> Bad interface, just fix it.
>>>>
>>>> In my opinion it isn't crucial for the user to be aware of the
>>>> fact that some non-persistent fault happened right after strobing the
>>>> flash (e.g. over temperature).
>>>>
>>>> I cannot see anything harmful in the situation when someone does grep
>>>> on /sys and clears non-persistent fault on a flash LED device.
>>>
>>> So why export the faults at all?
>>
>> Faults may prevent strobing the flash in case of some devices.
>> The example of such a device is ADP1663 (drivers/media/i2c/adp1653.c).
>> This driver reads the faults before strobing the flash and if a
>> fault preventing strobing has occurred it returns -EBUSY.
>>
>> If this driver was made a LED Flash class driver, then it would
>> expose flash_faults attribute. The driver would probably need
>> redesigning - checking the faults before strobing would have to be
>> avoided and it should be left to the userspace.
>
> That's fine, but Pavel's point is that you shouldn't "clear a fault" by
> reading a sysfs file as you don't control who reads all sysfs files
> (hint, libudev might cache all attributes when they are found / change,
> which could prevent anyone else from seeing that fault.)
>
> So please fix this, make a write to clear a fault or some other such
> explicit action, not a simple read.  That's not an acceptable api.

I am aware what Pavel'a point was, I just presented the arguments
justifying existence of the flash_faults attribute at all.

In my opinion flash_faults attribute should report the current state of
the device. For the devices which clear the faults on I2C readout the
faults read would have to be cached in the driver, until they are
explicitly cleared, to keep the sysfs interface consistent.

Nonetheless, there can be also devices which don't require clearing the
faults - they are reported only when the actual condition occurs,
e.g. over temperature or under voltage. When the related value gets
back to the acceptable level the fault is no longer reported by the
device.

In this case some faults will remain unnoticed by the user space. This
is the argument in favour of my statement that caching the faults does
not make a sense and is not crucial. The user's vital interest is to
know whether the flash LED is operational right before strobing.

Since we cannot guarantee reporting all the faults that occurred for
all possible flash LED devices, the only sensible solution is to report
only the currently valid fault.

-- 
Best Regards,
Jacek Anaszewski
