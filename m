From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH/RFC 01/51] leds: Add led_set_brightness_sync to the public
 LED subsystem API
Date: Tue, 21 Jul 2015 17:43:17 +0200
Message-ID: <55AE6895.3040605@gmail.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com> <1437122857-6765-2-git-send-email-j.anaszewski@samsung.com> <20150721095005.GB23841@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:35450 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932160AbbGUPou (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 21 Jul 2015 11:44:50 -0400
In-Reply-To: <20150721095005.GB23841@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>

On 21.07.2015 11:50, Pavel Machek wrote:
> On Fri 2015-07-17 10:46:47, Jacek Anaszewski wrote:
>> led_set_brightness_sync function was visible only internally to the
>> LED subsystem. It is now being made publicly available since it has
>> become apparent that this is a caller who should decide whether
>> brightness is to be set in a synchronous or an asynchronous way.
>> The function is modified to use brightness_set op as the second
>> option if brightness_set_sync is not implemented. Eventually all
>> LED subsystem drivers will be modfified to set brightness only in
>> a synchronous way with use of brightness_set op and brightness_set_sync
>> op will be removed. LED core will take care of calling brightness_set
>> op asynchronously if needed.
>
> As I explained before, having single brightness_set callback sometimes
> block and sometimes not based on flag elsewhere is a bad design.

The flag is not "elsewhere" but defined by the same driver that
implements the op. And LED core ensures that led_brightness_set
API will be always non-blocking.

>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Cc: Bryan Wu <cooloney@gmail.com>
>> Cc: Andrew Lunn <andrew@lunn.ch>
>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> Nacked-by: Pavel Machek <pavel@ucw.cz>
>
>> ---
>>   drivers/leds/leds.h  |   13 -------------
>>   include/linux/leds.h |   29 +++++++++++++++++++++++++++++
>>   2 files changed, 29 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
>> index bc89d7a..1c026c9 100644
>> --- a/drivers/leds/leds.h
>> +++ b/drivers/leds/leds.h
>> @@ -26,19 +26,6 @@ static inline void led_set_brightness_async(struct led_classdev *led_cdev,
>>   		led_cdev->brightness_set(led_cdev, value);
>>   }
>>
>> -static inline int led_set_brightness_sync(struct led_classdev *led_cdev,
>> -					enum led_brightness value)
>> -{
>> -	int ret = 0;
>> -
>

-- 
Best Regards,
Jacek Anaszewski
