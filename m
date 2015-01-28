From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Reading /sys with side effects (was Re: [PATCH 1/2] Documentation:
 leds: Add description of LED Flash class extension)
Date: Wed, 28 Jan 2015 09:43:28 +0100
Message-ID: <54C8A130.8000807@samsung.com>
References: <1422346028-16739-1-git-send-email-j.anaszewski@samsung.com>
 <20150127221958.GA18993@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20150127221958.GA18993@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Greg KH <greg@kroah.com>, kernel list <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 01/27/2015 11:37 PM, Pavel Machek wrote:
> Hi!
>
>> +	- flash_fault - list of flash faults that may have occurred:
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
>> +			flash at full current will not be possible. The condition
>> +			persists until this flag is no longer set
>> +		* led-over-temperature - the temperature of the LED has exceeded
>> +			its allowed upper limit
>> +
>> +		Flash faults are cleared, if possible, by reading the attribute.
>
> That's bad. Now you can no longer present flash_fault file as readable
> to non-root users, and grep -ri foo /sys will interfere with your
> camera application.
>
> Bad interface, just fix it.

In my opinion it isn't crucial for the user to be aware of the
fact that some non-persistent fault happened right after strobing the
flash (e.g. over temperature).

I cannot see anything harmful in the situation when someone does grep
on /sys and clears non-persistent fault on a flash LED device.

Also, not all devices may be able to report the faults that happened
earlier but are not valid at the time of I2C readout. In that case the
user will never now that the fault has ever occurred, unless they read
the flash_fault attribute at the proper moment.

In this case we cannot enforce consistent policy for all devices.

Please describe the use case when clearing the fault on read can be
harmful, if you have any.

Moreover, I don't see your reply to Sakari's message [1], where he
considers the problem from several perspectives.

[1] http://www.spinics.net/lists/linux-leds/msg02653.html

-- 
Best Regards,
Jacek Anaszewski
