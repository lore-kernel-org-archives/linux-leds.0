From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Hardware blink and brightness
Date: Fri, 20 May 2016 09:25:02 +0200
Message-ID: <573EBBCE.2030709@samsung.com>
References: <573DE268.3060900@daqri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:22824 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754572AbcETHZH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 20 May 2016 03:25:07 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O7G0041HSLQ2A50@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 20 May 2016 08:25:02 +0100 (BST)
In-reply-to: <573DE268.3060900@daqri.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tony Makkiel <tony.makkiel@daqri.com>
Cc: linux-leds@vger.kernel.org

Hi Tony,

On 05/19/2016 05:57 PM, Tony Makkiel wrote:
> Hi,
> 	Is there any particular reason to stipulate, (hardware) blink should be turned off, when brightness is set to 0? Following is copied from "Documentation/leds/leds-class.txt"
>
> "Setting the brightness to zero with brightness_set() callback function
> should completely turn off the LED and cancel the previously programmed
> hardware blinking function, if any."
>
> The chip driver could also use other methods for the same, keeping brightness independent of blink.
>
> For example,  delay_on/off
>   delay_off=0 ==> blink off, led on.
>   delay_on=0  ==> blink off, led off.
>
> Or am I overlooking something?

Setting brightness to zero not only disables blinking but also
any other active trigger. Besides, would it make sense to have
blinking enabled with brightness set to 0?

Anyway, we have to keep this interface as-is so as not to break
existing users of the LED API.

-- 
Best regards,
Jacek Anaszewski
