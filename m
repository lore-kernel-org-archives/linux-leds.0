From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 1/2] leds: leds-ipaq-micro: Use
 devm_led_classdev_register
Date: Mon, 07 Sep 2015 16:58:59 +0200
Message-ID: <55EDA633.6050603@samsung.com>
References: <1441635204-3634-1-git-send-email-falakreyaz@gmail.com>
 <1441635204-3634-2-git-send-email-falakreyaz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:23159 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750898AbbIGO7D (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2015 10:59:03 -0400
In-reply-to: <1441635204-3634-2-git-send-email-falakreyaz@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Muhammad Falak R Wani <falakreyaz@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/07/2015 04:13 PM, Muhammad Falak R Wani wrote:
> Use of resource-managed function devm_led_classdev_register
> instead of led_classdev_register is preferred, consequently
> remove redundant function micro_leds_remove.
>
> Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
> ---
>   drivers/leds/leds-ipaq-micro.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)

Merged, thanks.

-- 
Best Regards,
Jacek Anaszewski
