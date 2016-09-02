From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH V4] leds: trigger: Introduce an USB port trigger
Date: Fri, 02 Sep 2016 08:54:47 +0200
Message-ID: <caccb909-bf51-8f67-cd57-de407e576afc@samsung.com>
References: <Pine.LNX.4.44L0.1609011032040.1386-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <Pine.LNX.4.44L0.1609011032040.1386-100000@iolanthe.rowland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 09/01/2016 04:36 PM, Alan Stern wrote:
> On Thu, 1 Sep 2016, Jacek Anaszewski wrote:
>
>> On 09/01/2016 07:25 AM, Rafał Miłecki wrote:
>>> On 31 August 2016 at 21:00, Rafał Miłecki <zajec5@gmail.com> wrote:
>>>> On 31 August 2016 at 20:23, Alan Stern <stern@rowland.harvard.edu> wrote:
>>>>> On Tue, 30 Aug 2016, Rafał Miłecki wrote:
>>>>>> Not really as it won't cover some pretty common use cases. Many home
>>>>>> routers have few USB ports (2-5) and only 1 USB LED. It has to be
>>>>>> possible to assign few USB ports to a single LED (trigger). That way
>>>>>> LED should be turned on (and kept on) if there is at least 1 USB
>>>>>> device connected. You obviously can't do:
>>>>>> echo "usb1-1 usb1-2 usb2-1" > /sys/class/leds/foo/trigger
>>>>>>
>>>>>> This was already brought up by Rob (who mentioned CPU trigger) and I
>>>>>> replied him pretty much the same way in:
>>>>>> https://lkml.org/lkml/2016/7/29/38
>>>>>> (reply starts with "Anyway, the serious limitation I see").
>>>>>
>>>>> The code for a bunch of triggers must already be written.  What would
>>>>> the user do if he wanted to flash a single LED in response to both
>>>>> CPU activity and MTD activity?  If not
>>>>>
>>>>>         echo "cpu mtd" >/sys/class/leds/foo/trigger
>>>>>
>>>>> then what?
>>>>
>>>> Well, it sounds like a new feature then. Shall we add an extra API
>>>> with a request function for turning LED on? It could internally count
>>>> how many requests were raised and keep LED on as long as there is at
>>>> least 1 left. I guess we should implement it in trigger "subsystem"
>>>> (if I can call it so). Does it sound like a good plan?
>>>
>>> I'm pretty sure noone ever planned to have more than 1 trigger
>>> assigned to a single LED. I just realized there will be a problem with
>>> proposed solution: sysfs files conflict.
>>>
>>> Consider 2 existing triggers for a moment:
>>> 1) oneshot: it creates following sysfs files:
>>> /sys/class/leds/foo/delay_on
>>> /sys/class/leds/foo/delay_off
>>> /sys/class/leds/foo/invert
>>> /sys/class/leds/foo/shot
>>> 2) timer: it creates following sysfs files:
>>> /sys/class/leds/foo/delay_on
>>> /sys/class/leds/foo/delay_off
>>>
>>> Activating both of them will probably cause a WARNING in sysfs. They
>>> can't coexist :(
>>>
>>> We should probably have per-trigger subdirs, e.g.:
>>> /sys/class/leds/foo/trigger-oneshot/delay_on
>>> /sys/class/leds/foo/trigger-oneshot/delay_off
>>> /sys/class/leds/foo/trigger-oneshot/invert
>>> /sys/class/leds/foo/trigger-oneshot/shot
>>> /sys/class/leds/foo/trigger-timer/delay_on
>>> /sys/class/leds/foo/trigger-timer/delay_off
>>> but implementing it now would break the ABI.
>>>
>>> One workaround I can see is doing triggers V2, they:
>>> 1) Would put sysfs files in /sys/class/leds/foo/trigger-bar/
>>> 2) Use new API for *requesting* LED to be on/off
>>> 3) There would be a counter of requests in V2 API
>>> 4) Multiple triggers V2 would be allowed to be used (assigned) at the same time
>>
>> Currently we support only triggers dedicated to specific type of
>> devices. Even in case of triggers that don't expose custom sysfs
>> attributes, registered with led_trigger_register_simple(), device
>> drivers have to generate trigger event with dedicated function, e.g:
>>
>> - ledtrig-cpu: void ledtrig_cpu(enum cpu_led_event ledevt)
>> - ledtrig-disk: void ledtrig_disk_activity(void)
>> - ledtrig-mtd: void ledtrig_mtd_activity(void)
>>
>> If one wanted to have the LED notified by different type of devices,
>> then they would have to implement a trigger that would exposed all
>> required types of API.
>>
>> Unfortunately, there are many possible combinations of
>> triggers and that doesn't sound sane to add a new one when someone
>> will find it useful. Of course it would entail adding a call to the
>> new trigger API in the drivers, which doesn't seem like something
>> acceptable in the mainline.
>
> Maybe it would make more sense, in this case, to allow only three
> possibilities for a USB port activity trigger.  Toggle the LED
> whenever:
>
> 	There is activity on the specified port, or
>
> 	There is any activity on any port on the specified hub, or
>
> 	There is any USB activity on any port.
>
> That ought to cover most of the normal use cases, and it would be
> simple enough to implement.

What would be the benefit of having a USB port activity trigger,
for which we would be specifying the port to observe, but in the same
time we would react on any activity on any port (cases 1 and 3)?

-- 
Best regards,
Jacek Anaszewski
