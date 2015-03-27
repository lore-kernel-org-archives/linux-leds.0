From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] leds: start numerating duplicated devices from 2
Date: Fri, 27 Mar 2015 09:01:50 +0100
Message-ID: <55150E6E.6020605@samsung.com>
References: <1427381989-17365-1-git-send-email-j.anaszewski@samsung.com>
 <CAK5ve-JVeosdk+c7QsGqGWskNHvrpKbGn--LfGGOzwyROwDk0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:8579 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752793AbbC0IBx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Mar 2015 04:01:53 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NLV00JA12HQZF00@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 27 Mar 2015 08:05:50 +0000 (GMT)
In-reply-to: <CAK5ve-JVeosdk+c7QsGqGWskNHvrpKbGn--LfGGOzwyROwDk0w@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Sakari Ailus <sakari.ailus@iki.fi>

On 03/26/2015 07:15 PM, Bryan Wu wrote:
> On Thu, Mar 26, 2015 at 7:59 AM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>> Duplicated devices are currently given numerical suffixes
>> starting from 1. Since duplication means that one instance
>> of a device already exists in the system, then it is more
>> intuitive for the next device to get the suffix "_2".
>>
>
> No, I prefer to "_1" since normally we treat the first one "_0" or
> empty.

OK, I can live with that :)

> But I suggest we add the "_0" for the first new device then the
> second one will be "_1"

If we changed naming for the device probed as the first one, then
we could break some existing user space applications.

I think that most of time there won't be any device with automagically
added numerical suffix in the LED subsystem, provided that the user
will get acquainted with the DT common leds documentation and will
define labels with different names.

The only case when adding the suffix can't be avoided is the one with
DT overlays.

Adding the suffix should be considered rather a countermeasure than
a convention.


>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> Cc: Bryan Wu <cooloney@gmail.com>
>> Cc: Richard Purdie <rpurdie@rpsys.net>
>> Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> Cc: Sakari Ailus <sakari.ailus@iki.fi>
>> ---
>>   drivers/leds/led-class.c |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index 4ca37b8..07fcb35 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -222,14 +222,14 @@ static int match_name(struct device *dev, const void *data)
>>   static int led_classdev_next_name(const char *init_name, char *name,
>>                                    size_t len)
>>   {
>> -       int i = 0;
>> +       int i = 1;
>>
>>          strncpy(name, init_name, len);
>>
>>          while (class_find_device(leds_class, NULL, name, match_name))
>>                  snprintf(name, len, "%s_%d", init_name, ++i);
>>
>> -       return i;
>> +       return i > 1 ? i : 0;
>>   }
>>
>>   /**
>> --
>> 1.7.9.5
>>
>


-- 
Best Regards,
Jacek Anaszewski
