From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] Documentation: leds: Add description of LED Flash class
 extension
Date: Mon, 16 Feb 2015 14:30:43 +0100
Message-ID: <54E1F103.4000707@samsung.com>
References: <1423125773-22751-1-git-send-email-j.anaszewski@samsung.com>
 <20150211215723.GC11313@amd> <54DC671E.8010705@samsung.com>
 <20150212090756.GA30508@amd> <54DC7C1E.5020105@samsung.com>
 <20150212105417.GA10377@amd> <54DC8B6F.9080802@samsung.com>
 <20150212174444.GA9450@amd> <54E1D218.6020000@samsung.com>
 <20150216130610.GA3915@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:54335 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932428AbbBPNaq (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Feb 2015 08:30:46 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJV00FM59Q0RM40@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 16 Feb 2015 13:34:48 +0000 (GMT)
In-reply-to: <20150216130610.GA3915@valkosipuli.retiisi.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, s.nawrocki@samsung.com

Hi Sakari,

On 02/16/2015 02:06 PM, Sakari Ailus wrote:
> Hi Jacek,
>
> On Mon, Feb 16, 2015 at 12:18:48PM +0100, Jacek Anaszewski wrote:
>> Hi Pavel,
>>
>> On 02/12/2015 06:44 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>>>>> You acked LED Flash class patch, didn't you? :)
>>>>>>
>>>>>> There are many attributes documented in the list fashion, e.g.:
>>>>>> available_frequencies in the Documentation/ABI/testing/sysfs-class-devfreq.
>>>>>
>>>>> No, sorry, you can't do this. We have this parsing nightmare in /proc,
>>>>> before, and we don't want it again.
>>>>>
>>>>>> If we changed this a bit it would be easily parsed with AWK:
>>>>>>
>>>>>> echo "0 none;1 max77693-led1;2 max77693-led2" | awk -F';' '{ for (i=1;
>>>>>> i<=NF; i++) print $i}' | awk '{print $1": "$2}'
>>>>>
>>>>> sysfs is one entry per file. If someone screwed it up in devfreq, it
>>>>> is not reason to screw it up here. (Space separated lists of integers
>>>>> might be acceptable. Fixed strings with one marked by []s happen,
>>>>> too. Maps between ints and names are not.)
>>>>
>>>> "Fixed strings with one marked by []s happen" - I don't quite
>>>> get this.
>>>
>>> root@duo:~# cat /sys/power/state
>>> freeze mem disk
>>> root@duo:~# cat /sys/power/disk
>>> [platform] shutdown reboot suspend
>>> root@duo:~#
>>>
>>>> Could you propose the acceptable format then?
>>>> The numbers alone are inconvenient to use, we need a human
>>>> readable description next to them. Or some another way
>>>> to obtain the name.
>>>
>>> Files like "0.active", "0.name", "1.active", "1.name"?
>>>
>>> Subdirectories 0/1 with "name" and "active" files?
>>
>> We have flash_sync_strobe attribute which allows to read currently
>> chosen sync_led. I would simplify this:
>>
>> Let's assume there are two LED Flash class deviecs:
>>
>> - max77693-flash1
>> - max77693-flash2
>>
>> Proposed design described by use cases:
>>
>> #cd /sys/class/leds/max77693-flash1
>> #cat available_flash_leds
>> #[0.none] 1.max77693-flash2
>> #cat flash_sync_strobe
>> #0.none
>> #echo 1 > flash_sync_strobe
>> #cat flash_sync_strobe
>> #1.max77693-flash2
>> #cat available_sync_leds
>> #0.none [1.max77693-flash2]
>
> I'd either drop the brackets from the selected LED, or the flash_sync_strobe
> attribute in order to avoid redundancy in the interface. I slightly prefer
> the former since it's easier to use, but I'm fine with the latter as well.

I'm OK with droping the brackets.

> How about the number and the dot, where do they come from?

The number is the identifier of the flash LED in the sync_leds
array, the property of struct led_classdev_flash, incremented by 1.
It is concatenated, along with the dot, by the LED Flash class core
in the related sysfs attribute callback.

-- 
Best Regards,
Jacek Anaszewski
