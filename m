From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] Documentation: leds: Add description of LED Flash class
 extension
Date: Mon, 09 Feb 2015 09:17:03 +0100
Message-ID: <54D86CFF.7010706@samsung.com>
References: <1423125773-22751-1-git-send-email-j.anaszewski@samsung.com>
 <CAK5ve-KVQRN-quf9+Uh5HcN_Kh21Hs+2B93zC=ONQaG18k9oUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:26083 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759542AbbBIIRN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 9 Feb 2015 03:17:13 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJH00KSEWJA8130@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 09 Feb 2015 08:21:10 +0000 (GMT)
In-reply-to: <CAK5ve-KVQRN-quf9+Uh5HcN_Kh21Hs+2B93zC=ONQaG18k9oUA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Pavel Machek <pavel@ucw.cz>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Sakari Ailus <sakari.ailus@iki.fi>, Sylwester Nawrocki <s.nawrocki@samsung.com>

On 02/06/2015 07:48 PM, Bryan Wu wrote:
> On Thu, Feb 5, 2015 at 12:42 AM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>> The documentation being added contains overall description of the
>> LED Flash Class and the related sysfs attributes.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> Cc: Bryan Wu <cooloney@gmail.com>
>> Cc: Richard Purdie <rpurdie@rpsys.net>
>> ---
>
> Jacek, I lost the discussion here. Did you change something since V1 patch?
>
> Pavel, Is this version OK for you?

I changed the instruction on how to proceed with flash faults handling
in LED Flash class drivers (the part after listing possible flash
faults, as it is exposed below. There hasn't been any opinion on this
expressed yet, though.


>> +               * led-over-temperature - the temperature of the LED has exceeded
>> +                       its allowed upper limit
>> +
>> +               Flash faults should be read in the strobe_set callback, right
>> +               after the instruction initiating the strobe. If a flash LED
>> +               device provides an instruction for clearing the faults, then,
>> +               in case there were any faults read, it should be also executed
>> +               in the callback.
>> --
>> 1.7.9.5
>>
>


-- 
Best Regards,
Jacek Anaszewski
