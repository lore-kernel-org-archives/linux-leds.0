Return-Path: <SRS0=X9ll=DC=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5A6C4727E
	for <linux-leds@archiver.kernel.org>; Fri, 25 Sep 2020 23:16:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 224F220829
	for <linux-leds@archiver.kernel.org>; Fri, 25 Sep 2020 23:16:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgIYXQO (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 25 Sep 2020 19:16:14 -0400
Received: from mail.nic.cz ([217.31.204.67]:53640 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727258AbgIYXQO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 25 Sep 2020 19:16:14 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 8E54B140079;
        Sat, 26 Sep 2020 01:16:12 +0200 (CEST)
Date:   Sat, 26 Sep 2020 01:16:12 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Tobias Jordan <kernel@cdqe.de>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: lp55xx: fix device node iterator memory leaks
Message-ID: <20200926011612.37a50904@nic.cz>
In-Reply-To: <20200925225905.GA11731@agrajag.zerfleddert.de>
References: <20200925225905.GA11731@agrajag.zerfleddert.de>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 26 Sep 2020 00:59:05 +0200
Tobias Jordan <kernel@cdqe.de> wrote:

> Fix error paths in for_each_child_of_node loops that were missing an
> of_node_put call.
> 
> Fixes: 92a81562e695 ("leds: lp55xx: Add multicolor framework support to
> lp55xx")
> Signed-off-by: Tobias Jordan <kernel@cdqe.de>
> ---
>  drivers/leds/leds-lp55xx-common.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index 56210f4ad919..f8b55cfd21ef 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -614,8 +614,10 @@ static int lp55xx_parse_multi_led(struct device_node *np,
>  	for_each_child_of_node(np, child) {
>  		ret = lp55xx_parse_multi_led_child(child, cfg, child_number,
>  						   num_colors);
> -		if (ret)
> +		if (ret) {
> +			of_node_put(child);
>  			return ret;
> +		}
>  		num_colors++;
>  	}
>  
> @@ -681,8 +683,10 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>  
>  	for_each_child_of_node(np, child) {
>  		ret = lp55xx_parse_logical_led(child, cfg, i);
> -		if (ret)
> +		if (ret) {
> +			of_node_put(child);
>  			return ERR_PTR(-EINVAL);
> +		}
>  		i++;
>  	}
>  

This is already patched
