From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/5] Documentation: leds: Add description of brightness
 setting API
Date: Wed, 23 Sep 2015 11:24:01 +0200
Message-ID: <56026FB1.20804@samsung.com>
References: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
 <1442845770-17800-3-git-send-email-j.anaszewski@samsung.com>
 <20150922192750.GG20029@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:62165 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753115AbbIWJYH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 23 Sep 2015 05:24:07 -0400
In-reply-to: <20150922192750.GG20029@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com

On 09/22/2015 09:27 PM, Andrew Lunn wrote:
> On Mon, Sep 21, 2015 at 04:29:27PM +0200, Jacek Anaszewski wrote:
>> This patch adds description of the LED subsystem API for
>> setting an LED brightness.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>> ---
>>   Documentation/leds/leds-class.txt |   21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
>> index 62261c0..2cc38fa 100644
>> --- a/Documentation/leds/leds-class.txt
>> +++ b/Documentation/leds/leds-class.txt
>> @@ -52,6 +52,27 @@ above leaves scope for further attributes should they be needed. If sections
>>   of the name don't apply, just leave that section blank.
>>
>>
>> +Brightness setting API
>> +======================
>> +
>> +LED subsystem core exposes following API for setting brightness:
>> +
>> +    - led_set_brightness : if necessary, cancels the software blink timer that
>> +		implements blinking when the hardware doesn't; it is guaranteed
>> +		not to sleep
>
> I would put this in the reverse order. Not sleeping is the most
> important bit.

OK.

> Also, stopping blinking should also happen if the
> hardware is performing the blinking. There is no need to mention
> software blinking, that is an implementation detail.

OK.

>
>                  which implies the possibility of delegating the
>> +		job to a work queue task (uses led_set_brightness_nosleep
>> +		underneath - see below),
>
> This bit is also an implementation detail and not relevant to the API.
>
>
>> +    - led_set_brightness_sync : for use cases when immediate effect is desired;
>> +		it can block the caller for the time required for accessing
>> +		device registers and can sleep,
>
> In fact, i would probably have a separate paragraph that says passing
> LED_OFF to either of these two functions stops blinking.

In case of led_set_brightness_sync passing LED_OFF will disable only
hardware blinking. I noticed this discrepancy before a while. We can't
disable soft blinking, because we would have to do it in a work queue
task, which would in turn compromise the contract offering by the API,
i.e. brightness is guaranteed to be set after function returns.
Since Sakari proposed to return error from the function if soft blinking
is on, then this has to be explicitly stated here too.


-- 
Best Regards,
Jacek Anaszewski
