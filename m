From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: start numerating duplicated devices from 2
Date: Thu, 26 Mar 2015 15:39:13 +0100
Message-ID: <55141A11.3020703@samsung.com>
References: <1427378590-24219-1-git-send-email-j.anaszewski@samsung.com>
 <1427378590-24219-2-git-send-email-j.anaszewski@samsung.com>
 <CAPybu_2uPvZayywBuUbZ=JV7Fk5sBWeWqu3-AC35FcsA3kMXEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47535 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753023AbbCZOjQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Mar 2015 10:39:16 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NLT00GYSQ87EE00@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 26 Mar 2015 14:43:19 +0000 (GMT)
In-reply-to: <CAPybu_2uPvZayywBuUbZ=JV7Fk5sBWeWqu3-AC35FcsA3kMXEg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Sakari Ailus <sakari.ailus@iki.fi>

Hi Ricardo,

On 03/26/2015 03:22 PM, Ricardo Ribalda Delgado wrote:
> Hello
>
> I thought real programmers count from zero :), Jokes aside, I think it
> is the convention in the kernel to start from 0 (video0, mmc0....)
>
> Also the patch is wrong, it will always show the info message "led
> renamed to...", becase led_classdev_register expects 0 when the device
> has not been renamed, with this patch you will return 1.
>
> Best Regards
>
> Nacked-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>

Oops, I didn't notice this :-/

Getting back to numeration - in the LED subsystem devices don't
get numerical suffixes, if they are not duplicated.

For V4L2 case every device name begins from 'video' so adding
the numbers from 0 is reasonable.

For LED subsystem having devices e.g. aat1290 and aat1290_1 would
be confusing IMO.


-- 
Best Regards,
Jacek Anaszewski
