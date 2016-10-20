From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] leds: core: Add led_notify_brightness_change helper
 function
Date: Thu, 20 Oct 2016 12:02:22 +0200
Message-ID: <8b10b78c-c40a-bbf2-ea25-62a9b3c2413e@redhat.com>
References: <20161019133355.6192-1-hdegoede@redhat.com>
 <20161019133355.6192-2-hdegoede@redhat.com> <20161019135958.GE1689@pali>
 <CGME20161019160756eucas1p16549bdf4b7db9a91126752e81682ce67@eucas1p1.samsung.com>
 <e6f111e6-f921-4f96-3d21-89a16774880a@redhat.com>
 <6edc21a8-fd9d-f3c4-77f2-aaa17ed5683a@samsung.com>
 <412a78c0-204f-fd3f-8c6e-6dc2d3a94cc9@redhat.com>
 <1d7200f7-1a27-3c9b-51ab-5530f04b1d96@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <1d7200f7-1a27-3c9b-51ab-5530f04b1d96@samsung.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 20-10-16 11:15, Jacek Anaszewski wrote:
> On 10/20/2016 10:41 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 20-10-16 08:42, Jacek Anaszewski wrote:
>>> Hi Hans,
>>>
>>> How about exploiting recently added userspace driver for the LED
>>> subsystem ((drivers/leds/uleds.c, available in linux-next) instead?
>>>
>>> If the LED class device to be observed implemented its internal trigger
>>> for generating kernel events upon device brightness change, then the
>>> userspace could create virtual LED class device, register on the
>>> trigger and poll the obtained file descriptor.
>>>
>>> See tools/leds/uledmon.c.
>>
>> Erm, this feels like a very wrong way to go about this, so now you
>> want the led_classdev to send a new trigger to be picked up by a fake-led
>> driven from userspace ? Having a led_classdev send triggers feels quite
>> wrong, and having a u-led which will not really be a led at all, just a
>> way to listen to the trigger seems wrong to me too.
>
> Generally the intention behind introducing userspace LED class driver
> was to have a means for intercepting kernel LED events. I agree that
> having LED class device generating trigger events is awkward. It was
> just the first thing that came to my mind seeing the idea of polling,
> and having the fresh memory of userspace LED driver.
>
> I am inclined to accept your patch

Ok.

> but it will need thorough testing
> to check if there will be no unpleasant side effects when one or more
> processes will be polling the brightness sysfs file and in the
> meantime other process(es) will write to it.

Those paths are really separate, sysfs_notify_dirent just schedules
a wakeup (it is safe to be called from interrupt context) and does
nothing else. Later on the task will wake up, and likely will
call brightness_show().

Currently we can already have brightness_store() and brightness_show()
race with each other according to a comment in brightness_show()
this is safe, but I've my doubts about this, this means that a
led_classdev's brightness_set and brightness_get method can be
called simultaneously which seems wrong to me / seems to violate
the principle of least surprise where I as a led-driver author
would expect the led-core to protect me against this.

So you're right we need to think about this, but this seems to
be an orthogonal pre-existing problem/race which userspace can
already trigger.

Hmm, looking at the code closer I believe that the led code
needs an audit for races in general. E.g. when sw blinking
led_set_brightness() does a read-modify-write of led_cdev->flags
but led_timer_function() also does read-modify-write of led_cdev->flags
and nothing is protecting led_cdev->flags from these 2 happening at
the same time.

> Also notifying only about brightness change events not caused by
> writing brightness file is counter intuitive if we are polling
> brightness file. What about brightness changes caused by using
> led_set_brightness() API, without mediation of brightness file?

A valid question, after carefully reading the code I see that
triggers and blinking will make brightness_show() / reading
the brightness sysfs attribute return a different value,
so yes you're right we should notify each time one of
__led_set_brightness or __led_set_brightness_blocking
succeeds.

> If we want to notify only brightness changes originating from
> hardware, maybe it would be a good idea to add a dedicated
> sysfs file? It could appear only if relevant option in the
> kernel config was turned on.

I believe that simply allowing poll on the brightness sysfs
attribute is better.

Regards,

Hans


>
>>
>> No this really is the wrong way to do this IMHO.
>>
>> We already have a well defined interface to wait for sysfs attribute
>> changes for devices which export a sysfs interfaces, which is doing
>> POLL_PRI on the sysfs attribute.
>>
>> Looking at the discussion between me and Pali I can see a clear
>> consensus on the semantics of the poll here, we will notify any
>> POLL_PRI listeners on long-lived changes to the brightness, either
>> done by the hw autonomously or those done by a sysfs brightness write.
>> Temporary brightness changes caused by triggers and/or blinking will
>> not lead to a notify.
>>
>> If we can all agree on these semantics, then I believe that this will
>> be a good interface to deal with this.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>>
>>> Best regards,
>>> Jacek Anaszewski
>>>
>>> On 10/19/2016 06:07 PM, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 19-10-16 15:59, Pali Rohár wrote:
>>>>> On Wednesday 19 October 2016 15:33:54 Hans de Goede wrote:
>>>>>> +        itself and the driver can detect this. Changes done by
>>>>>> +        kernel triggers / software blinking and writing the
>>>>>> brightness
>>>>>> +        file are not signalled.
>>>>>
>>>>> Why? In case you have desktop application which show current brightness
>>>>> level and you change manually it via echo something > /sys/ then that
>>>>> application does not have any information about your change. And so it
>>>>> show old value...
>>>>
>>>> Well it seems like a bad idea to me to notify on changes caused by
>>>> triggers and blinking, even though those are visible under sysfs
>>>> if polling the brightness attribute. At which point it seemed to make
>>>> sense to only notify on changes done autonomously by the hardware,
>>>> rather then from any software (running on the main CPU).
>>>>
>>>> As for specifically not notifying on write, the sysfs interface is root
>>>> only,
>>>> so usually there will be a single daemon controlling the brightness,
>>>> and any users can go through that daemon and it can distribute change
>>>> messages itself (and will do so for the POLL_PRI events).
>>>>
>>>> Since the usual use case is a single writing process, which is also
>>>> the same single process listening for POLL_PRI, it seems unnecessary
>>>> to me to notify the process about the write it has just done.
>>>>
>>>> But if people think that we should consider multiple simultaneous
>>>> users (which seems like a bad idea to me, because of coordination
>>>> issues, but the API does allow it) and therefor should notify
>>>> of the brightness change on a write, I'm fine with doing a new
>>>> version implementing those semantics instead.
>>>>
>>>> Either way notifying on brightness changes caused by triggers /
>>>> blinking seems like a bad idea to me.
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>>
>>>
>>>
>>
>>
>>
>
>
