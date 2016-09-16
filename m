From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [ISSUE] Memleak in LED sysfs on heavy usage
Date: Fri, 16 Sep 2016 23:08:03 +0200
Message-ID: <72a11233-577a-ebd5-90bd-f25a883a34dd@gmail.com>
References: <37b949b3-6a9a-b8e3-c164-5ac2d44c9b3c@samsung.com>
 <4d51014d-c8fa-4687-cae8-1a8dd0f79beb@samsung.com>
 <CGME20160916120853eucas1p2474a728f5fc725b094ad1addab507b58@eucas1p2.samsung.com>
 <b267fe46-34ed-4c1e-3c7f-45267baf5517@esd.eu>
 <7bb9a00e-0927-2fdc-5733-64bf922ebed6@samsung.com>
 <20160916140626.GB391@kroah.com>
 <aa2f963b-0d48-6746-4795-0033994814cd@samsung.com>
 <20160916143951.GA20908@kroah.com>
 <6f9326ea-0ff6-7ff7-58d5-210d0c3e7252@gmail.com>
 <20160916194406.GA3315@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36805 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750949AbcIPVIl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Sep 2016 17:08:41 -0400
In-Reply-To: <20160916194406.GA3315@kroah.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Daniel Gorsulowski <daniel.gorsulowski@esd.eu>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


On 09/16/2016 09:44 PM, Greg KH wrote:
> On Fri, Sep 16, 2016 at 08:49:44PM +0200, Jacek Anaszewski wrote:
>> On 09/16/2016 04:39 PM, Greg KH wrote:
>>> On Fri, Sep 16, 2016 at 04:32:39PM +0200, Jacek Anaszewski wrote:
>>>> On 09/16/2016 04:06 PM, Greg KH wrote:
>>>>> On Fri, Sep 16, 2016 at 03:41:09PM +0200, Jacek Anaszewski wrote:
>>>>>> On 09/16/2016 02:08 PM, Daniel Gorsulowski wrote:
>>>>>>> Hi Jacek,
>>>>>>>
>>>>>>> Am 16.09.2016 um 13:25 schrieb Jacek Anaszewski:
>>>>>>>> On 09/16/2016 10:15 AM, Daniel Gorsulowski wrote:
>>>>>>>>> Hi Jacek,
>>>>>>>>>
>>>>>>>>> Am 16.09.2016 um 09:31 schrieb Jacek Anaszewski:
>>>>>>>>>> Hi Daniel,
>>>>>>>>>>
>>>>>>>>>> On 09/12/2016 10:50 AM, Daniel Gorsulowski wrote:
>>>>>>>>>>> Hello!
>>>>>>>>>>>
>>>>>>>>>>> Please consider if I made something wrong, sending this issue. This is
>>>>>>>>>>> my first contact to the LKML.
>>>>>>>>>>> By mistake, I accessed an LED via /sys/class/leds subsystem very
>>>>>>>>>>> fast in
>>>>>>>>>>> an user application. I figured out, that the free user memory
>>>>>>>>>>> decreased
>>>>>>>>>>> constantly. So I tried to analyze the Problem and wrote a litte
>>>>>>>>>>> script:
>>>>>>>>>>>
>>>>>>>>>>> #!/bin/sh
>>>>>>>>>>> while [ 1 ]; do
>>>>>>>>>>>         echo 1 > /sys/class/leds/2a_service_yellow/brightness
>>>>>>>>>>>         echo 0 > /sys/class/leds/2a_service_yellow/brightness
>>>>>>>>>>> done
>>>>>>>>>>>
>>>>>>>>>>> And voila, I was able to reproduce the problem.
>>>>>>>>>>> So I add a bit more debugging:
>>>>>>>>>>>
>>>>>>>>>>> #!/bin/sh
>>>>>>>>>>> cnt=0
>>>>>>>>>>> while [ 1 ]; do
>>>>>>>>>>>         if [ `expr $cnt % 1000` -eq 0 ]; then
>>>>>>>>>>>                 free | grep Mem: | cut -d' ' -f25
>>>>>>>>>>>         fi
>>>>>>>>>>>         echo 1 > /sys/class/leds/2a_service_yellow/brightness
>>>>>>>>>>>         echo 0 > /sys/class/leds/2a_service_yellow/brightness
>>>>>>>>>>>         let "cnt++"
>>>>>>>>>>> done
>>>>>>>>>>>
>>>>>>>>>>> And huh? No memory is eaten anymore. So it looks like, the problem
>>>>>>>>>>> only
>>>>>>>>>>> occours on heavy (fast) usage of /sys/class/leds subsystem.
>>>>>>>>>>>
>>>>>>>>>>> I rewrote the script and toggled a GPIO pin, but there was no problem
>>>>>>>>>>> recognizable.
>>>>>>>>>>
>>>>>>>>>> I've been unable to reproduce the problem with leds-aat1290 driver
>>>>>>>>>> and Samsung M0 board. It must be driver specific issue.
>>>>>>>>>> What driver did you use?
>>>>>>>>>>
>>>>>>>>> I defined LEDS_GPIO and so I'm using leds-gpio driver.
>>>>>>>>> danielg@debby:~/opt/prj/ti-linux-kernel$ cat .config | grep LEDS | grep
>>>>>>>>> -v "^# "
>>>>>>>>> CONFIG_INPUT_LEDS=y
>>>>>>>>> CONFIG_NEW_LEDS=y
>>>>>>>>> CONFIG_LEDS_CLASS=y
>>>>>>>>> CONFIG_LEDS_GPIO=y
>>>>>>>>> CONFIG_LEDS_TRIGGERS=y
>>>>>>>>> CONFIG_LEDS_TRIGGER_TIMER=y
>>>>>>>>> CONFIG_LEDS_TRIGGER_ONESHOT=y
>>>>>>>>> CONFIG_LEDS_TRIGGER_HEARTBEAT=y
>>>>>>>>> CONFIG_LEDS_TRIGGER_GPIO=y
>>>>>>>>> CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
>>>>>>>>> CONFIG_LEDS_TRIGGER_TRANSIENT=y
>>>>>>>>>
>>>>>>>>
>>>>>>>> Unfortunately I am still unable to reproduce the problem with leds-gpio.
>>>>>>>> I'm not observing any heavy usage with your test case:
>>>>>>>>
>>>>>>>> ~#free
>>>>>>>>               total       used       free     shared    buffers
>>>>>>>> cached
>>>>>>>> Mem:       1028092      61364     966728          0       8416      22396
>>>>>>>> -/+ buffers/cache:      30552     997540
>>>>>>>> Swap:            0          0          0
>>>>>>>>
>>>>>>>>
>>>>>>>> Actually you didn't give any numbers. What kernel version are you using?
>>>>>>>>
>>>>>>> As I wrote, the problems occurred in vanilla 4.6 kernel, but also in 4.4
>>>>>>> kernel (with PREEMPT-RT Patchset).
>>>>>>
>>>>>> Heh, funny coincidence. I was testing this on recent linux-leds.git,
>>>>>> for-next branch and was not able to detect the issue. It started to
>>>>>> appear after resetting HEAD to 4.8-rc2 base. Finally it turned out
>>>>>> that what fixes the issue is the most recent commit [1].
>>>>>>
>>>>>> Further investigation revealed that this is kobject_uevent_env(),
>>>>>> called from led_trigger_set(), which causes memory leaks when called
>>>>>> with high frequency.
>>>>>
>>>>> Really?  Where in kobject_uevent_env() is the memory leak?
>>>>
>>>> I'll chase it down when and will let you know. This may be
>>>> non-trivial issue as it suffices to add "sleep 0.1" between
>>>> brightness setting operations to prevent it.
>>>
>>> Why are you abusing uevents for flashing an LED?  Please don't do that,
>>> it's not what that interface is for at all.
>>
>> It is called in a result of setting brightness value to LED_OFF,
>> which also removes registered trigger if any.
>
> So every time the LED goes off a uevent happens?  That's not a good
> design.

We had a bug, but it was fixed with recent commit. Now the uevent
will happen when LED goes off only if trigger has been set.

>> The rationale for calling kobject_uevent_env() is given in the
>> relevant commit message:
>>
>> commit 52c47742f79d9240f90af9a6722fe8bb3fa8c0f9
>> Author: Colin Cross <ccross@android.com>
>> Date:   Mon Aug 27 09:31:49 2012 +0800
>>
>>     leds: triggers: send uevent when changing triggers
>>
>>     Some triggers create sysfs files when they are enabled. Send a uevent
>>     "change" notification whenever the trigger is changed to allow userspace
>>     processes such as udev to modify permissions on the new files.
>>
>>     A change notification will also be sent during registration of led class
>>     devices or led triggers if the default trigger of an led class device
>>     is found.
>
> If a sysfs file is removed, then I could see a change event being ok.
> But that's not what this patch does, it ALWAYS sends a uevent, even if
> nothing changed!

Yes, the function needs to be fixed. I'll submit relevant patch soon.

> Please fix that, otherwise you are going to really annoy userspace tools
> with this.
>
> But even then, I don't see how the uevent code has a memory leak with
> this, do you?

Not at the moment, but the fact is that the issue ceases to occur
after commenting the line out.

> And why aren't you checking the return value of
> kobject_uevent_env()?

Will fix.

-- 
Best regards,
Jacek Anaszewski
