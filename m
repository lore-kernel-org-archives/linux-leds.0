From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH/RFC 03/51] leds: Add an internal led_set_brightness_nosleep
 function
Date: Tue, 21 Jul 2015 17:43:28 +0200
Message-ID: <55AE68A0.3080903@gmail.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com> <1437122857-6765-4-git-send-email-j.anaszewski@samsung.com> <20150721095331.GC23841@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150721095331.GC23841@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: linux-leds@vger.kernel.org



On 21.07.2015 11:53, Pavel Machek wrote:
>
>>   	/* Set LED brightness level */
>> -	/* Must not sleep, use a workqueue if needed */
>> +	/* Must not sleep if the driver sets LED_BRIGHTNESS_FAST flag */
>>   	void		(*brightness_set)(struct led_classdev *led_cdev,
>>   					  enum led_brightness brightness);
>>   	/*
>
> Have fun improving static checkers to check for this kind of crazy
> semantics.

I'd be grateful if you gave an example of the tool that would
complain about it.

> NAK.
>
> Just use two callbacks, one of them always NULL.
> 									Pavel
>

-- 
Best Regards,
Jacek Anaszewski
