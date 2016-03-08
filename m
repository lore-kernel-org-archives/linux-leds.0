From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 0/7] leds: Use devm_led_classdev_register
Date: Tue, 08 Mar 2016 09:26:06 +0100
Message-ID: <56DE8C9E.1000400@samsung.com>
References: <cover.1457355135.git.amitoj1606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:39071 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753489AbcCHI0S (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 8 Mar 2016 03:26:18 -0500
In-reply-to: <cover.1457355135.git.amitoj1606@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr

Hi Amitoj,

Thanks for the patches.

Applied only the 7/7 one. In the remaining ones, please remove
also all occurrences of platform_set_drvdata() in the probe()
and pdev_to_gpio() definition from leds-s3c24xx.cm as they will
be no longer required.

Best regards,
Jacek Anaszewski

On 03/07/2016 03:50 PM, Amitoj Kaur Chawla wrote:
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
> Amitoj Kaur Chawla (7):
>    leds: 88pm860x: Use devm_led_classdev_register
>    leds: lp8788: Use devm_led_classdev_register
>    leds: wm381x-status: Use devm_led_classdev_register
>    leds: s3c24xx: Use devm_led_classdev_register
>    leds: da903x: Use devm_led_classdev_register
>    leds: max8997: Use devm_led_classdev_register
>    leds: lm3533: Use devm_led_classdev_register
>
>   drivers/leds/leds-88pm860x.c      | 11 +----------
>   drivers/leds/leds-da903x.c        | 11 +----------
>   drivers/leds/leds-lm3533.c        | 12 +++---------
>   drivers/leds/leds-lp8788.c        | 12 +-----------
>   drivers/leds/leds-max8997.c       | 12 +-----------
>   drivers/leds/leds-s3c24xx.c       | 12 +-----------
>   drivers/leds/leds-wm831x-status.c | 12 +-----------
>   7 files changed, 9 insertions(+), 73 deletions(-)
>
