From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/3] leds: core: Introduce generic pattern interface
Date: Sun, 16 Jul 2017 20:49:26 +0200
Message-ID: <beb9b4c3-4922-1ebb-5017-a4b791cdb4d7@gmail.com>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170714224520.467-2-bjorn.andersson@linaro.org>
 <20170706031801.GB12954@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36198 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751230AbdGPSuL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 Jul 2017 14:50:11 -0400
In-Reply-To: <20170706031801.GB12954@xo-6d-61-c0.localdomain>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>

Hi,

On 07/06/2017 05:18 AM, Pavel Machek wrote:
> Hi!
> 
>> Some LED controllers have support for autonomously controlling
>> brightness over time, according to some preprogrammed pattern or
>> function.
>>
>> This adds a new optional operator that LED class drivers can implement
>> if they support such functionality as well as a new device attribute to
>> configure the pattern for a given LED.
> 
>> @@ -61,3 +61,23 @@ Description:
>>  		gpio and backlight triggers. In case of the backlight trigger,
>>  		it is useful when driving a LED which is intended to indicate
>>  		a device in a standby like state.
>> +
>> +What:		/sys/class/leds/<led>/pattern
>> +Date:		July 2017
>> +KernelVersion:	4.14
>> +Description:
>> +		Specify a pattern for the LED, for LED hardware that support
>> +		altering the brightness as a function of time.
>> +
>> +		The pattern is given by a series of tuples, of brightness and
>> +		duration (ms). The LED is expected to traverse the series and
>> +		each brightness value for the specified duration.
>> +
>> +		Additionally a repeat marker ":|" can be appended to the
>> +		series, which should cause the pattern to be repeated
>> +		endlessly.
>> +
>> +		As LED hardware might have different capabilities and precision
>> +		the requested pattern might be slighly adjusted by the driver
>> +		and the resulting pattern of such operation should be returned
>> +		when this file is read.
> 
> Well. I believe this is mostly useful for RGB LEDs. Unfortunately, having patterns
> per-LED will present opportunity for different channels becoming de-synchronized
> from each other, which will not look nice.

Hmm, they are only [brightness duration] tuples, and no definition of
R, G and B LED device is covered here, so how it can be useful for RGB
LEDs?

I've been working on addition of RGB LED support to the LED core for
some time now, in the way as we agreed upon at [0], but it turns out to
be less trivial if we want to do it in an elegant way.

Less elegant way would be duplicating led-core functions and changing
single enum led_brightness argument with the three ones (or a struct
containing three brightness components)

I chose to go the elegant way and tried to introduce led_classdev_base
type that would be customizable with the set of ops, that would allow
for making the number of brightness components to be set at once
customizable. This of course entails significant amount of changes in
the LED core and some changes in LED Trigger core.

Unfortunately I can't predict how much time it will take
to submit an RFC due to limited amount of time I can spend working
on it.

[0] https://www.spinics.net/lists/linux-leds/msg07959.html

-- 
Best regards,
Jacek Anaszewski
