From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: Add Chrome OS keyboard LEDs driver
Date: Tue, 23 Feb 2016 13:50:30 +0100
Message-ID: <56CC5596.9050500@samsung.com>
References: <1456156814-9619-1-git-send-email-aeroevan@gmail.com>
 <56CC1BC7.9000108@samsung.com> <1456230106.20438.2.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41585 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbcBWMue (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2016 07:50:34 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O3000LR83O7X220@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 23 Feb 2016 12:50:31 +0000 (GMT)
In-reply-to: <1456230106.20438.2.camel@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Evan McClain <aeroevan@gmail.com>
Cc: linux-leds@vger.kernel.org, Simon Que <sque@chromium.org>, Duncan Laurie <dlaurie@chromium.org>

On 02/23/2016 01:21 PM, Evan McClain wrote:
> On Tue, 2016-02-23 at 09:43 +0100, Jacek Anaszewski wrote:
>> On 02/22/2016 05:00 PM, Evan McClain wrote:
>>> +static int keyboard_led_remove(struct platform_device *pdev)
>>> +{
>>> +	struct led_classdev *cdev = platform_get_drvdata(pdev);
>>> +
>>> +	platform_set_drvdata(pdev, NULL);
>>
>> Empty line here please.
>
> Unless I'm reading things wrong, I don't think keyboard_led_remove is
> needed at all.
>

Indeed, we can remove it.

-- 
Best regards,
Jacek Anaszewski
