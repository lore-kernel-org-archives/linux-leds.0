Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5EEC6FD1D
	for <linux-leds@archiver.kernel.org>; Fri, 17 Mar 2023 08:03:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbjCQIDc (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 17 Mar 2023 04:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjCQIDa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Mar 2023 04:03:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7374BFF24;
        Fri, 17 Mar 2023 01:03:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 07AC66220B;
        Fri, 17 Mar 2023 08:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED5AC433D2;
        Fri, 17 Mar 2023 08:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679040208;
        bh=ZjbZpcLBddKRtJpy6gJho7oasohnkmV6uVOjo4XlR+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=beDZHSVdgZbTMffnz9NNHhkxeNptV/lBtxnwF+/IrRa4mEuBwIz1NMt/Ik70BgnEZ
         J98g67W1QwAfa20ougP7ZOZZxry+1y+6fTtGxUDeuxDl4C44A0qgIlUQoXtcaKgeqh
         etOtwS77uWFeS76GD8KOB3o9INr1PjlBB8pN73YzzTfH4RAQyCXWDIColH2LRxulKq
         EdCGb3xHZ+NsRD68jTqB33eaqLRpjxqGWYhGxRthZfSr2DDv2z8/QM81NVw8zrR62Z
         1AA0ZH0o5zfcF5af1anv5Nfh9tPb3RxsX+FW9DJNPbbL53wNUf3gqE3aza4kQx6zhQ
         IzdBo6AUfoodw==
Date:   Fri, 17 Mar 2023 08:03:21 +0000
From:   Lee Jones <lee@kernel.org>
To:     ChiaEn Wu <chiaen_wu@richtek.com>
Cc:     corbet@lwn.net, pavel@ucw.cz, matthias.bgg@gmail.com,
        andriy.shevchenko@linux.intel.com, jacek.anaszewski@gmail.com,
        angelogioacchino.delregno@collabora.com, linux-doc@vger.kernel.org,
        peterwu.pub@gmail.com, cy_huang@richtek.com,
        linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        szunichen@gmail.com, Alice Chen <alice_chen@richtek.com>
Subject: Re: [PATCH v18 2/3] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
Message-ID: <20230317080321.GC9667@google.com>
References: <cover.1678430444.git.chiaen_wu@richtek.com>
 <52480420a160e5a4c71715fbbf105e684a16e7c2.1678430444.git.chiaen_wu@richtek.com>
 <20230317080016.GB9667@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230317080016.GB9667@google.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 17 Mar 2023, Lee Jones wrote:

> On Fri, 10 Mar 2023, ChiaEn Wu wrote:
>
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > The MediaTek MT6370 is a highly-integrated smart power management IC,
> > which includes a single cell Li-Ion/Li-Polymer switching battery
> > charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> > LED current sources, a RGB LED driver, a backlight WLED driver,
> > a display bias driver and a general LDO for portable devices.
> >
> > Add support for the MT6370 Flash LED driver. Flash LED in MT6370
> > has 2 channels and support torch/strobe mode.
> >
> > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Co-developed-by: Alice Chen <alice_chen@richtek.com>
> > Signed-off-by: Alice Chen <alice_chen@richtek.com>
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > ---
> > v18:
> > - Unwrap each line by 100 chars limit.
> > - For joint flash, add more comments above the source code.
> > - Remove 'sentinel' comment in of_device_id table declaration.
> > ---
> >  drivers/leds/flash/Kconfig             |  13 +
> >  drivers/leds/flash/Makefile            |   1 +
> >  drivers/leds/flash/leds-mt6370-flash.c | 573 +++++++++++++++++++++++++++++++++
> >  3 files changed, 587 insertions(+)
> >  create mode 100644 drivers/leds/flash/leds-mt6370-flash.c
>
> Applied, thanks

Next time, please make checkpatch.pl happy before submitting.

--
Lee Jones [李琼斯]
