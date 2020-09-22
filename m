Return-Path: <SRS0=VYW2=C7=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DBFC4363D
	for <linux-leds@archiver.kernel.org>; Tue, 22 Sep 2020 15:43:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 830A32388B
	for <linux-leds@archiver.kernel.org>; Tue, 22 Sep 2020 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600789381;
	bh=DpQp8QigIcreB9Z+VX/e8nNNyEZBPU8x4KLXU2qLj10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DOUMyyTYB5ii6H7ceeyZqG8M48pmtIQiGL0IRmXL+lKLBswzm9aocjDo5rqrRPb65
	 QMJ86/jWBc4anJAflKT0mdmdWFG7fVbjht3G7LT4ZAUa3ixIZKVREjv3V3qcUqUVMj
	 cAPRskDI37H3olbqgR2vvblr50xkDtozBzHcc1Lo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgIVPnA (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 22 Sep 2020 11:43:00 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35835 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgIVPnA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 11:43:00 -0400
Received: by mail-io1-f67.google.com with SMTP id r9so20146342ioa.2;
        Tue, 22 Sep 2020 08:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TYaXL7cZi02QTFmVE3KbgOk5ke0TQzCQlpLbVieBcpQ=;
        b=O09mjFFzJ/fMYEk/Ay59Qln6k3epi1j3TS1r0QFhoVzXUyPWyDnOeQUBi48XZzJ9zS
         beTsO+68si/SO6a/oNo1wovDkZYtDY4MJJzPeTOdKGLl47DOuf8M1XAGKim51QutKSy/
         LmwkFwoqRE+yHUsn8Se5W/D0HIrplCMuC5arcgDvNCjElvBfW+Df2Xuf1DJaoJ37r8q1
         /D4dj7p78Ov0GjzhdIbpx9Ve2av3BEazppVN6njVqtAEBo5n8VNVu51FWjkX7GPpaEJ0
         7n7siETbmuOwztZnAABs5PAD2ZTUfG8i2nIRuONIHXIDbX8w/soMKjYElOHNFsuCARkD
         isxQ==
X-Gm-Message-State: AOAM5310den4Zke+IDkWM/0aTtytTi3hmsdSs0oqcNtZjYtnhqNI183i
        IU3YTru69u9Wa5OSJBda/w==
X-Google-Smtp-Source: ABdhPJy+Hq99CXsctsqgNL6jGVICW70cZDShAPM0k7zPu/xyL8LLbocFjQ/SeALO44nL1LPVzKDynA==
X-Received: by 2002:a02:a498:: with SMTP id d24mr4624545jam.137.1600789379991;
        Tue, 22 Sep 2020 08:42:59 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k1sm9023999ilq.59.2020.09.22.08.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 08:42:59 -0700 (PDT)
Received: (nullmailer pid 2734521 invoked by uid 1000);
        Tue, 22 Sep 2020 15:42:58 -0000
Date:   Tue, 22 Sep 2020 09:42:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexander Dahl <post@lespocky.de>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 3/3] dt-bindings: leds: Convert pwm to yaml
Message-ID: <20200922154258.GA2731185@bogus>
References: <20200919053145.7564-1-post@lespocky.de>
 <20200919053145.7564-4-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200919053145.7564-4-post@lespocky.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 19 Sep 2020 07:31:45 +0200, Alexander Dahl wrote:
> The example was adapted slightly to make use of the 'function' and
> 'color' properties.  License discussed with the original author.
> 
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> 
> Notes:
>     v4 -> v5:
>       * updated based on feedback by Rob Herring
>       * removed Acked-by
> 
>     v3 -> v4:
>       * added Cc to original author of the binding
> 
>     v2 -> v3:
>       * changed license identifier to recommended one
>       * added Acked-by
> 
>     v2:
>       * added this patch to series (Suggested-by: Jacek Anaszewski)
> 
>  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
>  .../devicetree/bindings/leds/leds-pwm.yaml    | 82 +++++++++++++++++++
>  2 files changed, 82 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-pwm.yaml


See https://patchwork.ozlabs.org/patch/1367461

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

