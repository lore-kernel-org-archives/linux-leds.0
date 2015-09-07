From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-hp6xx: Use devm_led_classdev_register
Date: Mon, 07 Sep 2015 09:49:22 +0200
Message-ID: <55ED4182.4000806@samsung.com>
References: <1441482817-23400-1-git-send-email-falakreyaz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50087 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753533AbbIGHtZ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2015 03:49:25 -0400
In-reply-to: <1441482817-23400-1-git-send-email-falakreyaz@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Muhammad Falak R Wani <falakreyaz@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/05/2015 09:53 PM, Muhammad Falak R Wani wrote:
> Use resource-managed function devm_led_classdev_register
> instead of led_classdev_register to simplify error path.
> An unnecessary check of ret is replaced with a direct return
> Also, remove redundant hp6xxled_remove.
>
> Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
> ---
>   drivers/leds/leds-hp6xx.c | 17 ++---------------
>   1 file changed, 2 insertions(+), 15 deletions(-)
>

Merged, thanks.

-- 
Best Regards,
Jacek Anaszewski
