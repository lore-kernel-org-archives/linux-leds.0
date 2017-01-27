From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v6 1/4] leds: class: Add new optional
 brightness_hw_changed attribute
Date: Fri, 27 Jan 2017 08:38:29 +0100
Message-ID: <d5015af4-47c0-31cd-f7b3-bcbd5eb9ddea@redhat.com>
References: <20170125161130.5424-1-hdegoede@redhat.com>
 <20170125161130.5424-2-hdegoede@redhat.com> <20170125164936.GE7936@pali>
 <b43ec266-d5ba-d974-b964-25fe82115db5@gmail.com> <20170126083338.GA6085@pali>
 <70a01088-f772-6dec-a505-bf058cc2b0dd@gmail.com>
 <937f728f-9d36-d8db-0ed1-c6d8cd1b090e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46512 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754082AbdA0Hid (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 27 Jan 2017 02:38:33 -0500
In-Reply-To: <937f728f-9d36-d8db-0ed1-c6d8cd1b090e@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org

Hi,

On 01/26/2017 09:04 PM, Jacek Anaszewski wrote:
> On 01/26/2017 08:51 PM, Jacek Anaszewski wrote:
>> On 01/26/2017 09:33 AM, Pali Rohár wrote:
>>> On Wednesday 25 January 2017 22:35:53 Jacek Anaszewski wrote:
>>>> On 01/25/2017 05:49 PM, Pali Rohár wrote:
>>>>> On Wednesday 25 January 2017 17:11:27 Hans de Goede wrote:
>>>>>> Some LEDs may have their brightness level changed autonomously
>>>>>> (outside of kernel control) by hardware / firmware. This commit
>>>>>> adds support for an optional brightness_hw_changed attribute to
>>>>>> signal such changes to userspace (if a driver can detect them):
>>>>>>
>>>>>> What:		/sys/class/leds/<led>/brightness_hw_changed
>>>>>> Date:		January 2017
>>>>>> KernelVersion:	4.11
>>>>>> Description:
>>>>>> 		Last hardware set brightness level for this LED. Some LEDs
>>>>>> 		may be changed autonomously by hardware/firmware. Only LEDs
>>>>>> 		where this happens and the driver can detect this, will
>>>>>> 		have this file.
>>>>>>
>>>>>> 		This file supports poll() to detect when the hardware
>>>>>> 		changes the brightness.
>>>>>>
>>>>>> 		Reading this file will return the last brightness level set
>>>>>> 		by the hardware, this may be different from the current
>>>>>> 		brightness.
>>>
>>> In which situation this attribute may be different?
>>>
>>> I think some information should be present in this description...
>>
>> The first sentence in description says:
>>
>> "Last hardware set brightness level for this LED" - i.e. it may be
>> different from the _actual_ brightness, which could have been set by
>> LED class driver.
>>
>>>>>> Drivers which want to support this, simply add LED_BRIGHT_HW_CHANGED to
>>>>>> their flags field and call led_classdev_notify_brightness_hw_changed()
>>>>>> with the hardware set brightness when they detect a hardware / firmware
>>>>>> triggered brightness change.
>>>>>>
>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>
>>>>> Just speculation: What about using name 'actual_brightness'? It provides
>>>>> same output on read as actual_brightness from /sys/class/backlight/.
>>>>
>>>> This name is ambiguous. Propagating it to the LED subsystem only because
>>>> it exists in backlight is not sufficient argument IMHO.
>>>
>>> I thought that having same name could help userspace and also to have
>>> consistency between similar subsystems. But ok, that was just my
>>> speculation.
>>
>> Please also note the "actual" would be ambiguous especially in view
>> of my above explanation.
>>
>>> I have just one small suggestion in current name "brightness_hw_changed".
>>> As it provides regular read() capability I would suggest to not indicate
>>> "activity" (changed) in name...
>>
>> Without "changed" one could think that brightness file (the one we have
>> currently) doesn't reflect hardware state.
>
> A new, possibly better name has just come to my mind.
> Since the file has two purposes: to notify about brightness changes
> made by hardware and caching last such a change, then we could call
> it hw_brightness_cache. Now there is no activity in the file name.

I must say I don't like that name the "cache" bit suggests that the hardware
is caching system, which is not the case. As for having an acivity in the
name, there is no rule against that.

Regards,

Hans



>
