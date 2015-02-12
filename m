From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] Documentation: leds: Add description of LED Flash class
 extension
Date: Thu, 12 Feb 2015 09:41:02 +0100
Message-ID: <54DC671E.8010705@samsung.com>
References: <1423125773-22751-1-git-send-email-j.anaszewski@samsung.com>
 <20150211215723.GC11313@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52069 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753026AbbBLIlG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Feb 2015 03:41:06 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJN001SJHN5AC70@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 12 Feb 2015 08:45:05 +0000 (GMT)
In-reply-to: <20150211215723.GC11313@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com

Hi Pavel,

Thanks for the review.

On 02/11/2015 10:57 PM, Pavel Machek wrote:
> On Thu 2015-02-05 09:42:53, Jacek Anaszewski wrote:
>> The documentation being added contains overall description of the
>> LED Flash Class and the related sysfs attributes.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> Cc: Bryan Wu <cooloney@gmail.com>
>> Cc: Richard Purdie <rpurdie@rpsys.net>
>> ---
>>   Documentation/leds/leds-class-flash.txt |   63 +++++++++++++++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>   create mode 100644 Documentation/leds/leds-class-flash.txt
>>
>> diff --git a/Documentation/leds/leds-class-flash.txt b/Documentation/leds/leds-class-flash.txt
>> new file mode 100644
>> index 0000000..16c6187
>> --- /dev/null
>> +++ b/Documentation/leds/leds-class-flash.txt
>> @@ -0,0 +1,63 @@
>> +
>> +Flash LED handling under Linux
>> +==============================
>> +
>> +Some LED devices support two modes - torch and flash. In the LED subsystem
>> +those modes are supported by LED class (see Documentation/leds/leds-class.txt)
>> +and LED Flash class respectively. The torch mode related features are enabled
>> +by default and the flash ones only if a driver declares it by setting
>> +LED_DEV_CAP_FLASH flag.
>> +
>> +In order to enable support for flash LEDs CONFIG_LEDS_CLASS_FLASH symbol
>> +must be defined in the kernel config. A flash LED driver must register
>> +in the LED subsystem with led_classdev_flash_register function to gain flash
>> +related capabilities.
>> +
>> +There are flash LED devices which can control more than one LED and allow for
>> +strobing the sub-LEDs synchronously. A LED will be strobed synchronously with
>> +the one whose identifier is written to the flash_sync_strobe sysfs attribute.
>> +The list of available sub-LED identifiers can be read from the available_sync_leds
>> +sysfs attribute. In order to enable the related settings the driver must set
>> +LED_DEV_CAP_SYNC_STROBE flag.
>> +
>> +Following sysfs attributes are exposed for controlling flash LED devices:
>> +
>> +	- flash_brightness - flash LED brightness in microamperes (RW)
>> +	- max_flash_brightness - maximum available flash LED brightness (RO)
>
> in microamperes
>
>> +	- flash_timeout - flash strobe duration in microseconds (RW)
>> +	- max_flash_timeout - maximum available flash strobe duration
>> (RO)
>
> in microseconds
>
>> +	- flash_strobe - flash strobe state (RW)
>
> This is integer..?

I can be 0 or 1. Let's make it more precise:

- flash_strobe - flash strobe state (RW):
			semantics on write:
				0: turn the flash LED off
				1: strobe the flash LED
			semantics on read:
				0: flash LED is off
				1: flash LED is strobing

>> +	- available_sync_leds - list of sub-LEDs available for flash strobe
>> +				synchronization (RO)
>
> "space separated"?

- available_sync_leds - space separated list of sub-LEDs available for
			flash strobe synchronization; each sub-LED is
			described in the form of chunks:
			[led_id: led_name]


> So this will say something like "0 3 5"

Rather e.g.: [0: none] [1: max77693-led1] [2: max77693-led2]

>> +	- flash_sync_strobe - identifier of the sub-LED to synchronize the flash
>> +			      strobe with; 0 stands for no synchronization (RW)
>
> ...and it means that I can put 0, 3 or 5 into this file?

Yes.

>> +	- flash_fault - list of flash faults that may have occurred:
>
> "space separated"?

Right.

>> +		* led-over-voltage - flash controller voltage to the flash LED
>> +			has exceededthe limit specific to the flash controller
>> +		* flash-timeout-exceeded - the flash strobe was still on when
>> +			the timeout set by the user has expired; not all flash
>> +			controllers may set this in all such conditions
>> +		* controller-over-temperature - the flash controller has
>> +			overheated
>> +		* controller-short-circuit - the short circuit protection
>> +			of the flash controller has been triggered
>> +		* led-power-supply-over-current - current in the LED power
>> +			supply has exceeded the limit specific to the flash
>> +			controller
>> +		* indicator-led-fault - the flash controller has detected
>> +			a short or open circuit condition on the indicator LED
>> +		* led-under-voltage - flash controller voltage to the flash
>> +			LED has been below the minimum limit specific to
>> +			the flash
>> +		* controller-under-voltage - the input voltage of the flash
>> +			controller is below the limit under which strobing the
>> +			flash at full current will not be possible;
>> +			the condition persists until this flag is no longer set
>> +		* led-over-temperature - the temperature of the LED has exceeded
>> +			its allowed upper limit
>> +
>> +		Flash faults should be read in the strobe_set callback, right
>> +		after the instruction initiating the strobe. If a flash LED
>
> Ok, so this is part sysfs documentation, part kernel class
> documentation... it is a bit confusing.

As it documents the class itself it is convenient that all information
is available in one place. LED class documentation
Documentation/leds/leds-class.txt also contains information about
sysfs attributes semantics.


-- 
Best Regards,
Jacek Anaszewski
