From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v2] leds: fix brightness changing when software blinking
 is active
Date: Tue, 19 May 2015 17:00:54 -0700
Message-ID: <CAK5ve-Lwv4=a7MwRv6rH10q4HgikQbTKW8o9xrr030bKv0d1vg@mail.gmail.com>
References: <5554BE12.7050209@list.ru> <5555AA7F.1000001@samsung.com>
 <5555FDFF.5060402@samsung.com> <5555FE9D.20103@list.ru> <55560580.8070404@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:32817 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752067AbbETABP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 19 May 2015 20:01:15 -0400
In-Reply-To: <55560580.8070404@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Stas Sergeev <stsp@list.ru>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Linux kernel <linux-kernel@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>, Stas Sergeev <stsp@users.sourceforge.net>

On Fri, May 15, 2015 at 7:41 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> On 05/15/2015 04:11 PM, Stas Sergeev wrote:
>>
>> 15.05.2015 17:09, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>
>>> On 05/15/2015 10:12 AM, Jacek Anaszewski wrote:
>>>>
>>>> Hi Stas,
>>>>
>>>> On 05/14/2015 05:24 PM, Stas Sergeev wrote:
>>>>>
>>>>>
>>>>> The following sequence:
>>>>> echo timer >/sys/class/leds/<name>/trigger
>>>>> echo 1 >/sys/class/leds/<name>/brightness
>>>>> should change the ON brightness for blinking.
>>>>> The function led_set_brightness() was mistakenly initiating the
>>>>> delayed blink stop procedure, which resulted in no blinking with
>>>>> the timer trigger still active.
>>>>>
>>>>> This patch fixes the problem by changing led_set_brightness()
>>>>> to not initiate the delayed blink stop when brightness is not 0.
>>>
>>>
>>> This commit message is not valid for this version of the patch.
>>
>> Why do you think so?
>> ---
>> -               schedule_work(&led_cdev->set_brightness_work);
>> +               if (brightness =3D=3D LED_OFF)
>> +                       schedule_work(&led_cdev->set_brightness_work=
);
>> ---
>>
>> LED_OFF is a 0 define.
>>
>
> You're right, I was just looking at the issue from different
> perspective.
>

Applied into my tree. Thanks,
-Bryan
