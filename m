Return-Path: <SRS0=8MO0=EK=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8E2C388F7
	for <linux-leds@archiver.kernel.org>; Wed,  4 Nov 2020 21:55:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57D1420825
	for <linux-leds@archiver.kernel.org>; Wed,  4 Nov 2020 21:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604526906;
	bh=iofFxCxdDyicpOsBo5PKrSGpbEgK+poiR7ICYZaWCCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=SA8MXnsg9EZuFBYld6HfO3dx1l43flAFgM/9yLGa5rkUDBuKq3gUTtz1gk6rwl4Kx
	 BH/thiPchhjcgERwGfJDPhJgrtrKG7SE3jicYaH9QHgJB9vluWKAH+iFeWby/6bGSg
	 fy1zHS2IYpTr5fX7MtGxPJfp4uhCSBe++yk0xL40=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgKDVzF (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 4 Nov 2020 16:55:05 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46423 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731900AbgKDVzE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Nov 2020 16:55:04 -0500
Received: by mail-oi1-f195.google.com with SMTP id x1so23791397oic.13;
        Wed, 04 Nov 2020 13:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Eu79pluxi2jBLnyziJETRnUZpe98wIFWTcEeZIpZb4g=;
        b=MWTXrRUt9UlBulVWP/g4bPGSAgt9k2ZT5egFPCOEwLU3KF70yFfqx56DioJTgSTn9s
         vQ2+WmgADonEGJL5rmQ/SRdwDccqRxV55U5USI1IS1h+1rWPdJWAmB7XkMkJ6VXnniLp
         5DXVqb8ecGzGJclCRTwq30y52otoaSMdPbgbeXmDqtxyJnN2hrefhxgvwcg1G0uJnyba
         dDaIUPdJmfxFxUIIuC4p1zJup8+wJdXYxo/PPC/CW7c+vhbDbKn9mJX4ZQlhxFgLcT37
         q/X2FiMsj47vR0clmI4PYPitOq7oMeIIkqY8qI7xJcm3woqGqhLqlbh/xOuGoBMuiUpy
         dOmg==
X-Gm-Message-State: AOAM530rDKWgkbR3U40zrEMymJgHOyuyoyG6zMWWnTBgpBz782M195yw
        1rAeMpBijmUnnsnWww4lcdkJx0yFFg==
X-Google-Smtp-Source: ABdhPJydwd6XJRKFbXQ99S19JU4iNPUNrUzq7EMiZKJyCt1HTIUxZu6GETfLbFMaKGvqfOqUOJlReQ==
X-Received: by 2002:aca:3d57:: with SMTP id k84mr4016136oia.38.1604526903726;
        Wed, 04 Nov 2020 13:55:03 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v185sm837744ooa.31.2020.11.04.13.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 13:55:03 -0800 (PST)
Received: (nullmailer pid 4189357 invoked by uid 1000);
        Wed, 04 Nov 2020 21:55:02 -0000
Date:   Wed, 4 Nov 2020 15:55:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH leds 4/5] dt-bindings: leds: leds-class-multicolor: use
 LED_COLOR_ID_RGB for now
Message-ID: <20201104215502.GA4184250@bogus>
References: <20201030023906.24259-1-kabel@kernel.org>
 <20201030023906.24259-4-kabel@kernel.org>
 <b22f8d21-7625-dcff-616c-0c68008b5ab2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b22f8d21-7625-dcff-616c-0c68008b5ab2@ti.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Oct 30, 2020 at 08:08:01AM -0500, Dan Murphy wrote:
> Marek
> 
> On 10/29/20 9:39 PM, Marek Behún wrote:
> > Commit 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for now")
> > disallows LED_COLOR_ID_MULTI for now, and instead LED_COLOR_ID_RGB
> > should be used. Fix this is leds-class-multicolor binding.
> > 
> > After we have some usecases for non-RGB multicolor LEDs, this can be
> > changed.
> > 
> > Signed-off-by: Marek Behún <kabel@kernel.org>
> > Fixes: 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for now")
> > Cc: devicetree@vger.kernel.org
> > Cc: robh+dt@kernel.org
> > ---
> >   .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml     | 4 ++--
> >   .../devicetree/bindings/leds/leds-class-multicolor.yaml       | 4 ++--
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> > index fe7fa25877fd..2015db9b7618 100644
> > --- a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> > +++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> > @@ -73,14 +73,14 @@ examples:
> >                    * LEDs.
> >                    */
> >                   reg = <0>;
> > -                color = <LED_COLOR_ID_MULTI>;
> > +                color = <LED_COLOR_ID_RGB>;
> >                   function = LED_FUNCTION_POWER;
> >                   linux,default-trigger = "heartbeat";
> >               };
> >               multi-led@a {
> >                   reg = <0xa>;
> > -                color = <LED_COLOR_ID_MULTI>;
> > +                color = <LED_COLOR_ID_RGB>;
> >                   function = LED_FUNCTION_INDICATOR;
> >                   function-enumerator = <1>;
> >               };
> > diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> > index b1a53f054b89..9faa3609a6bb 100644
> > --- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> > +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> 
> Why are you resubmitting the multicolor.yaml?
> 
> https://lore.kernel.org/patchwork/patch/1320863/
> 
> This is waiting on DT review.

I'm expecting another version as you commented on it.

Rob
