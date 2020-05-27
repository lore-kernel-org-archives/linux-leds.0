Return-Path: <SRS0=fdXr=7J=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2A5C433E0
	for <linux-leds@archiver.kernel.org>; Wed, 27 May 2020 14:35:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D30D207D8
	for <linux-leds@archiver.kernel.org>; Wed, 27 May 2020 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590590124;
	bh=ZHtlGUdsxIEBDD/xsBrVNKXYYZ2i+BMLqDQbWpUZlVQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=OinheXsSSK5yofbK9i3KSVPwgPuK9VV7NR37VjJo/Oobq9Q4id2/iSGG43oSg6TgT
	 +Pwx4fUQp0mZrcSqesGdrv+JXcEdGnAQt3c2xfyoxcIijE6zpzixUKLwWmL1nev7kq
	 9rTXBlmmSRtFZyxuwZ7fpi3E7X7uAzBv8iVLSok8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389261AbgE0OfT (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 27 May 2020 10:35:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:42028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389205AbgE0OfT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 27 May 2020 10:35:19 -0400
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C4497207D8;
        Wed, 27 May 2020 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590590118;
        bh=ZHtlGUdsxIEBDD/xsBrVNKXYYZ2i+BMLqDQbWpUZlVQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Kt7Bifq9PQAYdyS3oLP+3AgwaXJKnTd/D+XY1nMLTXHODDtOt1bkd6DfpX/XIaNKV
         fiYm/Qr1XeJTcMpgvZRUiNpotgeHbumz8wl33tmu2JUojuQpdudrDlv3dOauHw9X/H
         6HDd5bFq5NQuqMSJl73ny0fdoFgRbm3IHn22lA5s=
Received: by mail-ot1-f44.google.com with SMTP id 63so19312581oto.8;
        Wed, 27 May 2020 07:35:18 -0700 (PDT)
X-Gm-Message-State: AOAM531C4wCKDOmD+m0HkDpi5DEaJGprO3YWd165t7zBOmvs0XCt7dyV
        /BdrSPLXZWjWK2Fe7QwpwjIRqneoXqETUNnoWQ==
X-Google-Smtp-Source: ABdhPJzgO0PBm+/AfLe7jnde5ihC21UEs5rp32++DKs0id2GuWNq7IxMhIZjtQ7ntkOjM6vINFi6FRy20LlfhlOWQyM=
X-Received: by 2002:a05:6830:18d9:: with SMTP id v25mr4556571ote.107.1590590118113;
 Wed, 27 May 2020 07:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200526164652.2331-1-dmurphy@ti.com> <20200526164652.2331-2-dmurphy@ti.com>
 <20200527014902.GA859634@bogus> <20200527133948.GA5011@amd>
In-Reply-To: <20200527133948.GA5011@amd>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 27 May 2020 08:35:06 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+rS=awLC_maPGjeWhh1Sb9U31xfvLecVe9sPTh83eDBw@mail.gmail.com>
Message-ID: <CAL_Jsq+rS=awLC_maPGjeWhh1Sb9U31xfvLecVe9sPTh83eDBw@mail.gmail.com>
Subject: Re: [PATCH v25 01/16] dt: bindings: Add multicolor class dt bindings documention
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, May 27, 2020 at 7:39 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> Thanks for reviews!
>
> > > +additionalProperties: false
> > > +...
> > > diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> >
> > This isn't a binding file. Belongs in another patch.
>
> These constants are directly related to the binding. It makes sense to
> go in one patch...

Yes, the header does go in this patch, but kernel subsystem files do not.

Part of the reason for separating is we generate a DT only repository
which filters out all the kernel code. Ideally this is just filtering
out commits and the commit messages still make sense.

Rob
