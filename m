From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: linux-4.4-rc1/drivers/leds/led-class-flash.c:111: pointless test ?
Date: Wed, 18 Nov 2015 16:35:37 +0100
Message-ID: <564C9AC9.9030307@samsung.com>
References: <DUB128-W15AF3520E78E43963EA8339C1D0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:8530 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755008AbbKRPfl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 18 Nov 2015 10:35:41 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NY000AVOONEJV60@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 18 Nov 2015 15:35:38 +0000 (GMT)
In-reply-to: <DUB128-W15AF3520E78E43963EA8339C1D0@phx.gbl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: David Binderman <dcb314@hotmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi David,

Thanks for catching this. Fix applied.

On 11/17/2015 11:45 PM, David Binderman wrote:
> Hello there,
>
> [linux-4.4-rc1/drivers/leds/led-class-flash.c:111]: (style) Checking if unsigned variable 'state' is less than zero.
>
> Source code is
>
>
>     if (state < 0 || state> 1) {
>
> but
>
>    unsigned long state;
>
>
> Regards
>
> David Binderman
>
>   		 	   		
>


-- 
Best Regards,
Jacek Anaszewski
