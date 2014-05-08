From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 0/6] leds: Remove duplicated OOM message for individual driver
Date: Wed, 7 May 2014 18:58:33 -0700
Message-ID: <CAK5ve-KcKCGtwptnWNqP4s_pqDV=aN2sD5h+JOq-m-yTzPXCyQ@mail.gmail.com>
References: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:45439 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751841AbaEHB6y (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 7 May 2014 21:58:54 -0400
Received: by mail-lb0-f173.google.com with SMTP id 10so2555144lbg.4
        for <linux-leds@vger.kernel.org>; Wed, 07 May 2014 18:58:53 -0700 (PDT)
In-Reply-To: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Xiubo Li <Li.Xiubo@freescale.com>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "Hennerich, Michael" <michael.hennerich@analog.com>

On Wed, Apr 30, 2014 at 1:07 AM, Xiubo Li <Li.Xiubo@freescale.com> wrote:
>
> Xiubo Li (6):
>   leds: bd2802: Remove duplicated OOM message for individual driver
>   leds: da903x: Remove duplicated OOM message for individual driver
>   leds: da9052: Remove duplicated OOM message for individual driver
>   leds: s3c24xx: Remove duplicated OOM message for individual driver
>   leds: sunfire: Remove duplicated OOM message for individual driver
>   leds: adp5520: Remove duplicated OOM message for individual driver
>

This patchset looks good to me, could you please fold them together? I
can apply it in one shot?

Thanks,
-Bryan

>  drivers/leds/leds-adp5520.c | 5 +----
>  drivers/leds/leds-bd2802.c  | 4 +---
>  drivers/leds/leds-da903x.c  | 4 +---
>  drivers/leds/leds-da9052.c  | 3 +--
>  drivers/leds/leds-s3c24xx.c | 4 +---
>  drivers/leds/leds-sunfire.c | 4 +---
>  6 files changed, 6 insertions(+), 18 deletions(-)
>
> --
> 1.8.4
>
