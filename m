From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH RESEND v6 2/2] leds: tlc591xx: Driver for the TI 8/16
 Channel i2c LED driver
Date: Mon, 20 Apr 2015 15:07:31 +0200
Message-ID: <5534FA13.9090502@samsung.com>
References: <1426630107-25057-1-git-send-email-andrew@lunn.ch>
 <1426630107-25057-3-git-send-email-andrew@lunn.ch>
 <5534C181.9060202@samsung.com> <20150420115959.GA8050@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:21297 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752090AbbDTNHf (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 20 Apr 2015 09:07:35 -0400
In-reply-to: <20150420115959.GA8050@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Matthew.Fatheree@belkin.com

On 04/20/2015 01:59 PM, Andrew Lunn wrote:
> On Mon, Apr 20, 2015 at 11:06:09AM +0200, Jacek Anaszewski wrote:
>> Hi Andrew,
>>
>> Very nice driver.
>
> Thanks. I just hope it gets accepted into this merge window.
>
>> I have one question below.
>
[...]
>>> +static int
>>> +tlc591xx_configure(struct device *dev,
>>> +		   struct tlc591xx_priv *priv,
>>> +		   const struct tlc591xx *tlc591xx)
>>> +{
>>> +	unsigned int i;
>>> +	int err = 0;
>>> +
>>> +	tlc591xx_set_mode(priv->regmap, MODE2_DIM);
>>
>> It seems that all leds will be initially turned on, in dim mode.
>> This shouldn't be fixed and probably an optional 'led-mode' DT node
>> property should be provided for defining the initial state. It would
>> default to OFF if not present.
>
> If you look further down, you will find
>
>>> +		priv->leds[reg].ldev.default_trigger =
>>> +			of_get_property(child, "linux,default-trigger", NULL);
>
> This is the normal way in DT to specify the default on/off/keep
> current value/heartbeat etc.

OK, I was initially thinking that initializing LED to MODE2_DIM
turns the LED on.

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>


-- 
Best Regards,
Jacek Anaszewski
