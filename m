From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [ISSUE] Memleak in LED sysfs on heavy usage
Date: Fri, 16 Sep 2016 15:41:09 +0200
Message-ID: <7bb9a00e-0927-2fdc-5733-64bf922ebed6@samsung.com>
References: <37b949b3-6a9a-b8e3-c164-5ac2d44c9b3c@samsung.com>
 <4d51014d-c8fa-4687-cae8-1a8dd0f79beb@samsung.com>
 <CGME20160916120853eucas1p2474a728f5fc725b094ad1addab507b58@eucas1p2.samsung.com>
 <b267fe46-34ed-4c1e-3c7f-45267baf5517@esd.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56571 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755809AbcIPNlQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Sep 2016 09:41:16 -0400
In-reply-to: <b267fe46-34ed-4c1e-3c7f-45267baf5517@esd.eu>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Daniel Gorsulowski <daniel.gorsulowski@esd.eu>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH <greg@kroah.com>

On 09/16/2016 02:08 PM, Daniel Gorsulowski wrote:
> Hi Jacek,
>
> Am 16.09.2016 um 13:25 schrieb Jacek Anaszewski:
>> On 09/16/2016 10:15 AM, Daniel Gorsulowski wrote:
>>> Hi Jacek,
>>>
>>> Am 16.09.2016 um 09:31 schrieb Jacek Anaszewski:
>>>> Hi Daniel,
>>>>
>>>> On 09/12/2016 10:50 AM, Daniel Gorsulowski wrote:
>>>>> Hello!
>>>>>
>>>>> Please consider if I made something wrong, sending this issue. This is
>>>>> my first contact to the LKML.
>>>>> By mistake, I accessed an LED via /sys/class/leds subsystem very
>>>>> fast in
>>>>> an user application. I figured out, that the free user memory
>>>>> decreased
>>>>> constantly. So I tried to analyze the Problem and wrote a litte
>>>>> script:
>>>>>
>>>>> #!/bin/sh
>>>>> while [ 1 ]; do
>>>>>         echo 1 > /sys/class/leds/2a_service_yellow/brightness
>>>>>         echo 0 > /sys/class/leds/2a_service_yellow/brightness
>>>>> done
>>>>>
>>>>> And voila, I was able to reproduce the problem.
>>>>> So I add a bit more debugging:
>>>>>
>>>>> #!/bin/sh
>>>>> cnt=0
>>>>> while [ 1 ]; do
>>>>>         if [ `expr $cnt % 1000` -eq 0 ]; then
>>>>>                 free | grep Mem: | cut -d' ' -f25
>>>>>         fi
>>>>>         echo 1 > /sys/class/leds/2a_service_yellow/brightness
>>>>>         echo 0 > /sys/class/leds/2a_service_yellow/brightness
>>>>>         let "cnt++"
>>>>> done
>>>>>
>>>>> And huh? No memory is eaten anymore. So it looks like, the problem
>>>>> only
>>>>> occours on heavy (fast) usage of /sys/class/leds subsystem.
>>>>>
>>>>> I rewrote the script and toggled a GPIO pin, but there was no problem
>>>>> recognizable.
>>>>
>>>> I've been unable to reproduce the problem with leds-aat1290 driver
>>>> and Samsung M0 board. It must be driver specific issue.
>>>> What driver did you use?
>>>>
>>> I defined LEDS_GPIO and so I'm using leds-gpio driver.
>>> danielg@debby:~/opt/prj/ti-linux-kernel$ cat .config | grep LEDS | grep
>>> -v "^# "
>>> CONFIG_INPUT_LEDS=y
>>> CONFIG_NEW_LEDS=y
>>> CONFIG_LEDS_CLASS=y
>>> CONFIG_LEDS_GPIO=y
>>> CONFIG_LEDS_TRIGGERS=y
>>> CONFIG_LEDS_TRIGGER_TIMER=y
>>> CONFIG_LEDS_TRIGGER_ONESHOT=y
>>> CONFIG_LEDS_TRIGGER_HEARTBEAT=y
>>> CONFIG_LEDS_TRIGGER_GPIO=y
>>> CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
>>> CONFIG_LEDS_TRIGGER_TRANSIENT=y
>>>
>>
>> Unfortunately I am still unable to reproduce the problem with leds-gpio.
>> I'm not observing any heavy usage with your test case:
>>
>> ~#free
>>               total       used       free     shared    buffers
>> cached
>> Mem:       1028092      61364     966728          0       8416      22396
>> -/+ buffers/cache:      30552     997540
>> Swap:            0          0          0
>>
>>
>> Actually you didn't give any numbers. What kernel version are you using?
>>
> As I wrote, the problems occurred in vanilla 4.6 kernel, but also in 4.4
> kernel (with PREEMPT-RT Patchset).

Heh, funny coincidence. I was testing this on recent linux-leds.git,
for-next branch and was not able to detect the issue. It started to
appear after resetting HEAD to 4.8-rc2 base. Finally it turned out
that what fixes the issue is the most recent commit [1].

Further investigation revealed that this is kobject_uevent_env(),
called from led_trigger_set(), which causes memory leaks when called
with high frequency.

CC GregKH.

[1] 
https://git.kernel.org/cgit/linux/kernel/git/j.anaszewski/linux-leds.git/commit/?h=for-next&id=f3f624941be0fafb29fff5c1411fa433feca792c

-- 
Best regards,
Jacek Anaszewski
