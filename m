Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F9745D927
	for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 08:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981065; cv=pass; b=XvNb+xPYu9N9iMdKgkJRC1hZnaofFy1dZ8l8fXgCnbZGtxgq7Z43QymA5EXBWTLQRQTTeNwzsZRvv/jFi4Y5bYWmyiiN3qD9km9eMy1Ou4jW0v1EtSI4G5FUTN6+SsBORDNvsW3qOX8bekuJEUjNW7BI/agIsIzijtCUS9EVe8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981065; c=relaxed/simple;
	bh=NdNpEVEYGWRp+lG5EVisUhD0Ul+t23nE19hAcmFXZy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQq3BU+15kfLGNM/1TTqV8zlnrXxZvezdwuHzbsOf78g9d2CYqapabmEXiLvjhAejCkVg7bBQMntx0SEQrnlyIL/ternrRJKL2+/TS3Of1A+2/R2GVgURF5uV28bk055rafdj0QHD5tOhhs+uuyXe9NmIFUR/JEnbsF324PZhXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUHHa3Xk; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUHHa3Xk"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab20a33so2480938d50.1
        for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 01:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789981063; cv=none;
        d=google.com; s=arc-20260327;
        b=n7cgusxvDo6hY+Lk7gbf9eXIv4ehT564BsGDrJD/jj6Oi/q/RpP3LR0E0YKN0f+dW2
         0eqsl2fpU0nLDIwEYVi0b5M20SxB/CMq7xTwmYJsb4nd8MO2RmrKBQbKMaAigasYpHOX
         d/s4/cWc4FN3RtVfMV+81H1KJfn0LlVYdI95Epld+Bv5JQyavlfuN/AwROl7XSrQkGR5
         say8Ay3GqIVW5A6m/RnZWClLvu7n9HIeiODd5hY6ER9oQrPeHKzDis9wcNfyv3tKQQXo
         LmdTfadiDHKNH3gzbnz+5xVH+d5hLWlkNpp7eMtGRnIW4Vj9h7VRvGagNvh2dCXUxvNZ
         RdSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WNPGtq4YfsyCjrsGN2dydVZdpvuv9q3GR9oFHfMc4a4=;
        fh=/MMHLA9V7wtu7UchHi3U5hUVeq3BOG6BlgeixS/s2ms=;
        b=WOG8GBWC89skvhq6E2TTLyNkUp15K2RaTYMLjiYGi8RZTdLLq3ssRLxl7+Xnqb482Q
         NleBnO5wzE9AdKsm3C0s/D4tbjgl6FRPcDg5vlUAAS1vmJbBIreVL8pW376CCTXAtOpw
         cxjKvUtDnZg9hSPxjxHbLkazZcChEY69ZmsbsB/L2km32KanpAtnt3mg/x5k/dkTOANI
         eMO8lpRx/b94AIbB01zgHSpkGqEKF3B5Rz8Fzfc+1PEnvmI5ROPwsm8+wAHTI/ZBWqtJ
         VJ+05C/3vOlzYX+Wt5QiuNySJfFOjnloYTKSV9QmqLss4PyMTk5PNKjwoInn1jPdGKRy
         +hSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789981063; x=1790585863; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNPGtq4YfsyCjrsGN2dydVZdpvuv9q3GR9oFHfMc4a4=;
        b=BUHHa3XkEHJgIu4OEHhWfvrHLgT6SYJlyW2NOwq6WZwN0nQajSDiFDICeL2FsbwbbR
         VatGu8Rk6wNaORbfw3re+LD/uphZD/IE9WtHH7DMzcUvAc9LZg830PboIt8MIaiMDDEg
         igXDKJmekJFuoYpgfzxmgSoSazQoes4mlFjZBV7rcN9h92mCyieuwc1o/gAHIfCemLoY
         GKs/b3JAJKinyqPs6BpAUrAj2QOUvbkDKQNxsgytvrnGcAZGgInOWOJSVLlaG88YoJpm
         gkrjqSVeg2hYFYFamLINz5pnOb/LGiIL1VPQrYXrrbMpwd8C0ZzeVSUV2FTlF9HlyEjI
         jH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981063; x=1790585863;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WNPGtq4YfsyCjrsGN2dydVZdpvuv9q3GR9oFHfMc4a4=;
        b=D3W7qZGnOsiRKfql7hZYnCp8WXCbv4ktBQ5tBNI+/2yMpsgPeSo39rJQ4yJtV90Aqz
         JqT6vTYB/7XFfP/BNCl0JNeEN8t78Ic08a64+0q/pKDFxaxJUbl8b8nUF4V8DA7gO9oJ
         NcsJ8m03jqOasB1EhLqbvHTAptE1vW4gj6egJi8TZ6C/+3uoai9D0YAnzu/A4eX7OcdR
         ZOHlX9g4kUNBlZJVql6ij29k9gB3/IHHm5639rSWYtfdf1Ui6Lvqo/P2D4/pPOyJSfel
         6hFFnxQ7+7z/V0/9E0lWQTYPso2ONG5YJEfS/9sJyaOT73Df9/nwaalp/PqNSVDZvkdY
         o7LQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/RQXyQoe+njkQSZGMK22ha/jt3pFzbsQOUmQ6yUlBVp5bTszfifo7VW+IMOFcxOHffU9TOOv006HW@vger.kernel.org
X-Gm-Message-State: AFuF++lFLNodU6nDw5rWKVv+/vfOmGVWZ7ALLhF+HE3f7dmWxt/R7PKQ
	9ICCRav6wlRpnYsXau7NUYKPZ72Ft8kxTc2E+PixXJDb5WkCe0PD0UAWQQYqGhL5tb9WfwJ4Kfr
	IkW1kwO7ZD13AoQ9kzTsKfM8N3SAvtOI=
X-Gm-Gg: AYBFou0tcA/+/IABxEXR3mWykJLmoXlJPfC9KJt3gZgjeN+iZW7OfPGKfy5wjSC2R5P
	dZZahsEfCw2YcoIIvQhMy+wm7pwLkFRn/lr+OYmLQaqTs9xUNeGvGZtKXfxlBkvqzLX2AvLBOA6
	F3LvUsHlfBDJB5yzb3W4i3+Suy/L7oP5WOODNa4AX8gANzV/QT4acp4Fc8jfRG6pynt0Bi5JuZP
	XMwmY8dJQv27Obr27r/zS/Gk02L2nsAXOkFFr6G+b+00xPIDsGAlKSI2VfXWK9xz9zvVLRixeEi
	7/663X/ZlRwHlT7i7ucYINWQlbzBs0E1I7Po5dz3a1APYKzotsGXcjYpS9E=
X-Received: by 2002:a05:690e:e8f:b0:671:33f6:721e with SMTP id
 956f58d0204a3-6717fdb0525mr3003733d50.54.1789981063055; Mon, 21 Sep 2026
 01:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914135723.1741327-1-lgs201920130244@gmail.com> <20260914141722.GD2522202@killaraus.ideasonboard.com>
In-Reply-To: <20260914141722.GD2522202@killaraus.ideasonboard.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 21 Sep 2026 16:57:30 +0800
X-Gm-Features: AcwNN1XQe9klFLOjmAq9TXfAgk-ToudlKrBmGJPpclhmBvVstwJugBBaKTNo2WU
Message-ID: <CANUHTR9Zy1XK9=2vUu22Udcvnr9rywWGvgx0j0rdxkOtWhjDgA@mail.gmail.com>
Subject: Re: [PATCH] leds: flash: sgm3140: fix child node reference leak
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	Luca Weiss <luca@lucaweiss.eu>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

Thanks for the review.

On Mon, 14 Sept 2026 at 22:17, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Sep 14, 2026 at 09:57:23PM +0800, Guangshuo Li wrote:
> > sgm3140_probe() obtains a reference to the LED child node with
> > device_get_next_child_node(). The probe error path correctly drops this
> > reference with fwnode_handle_put(), but the successful probe path
> > returns without releasing it.
> >
> > v4l2_flash_init() takes its own reference to the supplied fwnode and
> > v4l2_flash_release() drops that reference during device removal.
>
> How about devm_led_classdev_flash_register_ext() ?
>
> > Therefore, the reference acquired by sgm3140_probe() is only needed
> > during probe and can be released once initialization has completed.
> >
> > Drop the child node reference before returning successfully from probe.
> >
> > This issue was found by manual code inspection.
>
> I wonder what prompted you to manual inspect that code.
>
> > Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/leds/flash/leds-sgm3140.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
> > index dc6840357370..51e31fdb78e5 100644
> > --- a/drivers/leds/flash/leds-sgm3140.c
> > +++ b/drivers/leds/flash/leds-sgm3140.c
> > @@ -273,7 +273,9 @@ static int sgm3140_probe(struct platform_device *pdev)
> >               goto err;
> >       }
> >
> > -     return ret;
> > +     fwnode_handle_put(child_node);
> > +
> > +     return 0;
> >
> >  err:
> >       fwnode_handle_put(child_node);
>
> --
> Regards,
>
> Laurent Pinchart

The issue I was trying to fix is that the reference obtained by
device_get_next_child_node() is not released on the successful probe
path.

I missed that devm_led_classdev_flash_register_ext() stores the fwnode
in the LED class device without taking a reference of its own. Therefore,
dropping the reference at the end of probe, as in this patch, would be
too early.

I think the reference should instead be kept until the LED class device
is unregistered. I'll rework the fix to manage it with a devm action
registered before the LED class device registration and send a v2.

Thanks,
Guangshuo
