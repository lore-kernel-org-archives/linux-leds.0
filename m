From: Tony Makkiel <tony.makkiel@daqri.com>
Subject: Re: Hardware blink and brightness
Date: Thu, 26 May 2016 15:48:47 +0100
Message-ID: <57470CCF.8050808@daqri.com>
References: <573DE268.3060900@daqri.com> <573EBBCE.2030709@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:38864 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753380AbcEZOsv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 May 2016 10:48:51 -0400
Received: by mail-wm0-f42.google.com with SMTP id n129so102949339wmn.1
        for <linux-leds@vger.kernel.org>; Thu, 26 May 2016 07:48:50 -0700 (PDT)
In-Reply-To: <573EBBCE.2030709@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Tony Makkiel <tony.makkiel@daqri.com>



On 20/05/16 08:25, Jacek Anaszewski wrote:
> Hi Tony,
> 
> On 05/19/2016 05:57 PM, Tony Makkiel wrote:
>> Hi,
>>     Is there any particular reason to stipulate, (hardware) blink should be turned off, when brightness is set to 0? Following is copied from "Documentation/leds/leds-class.txt"
>>
>> "Setting the brightness to zero with brightness_set() callback function
>> should completely turn off the LED and cancel the previously programmed
>> hardware blinking function, if any."
>>
>> The chip driver could also use other methods for the same, keeping brightness independent of blink.
>>
>> For example,  delay_on/off
>>   delay_off=0 ==> blink off, led on.
>>   delay_on=0  ==> blink off, led off.
>>
>> Or am I overlooking something?
> 
> Setting brightness to zero not only disables blinking but also
> any other active trigger. Besides, would it make sense to have
> blinking enabled with brightness set to 0?

I agree brightness set to 0, should turn off led. I was thinking of 
case when user turns led back ON with a brightness value. Ideally 
led comes back on blinking as was configured previously(making, 
brightness and blink independent). At present, once the brightness 
is set, blink also needs to be reconfigured. 

> 
> Anyway, we have to keep this interface as-is so as not to break
> existing users of the LED API. 

I see your point now, Thank you. I was under the wrong impression, this 
could be achieved without code change.

Initially, I thought of using delay_on/delay_off, to turn 
off blink. But with this approach, even if it will save a step 
initially (no need to reconfigure blink), will add additional 
step (re-enable trigger) to disable blink. 
> 
