From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 0/6] leds: Fix module autoload for OF platform drivers
Date: Fri, 04 Sep 2015 13:25:47 +0200
Message-ID: <55E97FBB.5090504@samsung.com>
References: <20150901213450.GA14225@goodgumbo.baconseed.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:59304 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758970AbbIDLZw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Sep 2015 07:25:52 -0400
In-reply-to: <20150901213450.GA14225@goodgumbo.baconseed.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Luis de Bethencourt <luis@debethencourt.com>
Cc: linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

Hi Luis,

Whole patch set merged, thanks.

On 09/01/2015 11:34 PM, Luis de Bethencourt wrote:
> Hello,
>
> This series adds the missing MODULE_DEVICE_TABLE() for OF to eport
> that information so modules have the correct aliases built-in and
> autoloading works correctly.
>
> A longer explanation by Javier Canillas can be found here:
> https://lkml.org/lkml/2015/7/30/519
>
> Thanks,
> Luis
>
> Luis de Bethencourt (6):
>    leds: aat1290: Fix module autoload for OF platform driver
>    leds: bcm6328: Fix module autoload for OF platform driver
>    leds: bcm6358: Fix module autoload for OF platform driver
>    leds: ktd2692: Fix module autoload for OF platform driver
>    leds: max77693: Fix module autoload for OF platform driver
>    leds: leds-ns2: Fix module autoload for OF platform driver
>
>   drivers/leds/leds-aat1290.c  | 1 +
>   drivers/leds/leds-bcm6328.c  | 1 +
>   drivers/leds/leds-bcm6358.c  | 1 +
>   drivers/leds/leds-ktd2692.c  | 1 +
>   drivers/leds/leds-max77693.c | 1 +
>   drivers/leds/leds-ns2.c      | 1 +
>   6 files changed, 6 insertions(+)
>


-- 
Best Regards,
Jacek Anaszewski
