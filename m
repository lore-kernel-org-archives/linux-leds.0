From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-ipaq-micro: Use devm_led_classdev_register
Date: Mon, 07 Sep 2015 09:53:19 +0200
Message-ID: <55ED426F.9030109@samsung.com>
References: <1441482942-23447-1-git-send-email-falakreyaz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:59771 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751676AbbIGHxX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2015 03:53:23 -0400
In-reply-to: <1441482942-23447-1-git-send-email-falakreyaz@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Muhammad Falak R Wani <falakreyaz@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Muhammad,

Please split coding style fixes to a separate patch and leave
only devm related changes here.

On 09/05/2015 09:55 PM, Muhammad Falak R Wani wrote:
> Use of resource-managed function devm_led_classdev_register
> instead of led_classdev_register is preferred, consequently
> remove redundant function micro_leds_remove. Also some coding
> style issues are fixed, only two remain, which are left alone
> to aid better readability.
>
> Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
> ---
>   drivers/leds/leds-ipaq-micro.c | 47 ++++++++++++++++++------------------------
>   1 file changed, 20 insertions(+), 27 deletions(-)
>
[...]


-- 
Best Regards,
Jacek Anaszewski
