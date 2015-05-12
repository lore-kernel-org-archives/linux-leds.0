From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v9 1/3] of: Add vendor prefix for Kinetic technologies
Date: Tue, 12 May 2015 10:41:31 -0700
Message-ID: <CAK5ve-KnBPq=4LhVP6f2TS=T4bkEaoBPe1JrJ91R_rUcWaOQwA@mail.gmail.com>
References: <1431419877-28339-1-git-send-email-ingi2.kim@samsung.com> <1431419877-28339-2-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:36528 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932847AbbELRlx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 May 2015 13:41:53 -0400
In-Reply-To: <1431419877-28339-2-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Sakari Ailus <sakari.ailus@iki.fi>, Jacek Anaszewski <j.anaszewski@samsung.com>, varkabhadram@gmail.com, Joe Perches <joe@perches.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, jh80.chung@samsung.com, ideal.song@samsung.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Tue, May 12, 2015 at 1:37 AM, Ingi Kim <ingi2.kim@samsung.com> wrote:
> This patch adds vendor prefix for Kinetic technologies
>
> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> Reviewed-by: Varka Bhadram <varkabhadram@gmail.com>

Merged into my tree with DT reviewer's acks.
Thanks,
-Bryan

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index b6682ab..0a50533 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -108,6 +108,7 @@ isee        ISEE 2007 S.L.
>  isil   Intersil
>  karo   Ka-Ro electronics GmbH
>  keymile        Keymile GmbH
> +kinetic Kinetic Technologies
>  lacie  LaCie
>  lantiq Lantiq Semiconductor
>  lenovo Lenovo Group Ltd.
> --
> 2.0.5
>
