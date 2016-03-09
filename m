From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 0/6] leds: Use devm_led_classdev_register
Date: Wed, 09 Mar 2016 16:23:35 +0100
Message-ID: <56E03FF7.5010604@samsung.com>
References: <cover.1457449111.git.amitoj1606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:53841 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751316AbcCIPXl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 9 Mar 2016 10:23:41 -0500
In-reply-to: <cover.1457449111.git.amitoj1606@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr

Hi Amitoj,

On 03/09/2016 04:23 AM, Amitoj Kaur Chawla wrote:
> Switch to resource-managed function devm_led_classdev_register instead
> of led_classdev_register and remove unneeded led_classdev_unregister.
>
> The Coccinelle semantic patch used to make this change is as follows:
> //<smpl>
> @platform@
> identifier p, probefn, removefn;
> @@
> struct platform_driver p = {
>    .probe = probefn,
>    .remove = removefn,
> };
>
> @prb@
> identifier platform.probefn, pdev;
> expression e;
> @@
> probefn(struct platform_device *pdev, ...) {
>    ...
>    e =
> - led_classdev_register
> + devm_led_classdev_register
>    (...);
>     ...
> ?- led_classdev_unregister(...);
>    ...
> }
> @remove depends on prb@
> identifier platform.removefn;
> @@
> removefn(...) {
> ...
> ?- led_classdev_unregister(...);
> ...
> }
> //</smpl>
>
> Amitoj Kaur Chawla (6):
>    leds: 88pm860x: Use devm_led_classdev_register
>    leds: lp8788: Use devm_led_classdev_register
>    leds: wm831x-status: Use devm_led_classdev_register
>    leds: s3c24xx: Use devm_led_classdev_register
>    leds: da903x: Use devm_led_classdev_register
>    leds: max8997: Use devm_led_classdev_register
>
> Changes in v2:
>          -Patches 1-6: Remove unnecessary platform_set_drvdata
>          -Patch 4: Remove unnecessary pdev_to_gpio function definition
>
>   drivers/leds/leds-88pm860x.c      | 12 +-----------
>   drivers/leds/leds-da903x.c        | 12 +-----------
>   drivers/leds/leds-lp8788.c        | 14 +-------------
>   drivers/leds/leds-max8997.c       | 14 +-------------
>   drivers/leds/leds-s3c24xx.c       | 19 +------------------
>   drivers/leds/leds-wm831x-status.c | 13 +------------
>   6 files changed, 6 insertions(+), 78 deletions(-)
>

Thanks for the updated set. All patches have been applied
to the linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
