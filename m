From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/2] leds: as3645a: Fix quoted string split warning
Date: Thu, 14 Dec 2017 22:11:03 +0100
Message-ID: <df3a8f78-fec9-d75e-cc13-b1ed30009d0e@gmail.com>
References: <20171214173727.10070-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36659 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752361AbdLNVMB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Dec 2017 16:12:01 -0500
In-Reply-To: <20171214173727.10070-1-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, pavel@ucw.cz, sakari.ailus@iki.fi, laurent.pinchart@ideasonboard.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Dan,

Thanks for the patch set.
Bot patches applied to the for-next branch.

-- 
Best regards,
Jacek Anaszewski

On 12/14/2017 06:37 PM, Dan Murphy wrote:
> Fix a warning for a split quoted string across
> lines.
> 
> WARNING: quoted string split across lines
> 459: FILE: drivers/leds/leds-as3645a.c:459:
> 		dev_err(dev, "AS3645A not detected "
> 			"(model %d rfu %d)\n", model, rfu);
> 
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - Split the warning fixes into 2 patches and fixed commit message -
> https://patchwork.kernel.org/patch/10108325/
> 
>  drivers/leds/leds-as3645a.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
> index 9a257f969300..49fdd7c0a6f6 100644
> --- a/drivers/leds/leds-as3645a.c
> +++ b/drivers/leds/leds-as3645a.c
> @@ -455,8 +455,8 @@ static int as3645a_detect(struct as3645a *flash)
>  
>  	/* Verify the chip model and version. */
>  	if (model != 0x01 || rfu != 0x00) {
> -		dev_err(dev, "AS3645A not detected "
> -			"(model %d rfu %d)\n", model, rfu);
> +		dev_err(dev, "AS3645A not detected (model %d rfu %d)\n",
> +			model, rfu);
>  		return -ENODEV;
>  	}
>  
> 
