From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 1/7] platform/x86/thinkpad_acpi: Stop setting
 led_classdev brightness directly
Date: Wed, 1 Mar 2017 12:57:42 +0100
Message-ID: <7400ebde-21bf-6a36-9ee7-ec1b2c7b5d02@redhat.com>
References: <20170209154417.19040-1-hdegoede@redhat.com>
 <20170209154417.19040-2-hdegoede@redhat.com> <20170301112700.GD3185@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40556 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750709AbdCAL6f (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 1 Mar 2017 06:58:35 -0500
In-Reply-To: <20170301112700.GD3185@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Marco Trevisan <mail@3v1n0.net>

Hi,

On 01-03-17 12:27, Pali Rohár wrote:
> On Thursday 09 February 2017 16:44:11 Hans de Goede wrote:
>> There is no need to set the led_classdev's brightness value from
>> its set_brightness callback, this is taken care of by the led-core and
>> thinkpad_acpi really should not be mucking with it.
>>
>> Note that kbdlight_set_level_and_update() is still used by the old
>> thinpad_acpi specific sysfs interface for the led, so we cannot
>> remove it.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v8:
>> -New patch in v8 of this patch-set
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index cacb43f..0680bb3 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -5095,8 +5095,6 @@ static int kbdlight_set_level(int level)
>>  	return 0;
>>  }
>>
>> -static int kbdlight_set_level_and_update(int level);
>> -
>>  static int kbdlight_get_level(void)
>>  {
>>  	int status = 0;
>> @@ -5164,7 +5162,7 @@ static void kbdlight_set_worker(struct work_struct *work)
>>  			container_of(work, struct tpacpi_led_classdev, work);
>>
>>  	if (likely(tpacpi_lifecycle == TPACPI_LIFE_RUNNING))
>> -		kbdlight_set_level_and_update(data->new_state);
>> +		kbdlight_set_level(data->new_state);
>>  }
>>
>>  static void kbdlight_sysfs_set(struct led_classdev *led_cdev,
>
> Hi! This change was added in commit afcedebc6a0 (thinkpad_acpi: save
> kbdlight state on suspend and restore it on resume). It is really OK to
> revert that change?

Yes, as explained on the commit msg, kbdlight_set_worker is only used
from ledclass callbacks and the led core already update led_cdev->brightness
when calling those.

Regards,

Hans
